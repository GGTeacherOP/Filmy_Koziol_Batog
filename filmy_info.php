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
    
    // Pobierz ID filmu z parametru URL
    $film_id = isset($_GET['id']) ? intval($_GET['id']) : 1;
    
    // Zapytanie o informacje o filmie
    $query_film = "SELECT f.*, r.imie_nazwisko AS rezyser , r.ID AS id_rezysera
                  FROM filmy f 
                  JOIN rezyserzy r ON f.rezyser_id = r.ID 
                  WHERE f.ID = $film_id";
    $result_film = mysqli_query($conn, $query_film);
    
    if (!$result_film || mysqli_num_rows($result_film) == 0) {
        die("Film nie znaleziony");
    }
    
    $film = mysqli_fetch_assoc($result_film);
    
    // Zapytanie o aktorów w filmie (ograniczone do 5)
    $query_aktorzy = "SELECT a.ID, a.imie_nazwisko, a.zdjecie 
                     FROM aktorzy a
                     JOIN wystapienia w ON a.ID = w.id_aktora
                     WHERE w.id_filmu = $film_id
                     LIMIT 5";
    $result_aktorzy = mysqli_query($conn, $query_aktorzy);
    
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
            <img style='width: 400px; height: 600px;' src="<?php echo htmlspecialchars($film['zdjecie']); ?>" alt="Plakat filmu">
        </section>
        <section class="main-prawy">
            <h2><?php echo htmlspecialchars($film['tytul']); ?></h2>
            <section class="row1">
                <h4 class="rezyser">
                <a href="rezyser_info.php?id=<?php echo $film['id_rezysera']; ?>">
                <?php echo htmlspecialchars($film['rezyser']); ?>
                </a>
                </h4>
                <h4 class="gatunek">Gatunek: <?php echo htmlspecialchars($film['gatunek']); ?></h4><br>
            </section>
            <section class="row2">
                <div class="popularnosc"><h5 class="miejsce">#<?php echo htmlspecialchars($film['ranking_popularnosci']); ?></h5><h5 class="podtekst">Najpopularniejszy</h5></div>
                <div class="ocena"><h5 class="gwiazdy"><?php echo htmlspecialchars($film['srednia_ocena']); ?></h5></div>
            </section>
            <div class="opis"><h5 class="opis-tekst"><?php echo htmlspecialchars($film['opis']); ?></h5></div>
            <div class="clearfix"></div>
            <section class="row3">
                <?php
                if ($result_aktorzy && mysqli_num_rows($result_aktorzy) > 0) {
                    while ($aktor = mysqli_fetch_assoc($result_aktorzy)) {
                        echo '<div class="aktor"><a href="obsada_info.php?id=' . $aktor['ID'] . '">';
                        echo '<img src="' . htmlspecialchars($aktor['zdjecie']) . '" alt="' . htmlspecialchars($aktor['imie_nazwisko']) . '">';
                        echo '<p>' . htmlspecialchars($aktor['imie_nazwisko']) . '</p>';
                        echo '</a></div>';
                    }
                } else {
                    echo '<p>Brak informacji o aktorach</p>';
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