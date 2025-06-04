<?php
session_start();
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Informacje | Movielock</title>
    <link rel="stylesheet" href="styl.css">
    <link rel="stylesheet" href="info.css">
</head>
<body>
    <?php
    require_once 'db_connect.php';
    
    // Pobranie ID rezysera z parametru URL
    $rezyser_id = isset($_GET['id']) ? intval($_GET['id']) : 1;
    
    // Zapytanie o informacje o rezyserze
    $query_rezyser = "SELECT * FROM rezyserzy WHERE ID = $rezyser_id";
    $result_rezyser = mysqli_query($conn, $query_rezyser);
    
    if (!$result_rezyser || mysqli_num_rows($result_rezyser) == 0) {
        die("Reżyser nie znaleziony");
    }
    
    $rezyser = mysqli_fetch_assoc($result_rezyser);
    
    // Zapytanie o filmy z udziałem rezysera (ograniczone do 5)
    $query_filmy = "SELECT f.tytul, f.zdjecie, f.ID, r.ID AS id_rezysera
                   FROM filmy f
                   JOIN rezyserzy r ON f.rezyser_id = r.ID
                   WHERE r.ID = $rezyser_id
                   LIMIT 5";
    $result_filmy = mysqli_query($conn, $query_filmy);
    ?>
    
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
                <a href="koszyk.php" class="odstep">Koszyk</a>
            <?php else: ?>
                <a href="login.php" class="odstep">Logowanie</a>
            <?php endif; ?>
            <a href="top_popularnosc.php">Najpopularniejsze</a>
            <a href="top_ocena.php">Najlepsze</a>
            <a href="index.php">Strona Główna</a>
        </section>
    </header>
    <main>
        <section class="main-lewy">
            <img style='width: 400px; height: 600px;' src="<?php echo htmlspecialchars($rezyser['zdjecie']); ?>" alt="Zdjęcie rezysera">
        </section>
        <section class="main-prawy">
            <h2 class="imie"><?php echo htmlspecialchars($rezyser['imie_nazwisko']); ?></h2>
            <section class="row2">
                <div class="popularnosc"><h5 class="miejsce">#<?php echo htmlspecialchars($rezyser['ranking_popularnosci']); ?></h5><h5 class="podtekst">Najpopularniejszy</h5></div>
                <div class="ocena"><h5 class="gwiazdy"><?php echo htmlspecialchars($rezyser['ocena']); ?></h5></div>
            </section>
            <div class="opis"><h5 class="opis-tekst"><?php echo htmlspecialchars($rezyser['zyciorys']); ?></h5></div>
            <section class="row3">
                <?php
                if ($result_filmy && mysqli_num_rows($result_filmy) > 0) {
                    while ($film = mysqli_fetch_assoc($result_filmy)) {
                        echo '<div class="aktor"><a href="filmy_info.php?id=' . $film['ID'] . '">';
                        echo '<img src="' . htmlspecialchars($film['zdjecie']) . '" alt="' . htmlspecialchars($film['tytul']) . '">';
                        echo '<p>' . htmlspecialchars($film['tytul']) . '</p>';
                        echo '</a></div>';
                    }
                } else {
                    echo '<p>Brak informacji o filmach</p>';
                }
                ?>
            </section>
        </section>
    </main>
    <footer>
        <section>
            <h1>Movielock</h1>
            <a href="kontakt.html">Kontakt</a>
        </section>
    </footer>
    <?php
    mysqli_close($conn);
    ?>
</body>
</html>