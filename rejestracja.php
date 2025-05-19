<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rejestracja | Movielock</title>
    <link rel="icon" href="logo.png">
    <link rel="stylesheet" href="styl.css">
    <link rel="stylesheet" href="login.css">
</head>
<body>
    <header>
        <img alt="logo" src="logo.png">
        <section>
            <h1>Movielock</h1>
            <a href="login.php" class="odstep">Logowanie</a>
            <a href="top_popularnosc.php">Najpopularniejsze</a>
            <a href="top_ocena.php">Najlepsze</a>
            <a href="index.php">Strona Główna</a>
        </section>
    </header>
    <main>
        <section>
            <h2>Rejestracja</h2>
            <form method="post">
                <label for="log">Login: </label><br>
                <input type="text" name="log"><br>
                

                <label for="email">Email: </label><br>
                <input type="email" name="email"><br>

                <label for="has1">Hasło: </label><br>
                <input type="password" name="has1"><br>

                <label for="has2">Powtórz Hasło: </label><br>
                <input type="password" name="has2" class="lastinput"><br>

                <span id="login_exist">Konto już istnieje</span><br>
                <span id="haspotw">Hasła muszą się zgadzać</span><br>
                <span id="nieok">Należy wpisać poprawne dane</span><br>
                <input type="submit" value="Zarejestruj się" class="submit" name="submit" style="margin-top:0;"><br><br>
            </form><!-- Formularz rejestracji na stronie rejestracja.php-->
            <p>Chcesz się zalogować?</p>
            <a class="zmiana_strony" href="login.php">Zaloguj się</a><!-- Przycisk odsyłający na stronę z logowaniem-->

        </section>
    </main>
    <footer>
        <section>
            <h1>Movielock</h1>
            <a href="kontakt.php">Kontakt</a>
        </section>
    </footer>
</body>
</html>
<?php
$issetlog=false;//Ustawienie zmiennych potwierdzających prawidłowość danych
$issetemail=false;
$potw_haslo=false;
$qry=mysqli_query(mysqli_connect("localhost","root","","movielock"),"SELECT login FROM uzytkownicy;");

if(isset($_POST['submit']) && isset($_POST['log']) && isset($_POST['email']) && isset($_POST['has1']) && isset($_POST['has2'])){
    $log=$_POST['log'];
    if($log!=""){//Jeżeli login jest niepusty
        while ($row=mysqli_fetch_array($qry)){
            if ($row[0]==$log){
                echo("<script>document.getElementById('login_exist').style.display='initial';</script>");
                $issetlog=false;
                break;//Jeżeli występuje chociaż jeden taki sam login,pokazuje błąd i kończy pętle
            } else {
                $issetlog=true;//Jeżeli nie znajdzie potwierdza login
            }
        }
    } else {
        echo("<script>document.getElementById('nieok').style.display='initial';</script>");
    }
    $email=$_POST['email'];
    if($email!=""){
        $issetemail=true;
    } else {
        echo("<script>document.getElementById('nieok').style.display='initial';</script>");
    }
    $has1=$_POST['has1'];
    $has2=$_POST['has2'];
    if($has1!="" && $has2!=""){
        if ($has1==$has2){//Obydwa hasła muszą się zgadzać, jeżeli nie, pokazuje błąd
            $has_potw=$has1;
        } else {
            echo("<script>document.getElementById('haspotw').style.display='initial';</script>");
        }
    } else {
        echo("<script>document.getElementById('nieok').style.display='initial';</script>");
    }

    if($has1!=$has2){
        echo("<script>document.getElementById('haspotw').style.display='initial';</script>");
    } else {
        $potw_haslo=true;
        
    }
    echo("<script>console.log('".$log."');console.log('".$email."');console.log('".$has1."');console.log('".$has2."');console.log('".$potw_haslo."');");
}
if ($issetlog && $issetemail && $potw_haslo){//Jeżeli wszystko się zgadza, tworzy użytkownika
    $qry = mysqli_query(mysqli_connect("localhost","root","","movielock"), "INSERT INTO `uzytkownicy`(`login`, `haslo`, `rola`, `email`) VALUES ('".$log."','".$has_potw."','uzytkownik','".$email."')");
    header('Location: login.php');
}
?>