<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Top 100 Najpopularniejszych | Movielock</title>
    <link rel="stylesheet" href="styl.css">
    <link rel="stylesheet" href="listy.css">
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
        <h1>Top 100 Najpopularniejszych Filmów</h1>
        <table>
            <tr>
                <th class="numcol">Num</th>
                <th class="zdjcol">Zdjęcie</th>
                <th class="nazwacol">Nazwa</th>
                <th class="rezcol">Reż.</th>
            </tr>
            <?php
            //dołącenie pliku z połączeniem z bazą danych
            require_once 'db_connect.php';

            // Zapytanie SQL z widokiem
            $query = "SELECT id, zdjecie, tytul, imie_nazwisko, id_rezysera FROM `top_popularnosc`";

            $result = mysqli_query($conn, $query);

            if (!$result) {
                die("Błąd zapytania: " . mysqli_error($conn));
            }

            $counter = 1;
            while ($row = mysqli_fetch_assoc($result)) {
                // Dodanie specjalnej klasy dla pierwszych 3 pozycji
                $row_class = ($counter <= 3) ? "top$counter" : "lower";
                
                echo "<tr class='$row_class'>";
                echo "<td>" . $counter . ".</td>";
                echo "<td class='filmZdj'><img style='width: 200px; height: 350px;' src='" . htmlspecialchars($row['zdjecie']) . "' alt='Plakat filmu'></td>";
                echo "<td style='text-align: center;'>
                        <a href='filmy_info.php?id=" . $row['id'] . "' style='display: inline-block; width: 100%; text-align: center;'>
                          " . htmlspecialchars($row['tytul']) . "
                        </a>
                      </td>";
                echo "<td style='text-align: center;'><a href='rezyser_info.php?id=" . $row['id_rezysera'] . "' style='display: inline-block; width: 100%; text-align: center;'>" . htmlspecialchars($row['imie_nazwisko']) . "</a></td>";
                echo "</tr>";
                
                $counter++;
            }

            mysqli_close($conn);
            ?>
        </table>
        <div class="odstep"></div>
    </main>
    <footer>
        <section>
            <h1>Movielock</h1>
            <a href="kontakt.html">Kontakt</a>
        </section>
    </footer>
</body>
</html>