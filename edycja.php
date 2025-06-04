<?php
session_start();
$con=mysqli_connect("localhost","root","","movielock");
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel Administratora | Movielock</title>
        <link rel="icon" href="logo.png">
    <link rel="stylesheet" href="styl.css">
    <link rel="stylesheet" href="panel.css">
    <style>
        input {
            background-color: #aaa;
            border:1px solid black;
            border-radius: 10px;
            padding:2px;
            padding-left: 8px;
            padding-right: 8px;
            text-shadow: 1px 1px black, 1px -1px black, -1px 1px black, -1px -1px black;
            color:white;
        }
        .outline_txt {
            text-shadow: 1px 1px black, 1px -1px black, -1px 1px black, -1px -1px black;
        }
        td,th{
            padding:10px;
        }
        input[type="text"]{
            width:85%;
        }
    </style>
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
    <table class="display_table" style="margin-left:10%;margin-right:10%;width:80%;">
        <tr><th colspan="9" style="font-size:x-large">Obecne wartości</th></tr><tr>
<?php
if (isset($_GET['tab']) && isset($_GET['rekord'])){
    require 'db_connect.php';
    $tab=$_GET['tab'];
    $rek=(int)$_GET['rekord'];
    $qry=mysqli_query($conn,"SELECT * FROM ".$tab." WHERE ID='".$rek."';");
    $row=mysqli_fetch_row($qry);

    $qry2=mysqli_query($con, "DESCRIBE ".$tab);

    $i=0;
    while($names=mysqli_fetch_array($qry2)){
        if($i==0){
            $i++;
            continue;
        } //Pominięcie pierwszego pola
         echo "<th>".$names[0]."</th>";
    }
    echo "</tr><tr>";
    for($i=1;$i<mysqli_num_fields($qry);$i++){
        echo "<td>".$row[$i]."</td>";
    }

    switch($tab){
                    case 'aktorzy':
                        echo "<form method='post'><tr><td><input type='text' name='input1' maxlength='100'value='".$row[1]."'></td><td><input type='text' name='input2' maxlength='255' value='".$row[2]."'></td><td><input type='number' name='input3' maxlength='11' min='1' value='".$row[3]."'></td><td><input type='text' name='input4' maxlength='5000' value='".$row[4]."'></td><td><input type='number' name='input5' step='0.01' max='10' min='0' value='".$row[5]."'></td>";
                        break;
                    case 'filmy':
                        echo "<form method='post'><tr><td><input type='text' name='input1' maxlength='255' value='".$row[1]."'></td><td><input type='text' name='input2' maxlength='255' value='".$row[2]."'></td><td><input type='text' name='input3' maxlength='100' value='".$row[3]."'></td><td><select name='input4'>";
                        if($row[4]== "film"){//Jeżeli ten rekord był poprzednio ustawiony, oznacza go jako podstawowy
                            echo "<option value='film' selected='selected'>Film</option><option value='serial'>Serial</option>";
                        } else if($row[4]=="serial"){//Jeżeli był to ten, oznacza tego
                            echo "<option value='film'>Film</option><option value='serial' selected='selected'>Serial</option>";
                        }
                        echo "</select></td><td><input type='number' name='input5' maxlength='11' min='1' value='".$row[5]."'></td><td><input type='text' name='input6' maxlenght='5000' value='".$row[6]."'></td><td><input type='number' name='input7' step='0.1' max='10' min='0' value='".$row[7]."'></td><td><input type='number' name='input8' maxlength='11' min='1' value='".$row[8]."'></td>";
                        break;
                    case 'oceny':
                        echo "<form method='post'><tr><td><input type='number' name='input1' maxlength='11' min='1' value='".$row[1]."'></td><td><input type='number' name='input2' maxlength='11' min='1' value='".$row[2]."'></td><td><input type='number' name='input3' step='0.1' max='10' min='1' value='".$row[3]."'></td><td><input type='text' name='input4' maxlength='5000' value='".$row[4]."'></td><td><select name='input5'>";
                        if ($row[5]=="niezaakceptowane"){
                            echo "<option value='niezaakceptowane' selected='selected'>Niezaakceptowane</option><option value='zaakceptowane'>Zaakceptowane</option>";
                        } else if ($row[5]== "zaakceptowane"){
                            echo "<option value='niezaakceptowane'>Niezaakceptowane</option><option value='zaakceptowane' selected='selected'>Zaakceptowane</option>";
                        }
                        echo "</select></td>";
                        break;
                    case 'koszyk':
                        echo "<form method='post'><tr><td><input type='number' name='input1' maxlength='11' min='1' value='".$row[1]."'></td><td><input type='number' name='input2' maxlength='11' min='1' value='".$row[2]."'></td>";
                        break;
                    case 'personel':
                        echo "<form method='post'><tr><td><input type='number' name='input1' maxlength='11' min='1' value='".$row[1]."'></td><td><select name='input2'>";
                        if ($row[2]=="edytor"){
                            echo "<option value='edytor' selected='selected'>Edytor</option><option value='moderator'>Moderator</option><option value='admin'>Admin</option>";
                        } else if ($row[2]=="moderator"){
                            echo "<option value='edytor'>Edytor</option><option value='moderator' selected='selected'>Moderator</option><option value='admin'>Admin</option>";
                        } else if ($row[2]=="admin"){
                            echo "<option value='edytor'>Edytor</option><option value='moderator'>Moderator</option><option value='admin' selected='selected'>Admin</option>";
                        }
                        echo "</select></td><td><input type='number' name='input3' step='1' min='0' value='".$row[3]."'></td>";
                        break;
                    case 'rezyserzy':
                        echo "<form method='post'><tr><td><input type='text' name='input1' maxlength='100' value='".$row[1]."'></td><td><input type='text' name='input2' maxlength='255' value='".$row[2]."'></td><td><input type='number' name='input3' maxlength='11' min='1' value='".$row[3]."'></td><td><input type='text' name='input4' maxlength='5000' value='".$row[4]."'></td><td><input type='number' name='input5' step='0.01' max='10' min='0' value='".$row[5]."'></td>";
                        break;
                    case 'statystyki_systemu':
                        echo "<form method='post'><tr><td><input type='number' name='input1' maxlength='11' min='1' value='".$row[1]."'></td><td><input type='number' name='input2' maxlength='11' min='1' value='".$row[2]."'></td><td><input type='number' name='input3' maxlength='11' min='1' value='".$row[3]."'></td><td><input type='number' name='input4' maxlength='11' min='1' value='".$row[4]."'></td>";
                        break;
                    case 'statusy_filmow':
                        echo "<form method='post'><tr><td><input type='number' name='input1' maxlength='11' min='1' value='".$row[1]."'></td><td><input type='number' name='input2' maxlength='11' min='1' value='".$row[2]."'></td><td><select name='input3'>";
                        if ($row[3]=="planowane"){
                            echo "<option value='planowane' selected='selected'>Planowane</option><option value='obejrzane'>Obejrzane</option>";
                        } else if ($row[3]=="obejrzane"){
                            echo "<option value='planowane'>Planowane</option><option value='obejrzane' selected='selected'>Obejrzane</option>";
                        }
                        echo "</select></td><td><input type='number' name='input4' min='0' max='1' step='1' value='".$row[4]."'></td>";
                        break;
                    case 'uzytkownicy':
                        echo "<form method='post'><tr><td><input type='text' name='input1' maxlength='255' value='".$row[1]."'></td><td><input type='text' name='input2' maxlength='255' value='".$row[2]."'></td><td><select name='input3'>";
                        if ($row[3]== "uzytkownik"){
                            echo "<option value='uzytkownik' selected='selected'>Użytkownik</option><option value='edytor'>Edytor</option><option value='moderator'>Moderator</option><option value='admin'>Admin</option>";
                        } else if ($row[3]== "edytor"){
                            echo "<option value='uzytkownik'>Użytkownik</option><option value='edytor' selected='selected'>Edytor</option><option value='moderator'>Moderator</option><option value='admin'>Admin</option>";
                        } else if ($row[3]== "moderator"){
                            echo "<option value='uzytkownik'>Użytkownik</option><option value='edytor'>Edytor</option><option value='moderator' selected='selected'>Moderator</option><option value='admin'>Admin</option>";
                        } else if ($row[3]== "admin"){
                            echo "<option value='uzytkownik'>Użytkownik</option><option value='edytor'>Edytor</option><option value='moderator'>Moderator</option><option value='admin' selected='selected'>Admin</option>";
                        }
                        
                        echo "</select></td><td><input type='email' name='input4' maxlength='100' value='".$row[4]."'></td>";
                        break;
                    case 'wystapienia':
                        echo "<form method='post'><tr><td><input type='number' name='input1' maxlength='11' min='1' value='".$row[1]."'></td><td><input type='number' name='input2' maxlength='11' min='1' value='".$row[2]."'></td>";
                        break;
                    }
    echo "</tr><tr><td colspan='9'><input type='submit' value='Zmień' name='update'></td></tr></form>";
} else {
    echo "<script>history.go(-2)</script></tr>";
}
?>
    </table>
    <?php 
    if(isset($_POST['update'])){
        switch($tab){
            case 'aktorzy':
                if (isset($_POST['input1']) && isset($_POST['input2']) && isset($_POST['input3']) && isset($_POST['input4']) && isset($_POST['input5'])){
                    mysqli_query($conn,"UPDATE ".$tab." SET 
                    `imie_nazwisko`='".$_POST['input1']."',
                    `zdjecie`='".$_POST['input2']."',
                    `ranking_popularnosci`='".$_POST['input3']."',
                    `zyciorys`='".$_POST['input4']."',
                    `ocena`='".$_POST['input5']."'
                    WHERE `ID`='".$rek."'" );//Obsługa formularzu
                    echo "<script>history.go(-2)</script>";//Odesłanie użytkownika o 2 strony
                }                                  // (1 do oryginalnego formuarzu, 2 na panel)
                break;
            case 'filmy':
                if (isset($_POST['input1']) && isset($_POST['input2']) && isset($_POST['input3']) && isset($_POST['input4']) && isset($_POST['input5']) && isset($_POST['input6']) && isset($_POST['input7']) && isset($_POST['input8'])){
                    mysqli_query($conn,"UPDATE ".$tab." SET 
                    `tytul`='".$_POST['input1']."',
                    `zdjecie`='".$_POST['input2']."',
                    `gatunek`='".$_POST['input3']."',
                    `typ`='".$_POST['input4']."',
                    `rezyser_id`='".$_POST['input5']."',
                    `opis`='".$_POST['input6']."',
                    `srednia_ocena`='".$_POST['input7']."',
                    `ranking_popularnosci`='".$_POST['input8']."'
                    WHERE `ID`='".$rek."'" );
                    echo "<script>history.go(-2)</script>";
                }
                break;
            case 'koszyk':
                if (isset($_POST['input1']) && isset($_POST['input2'])){
                    mysqli_query($conn,"UPDATE ".$tab." SET 
                    `uzytkownik_id`='".$_POST['input1']."',
                    `film_id`='".$_POST['input2']."'
                    WHERE `id`='".$rek."'" );
                    echo "<script>history.go(-2)</script>";
                }
                break;
            case 'oceny':
                if (isset($_POST['input1']) && isset($_POST['input2']) && isset($_POST['input3']) && isset($_POST['input4']) && isset($_POST['input5'])){
                mysqli_query($conn,"UPDATE ".$tab." SET 
                `film_id`='".$_POST['input1']."',
                `uzytkownik_id`='".$_POST['input2']."',
                `ocena`='".$_POST['input3']."',
                `opis`='".$_POST['input4']."',
                `potwierdzone`='".$_POST['input5']."'
                WHERE `ID`='".$rek."';" );
                echo "<script>history.go(-2)</script>";
                }
            break;
            case 'personel':
                if (isset($_POST['input1']) && isset($_POST['input2']) && isset($_POST['input3'])){
                mysqli_query($conn,"UPDATE ".$tab." SET 
                `uzytkownik_id`='".$_POST['input1']."',
                `uprawnienia`='".$_POST['input2']."',
                `wynagrodzenie`='".$_POST['input3']."'
                WHERE `ID`='".$rek."'" );
                echo "<script>history.go(-2)</script>";
                }
            break;
            case 'rezyserzy':
                if (isset($_POST['input1']) && isset($_POST['input2']) && isset($_POST['input3']) && isset($_POST['input4']) && isset($_POST['input5'])){
                mysqli_query($conn,"UPDATE ".$tab." SET 
                `imie_nazwisko`='".$_POST['input1']."',
                `zdjecie`='".$_POST['input2']."',
                `ranking_popularnosci`='".$_POST['input3']."',
                `zyciorys`='".$_POST['input4']."',
                `ocena`='".$_POST['input5']."'
                WHERE `ID`='".$rek."'" );
                echo "<script>history.go(-2)</script>";
                }
            break;
            case 'statusy_filmow':
                if (isset($_POST['input1']) && isset($_POST['input2']) && isset($_POST['input3']) && isset($_POST['input4'])){
                mysqli_query($conn,"UPDATE ".$tab." SET 
                `film_id`='".$_POST['input1']."',
                `uzytkownik_id`='".$_POST['input2']."',
                `status`='".$_POST['input3']."',
                `kupione`='".$_POST['input4']."'
                WHERE `ID`='".$rek."'" );
                echo "<script>history.go(-2)</script>";
                }
            break;
            case 'statystyki_systemu':
                if (isset($_POST['input1']) && isset($_POST['input2']) && isset($_POST['input3']) && isset($_POST['input4'])){
                mysqli_query($conn,"UPDATE ".$tab." SET 
                `liczba_uzytkownikow`='".$_POST['input1']."',
                `liczba_produkcji`='".$_POST['input2']."',
                `liczba_aktorow`='".$_POST['input3']."',
                `liczba_rezyserow`='".$_POST['input4']."'
                WHERE `id`='".$rek."'" );
                echo "<script>history.go(-2)</script>";
                }
            break;
            case 'uzytkownicy':
                if (isset($_POST['input1']) && isset($_POST['input2']) && isset($_POST['input3']) && isset($_POST['input4'])){
                mysqli_query($conn,"UPDATE ".$tab." SET 
                `login`='".$_POST['input1']."',
                `haslo`='".$_POST['input2']."',
                `rola`='".$_POST['input3']."',
                `email`='".$_POST['input4']."'
                WHERE `ID`='".$rek."'" );
                echo "<script>history.go(-2)</script>";
                }
            break;
            case 'wystapienia':
                if (isset($_POST['input1']) && isset($_POST['input2'])){
                mysqli_query($conn,"UPDATE ".$tab." SET 
                `id_filmu`='".$_POST['input1']."',
                `id_aktora`='".$_POST['input2']."'
                WHERE `id`='".$rek."'" );
                echo "<script>history.go(-2)</script>";
                }
            break;
        }
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