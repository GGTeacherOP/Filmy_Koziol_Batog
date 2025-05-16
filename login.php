<?php
session_start();
require 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $login = trim($_POST['log']); 
    $password = $_POST['has'];

    // Walidacja danych
    if (empty($login) || empty($password)) {
        header("Location: login.php?error=Wszystkie pola są wymagane");
        exit();
    }

    // Pobranie użytkownika z bazy
    $query = "SELECT ID, login, haslo, rola FROM uzytkownicy WHERE login = ?";
    $stmt = mysqli_prepare($conn, $query);
    mysqli_stmt_bind_param($stmt, "s", $login);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_store_result($stmt);

    if (mysqli_stmt_num_rows($stmt) === 1) {
        mysqli_stmt_bind_result($stmt, $id, $db_login, $db_password, $db_role);
        mysqli_stmt_fetch($stmt);
        //weryfikacja hasła
        if ($password === $db_password) {
            // Ustawienie sesji
            $_SESSION['user_id'] = $id;
            $_SESSION['user_login'] = $db_login;
            $_SESSION['user_role'] = $db_role;

            // Przekierowanie w zależności od roli
            switch ($db_role) {
                case 'admin':
                    header("Location: admin_panel.php");
                    break;
                case 'moderator':
                    header("Location: moderator_panel.php");
                    break;
                case 'edytor':
                    header("Location: edytor_panel.php");
                    break;
                default:
                    header("Location: index.php");
            }
            mysqli_stmt_close($stmt);
            mysqli_close($conn);
            exit();
        }
    }
    mysqli_stmt_close($stmt);

    // Jeśli logowanie nie powiodło się
    header("Location: login.php?error=Nieprawidłowy login lub hasło");
    mysqli_close($conn);
    exit();
}
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logowanie | Movielock</title>
    <link rel="stylesheet" href="styl.css">
    <link rel="stylesheet" href="login.css">
</head>
<body>
    <header>
        <img alt="logo" src="logo.png">
        <section>
            <h1>Movielock</h1>
            <a href="login.php" class="odstep">Logowanie</a>
            <a href="top_popularnosc.html">Najpopularniejsze</a>
            <a href="top_ocena.html">Najlepsze</a>
            <a href="index.php">Strona Główna</a>
        </section>
    </header>
    <main>
        <section>
            <h2>Logowanie</h2>
            <?php if(isset($_GET['error'])): ?>
                <div class="error"><?php echo htmlspecialchars($_GET['error']); ?></div>
            <?php endif; ?>
            <form action="login.php" method="post">
                <label for="log">Login: </label><br>
                <input type="text" name="log" id="log" required><br>
                <label for="has">Hasło: </label><br>
                <input type="password" name="has" id="has" required><br>
                <input type="submit" value="Zaloguj się" class="submit"><br><br>
            </form>
            <p>Nie masz konta?</p>
            <a class="zmiana_strony" href="rejestracja.php">Zarejestruj się</a>
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