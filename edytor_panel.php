<?php
session_start();
$con=mysqli_connect("localhost","root","","movielock");
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel Edytora | Movielock</title>
    <link rel="icon" href="logo.png">
    <link rel="stylesheet" href="styl.css">
    <link rel="stylesheet" href="panel.css">
        <style>
        input, select {
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
    </style>
    <script>
        function redirecttab(x){
            window.open("edytor_panel.php?mode=table&tab="+x, '_self').focus();
        }
                function redirectvie(x){
            window.open("edytor_panel.php?mode=view&tab="+x, '_self').focus();
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
    if (!isset($_GET['mode'])){
        $_GET['mode']="table";
    }
    if (!isset($_GET['tab'])){
        $_GET['tab']="aktorzy";
    }
    
    if($_GET['mode']=="table"): ?>
    <div>
    <table class="main_table">
        <tr>
            <td class="category" onclick="redirecttab('aktorzy')" rowspan="2">Tabele</td>
            <td onclick="redirecttab('aktorzy')">aktorzy</td>
        </tr>
        <tr>
            <td onclick="redirecttab('filmy')">filmy</td>
        </tr>
        <tr>
            <td class="category" onclick="redirectvie('top_aktorzy')"rowspan="2">Widoki</td>
            <td onclick="redirecttab('rezyserzy')">reżyserzy</td>
        </tr>
        <tr>
            <td onclick="redirecttab('wystapienia')">wystąpienia</td>
        </tr>
    </table>
    <?php elseif ($_GET['mode']=="view"): ?>
    <div>
    <table class="main_table">
        <tr>
            <td class="category" onclick="redirecttab('aktorzy')" rowspan="2">Tabele</td>
            <td onclick="redirectvie('top_aktorzy')">top aktorzy</td>
        </tr>
        <tr>
            <td onclick="redirectvie('top_ocena')">top ocena</td>
        </tr>
        <tr>
            <td class="category" onclick="redirectvie('top_aktorzy')"rowspan="2">Widoki</td>
            <td onclick="redirectvie('top_popularnosc')">top popularnosc</td>
        </tr>
        <tr>
            <td onclick="redirectvie('top_rezyserzy')">top rezyserzy</td>
        </tr>
    </table>
    </div>
    <?php endif; ?>
    <table class="display_table" id="input_table" style="margin-bottom:20px;">
        <tr><td colspan="9">Wstaw</td></tr>
        <tr>                    
                    <?php 
                        if (!isset($_GET['mode'])){
                            $mode="table";
                        } else {
                            $mode=$_GET['mode'];
                        }
                        if (!isset($_GET['tab'])){
                            $tab="aktorzy";
                        } else {
                            $tab=$_GET['tab'];
                        }

                switch($tab){
                    case 'aktorzy':
                        echo "<td>Imię i nazwisko</td><td>Zdjęcie</td><td>Ranking popularności</td><td>Życiorys</td><td>Ocena</td></tr>";
                        echo "<form method='post'><tr><td><input type='text' name='input1' maxlength='100'></td><td><input type='text' name='input2' maxlength='255'></td><td><input type='number' name='input3' maxlength='11' min='1'></td><td><input type='text' name='input4' maxlength='5000'></td><td><input type='number' name='input5' step='0.01' max='10' min='0'></td>";
                        break;
                    case 'filmy':
                        echo "<td>Tytuł</td><td>Zdjęcie</td><td>Gatunek</td><td>Typ</td><td>Id_reżysera</td><td>Opis</td><td>Średnia ocena</td><td>Ranking</td></tr>";
                        echo "<form method='post'><tr><td><input type='text' name='input1' maxlength='255'></td><td><input type='text' name='input2' maxlength='255'></td><td><input type='text' name='input3' maxlength='100'></td><td><select name='input4'><option value='film'>Film</option><option value='serial'>Serial</option></select></td><td><input type='number' name='input5' maxlength='11' min='1'></td><td><input type='text' name='input6' maxlenght='5000'></td><td><input type='number' name='input7' step='0.1' max='10' min='0'></td><td><input type='number' name='input8' maxlength='11' min='1'></td>";
                        break;
                    case 'rezyserzy':
                        echo "<td>Imię i nazwisko</td><td>Zdjęcie</td><td>Ranking popularności</td><td>Życiorys</td><td>Ocena</td></tr>";
                        echo "<form method='post'><tr><td><input type='text' name='input1' maxlength='100'></td><td><input type='text' name='input2' maxlength='255'></td><td><input type='number' name='input3' maxlength='11' min='1'></td><td><input type='text' name='input4' maxlength='5000'></td><td><input type='number' name='input5' step='0.01' max='10' min='0'></td>";
                        break;
                    case 'wystapienia':
                        echo "<td>Id filmu</td><td>Id aktora</td></tr>";
                        echo "<form method='post'><tr><td><input type='number' name='input1' maxlength='11' min='1'></td><td><input type='number' name='input2' maxlength='11' min='1'></td>";
                        break;
                    default:
                        echo "<script>document.getElementById('input_table').style.display='none'</script>";
                        break;
                }
                ?>
                </tr>
                <tr>
                    <td colspan="9"><input name="submit" type='submit' style="color:white;float:right;" value="Wyślij" class="outline_txt"></td></form>
                </tr>
                </table>
                <?php
                if(isset($_POST['submit'])){
        switch($tab){
            case 'wystapienia'://2 do wstawienia
                if(isset($_POST['input1']) && isset($_POST['input2'])){
                    mysqli_query($con,"INSERT INTO ".$tab." VALUES (NULL,'".$_POST['input1']."','".$_POST['input2']."');");
                } break;
            case 'aktorzy':  
            case 'rezyserzy'://5 do wstawienia
                if(isset($_POST['input1']) && isset($_POST['input2']) && isset($_POST['input3']) && isset($_POST['input4']) && isset($_POST['input5'])){
                    mysqli_query($con,"INSERT INTO ".$tab." VALUES (NULL,'".$_POST['input1']."','".$_POST['input2']."','".$_POST['input3']."','".$_POST['input4']."','".$_POST['input5']."');");
                } break;
            case 'filmy'://8 do wstawienia
                if(isset($_POST['input1']) && isset($_POST['input2']) && isset($_POST['input3']) && isset($_POST['input4']) && isset($_POST['input5']) && isset($_POST['input6']) && isset($_POST['input7']) && isset($_POST['input8'])){
                    mysqli_query($con,"INSERT INTO ".$tab." VALUES (NULL,'".$_POST['input1']."','".$_POST['input2']."','".$_POST['input3']."','".$_POST['input4']."','".$_POST['input5']."','".$_POST['input6']."','".$_POST['input7']."','".$_POST['input8']."');");
                } break;
        }
    }
    ?>
    <table class="display_table">
    <?php
                    $qry=mysqli_query($con, "SELECT * FROM ".$tab." ORDER BY ID");
                    $cols=mysqli_field_count($con);
                    $qry2=mysqli_query($con, "DESCRIBE ".$tab);
                    $j=1;
                    if (mysqli_num_rows($qry)>0){
                        echo "<tr>";
                        while($names=mysqli_fetch_array($qry2)){
                            echo "<th>".$names[0]."</th>";
                        }
                        echo "</tr>";
                        while ($row=mysqli_fetch_row($qry)){
                            echo "<tr>";
                            for($i=0;$i<$cols;$i++){
                                if (substr($row[$i],0,8)=="https://"){
                                    echo "<td><img height='60px' src='".$row[$i]."'></td>";
                                } else {
                                    echo "<td>".$row[$i]."</td>";
                                }
                            }
                        if ($mode=='table'){
                            echo"<td><a style='float:unset;' href='edycja.php?tab=".$tab."&rekord=".$row[0]."'>Edytuj</a><br><a style='float:unset;' href='usun.php?tab=".$tab."&rekord=".$row[0]."'>Usuń</a></td></tr>";
                        }
                        $j++;
                        }
                    } else {
                        echo "<td style='padding:15px;'>Brak informacji do wyświetlenia...</td>";
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