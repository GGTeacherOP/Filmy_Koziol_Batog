<?php
session_start();
$con=mysqli_connect("localhost","root","","movielock");
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel Moderatora | Movielock</title>
    <link rel="icon" href="logo.png">
    <link rel="stylesheet" href="styl.css">
    <link rel="stylesheet" href="panel.css"><!--styl dla panelów-->
    <script>
        function redirecttab(x){
            window.open("moderator_panel.php?mode=table&tab="+x, '_self').focus();
        }//Funcje wysyła użytkownika na tą samą strone z innymi wartościami $_GET
        //Funkcja na górze ustawia w głównej tabeli tabele z bazy, zaś na dole - widoki
        function redirectvie(x){
            window.open("moderator_panel.php?mode=view&tab="+x, '_self').focus();
        }
    </script>
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
            <?php else: ?>
                <a href="login.php" class="odstep">Logowanie</a>
            <?php endif; ?>
            <a href="top_popularnosc.php">Najpopularniejsze</a>
            <a href="top_ocena.php">Najlepsze</a>
            <a href="index.php">Strona Główna</a>
        </section>
    </header>
    <?php
    if (!isset($_GET['mode'])){// Jeżeli link otwierający nie zawiera wartości $_GET, przypisywane są podstawowe
        $_GET['mode']="table";
    } 
    if (!isset($_GET['tab'])){
        $_GET['tab']="aktorzy";
    }
    
    if($_GET['mode']=="table"): ?><!-- Jeżeli tryb jest ustawiony na tabele, w tabeli głównej wyświetlane są -->                  
    <div>                           <!-- tabele z bazy  -->
    <table class="main_table">
        <tr>
            <td class="category" onclick="redirecttab('oceny')" rowspan="2">Tabele</td>
            <td onclick="redirecttab('oceny')">oceny</td>
        </tr>
        <tr>
            <td onclick="redirecttab('statusy_filmow')">statusy filmów</td>
        </tr>
        <tr>
            <td class="category" onclick="redirectvie('oceny_uzytkownikow')"rowspan="2">Widoki</td>
            <td onclick="redirecttab('uzytkownicy')">użytkownicy</td>
        </tr>
        <tr>
            <td></td>
        </tr>
    </table>
    <?php elseif ($_GET['mode']=="view"): ?>
    <div>
    <table class="main_table">
        <tr>
            <td class="category" onclick="redirecttab('oceny')" rowspan="2">Tabele</td>
            <td onclick="redirectvie('oceny_uzytkownikow')">oceny użytkowników</td>
        </tr>
        <tr>
            <td onclick="redirectvie('wszyscy_uzytkownicy')">wszyscy uzytkownicy</td>
        </tr>
        <tr>
            <td class="category" onclick="redirectvie('oceny_uzytkownikow')"rowspan="2">Widoki</td>
            <td></td>
        </tr>
        <tr>
            <td></td>
        </tr>
    </table>
    </div>
    <?php endif; ?>
                    <table class="display_table"><!--skrypt tabeli wyświetlającej dane-->
                    <?php 
                        if (!isset($_GET['mode'])){
                            $mode="table";//jeżeli nie jest ustawione, ustaw domyślne
                        } else {
                            $mode=$_GET['mode'];
                        }
                        if (!isset($_GET['tab'])){
                            $tab="aktorzy";
                        } else {
                            $tab=$_GET['tab'];
                        }
                    $qry=mysqli_query($con, "SELECT * FROM ".$tab);//Zapytanie biorące wszystkie dane z wybranej tabeli
                    $cols=mysqli_field_count($con);                //Pobieranie ilość kolumn z ostatniego zapytania
                    $qry2=mysqli_query($con, "DESCRIBE ".$tab);    //Pobranie nazw nagłówków
                    if (mysqli_num_rows($qry)>0){                  //Sprawdzenie czy jest coś do wyświetlenia
                        echo "<tr>";                               
                        while($names=mysqli_fetch_array($qry2)){   
                            echo "<th>".$names[0]."</th>";         //Wypisanie każdego nagłówka tabeli
                        }
                        echo "</tr>";
                        while ($row=mysqli_fetch_row($qry)){
                            echo "<tr>";
                            for($i=0;$i<$cols;$i++){                //Powtarza tyle razy, ile jest kolumn
                                if (substr($row[$i],0,8)=="https://"){//Jeżeli zaczyna się jak obraz, to zamiast wypisać tekst,
                                    echo "<td><img height='60px' src='".$row[$i]."'></td>";// otwiera go jako obraz
                                } else {
                                    echo "<td>".$row[$i]."</td>";//Jeżeli nie to jako normalna komórka
                                }
                            }
                        echo"</tr>";
                        }
                    } else {
                        echo "<td style='padding:15px;'>Brak informacji do wyświetlenia...</td>";//Jeżeli nie ma wartości to wypisuje brak informacji
                    }
                    
                    ?>
    <footer>
        <section>
            <h1>Movielock</h1>
            <a href="kontakt.html">Kontakt</a>
        </section>
    </footer>
</body>
</html>