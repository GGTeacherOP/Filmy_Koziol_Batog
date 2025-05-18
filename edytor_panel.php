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
            <td class="category" onclick="redirectvie('oceny_uzytkownikow')"rowspan="2">Widoki</td>
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
            <td class="category" onclick="redirectvie('oceny_uzytkownikow')"rowspan="2">Widoki</td>
            <td onclick="redirectvie('top_popularnosc')">top popularnosc</td>
        </tr>
        <tr>
            <td onclick="redirectvie('top_rezyserzy')">top rezyserzy</td>
        </tr>
    </table>
    </div>
    <?php endif; ?>
                    <table class="display_table">
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
                    $qry=mysqli_query($con, "SELECT * FROM ".$tab);
                    $cols=mysqli_field_count($con);
                    $qry2=mysqli_query($con, "DESCRIBE ".$tab);
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
                        echo"</tr>";
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