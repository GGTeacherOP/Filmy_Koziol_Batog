<?php
session_start();
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Strona Główna | Movielock</title>
    <link rel="stylesheet" href="styl.css">
    <link rel="stylesheet" href="index.css">
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
            <a href="top_popularnosc.html">Najpopularniejsze</a>
            <a href="top_ocena.html">Najlepsze</a>
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
        </section>
        <h2 class="category-title">Dramat</h2>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <h2 class="category-title">Komedia</h2>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <h2 class="category-title">Horror</h2>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <h2 class="category-title">Science Fiction</h2>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <h2 class="category-title">Romans</h2>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <h2 class="category-title">Akcja</h2>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
        <section class="film"><a class="info" href="filmy_info.html"><img alt="film" src=".png"><h2>Film</h2></a></section>
    </main>
    <footer>
        <section>
            <h1>Movielock</h1>
            <a href="kontakt.html">Kontakt</a>
        </section>
    </footer>
</body>
</html>