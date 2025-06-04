<?php
$host = "localhost";
$user = "root";
$pass = "";
$db = "movielock";

$conn = mysqli_connect($host, $user, $pass, $db);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Rozpocznij sesję jeśli nie została jeszcze rozpoczęta
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Funkcja do dodawania filmu do koszyka w bazie danych
function dodaj_do_koszyka($conn, $user_id, $film_id) {
    $query = "INSERT INTO koszyk (uzytkownik_id, film_id) VALUES (?, ?)";
    $stmt = mysqli_prepare($conn, $query);
    mysqli_stmt_bind_param($stmt, "ii", $user_id, $film_id);
    return mysqli_stmt_execute($stmt);
}

// Funkcja do usuwania filmu z koszyka w bazie danych
function usun_z_koszyka($conn, $user_id, $film_id) {
    $query = "DELETE FROM koszyk WHERE uzytkownik_id = ? AND film_id = ?";
    $stmt = mysqli_prepare($conn, $query);
    mysqli_stmt_bind_param($stmt, "ii", $user_id, $film_id);
    return mysqli_stmt_execute($stmt);
}

// Funkcja do pobierania zawartości koszyka z bazy danych
function pobierz_koszyk($conn, $user_id) {
    $query = "SELECT f.ID, f.tytul, f.zdjecie 
              FROM koszyk k 
              JOIN filmy f ON k.film_id = f.ID 
              WHERE k.uzytkownik_id = ?";
    $stmt = mysqli_prepare($conn, $query);
    mysqli_stmt_bind_param($stmt, "i", $user_id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    return mysqli_fetch_all($result, MYSQLI_ASSOC);
}

// Funkcja do czyszczenia koszyka po zakupie
function wyczysc_koszyk($conn, $user_id) {
    $query = "DELETE FROM koszyk WHERE uzytkownik_id = ?";
    $stmt = mysqli_prepare($conn, $query);
    mysqli_stmt_bind_param($stmt, "i", $user_id);
    return mysqli_stmt_execute($stmt);
}
?>