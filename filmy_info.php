<?php
session_start();
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
    <?php
    require_once 'db_connect.php';
    
    // Pobierz ID filmu z parametru URL
    $film_id = isset($_GET['id']) ? intval($_GET['id']) : 1;
    
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
            <img style='width: 400px; height: 600px;' src="<?php echo htmlspecialchars($film['zdjecie']); ?>" alt="Plakat filmu"><!-- ustawienie adresu obrazu jako link z bazy-->
        </section>
        <section class="main-prawy">
            <h2><?php echo htmlspecialchars($film['tytul']); ?></h2><!-- wypisanie tytułu z bazy-->
            <section class="row1">
                <h4 class="rezyser">
                <a href="rezyser_info.php?id=<?php echo $film['id_rezysera']; ?>">
                <?php echo htmlspecialchars($film['rezyser']); ?><!-- wypisanie imienia reżysera z bazy-->
                </a>
                </h4>
                <h4 class="gatunek">Gatunek: <?php echo htmlspecialchars($film['gatunek']); ?></h4><br><!-- wypisanie gatunku z bazy-->
            </section>
            <section class="row2">
                <div class="popularnosc"><h5 class="miejsce">#<?php echo htmlspecialchars($film['ranking_popularnosci']); ?></h5><h5 class="podtekst">Najpopularniejszy</h5></div><!-- wypisanie rankingu z bazy-->
                <div class="ocena"><h5 class="gwiazdy"><?php echo htmlspecialchars($film['srednia_ocena']); ?></h5></div><!-- wypisanie oceny z bazy-->
            </section>
            <div class="opis"><h5 class="opis-tekst"><?php echo htmlspecialchars($film['opis']); ?></h5></div><!-- wypisanie opisu z bazy-->
                <form method="post" style="float:right;">
                    <input id="przycisk_kup" type="submit" name="kup" value="Kup">
                </form><!-- formularz kupna filmu -->
            <div class="clearfix"></div>
            <section class="row3">
                <?php
                if ($result_aktorzy && mysqli_num_rows($result_aktorzy) > 0) {//Sprawdzenie czy aktorzy istnieją
                    while ($aktor = mysqli_fetch_assoc($result_aktorzy)) {
                        echo '<div class="aktor"><a href="obsada_info.php?id=' . $aktor['ID'] . '">';//wypisanie ich
                        echo '<img src="' . htmlspecialchars($aktor['zdjecie']) . '" alt="' . htmlspecialchars($aktor['imie_nazwisko']) . '">';
                        echo '<br><br><br><br><br><br><br><br><p>' . htmlspecialchars($aktor['imie_nazwisko']) . '</p>';
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

                if (mysqli_num_rows($qry_sprawdz_kupiony)>0){//Jeżeli tak
                    echo "<script>document.getElementById('przycisk_kup').value='kupione'</script>";
                    echo "<script>document.getElementById('przycisk_kup').style.backgroundColor='#444'</script>";
                }
                if (isset($_POST['kup'])){// Jeżeli kliknięto pzrycisk zakupu
                    $qry_znajdz=mysqli_query($conn, "SELECT id FROM `statusy_filmow` WHERE `film_id`='".$_GET['id']."' AND `uzytkownik_id`='".$_SESSION['user_id']."';");
                    $row_znajdz=mysqli_fetch_array($qry_znajdz);
                    if (mysqli_num_rows($qry_znajdz)>0){//Sprawdzenie czy zmieniono status filmu przed zakupem
                    mysqli_query($conn, "INSERT INTO `statusy_filmow`(`ID`,`film_id`, `uzytkownik_id`, `kupione`) VALUES ('".$row_znajdz[0]."','".$_GET['id']."','".$_SESSION['user_id']."','1') ON DUPLICATE KEY UPDATE `kupione`=VALUES(kupione)");
                } else {
                    mysqli_query($conn, "INSERT INTO `statusy_filmow`(`film_id`, `uzytkownik_id`, `kupione`) VALUES ('".$_GET['id']."','".$_SESSION['user_id']."','1')");
                }
            }
                if (isset($_POST['status']) && isset($_POST['zmien_status'])){
                    $status=$_POST['status'];
                    $qry_znajdz=mysqli_query($conn, "SELECT id FROM `statusy_filmow` WHERE `film_id`='".$_GET['id']."' AND `uzytkownik_id`='".$_SESSION['user_id']."';");
                    $row_znajdz=mysqli_fetch_array($qry_znajdz);
                    switch ($status){
                        case 0://Zmiana statusu na nieobejrzany 
                            $qry_status=mysqli_query($conn, "INSERT INTO `statusy_filmow`(`ID`,`film_id`, `uzytkownik_id`, `status`) VALUES ('".$row_znajdz[0]."','".$_GET['id']."','".$_SESSION['user_id']."','NULL') ON DUPLICATE KEY UPDATE `status`=VALUES(`status`)");
                                                                // ON DUPLICATE KEY oznacza, że jeśli rekord z tym `ID`, zamiast zwracać błędu, przejdzie do fragmentu po nim,
                                                                //W tym fragmencie jest tam UPDATE co znaczy że jeżeli nie może stworzyć rekordu, to go uaktualni
                            break;
                        default://Zmiana statusu na inny 
                            $qry_status=mysqli_query($conn, "INSERT INTO `statusy_filmow`(`ID`,`film_id`, `uzytkownik_id`, `status`) VALUES ('".$row_znajdz[0]."','".$_GET['id']."','".$_SESSION['user_id']."','".$status."') ON DUPLICATE KEY UPDATE `status`=VALUES(`status`)");
                            break;
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