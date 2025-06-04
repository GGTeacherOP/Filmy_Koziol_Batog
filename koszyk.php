<?php
session_start();
require_once 'db_connect.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

$user_id = $_SESSION['user_id'];

// Obsługa usuwania filmu z koszyka
if (isset($_GET['usun_z_koszyka'])) {
    $film_id = intval($_GET['usun_z_koszyka']);
    usun_z_koszyka($conn, $user_id, $film_id);
    header("Location: koszyk.php");
    exit();
}

// Obsługa kupowania filmów z koszyka
if (isset($_POST['kup_z_koszyka'])) {
    // Pobierz filmy z koszyka
    $filmy_w_koszyku = pobierz_koszyk($conn, $user_id);
    
    // Dodaj filmy do statusów_filmow jako kupione
    foreach ($filmy_w_koszyku as $film) {
        $film_id = $film['ID'];
        
        // Sprawdź czy film już został kupiony
        $qry_sprawdz = mysqli_query($conn, "SELECT id FROM statusy_filmow WHERE film_id='$film_id' AND uzytkownik_id='$user_id'");
        
        if (mysqli_num_rows($qry_sprawdz) > 0) {
            // Aktualizuj jeśli już istnieje
            mysqli_query($conn, "UPDATE statusy_filmow SET kupione=1 WHERE film_id='$film_id' AND uzytkownik_id='$user_id'");
        } else {
            // Wstaw nowy rekord
            mysqli_query($conn, "INSERT INTO statusy_filmow (film_id, uzytkownik_id, kupione) VALUES ('$film_id', '$user_id', 1)");
        }
    }
    
    // Wyczyść koszyk po zakupie
    wyczysc_koszyk($conn, $user_id);
    
    // Przekieruj z powrotem
    header("Location: user_profile.php?id=" . $user_id);
    exit();
}

// Pobierz zawartość koszyka
$koszyk = pobierz_koszyk($conn, $user_id);
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Koszyk | Movielock</title>
    <link rel="icon" href="logo.png">
    <link rel="stylesheet" href="styl.css">
    <link rel="stylesheet" href="koszyk.css">
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
        <section class="koszyk-container">
        <br>
        <br>
        <p class="napis">Twój koszyk</p>
            
            <?php if (empty($koszyk)): ?>
                <p class="koszyk-pusty">Koszyk jest pusty</p>
            <?php else: ?>
                <ul class="lista-filmow">
                    <?php foreach ($koszyk as $film): ?>
                        <li class="film">
                            <div class="film-info">
                                <img src="<?php echo htmlspecialchars($film['zdjecie']); ?>" alt="<?php echo htmlspecialchars($film['tytul']); ?>">
                                <span><?php echo htmlspecialchars($film['tytul']); ?></span>
                            </div>
                            <a href="koszyk.php?usun_z_koszyka=<?php echo $film['ID']; ?>" class="usun-film">Usuń</a>
                        </li>
                    <?php endforeach; ?>
                </ul>
                
                <div class="przyciski-koszyka">
                    <form method="post">
                        <input type="submit" name="kup_z_koszyka" value="Kup wszystko">
                    </form>
                    <a href="user_profile.php?id=<?php echo $user_id; ?>">Przejdź do profilu</a>
                </div>
            <?php endif; ?>
        </section>
    </main>
    <footer>
        <section>
            <h1>Movielock</h1>
            <a href="kontakt.html">Kontakt</a>
        </section>
    </footer>
</body>
</html>