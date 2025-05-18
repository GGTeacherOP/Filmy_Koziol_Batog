<?php
session_start();
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profil | Movielock</title>
    <link rel="icon" href="logo.png">
    <link rel="stylesheet" href="styl.css">
    <link rel="stylesheet" href="profil.css">
</head>
<body>
    <?php 
    require_once 'db_connect.php';
    
    // Pobierz ID użytkownika z parametru URL
    $id = isset($_GET['id']) ? intval($_GET['id']) : 1;
    $query = "SELECT login FROM uzytkownicy WHERE ID = $id";
    $result = mysqli_query($conn, $query);
    $data=mysqli_fetch_row($result);
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
        <section>
            <?php
            echo "<h1> $data[0] </h1>"; //Wypisanie nazwy użytkownika  
            echo "<br><br><br><h3>Status Filmów</h3>"; 
            $qry_statusy=mysqli_query($conn,"SELECT filmy.ID,zdjecie,status FROM statusy_filmow JOIN filmy ON statusy_filmow.film_id=filmy.ID WHERE uzytkownik_id='".$id."'ORDER BY status ASC LIMIT 10;");
            if (mysqli_num_rows($qry_statusy)==0){
                echo "<p style='float:left'>Brak statusów do wyświetlenia</p>";
            }else{
                while ($row=mysqli_fetch_array($qry_statusy)){
                    if ($row[2]==NULL){//Wypisanie nieobejrzanych filmów  
                        echo "<section class='film'><a class='info' href='filmy_info.php?id=".$row[0]."'><img alt='film' src='".$row[1]."'><h2>nieobejrzane</h2></a></section>";
                    } else {//Wypisanie obejrzanych i planowanych filmów 
                        echo "<section class='film'><a class='info' href='filmy_info.php?id=".$row[0]."'><img alt='film' src='".$row[1]."'><h2>".$row[2]."</h2></a></section>";
                    }
                }
            }
            echo "<br><br><br><h3 style='clear:both;'>Recenzje</h3>";//Wypisanie recenzji
            $qry_recenzje=mysqli_query($conn,"SELECT tytul,ocena,oceny.opis FROM oceny JOIN filmy ON oceny.film_id=filmy.ID WHERE uzytkownik_id='".$id."';");
            if (mysqli_num_rows($qry_recenzje)==0){
                echo "<p style='float:left'>Brak recenzji do wyświetlenia</p>";
            }else{
                while ($recenzja=mysqli_fetch_array($qry_recenzje)){
                    echo "<div class='recenzja'><p class='film_tytul'>".$recenzja[0]."</p><p>".$recenzja[1]."/10</p><p class='opinia'>".$recenzja[2]."</p></div>";
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
</body>
</html>