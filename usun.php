<?php
if (isset($_GET['tab']) && isset($_GET['rekord'])){
    require 'db_connect.php';
    $tab=$_GET['tab'];
    $rek=(int)$_GET['rekord'];//Upewnia się że rekord to numer, jeżeli nie
    // ustawia 0, co w zapytaniu nie znajduje rekordów do usunięcia
    mysqli_query($conn,"DELETE FROM ".$tab." WHERE ID='".$rek."'");
}
echo "<script>history.go(-1)</script>";//Cofa na poprzednią strone po usunięciu
?>