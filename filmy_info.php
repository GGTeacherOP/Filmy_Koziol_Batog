<?php
session_start();
require_once 'db_connect.php';

// Pobierz ID filmu z parametru URL
$film_id = isset($_GET['id']) ? intval($_GET['id']) : 1;

// Obsługa dodawania do koszyka
if (isset($_GET['dodaj_do_koszyka']) && isset($_SESSION['user_id'])) {    
    // Sprawdź czy film istnieje
    $check_movie = mysqli_prepare($conn, "SELECT ID FROM filmy WHERE ID = ?");
    mysqli_stmt_bind_param($check_movie, "i", $film_id);
    mysqli_stmt_execute($check_movie);
    mysqli_stmt_store_result($check_movie);
    
    if (mysqli_stmt_num_rows($check_movie) > 0) {
        // Sprawdź czy film już jest w koszyku
        $check_cart = mysqli_prepare($conn, "SELECT * FROM koszyk WHERE uzytkownik_id = ? AND film_id = ?");
        mysqli_stmt_bind_param($check_cart, "ii", $_SESSION['user_id'], $film_id);
        mysqli_stmt_execute($check_cart);
        mysqli_stmt_store_result($check_cart);
        
        if (mysqli_stmt_num_rows($check_cart) == 0) {
            // Dodaj film do koszyka
            $query = "INSERT INTO koszyk (uzytkownik_id, film_id) VALUES (?, ?)";
            $stmt = mysqli_prepare($conn, $query);
            mysqli_stmt_bind_param($stmt, "ii", $_SESSION['user_id'], $film_id);
            mysqli_stmt_execute($stmt);
        }
    }
    
    // Przekieruj z powrotem aby uniknąć ponownego wysłania formularza
    header("Location: filmy_info.php?id=" . $film_id);
    exit();
}

// Zapytanie o informacje o filmie
$query_film = "SELECT f.*, r.imie_nazwisko AS rezyser , r.ID AS id_rezysera
              FROM filmy f 
              JOIN rezyserzy r ON f.rezyser_id = r.ID 
              WHERE f.ID = $film_id";
$result_film = mysqli_query($conn, $query_film);

if (!$result_film || mysqli_num_rows($result_film) == 0) {
    die("Film nie znaleziony");
}

$film = mysqli_fetch_assoc($result_film);

// Zapytanie o aktorów w filmie (ograniczone do 5)
$query_aktorzy = "SELECT a.ID, a.imie_nazwisko, a.zdjecie 
                 FROM aktorzy a
                 JOIN wystapienia w ON a.ID = w.id_aktora
                 WHERE w.id_filmu = $film_id
                 LIMIT 5";
$result_aktorzy = mysqli_query($conn, $query_aktorzy);

?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Informacje | Movielock</title>
    <link rel="icon" href="logo.png">
    <link rel="stylesheet" href="styl.css">
    <link rel="stylesheet" href="info.css"><!-- styl dla stron *_info.php-->
