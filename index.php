<?php
session_start();
$gatunki=[];
$con=mysqli_connect("localhost","root","","movielock");/*połączenie z bazą*/
$gatunki_qry=mysqli_query($con,"SELECT gatunek FROM filmy GROUP BY gatunek ORDER BY RAND();");
while($gatunki_row=mysqli_fetch_array($gatunki_qry)){
    array_push($gatunki,$gatunki_row[0]);/*dodanie do tablicy losowo gatunków z bazy*/
}
?>
<!DOCTYPE html>
<html lang="pl"> 
<head>
    <meta charset="UTF-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Strona Główna | Movielock</title> 
    <link rel="icon" href="logo.png"><!-- Dodanie obrazu jako ikony do karty przeglądarki -->
    <link rel="stylesheet" href="styl.css"> <!-- Połączenie do ogólnego pliku ze stylami -->
    <link rel="stylesheet" href="index.css"><!-- Połączenie do pliku ze stylami używanego na kilku stronach -->
</head>
<body>
    <header>
        <img alt="logo" src="logo.png"><!-- Połączenie do pliku ze stylami używanego na kilku stronach -->

        <section>
            <h1>Movielock</h1>
            <?php if(isset($_SESSION['user_id'])): ?>
                <a href="<?php 
                    switch($_SESSION['user_role']) {//Sprawdzenie czy użytkownik jest ustawiony i wypisanie odpowiedniego
                        case 'admin': echo 'admin_panel.php'; break;// linku do profilu lub panelu
                        case 'moderator': echo 'moderator_panel.php'; break;
                        case 'edytor': echo 'edytor_panel.php'; break;
                        default: echo 'user_profile.php';
                    }
                ?>" class="odstep">Moje konto</a>
                <a href="logout.php">Wyloguj</a>
                <a href="koszyk.php" class="odstep">Koszyk</a>
            <?php else: ?>
                <a href="login.php" class="odstep">Logowanie</a><!-- W przypadku braku, wypisanie odnośnika do logowania -->
            <?php endif; ?>
            <a href="top_popularnosc.php">Najpopularniejsze</a>
            <a href="top_ocena.php">Najlepsze</a>
            <a href="index.php">Strona Główna</a>
        </section>
    </header>
    <main>
        <section class="main-lewy">
            <br>
            <br>
            <br>
            <img alt="logo" src="logo.png" class="logo">
            <h1>Movielock</h1>
            <h3>Skrytka na filmy</h3>
        </section>
        <section class="main-prawy">
            <img alt="obraz" src="obraz.jpeg" width="100%" height="600px">
        </section><!-- Górna część głównego bloku z logiem strony oraz nazwą-->
        <?php 
        foreach($gatunki as $gatunek){
            echo "<h2 class='category-title'>".$gatunek."</h2>";                                                            // Dla każdego gatunku wypisuje nazwe
            $qry = mysqli_query($con, "SELECT ID,tytul,zdjecie FROM filmy WHERE gatunek='".$gatunek."' LIMIT 10;");         //Po losuje 10 filmów z tej kategori
            while ($row=mysqli_fetch_row($qry)){
                echo "<section class='film'><a class='info' href='filmy_info.php?id=".$row[0]."'><img alt='film' src='".$row[2]."'><h2>".$row[1]."</h2></a></section>";
            }                                                                                               // i wypisuje je obok siebie, robi to dla każdego elementu
        }
        ?>
    </main>
    <footer><!--Stopka zawierająca odnośnik do kontaktu -->
        <section>
            <h1>Movielock</h1>
            <a href="kontakt.html">Kontakt</a>
        </section>
    </footer>
</body>
</html>