</head>
<body>
    <header>
        <img alt="logo" src="logo.png">
        <section>
            <h1>Movielock</h1>
            <?php if(isset($_SESSION['user_id'])): ?>
                <a href="<?php 
                    switch($_SESSION['user_role']) {
                        case 'admin': echo 'admin_panel.php'; break;
                        case 'moderator': echo 'moderator_panel.php'; break;
                        case 'edytor': echo 'edytor_panel.php'; break;
                        default: echo 'user_profile.php';
                    }
                ?>" class="odstep">Moje konto</a>
                <a href="logout.php">Wyloguj</a>
                <a href="koszyk.php" class="odstep">Koszyk</a>
            <?php else: ?>
                <a href="login.php" class="odstep">Logowanie</a>
            <?php endif; ?>
            <a href="top_popularnosc.php">Najpopularniejsze</a>
            <a href="top_ocena.php">Najlepsze</a>
            <a href="index.php">Strona Główna</a>
        </section>
    </header>
    <main>
        <section class="main-lewy">
            <img style='width: 400px; height: 600px;' src="<?php echo htmlspecialchars($film['zdjecie']); ?>" alt="Plakat filmu">
        </section>
        <section class="main-prawy">
            <h2><?php echo htmlspecialchars($film['tytul']); ?></h2>
            <section class="row1">
                <h4 class="rezyser">
                <a href="rezyser_info.php?id=<?php echo $film['id_rezysera']; ?>">
                <?php echo htmlspecialchars($film['rezyser']); ?>
                </a>
                </h4>
                <h4 class="gatunek">Gatunek: <?php echo htmlspecialchars($film['gatunek']); ?></h4><br>
            </section>
            <section class="row2">
                <div class="popularnosc"><h5 class="miejsce">#<?php echo htmlspecialchars($film['ranking_popularnosci']); ?></h5><h5 class="podtekst">Najpopularniejszy</h5></div>
                <div class="ocena"><h5 class="gwiazdy"><?php echo htmlspecialchars($film['srednia_ocena']); ?></h5></div>
            </section>
            <div class="opis"><h5 class="opis-tekst"><?php echo htmlspecialchars($film['opis']); ?></h5></div>
            <?php if(isset($_SESSION['user_id'])): ?>
                <form method="get" style="float:right;">
                    <input type="hidden" name="id" value="<?php echo $film_id; ?>">
                    <input type="submit" name="dodaj_do_koszyka" value="Dodaj do koszyka" value="<?php echo $film_id; ?>">
                </form>
            <?php endif; ?>
            <div class="clearfix"></div>
            <section class="row3">
                <?php
                if ($result_aktorzy && mysqli_num_rows($result_aktorzy) > 0) {
                    while ($aktor = mysqli_fetch_assoc($result_aktorzy)) {
                        echo '<div class="aktor"><a href="obsada_info.php?id=' . $aktor['ID'] . '">';
                        echo '<img src="' . htmlspecialchars($aktor['zdjecie']) . '" alt="' . htmlspecialchars($aktor['imie_nazwisko']) . '">';
                        echo '<p>' . htmlspecialchars($aktor['imie_nazwisko']) . '</p>';
                        echo '</a></div>';
                    }
                } else {
                    echo '<p>Brak informacji o aktorach</p>';
                }
                ?>
                <form method="post" style="float:right;">
                    <select name="status">
                        <option hidden>--Wybierz--</option>
                        <option value="0">Nieobejrzany</option>     
                        <option value="obejrzane">Obejrzany</option>     
                        <option value="planowane">Planuje obejrzeć</option> 
                    </select><br>
                    <input type="submit" name="zmien_status" value="Zmień status">
                </form><!--formulrz zmieniający statuj filmu -->
                <?php 
                if(isset($_SESSION['user_id'])){//Sprawdzenie czy użytkownik jest zalogowany
                $qry_sprawdz_kupiony=mysqli_query($conn, "SELECT `kupione` FROM `statusy_filmow` WHERE `film_id`='".$_GET['id']."' AND `uzytkownik_id`='".$_SESSION['user_id']."';");
                //Sprawdzenie czy kupił wybrany film

                if (isset($_POST['status']) && isset($_POST['zmien_status'])) {
    $film_id = intval($_GET['id']); // Upewnij się, że film_id jest liczbą całkowitą
    $user_id = $_SESSION['user_id']; // ID użytkownika z sesji

    // Pobierz wartość statusu z POST
    $status_value = $_POST['status'];

    // Jeśli status jest 0, ustaw go na NULL (w MySQL 'NULL' to nie to samo co string 'NULL')
    $status_do_zapisu = ($status_value == 0) ? NULL : $status_value;

    // Zapytanie SQL z ON DUPLICATE KEY UPDATE, bez podawania ID i bez $qry_znajdz
    $query = "INSERT INTO `statusy_filmow` (`film_id`, `uzytkownik_id`, `status`)
              VALUES (?, ?, ?)
              ON DUPLICATE KEY UPDATE `status` = VALUES(`status`)";

    $stmt = mysqli_prepare($conn, $query);

    if ($stmt) {
        mysqli_stmt_bind_param($stmt, "iis", $film_id, $user_id, $status_do_zapisu);
        
        if (mysqli_stmt_execute($stmt)) {
        } else {
            error_log("Błąd podczas aktualizacji statusu filmu: " . mysqli_stmt_error($stmt));
        }
        mysqli_stmt_close($stmt);
    } else {
        error_log("Błąd przygotowania zapytania SQL dla statusu: " . mysqli_error($conn));
    }
}
                }
                ?>    
            </section>
            <br>
        </section>
        <section class="row4">
            <h2>Recenzje</h2><br><br><br><br>
            <?php if(isset($_SESSION['user_id'])): ?><!-- Jeżeli użytkownik jest zalogowany, umożliwia napisanie recenzji-->
            <div class="recenzja">
            <form method="post">
                <p class='konto'>Dodaj recenzje</p>
                <input class="lstrow" style="float:right;" name='ocena' type="number" min="1" max="10" step="0.1"><p class="lstrow">Ocena: </p>
                <!-- ^ input przyjmuje wartości 1-10 z odstępem 0.1-->
                <p class='opinia'><textarea cols="33" name="opis" style="float:right;"> </textarea><br>Opis:</p>
                <input type="submit" name="submit" value="Dodaj">
            </form><!--formulrz dodawania recenzji -->
            </div>
            <?php endif;?>
            <?php
            if (isset($_POST['ocena']) && isset($_POST['opis']) && isset($_POST['submit']))//Obsługa pisania recenzji pobierająca konto z sesji i resztę z formularzu
            {
                $user_id = (int)$_SESSION['user_id'];
                $ocena = $_POST['ocena'];
                $opis = trim($_POST['opis']);
                $stmt = mysqli_prepare($conn, "INSERT INTO `oceny` (`film_id`, `uzytkownik_id`, `ocena`, `opis`) VALUES (?, ?, ?, ?)");
                mysqli_stmt_bind_param($stmt, "iids", $film_id, $user_id, $ocena, $opis);
                mysqli_stmt_execute($stmt);
                mysqli_stmt_close($stmt);
            }
            //Pokazanie recenzji
            $result_recenzje = mysqli_query($conn, "SELECT login,ocena,opis FROM oceny JOIN uzytkownicy ON oceny.uzytkownik_id=uzytkownicy.ID WHERE film_id='".$film_id."';");
            
            if (mysqli_num_rows($result_recenzje)==0){
                echo "<p style='float:left'>Brak recenzji do wyświetlenia</p>";
            }else{
                while ($recenzja=mysqli_fetch_array($result_recenzje)){
                    echo "<div class='recenzja'><p class='konto'>".$recenzja[0]."</p><p>".$recenzja[1]."/10</p><p class='opinia'>".$recenzja[2]."</p></div>";
                }
            }
            ?>
        </section>
    </main>
    <footer>
        <section>
            <h1>Movielock</h1>
            <a href="kontakt.html">Kontakt</a>
        </section>
    </footer>
    <?php
    $qry_policz_kupione=mysqli_query($conn, "SELECT COUNT(*) FROM `statusy_filmow` WHERE `kupione`=1;");//Obliczenie sumy zakupionych filmów przez wszystkich użytkowników
    $row_policz_kupione=mysqli_fetch_array($qry_policz_kupione);
    mysqli_query($conn,"UPDATE personel SET wynagrodzenie=(70*".$row_policz_kupione[0]."+9000) WHERE `uprawnienia`='admin';");//zmiana wypłaty administratora
    mysqli_close($conn);
    ?>
</body>
</html>