-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Maj 17, 2025 at 04:36 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movielock`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `aktorzy`
--

CREATE TABLE `aktorzy` (
  `ID` int(11) NOT NULL,
  `imie_nazwisko` varchar(100) NOT NULL,
  `zdjecie` varchar(255) DEFAULT NULL,
  `ranking_popularnosci` int(11) DEFAULT 0,
  `zyciorys` text DEFAULT NULL,
  `ocena` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aktorzy`
--

INSERT INTO `aktorzy` (`ID`, `imie_nazwisko`, `zdjecie`, `ranking_popularnosci`, `zyciorys`, `ocena`) VALUES
(1, 'Joaquin Phoenix', 'https://fwcdn.pl/ppo/50/28/5028/449870_1.3.jpg', 1, 'Amerykański aktor znany z \"Jokera\" i \"Mistrza\". Laureat Oscara.', 9.06),
(2, 'Heath Ledger', 'https://fwcdn.pl/ppo/63/22/6322/449649_1.3.jpg', 2, 'Australijski aktor, ikoniczna rola Jokera w \"Mrocznym Rycerzu\".', 9.64),
(3, 'Tom Hanks', 'https://fwcdn.pl/ppo/01/24/124/449666_1.3.jpg', 3, 'Amerykański aktor, znany z \"Forrest Gump\", \"Cast Away\".', 9.61),
(4, 'Anthony Hopkins', 'https://fwcdn.pl/ppo/00/48/48/449670_1.3.jpg', 4, 'Walijski aktor, Hannibal Lecter w \"Milczeniu owiec\".', 9.57),
(5, 'Christoph Waltz', 'https://fwcdn.pl/ppo/95/01/69501/449668_1.3.jpg', 5, 'Austriacki aktor z Oscarem za \"Bękarty wojny\".', 9.51),
(6, 'Marlon Brando', 'https://fwcdn.pl/ppo/01/40/140/449871_1.3.jpg', 6, 'Legenda kina, \"Ojciec chrzestny\", \"Tramwaj zwany pożądaniem\".', 9.49),
(7, 'Johnny Depp', 'https://fwcdn.pl/ppo/00/29/29/449646_1.3.jpg', 7, 'Rola Jacka Sparrowa, ikona ekscentrycznych postaci.', 9.44),
(8, 'Robert De Niro', 'https://fwcdn.pl/ppo/01/23/123/449692_1.3.jpg', 8, '\"Taksówkarz\", \"Wściekły byk\", mistrz ról dramatycznych.', 9.42),
(9, 'Al Pacino', 'https://fwcdn.pl/ppo/00/78/78/449651_1.7.webp', 9, 'Człowiek z blizną\", \"Ojciec chrzestny\", potężna charyzma.', 9.40),
(10, 'Leonardo DiCaprio', 'https://fwcdn.pl/ppo/00/30/30/449647_1.3.jpg', 10, 'Od \"Titanica\" do Oscara za \"Zjawę\".', 9.38),
(11, 'Brad Pitt', 'https://fwcdn.pl/ppo/02/05/205/449687_1.3.jpg', 11, 'Wszechstronny aktor z sukcesami w kinie akcji i dramacie.', 9.35),
(12, 'Edward Norton', 'https://fwcdn.pl/ppo/46/41/4641/449669_1.3.jpg', 12, '\"Więzień nienawiści\", \"Fight Club\", znany z intensywności ról.', 9.34),
(13, 'Daniel Day-Lewis', 'https://fwcdn.pl/ppo/01/59/159/449673_1.3.jpg', 13, 'Trzykrotny laureat Oscara, perfekcjonista filmowy.', 9.33),
(14, 'Christian Bale', 'https://fwcdn.pl/ppo/32/38/3238/450856_1.3.jpg', 14, 'Batman Nolana, znany z metamorfoz fizycznych.', 9.30),
(15, 'Morgan Freeman', 'https://fwcdn.pl/ppo/01/76/176/449860_1.3.jpg', 15, 'Głos Boga w kinie. \"Skazani na Shawshank\", \"Bruce Wszechmogący\".', 9.28),
(16, 'Matthew McConaughey', 'https://fwcdn.pl/ppo/25/56/2556/449677_1.3.jpg', 16, 'Renesans aktorski w \"Detektywie\" i \"Witaj w klubie\".', 9.26),
(17, 'Jake Gyllenhaal', 'https://fwcdn.pl/ppo/81/01/48101/449682_1.3.jpg', 17, '\"Donnie Darko\", \"Nightcrawler\", mistrz ról złożonych.', 9.25),
(18, 'Robin Williams', 'https://fwcdn.pl/ppo/02/23/223/449681_1.3.jpg', 18, 'Komik o sercu dramatyka. \"Stowarzyszenie Umarłych Poetów\", \"Buntownik z wyboru\".', 9.24),
(19, 'Gary Oldman', 'https://fwcdn.pl/ppo/00/76/76/449688_1.3.jpg', 19, '\"Dracula\", \"Mroczny Rycerz\", \"Czas mroku\" – kameleon aktorstwa.', 9.22),
(20, 'Sean Penn', 'https://fwcdn.pl/ppo/02/02/202/449857_1.3.jpg', 20, '\"Rzeka tajemnic\", \"Milk\", znany z ról dramatycznych.', 9.20),
(21, 'Adrien Brody', 'https://fwcdn.pl/ppo/05/12/512/449734_1.3.jpg', 21, 'Najmłodszy laureat Oscara za główną rolę męską w \"Pianiście\".', 8.85),
(22, 'Tom Cruise', 'https://fwcdn.pl/nph/1985708/2022/39578_1.8.jpg', 22, 'Ikona kina akcji – \"Mission: Impossible\", \"Rain Man\".', 8.84),
(23, 'Paul Dano', 'https://fwcdn.pl/ppo/61/22/136122/450264_1.3.jpg', 23, 'Znany z ról psychologicznych w \"There Will Be Blood\", \"Fabelmanowie\".', 8.83),
(24, 'Mark Ruffalo', 'https://fwcdn.pl/ppo/66/50/6650/449988_1.3.jpg', 24, '\"Spotlight\", Hulk w MCU, aktor zaangażowany społecznie.', 8.82),
(25, 'Michael Keaton', 'https://fwcdn.pl/ppo/00/57/57/449883_1.3.jpg', 25, 'Batman Burtona, \"Birdman\" – powrót w wielkim stylu.', 8.81),
(26, 'Timothée Chalamet', 'https://fwcdn.pl/ppo/37/72/1543772/451634_1.3.jpg', 26, 'Wschodząca gwiazda – \"Tamte dni, tamte noce\", \"Diuna\".', 8.80),
(27, 'Steve Carell', 'https://fwcdn.pl/ppo/43/34/74334/449995_1.3.jpg', 27, 'Od komedii (\"Biuro\") do dramatu (\"Foxcatcher\").', 8.79),
(28, 'James McAvoy', 'https://fwcdn.pl/ppo/99/78/69978/449678_1.3.jpg', 28, '\"Split\", \"Pokuta\", charyzmatyczny i dynamiczny aktor.', 8.78),
(29, 'Colin Firth', 'https://fwcdn.pl/ppo/25/68/2568/449713_1.3.jpg', 29, 'Oscar za \"Jak zostać królem\", ikona brytyjskiego stylu.', 8.77),
(30, 'Viggo Mortensen', 'https://fwcdn.pl/ppo/30/60/3060/449683_1.3.jpg', 30, 'Aragorn w \"Władcy Pierścieni\", aktor z klasą.', 8.76),
(31, 'Jeff Bridges', 'https://fwcdn.pl/ppo/00/13/13/450144_1.3.jpg', 31, '\"Big Lebowski\", \"Crazy Heart\", niezapomniane role.', 8.75),
(32, 'Christopher Walken', 'https://fwcdn.pl/ppo/01/15/115/449925_1.3.jpg', 32, 'Nietuzinkowy styl – \"Łowca jeleni\", \"Pulp Fiction\".', 8.74),
(33, 'Ken Watanabe', 'https://fwcdn.pl/ppo/86/77/88677/450868_1.3.jpg', 33, 'Reprezentant japońskiego kina – \"Incepcja\", \"Ostatni samuraj\".', 8.73),
(34, 'Dev Patel', 'https://fwcdn.pl/nph/2025458/2024/50896_1.8.jpg', 34, '\"Slumdog. Milioner z ulicy\", \"Lew\", młody talent z UK.', 8.72),
(35, 'Oscar Isaac', 'https://fwcdn.pl/ppo/16/13/511613/450637_1.3.jpg', 35, '\"Ex Machina\", \"Dune\", łączy kino mainstreamowe i niezależne.', 8.71),
(36, 'Andy Garcia', 'https://fwcdn.pl/ppo/01/77/177/450649_1.3.jpg', 36, '\"Ojciec chrzestny III\", \"Ocean’s Eleven\", kubańsko-amerykański aktor.', 8.70),
(37, 'Ralph Fiennes', 'https://fwcdn.pl/ppo/01/71/171/449686_1.3.jpg', 37, 'Lord Voldemort, \"Lista Schindlera\", potężna ekranowa prezencja.', 8.69),
(38, 'George Clooney', 'https://fwcdn.pl/ppo/01/50/150/449979_1.3.jpg', 38, '\"Ocean’s Eleven\", \"Syriana\", aktor i reżyser.', 8.68),
(39, 'Clint Eastwood', 'https://fwcdn.pl/nph/2025458/2023/43254_1.8.jpg', 39, 'Legenda westernu, później reżyser uznanych dramatów.', 8.67),
(40, 'Sylvester Stallone', 'https://fwcdn.pl/ppo/02/15/215/449964_1.3.jpg', 40, 'Rambo, Rocky – twarz kina akcji lat 80.', 8.66),
(41, 'Bruce Willis', 'https://fwcdn.pl/ppo/01/17/117/450013_1.3.jpg', 41, 'Gwiazda \"Szklanej pułapki\", symbol kina akcji lat 90.', 8.65),
(42, 'Robert Pattinson', 'https://fwcdn.pl/ppo/44/50/164450/450997_1.3.jpg', 42, 'Od \"Zmierzchu\" do \"Batmana\" – metamorfoza kariery.', 8.64),
(43, 'Daniel Radcliffe', 'https://fwcdn.pl/ppo/02/07/40207/449919_1.3.jpg', 43, 'Harry Potter – rola życia, obecnie różnorodne projekty.', 8.63),
(44, 'Ben Affleck', 'https://fwcdn.pl/ppo/01/25/125/449982_1.7.webp', 44, 'Aktor i reżyser – \"Buntownik z wyboru\", \"Argo\".', 8.62),
(45, 'Channing Tatum', 'https://fwcdn.pl/ppo/49/61/164961/449991_1.3.jpg', 45, '\"Magic Mike\", \"21 Jump Street\" – taniec i humor.', 8.61),
(46, 'Zac Efron', 'https://fwcdn.pl/ppo/30/57/273057/450287_1.3.jpg', 46, 'Od Disneya do poważnych ról – \"Ted Bundy\", \"The Greatest Beer Run Ever\".', 8.60),
(47, 'Josh Brolin', 'https://fwcdn.pl/ppo/37/86/3786/449909_1.3.jpg', 47, 'Thanos w MCU, także \"Sicario\", \"To nie jest kraj...\".', 8.59),
(48, 'Don Cheadle', 'https://fwcdn.pl/ppo/27/17/2717/450492_1.3.jpg', 48, '\"Hotel Ruanda\", War Machine w Marvelu.', 8.58),
(49, 'Patrick Stewart', 'https://fwcdn.pl/ppo/44/16/4416/449731_1.3.jpg', 49, 'Kapitan Picard, Profesor X – charyzma i klasa.', 8.57),
(50, 'Ian McKellen', 'https://fwcdn.pl/ppo/61/49/6149/449662_1.3.jpg', 50, 'Gandalf, Magneto – brytyjska szkoła aktorstwa.', 8.56),
(51, 'Martin Freeman', 'https://fwcdn.pl/ppo/18/51/61851/449715_1.3.jpg', 51, '\"Sherlock\", \"Hobbit\", naturalny styl gry.', 8.55),
(52, 'David Tennant', 'https://fwcdn.pl/ppo/99/17/49917/449680_1.3.jpg', 52, 'Doctor Who, \"Broadchurch\" – intensywność i wszechstronność.', 8.54),
(53, 'Ewan McGregor', 'https://fwcdn.pl/ppo/00/71/71/449889_1.3.jpg', 53, '\"Trainspotting\", Obi-Wan – głębia i luz.', 8.53),
(54, 'Stanley Tucci', 'https://fwcdn.pl/ppo/72/08/7208/450232_1.7.webp', 54, 'Znakomity aktor drugoplanowy – \"Igrzyska śmierci\", \"Julie & Julia\".', 8.52),
(55, 'Brendan Fraser', 'https://fwcdn.pl/ppo/51/37/5137/450579_1.3.jpg', 55, 'Powrót z \"The Whale\", wcześniej znany z \"Mumii\".', 8.51),
(56, 'Donald Glover', 'https://fwcdn.pl/ppo/56/56/935656/451226_1.3.jpg', 56, 'Aktor, raper, scenarzysta – \"Atlanta\", \"Community\".', 8.50),
(57, 'Chris Pine', 'https://fwcdn.pl/ppo/03/66/140366/450369_1.3.jpg', 57, 'Kirk w \"Star Trek\", także dramat i komedia.', 8.49),
(58, 'Taron Egerton', 'https://fwcdn.pl/ppo/43/71/2014371/450711_1.3.jpg', 58, 'Elton John w \"Rocketman\", \"Kingsman\".', 8.48),
(59, 'Jude Law', 'https://fwcdn.pl/ppo/40/33/4033/449877_1.3.jpg', 59, '\"Utalentowany pan Ripley\", \"Sherlock Holmes\".', 8.47),
(60, 'Forest Whitaker', 'https://fwcdn.pl/ppo/75/26/7526/450373_1.3.jpg', 60, 'Oscar za \"Ostatniego króla Szkocji\", aktor o głębokim wyrazie.', 8.46),
(61, 'Samuel L. Jackson', 'https://fwcdn.pl/nph/1032473/2024/56065_1.8.jpg', 61, 'Znany z ról w filmach Tarantino i Marvela. Charakterystyczny styl.', 9.18),
(62, 'Hugh Jackman', 'https://fwcdn.pl/ppo/79/16/7916/449689_1.3.jpg', 62, '\"Wolverine\" i \"Les Misérables\" – aktor sceniczny i filmowy.', 9.17),
(63, 'Denzel Washington', 'https://fwcdn.pl/ppo/02/20/220/449718_1.3.jpg', 63, 'Ikona ról silnych, moralnych postaci. \"Trening Dnia\", \"Malcolm X\".', 9.16),
(64, 'Ryan Gosling', 'https://fwcdn.pl/ppo/50/13/55013/449913_1.3.jpg', 64, '\"Drive\", \"La La Land\", wszechstronność i magnetyzm ekranowy.', 9.15),
(65, 'Benedict Cumberbatch', 'https://fwcdn.pl/ppo/24/26/232426/449656_1.3.jpg', 65, 'Sherlock Holmes nowej ery, także Dr Strange w MCU.', 9.13),
(66, 'Jared Leto', 'https://fwcdn.pl/ppo/28/03/2803/449992_1.3.jpg', 66, '\"Requiem dla snu\", Oscar za \"Witaj w klubie\". Także muzyk.', 9.12),
(67, 'Javier Bardem', 'https://fwcdn.pl/ppo/29/29/2929/449721_1.3.jpg', 67, 'Oscar za \"To nie jest kraj dla starych ludzi\", intensywny aktor.', 9.10),
(68, 'Willem Dafoe', 'https://fwcdn.pl/nph/867323/2018/13546_1.8.jpg', 68, '\"Antychryst\", \"Spider-Man\", znany z ekspresyjnych ról.', 9.08),
(69, 'Matt Damon', 'https://fwcdn.pl/ppo/01/58/158/449986_1.3.jpg', 69, 'Znany z serii Bourne’a i \"Buntownika z wyboru\".', 9.06),
(70, 'Rami Malek', 'https://fwcdn.pl/ppo/34/09/563409/449652_1.3.jpg', 70, 'Freddie Mercury w \"Bohemian Rhapsody\", zdobywca Oscara.', 9.04),
(71, 'Michael Fassbender', 'https://fwcdn.pl/ppo/26/83/172683/449915_1.3.jpg', 71, '\"Shame\", \"12 Years a Slave\", uznany za role dramatyczne.', 9.03),
(72, 'Ethan Hawke', 'https://fwcdn.pl/ppo/01/83/183/450503_1.3.jpg', 72, '\"Przed wschodem słońca\", \"Dzień próby\", filozoficzny styl gry.', 9.01),
(73, 'Andy Serkis', 'https://fwcdn.pl/ppo/45/48/4548/449700_1.3.jpg', 73, 'Mistrz motion capture – Gollum, Caesar z \"Planety Małp\".', 8.99),
(74, 'Bill Murray', 'https://fwcdn.pl/ppo/00/73/73/449923_1.3.jpg', 74, '\"Dzień świstaka\", \"Między słowami\", kultowa postać kina.', 8.97),
(75, 'Shia LaBeouf', 'https://fwcdn.pl/ppo/48/55/104855/450633_1.3.jpg', 75, 'Z \"Transformers\" do kina artystycznego. Kontrowersyjny, ale utalentowany.', 8.95),
(76, 'Joseph Gordon-Levitt', 'https://fwcdn.pl/ppo/31/68/3168/450242_1.3.jpg', 76, '\"500 dni miłości\", \"Incepcja\", aktor i reżyser.', 8.93),
(77, 'John Travolta', 'https://fwcdn.pl/ppo/02/16/216/449917_1.7.webp', 77, '\"Gorączka sobotniej nocy\", \"Pulp Fiction\", taniec i styl.', 8.91),
(78, 'Keanu Reeves', 'https://fwcdn.pl/ppo/00/87/87/450015_1.3.jpg', 78, '\"Matrix\", \"John Wick\", uwielbiany przez fanów za skromność.', 8.89),
(79, 'Tobey Maguire', 'https://fwcdn.pl/ppo/47/74/4774/450468_1.3.jpg', 79, 'Pierwszy Spider-Man ery XXI wieku, znany z subtelnej gry.', 8.88),
(80, 'Russell Crowe', 'https://fwcdn.pl/ppo/03/80/380/449722_1.3.jpg', 80, 'Oscar za \"Gladiatora\", również \"Piękny umysł\", role z charakterem.', 8.87);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `filmy`
--

CREATE TABLE `filmy` (
  `ID` int(11) NOT NULL,
  `tytul` varchar(255) NOT NULL,
  `zdjecie` varchar(255) DEFAULT NULL,
  `gatunek` varchar(100) DEFAULT NULL,
  `typ` enum('film','serial') NOT NULL,
  `rezyser_id` int(11) DEFAULT NULL,
  `opis` text DEFAULT NULL,
  `srednia_ocena` decimal(3,2) DEFAULT 0.00,
  `ranking_popularnosci` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `filmy`
--

INSERT INTO `filmy` (`ID`, `tytul`, `zdjecie`, `gatunek`, `typ`, `rezyser_id`, `opis`, `srednia_ocena`, `ranking_popularnosci`) VALUES
(1, 'Skazani na Shawshank', 'https://stacjakultura.pl/wp-content/uploads/2023/11/Skazani-scaled.webp', 'dramat', 'film', 1, 'Niesłusznie skazany bankier spędza lata w więzieniu Shawshank, gdzie zaprzyjaźnia się z innym więźniem.', 9.30, 1),
(2, 'Ojciec chrzestny', 'https://kolorofon.departament.org/wp-content/uploads/2024/08/Plakaty-filmowe-klasyka-kina-Ojciec-chrzestny-1972-The-Godfather-Czarna-wersja-Plakat-wysokiej-jakosci-8K--scaled.jpg', 'kryminał', 'film', 2, 'Historia rodziny Corleone, jednej z najpotężniejszych mafijnych rodzin w Nowym Jorku.', 9.20, 2),
(3, 'Mroczny Rycerz', 'https://fwcdn.pl/fpo/63/51/236351/7198307_2.8.webp', 'akcja', 'film', 3, 'Batman musi stawić czoła Jokerowi, genialnemu przestępcy siejącemu chaos w Gotham.', 9.00, 3),
(4, 'Pulp Fiction', 'https://fwcdn.pl/fpo/10/39/1039/7517880_1.3.jpg', 'dramat', 'film', 4, 'Kilka powiązanych historii z życia przestępców w Los Angeles.', 8.90, 4),
(5, 'Władca Pierścieni: Powrót Króla', 'https://fwcdn.pl/fpo/18/41/11841/7494142_1.8.webp', 'fantasy', 'film', 5, 'Ostateczna bitwa o Śródziemie. Frodo i Sam docierają do Góry Przeznaczenia.', 8.90, 5),
(6, 'Forrest Gump', 'https://fwcdn.pl/fpo/09/98/998/8021615_1.3.jpg', 'dramat', 'film', 6, 'Życie Forresta Gumpa, prostego człowieka, który był świadkiem wielu ważnych wydarzeń historycznych.', 8.80, 6),
(7, 'Incepcja', 'https://fwcdn.pl/fpo/08/91/500891/7354571_1.8.webp', 'sci-fi', 'film', 3, 'Złodziej kradnący sekrety z ludzkich umysłów podczas snu otrzymuje zadanie niemożliwe.', 8.80, 7),
(8, 'Fight Club', 'https://fwcdn.pl/fpo/08/37/837/7522091_1.8.webp', 'dramat', 'film', 7, 'Znudzony pracownik biurowy i charyzmatyczny Tyler Durden zakładają tajny klub walk.', 8.80, 8),
(9, 'Gwiezdne Wojny: Imperium Kontratakuje', 'https://fwcdn.pl/fpo/05/25/525/8020805_1.3.jpg', 'przygodowy', 'film', 8, 'Luke Skywalker i jego sojusznicy walczą z Imperium Galaktycznym.', 8.70, 9),
(10, 'Dobrzy, źli i brzydcy', 'https://fwcdn.pl/fpo/51/03/5103/7530235_1.3.jpg', 'western', 'film', 9, 'Trzech rewolwerowców szuka zaginionego skarbu podczas Wojny Secesyjnej.', 8.70, 10),
(11, 'Gra o Tron', 'https://fwcdn.pl/fpo/68/48/476848/8145248.3.jpg', 'fantasy', 'serial', 10, 'Walka o władzę między rodami w krainie Westeros.', 8.60, 11),
(12, 'Breaking Bad', 'https://fwcdn.pl/fpo/06/68/430668/7463890_1.3.jpg', 'dramat', 'serial', 11, 'Walter i Jeremiasz gotują niezłą mete.', 8.60, 12),
(13, 'Przyjaciele', 'https://fwcdn.pl/fpo/39/93/33993/8145257.3.jpg', 'komedia', 'serial', 12, 'Losy szóstki przyjaciół mieszkających w Nowym Jorku.', 8.50, 13),
(14, 'The Office (US)', 'https://fwcdn.pl/fpo/28/87/202887/7906640_2.3.jpg', 'komedia', 'serial', 13, 'Codzienne życie pracowników biura regionalnego firmy Dunder Mifflin.', 8.50, 14),
(15, 'Stranger Things', 'https://fwcdn.pl/nph/49468/2017/12127.8.jpg', 'horror', 'serial', 14, 'Grupa dzieciaków w latach 80. odkrywa tajemnicze siły i potwora.', 8.40, 15),
(16, 'Westworld', 'https://fwcdn.pl/fpo/29/88/232988/8018055_1.3.jpg', 'sci-fi', 'serial', 15, 'Zaawansowany technologicznie park rozrywki, w którym androidy zaczynają zyskiwać świadomość.', 8.40, 16),
(17, 'Czarnobyl', 'https://fwcdn.pl/fpo/98/27/799827/8145245.3.jpg', 'historyczny', 'serial', 16, 'Dramatyczna historia katastrofy w Czarnobylskiej Elektrowni Jądrowej.', 8.30, 17),
(18, 'The Crown', 'https://fwcdn.pl/fpo/72/84/747284/8097580_1.3.jpg', 'biograficzny', 'serial', 17, 'Historia panowania Królowej Elżbiety II.', 8.30, 18),
(19, 'Peaky Blinders', 'https://fwcdn.pl/fpo/09/81/680981/7720875_1.3.jpg', 'kryminał', 'serial', 18, 'Historia gangu Peaky Blinders w Birmingham po I wojnie światowej.', 8.20, 19),
(20, 'Sherlock', 'https://fwcdn.pl/fpo/89/92/528992/7864164_2.8.webp', 'mystery', 'serial', 19, 'Współczesna adaptacja przygód Sherlocka Holmesa.', 8.20, 20),
(21, 'Harry Potter i Kamień Filozoficzny', 'https://fwcdn.pl/fpo/05/71/30571/7529392_1.3.jpg', 'familijny', 'film', 20, 'Jedenastoletni Harry Potter dowiaduje się, że jest czarodziejem.', 8.10, 21),
(22, 'Władca Pierścieni: Dwie Wieże', 'https://fwcdn.pl/fpo/14/51/31451/7877022_1.8.webp', 'przygodowy', 'film', 5, 'Druga część podróży Drużyny Pierścienia.', 8.00, 22),
(23, 'Django', 'https://fwcdn.pl/fpo/05/41/620541/7504936_2.3.jpg', 'western', 'film', 4, 'Wyzwolony niewolnik wyrusza na poszukiwanie swojej żony.', 7.90, 23),
(24, 'Leon zawodowiec', 'https://fwcdn.pl/fpo/06/71/671/8021401_1.3.jpg', 'akcja', 'film', 22, 'Profesjonalny zabójca opiekuje się dwunastoletnią dziewczynką.', 7.90, 24),
(25, 'Nietykalni', 'https://fwcdn.pl/fpo/33/90/583390/7441162_1.8.webp', 'komedia', 'film', 23, 'Sparaliżowany milioner zatrudnia do opieki młodego imigranta.', 7.80, 25),
(26, 'Gladiator', 'https://fwcdn.pl/fpo/09/36/936/8022172_1.3.jpg', 'historyczny', 'film', 24, 'Rzymski generał Maximus staje się gladiatorem po zdradzie cesarza.', 7.80, 26),
(27, 'Avengers: Wojna bez granic', 'https://fwcdn.pl/fpo/37/58/693758/7839647_2.8.webp', 'sci-fi', 'film', 25, 'Avengers i ich sojusznicy stają do walki z Thanosem.', 7.70, 27),
(28, 'Spider-Man: Uniwersum', 'https://fwcdn.pl/fpo/32/33/743233/7866074_2.3.jpg', 'animacja', 'film', 26, 'Miles Morales staje się Spider-Manem w wielowymiarowym uniwersum.', 7.70, 28),
(29, 'Parasite', 'https://fwcdn.pl/cont/5470.1.jpg', 'thriller', 'film', 27, 'Uboga rodzina infiltruje bogatą rodzinę.', 7.60, 29),
(30, 'Green Mile', 'https://fwcdn.pl/fpo/08/62/862/7517878_1.8.webp', 'fantasy', 'film', 1, 'Strażnik więzienny zaprzyjaźnia się z niezwykłym więźniem.', 7.60, 30),
(31, 'The Sopranos', 'https://fwcdn.pl/fpo/54/05/35405/8145261.3.jpg', 'dramat', 'serial', 28, 'Życie Tony\'ego Soprano, szefa mafii z New Jersey.', 8.50, 31),
(32, 'The Wire', 'https://fwcdn.pl/fpo/77/21/87721/7282667_1.3.jpg', 'kryminał', 'serial', 29, 'Opowieść o handlu narkotykami z perspektywy dilerów i policji.', 8.40, 32),
(33, 'Ozark', 'https://fwcdn.pl/fpo/95/50/779550/7797986_2.3.jpg', 'thriller', 'serial', 30, 'Doradca finansowy pierze pieniądze dla kartelu narkotykowego w Ozark.', 8.30, 33),
(34, 'Better Call Saul', 'https://fwcdn.pl/fpo/76/45/697645/8016283_1.8.webp', 'dramat', 'serial', 12, 'Historia prawnika Saula Goodmana przed wydarzeniami z Breaking Bad.', 8.20, 34),
(35, 'Squid Game', 'https://fwcdn.pl/fpo/18/42/841842/8153027.3.jpg', 'akcja', 'serial', 31, 'Grupa zadłużonych ludzi bierze udział w śmiertelnych grach o ogromną nagrodę.', 8.10, 35),
(36, 'Arcane', 'https://fwcdn.pl/fpo/36/28/873628/8130321.8.webp', 'animacja', 'serial', 32, 'Historia dwóch sióstr z podzielonego miasta Piltover i Zaun.', 8.00, 36),
(37, 'The Queen\'s Gambit', 'https://fwcdn.pl/fpo/00/24/840024/7932824_1.3.jpg', 'dramat', 'serial', 33, 'Historia młodej szachistki Beth Harmon.', 7.90, 37),
(38, 'Dark', 'https://fwcdn.pl/fpo/13/83/771383/7814585_2.3.jpg', 'sci-fi', 'serial', 34, 'Zaginięcie dzieci ujawnia mroczne sekrety i podróże w czasie.', 7.80, 38),
(39, 'Mindhunter', 'https://fwcdn.pl/fpo/41/11/764111/7894593_1.3.jpg', 'kryminał', 'serial', 7, 'Agenci FBI badają umysły seryjnych morderców.', 7.70, 39),
(40, 'Black Mirror', 'https://fwcdn.pl/nph/49468/2022/37142_1.8.jpg', 'dramat', 'serial', 35, 'Antologia opowieści o ciemnej stronie technologii.', 7.60, 40),
(41, 'Avatar', 'https://fwcdn.pl/fpo/91/13/299113/8028716_1.3.jpg', 'sci-fi', 'film', 36, 'Były marine zostaje wysłany na planetę Pandora.', 7.50, 41),
(42, 'Titanic', 'https://fwcdn.pl/fpo/01/87/187/7885890_1.3.jpg', 'romans', 'film', 36, 'Historia miłości na pokładzie tonącego Titanica.', 7.40, 42),
(43, 'Jurassic Park', 'https://fwcdn.pl/fpo/12/12/1212/7532664_1.3.jpg', 'przygodowy', 'film', 37, 'Naukowcy przywracają do życia dinozaury w parku rozrywki.', 7.30, 43),
(44, 'E.T. the Extra-Terrestrial', 'https://fwcdn.pl/fpo/12/15/1215/7997170_1.8.webp', 'familijny', 'film', 37, 'Chłopiec zaprzyjaźnia się z zagubionym kosmitą.', 7.20, 44),
(45, 'Szczęki', 'https://fwcdn.pl/fpo/12/17/1217/6903072_1.3.jpg', 'thriller', 'film', 37, 'Rekin ludojad terroryzuje nadmorskie miasteczko.', 7.10, 45),
(46, 'Indiana Jones i Poszukiwacze Zaginionej Arki', 'https://fwcdn.pl/fpo/12/16/1216/7211116_1.3.jpg', 'akcja', 'film', 37, 'Archeolog Indiana Jones szuka Arki Przymierza.', 7.00, 46),
(47, 'Powrót do przyszłości', 'https://fwcdn.pl/fpo/88/23/8823/7862830_1.8.webp', 'komedia', 'film', 6, 'Nastolatek podróżuje w czasie.', 6.90, 47),
(48, 'Terminator 2: Dzień Sądu', 'https://fwcdn.pl/fpo/09/92/992/8112402_1.3.jpg', 'akcja', 'film', 36, 'Terminator musi chronić młodego Johna Connora przed nowym modelem robota.', 6.80, 48),
(49, 'Obcy - ósmy pasażer Nostromo', 'https://fwcdn.pl/fpo/09/80/980/7518072_1.3.jpg', 'horror', 'film', 24, 'Załoga statku kosmicznego napotyka śmiertelnie niebezpieczną formę życia.', 6.70, 49),
(50, 'Blade Runner', 'https://fwcdn.pl/fpo/07/98/630798/7801880_1.3.jpg', 'sci-fi', 'film', 24, 'Łowca androidów ściga zbuntowane replikanty w futurystycznym Los Angeles.', 6.60, 50),
(51, 'The Mandalorian', 'https://fwcdn.pl/fpo/31/97/813197/8054742_1.3.jpg', 'sci-fi', 'serial', 21, 'Łowca nagród w uniwersum Gwiezdnych Wojen opiekuje się tajemniczym dzieckiem.', 8.30, 51),
(52, 'Dwunastu gniewnych ludzi', 'https://fwcdn.pl/fpo/07/01/30701/8094290_1.8.webp', 'dramat', 'film', 38, 'Dwunastu przysięgłych decyduje o losie młodego mężczyzny oskarżonego o morderstwo.', 8.58, 52),
(53, 'Lot nad kukułczym gniazdem', 'https://fwcdn.pl/fpo/10/19/1019/6974780_1.8.webp', 'dramat', 'film', 39, 'Mężczyzna trafia do szpitala psychiatrycznego, gdzie buntuje się przeciwko surowym zasadom.', 8.41, 53),
(54, 'Lista Schindlera', 'https://fwcdn.pl/fpo/12/11/1211/7876866_1.3.jpg', 'dramat', 'film', 37, 'Historia niemieckiego przemysłowca, który ratuje Żydów podczas Holokaustu.', 8.33, 54),
(55, 'Whiplash', 'https://fwcdn.pl/fpo/88/47/698847/7665305_1.10.webp', 'dramat', 'film', 40, 'Młody perkusista stara się sprostać wymaganiom surowego nauczyciela.', 8.25, 55),
(56, 'Joker', 'https://fwcdn.pl/fpo/01/67/810167/7905225_1.3.jpg', 'dramat', 'film', 41, 'Historia przemiany nieudacznika w ikonicznego złoczyńcę Gotham.', 8.19, 56),
(57, 'Gran Torino', 'https://fwcdn.pl/fpo/65/80/476580/7239651_2.3.jpg', 'dramat', 'film', 42, 'Weteran wojny koreańskiej zaprzyjaźnia się z młodym sąsiadem z Azji.', 8.16, 57),
(58, 'Człowiek z blizną', 'https://fwcdn.pl/fpo/48/33/4833/6935904_1.3.jpg', 'dramat', 'film', 43, 'Imigrant z Kuby wspina się po szczeblach przestępczej kariery w Miami.', 8.16, 58),
(59, 'Pianista', 'https://fwcdn.pl/fpo/22/25/32225/7519150_1.3.jpg', 'dramat', 'film', 44, 'Żydowski pianista walczy o przetrwanie w okupowanej Warszawie.', 8.15, 59),
(60, 'Braveheart - Waleczne serce', 'https://fwcdn.pl/fpo/10/52/1052/7911791_1.8.webp', 'dramat', 'film', 45, 'Szkocki bohater narodowy walczy o niepodległość swojego kraju.', 8.12, 60),
(61, 'Ojciec chrzestny II', 'https://fwcdn.pl/fpo/10/90/1090/7196616_1.3.jpg', 'akcja', 'film', 2, 'Kontynuacja sagi rodziny Corleone, ukazująca młodość Vito i rządy Michaela.', 8.38, 61),
(62, 'Requiem dla snu', 'https://fwcdn.pl/fpo/91/36/9136/6908595_1.3.jpg', 'dramat', 'film', 46, 'Przejmująca opowieść o uzależnieniach i ich destrukcyjnym wpływie na życie bohaterów.', 8.13, 62),
(63, 'Amelia', 'https://fwcdn.pl/fpo/14/16/31416/8172990.8.webp', 'komedia', 'film', 47, 'Młoda Francuzka postanawia zmieniać życie innych na lepsze, odkrywając przy tym własne szczęście.', 8.10, 63),
(64, 'Życie jest piękne', 'https://fwcdn.pl/fpo/02/08/208/8161942.3.jpg', 'dramat', 'film', 48, 'Ojciec używa wyobraźni, by chronić syna przed okrucieństwami obozu koncentracyjnego.', 8.57, 64),
(65, 'W pogoni za szczęściem', 'https://fwcdn.pl/fpo/00/46/240046/7131963_1.8.webp', 'komedia', 'film', 46, 'Bezrobotny ojciec walczy o lepsze życie dla siebie i syna, nie tracąc nadziei.', 8.00, 65),
(66, 'Zodiak', 'https://fwcdn.pl/fpo/13/45/191345/7527406_2.3.jpg', 'thriller', 'film', 7, 'Dziennikarze i detektywi próbują rozwikłać zagadkę seryjnego mordercy Zodiaka.', 7.90, 66),
(67, 'Wyspa tajemnic', 'https://fwcdn.pl/fpo/42/56/464256/7317256_2.8.webp', 'thriller', 'film', 49, 'Detektyw prowadzi śledztwo na wyspie, gdzie znajduje się szpital psychiatryczny.', 8.10, 67),
(68, 'Dzień świra', 'https://fwcdn.pl/fpo/14/13/31413/6900422_1.3.jpg', 'komedia', 'film', 50, 'Opowieść o codziennych zmaganiach nauczyciela języka polskiego z rzeczywistością.', 8.20, 68),
(69, 'Pokój', 'https://fwcdn.pl/fpo/15/41/731541/7723185_1.8.webp', 'dramat', 'film', 51, 'Matka i syn uciekają z niewoli i próbują odnaleźć się w normalnym świecie.', 8.30, 69),
(70, 'Siedem dusz', 'https://fwcdn.pl/fpo/99/74/459974/7380825_1.3.jpg', 'dramat', 'film', 52, 'Mężczyzna planuje zmienić życie siedmiu obcych osób, by odkupić własne winy.', 8.00, 70),
(71, 'Przełęcz ocalonych', 'https://fwcdn.pl/fpo/88/02/658802/7754988_1.8.webp', 'thriller', 'film', 45, 'Historia medyka, który podczas II wojny światowej odmawia noszenia broni, ratując wielu żołnierzy.', 8.10, 71),
(72, 'La La Land', 'https://fwcdn.pl/fpo/88/19/718819/7774367_1.3.jpg', 'musical', 'film', 40, 'Romans muzyka jazzowego i początkującej aktorki w Los Angeles.', 8.00, 72),
(73, 'Człowiek z marmuru', 'https://fwcdn.pl/fpo/11/23/1123/8005799_1.8.webp', 'dramat', 'film', 53, 'Dziennikarka odkrywa historię robotnika, który stał się symbolem propagandy.', 7.80, 73),
(74, 'Sala samobójców', 'https://fwcdn.pl/fpo/95/09/539509/7355120_1.3.jpg', 'dramat', 'film', 54, 'Nastolatek ucieka w wirtualny świat, zmagając się z problemami społecznymi.', 7.90, 74),
(75, 'Bogowie', 'https://fwcdn.pl/fpo/43/78/694378/7632114_1.8.webp', 'akcja', 'film', 55, 'Historia profesora Religi, który przeprowadził pierwszą udaną transplantację serca w Polsce.', 8.40, 75),
(76, 'Ida', 'https://fwcdn.pl/fpo/65/29/546529/7567351_1.8.webp', 'dramat', 'film', 55, 'Młoda zakonnica odkrywa tajemnice swojej rodziny przed złożeniem ślubów.', 8.10, 76),
(77, 'Body/Ciało', 'https://fwcdn.pl/fpo/40/87/714087/7674619_2.3.jpg', 'dramat', 'film', 56, 'Ojciec i córka próbują poradzić sobie z żałobą po stracie bliskiej osoby.', 7.80, 77),
(78, 'Zimna wojna', 'https://fwcdn.pl/fpo/40/39/764039/7845442_2.3.jpg', 'romans', 'film', 57, 'Historia burzliwego romansu muzyków w powojennej Europie.', 8.20, 78),
(79, 'Kler', 'https://fwcdn.pl/fpo/04/02/810402/7856555_1.3.jpg', 'dramat', 'film', 58, 'Trzech księży zmaga się z problemami moralnymi i kryzysem wiary.', 7.90, 79),
(80, 'Wołyń', 'https://fwcdn.pl/fpo/46/94/724694/7750060_1.3.jpg', 'dramat', 'film', 58, 'Młoda Polka doświadcza brutalnych wydarzeń na Wołyniu w czasie II wojny światowej.', 8.30, 80),
(81, 'Cicha noc', 'https://fwcdn.pl/fpo/22/51/712251/7788897_2.3.jpg', 'dramat', 'film', 59, 'Mężczyzna wraca do rodzinnego domu na Wigilię, skrywając tajemnicę.', 7.80, 81),
(82, 'Boże Ciało', 'https://fwcdn.pl/fpo/88/63/808863/7897966_2.3.jpg', 'dramat', 'film', 54, 'Młody mężczyzna podszywa się pod księdza w polskiej wsi, gdzie staje w obliczu moralnych dylematów.', 8.10, 82),
(83, 'Psy', 'https://fwcdn.pl/fpo/11/42/1142/7905480_1.8.webp', 'dramat', 'film', 60, 'Po 1989 roku były funkcjonariusz SB staje przed trudnymi wyborami w nowej rzeczywistości politycznej.', 8.20, 83),
(84, 'Idol', 'https://fwcdn.pl/fpo/62/85/876285/8069426_1.3.jpg', 'dramat', 'film', 61, 'Punkowy zespół stara się odnieść sukces w przemysłowej muzycznej machinie.', 7.90, 84),
(85, 'Wesele', 'https://fwcdn.pl/fpo/75/06/857506/7974517_2.3.jpg', 'dramat', 'film', 58, 'Dzień wesela, pełen emocji i absurdów, ujawnia problemy międzyludzkie w rodzinie i społeczeństwie.', 8.10, 85),
(86, 'Tylko Bóg wybacza', 'https://fwcdn.pl/fpo/92/90/579290/7752292_2.8.webp', 'thriller', 'film', 62, 'Brutalna opowieść o zemście, w której mężczyzna walczy ze swoją przeszłością w Tajlandii.', 7.50, 86),
(87, 'Kochanice króla', 'https://fwcdn.pl/fpo/71/54/297154/7192143_2.3.jpg', 'dramat', 'film', 63, 'Królewskie romanse i intrygi w XVII-wiecznej Francji.', 7.80, 87),
(88, 'Kong: Wyspa Czaszki', 'https://fwcdn.pl/fpo/90/66/719066/7775013_2.8.webp', 'przygodowy', 'film', 64, 'Grupa śmiałków wyrusza na wyspę, gdzie odkrywają gigantyczne, nieznane stworzenia.', 7.60, 88),
(89, 'Obcy: Przymierze', 'https://fwcdn.pl/fpo/54/00/665400/7784620_2.8.webp', 'horror', 'film', 24, 'Astronauci trafiają na planetę, gdzie stają się celem dla niebezpiecznych istot.', 7.70, 89),
(90, 'Matrix', 'https://fwcdn.pl/fpo/06/28/628/7685907_1.3.jpg', 'sci-fi', 'film', 65, 'Człowiek odkrywa, że rzeczywistość, w której żyje, jest symulacją komputerową.', 8.70, 90),
(91, 'Ostatni telefon', 'https://fwcdn.pl/fpo/26/86/32686/7269149_1.3.jpg', 'thriller', 'film', 66, 'Zwykły telefon od nieznajomego zmienia życie kobiety.', 7.70, 91),
(92, 'Krzyk w ciemności', 'https://fwcdn.pl/fpo/69/03/6903/7237032_1.3.jpg', 'horror', 'film', 67, 'Dzieci z sierocińca słyszą nocami głosy zza ściany.', 6.80, 92),
(93, 'Donnie Darko', 'https://fwcdn.pl/fpo/51/58/5158/7370965_2.8.webp', 'horror', 'film', 68, 'Donnie Darko, uważany za nastolatka z zaburzeniami osobowości, spotyka Franka - tajemniczą postać w kostiumie królika, która zaczyna manipulować jego życiem.', 7.20, 93),
(94, 'Gandhi', 'https://fwcdn.pl/fpo/12/88/1288/8028892_1.3.jpg', 'dramat', 'film', 69, 'Film opowiada historię życia Mahatmy Gandhiego, początki jego kariery jako prawnika, duchowego przywódcy narodu i jego walkę o niepodległość Indii.', 7.60, 94),
(95, 'Złap mnie, jeśli potrafisz', 'https://fwcdn.pl/fpo/23/62/32362/7519166_1.3.jpg', 'komedia', 'film', 37, 'Oparta na faktach historia młodego fałszerza, który w latach 60., podając się za pilotów, lekarzy i profesorów, wyłudził z banków ponad 2,5 mln dolarów.', 7.90, 95),
(96, 'Wilk z Wall Street', 'https://fwcdn.pl/fpo/65/97/426597/7586610_1.8.webp', 'dramat', 'film', 49, 'Historia Jordana Belforta, brokera, którego błyskawiczna droga na szczyt i rozrzutny styl życia wzbudziły zainteresowanie FBI.', 7.70, 96),
(97, 'Pan od muzyki', 'https://fwcdn.pl/fpo/95/14/119514/6936984_2.8.webp', 'dramat', 'film', 70, 'Nauczyciel muzyki podejmuje pracę w poprawczaku. Przeciwny żelaznej dyscyplinie wprowadza chłopców w świat muzyki.', 8.00, 97),
(98, 'Cinema Paradiso', 'https://fwcdn.pl/fpo/82/28/8228/7085935_1.3.jpg', 'dramat', 'film', 71, 'Zauroczony magią filmu Toto spędza w kinie cały wolny czas. Chłopiec zaprzyjaźnia się z operatorem Alfredo.', 8.10, 98),
(99, 'Mechaniczna pomarańcza', 'https://fwcdn.pl/fpo/12/75/1275/7183754_1.3.jpg', 'horror', 'film', 72, 'Alex DeLarge wraz ze swoim gangiem sieje spustoszenie na ulicach. Kiedy trafia do więzienia, otrzymuje propozycję odmiany swojego życia.', 7.90, 99),
(100, 'Taksówkarz ', 'https://fwcdn.pl/fpo/10/46/1046/7943939_1.8.webp', 'akcja', 'film', 49, 'Nowojorski taksówkarz Travis Bickle podczas nocnej zmiany poznaje młodocianą prostytutkę, której pragnie pomóc.', 7.80, 100);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oceny`
--

CREATE TABLE `oceny` (
  `ID` int(11) NOT NULL,
  `film_id` int(11) DEFAULT NULL,
  `uzytkownik_id` int(11) DEFAULT NULL,
  `ocena` int(11) DEFAULT NULL CHECK (`ocena` >= 1 and `ocena` <= 10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `oceny_uzytkownikow`
-- (See below for the actual view)
--
CREATE TABLE `oceny_uzytkownikow` (
`login` varchar(255)
,`tytul` varchar(255)
,`ocena` int(11)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `personel`
--

CREATE TABLE `personel` (
  `ID` int(11) NOT NULL,
  `uzytkownik_id` int(11) DEFAULT NULL,
  `uprawnienia` enum('edytor','moderator','admin') NOT NULL,
  `wynagrodzenie` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personel`
--

INSERT INTO `personel` (`ID`, `uzytkownik_id`, `uprawnienia`, `wynagrodzenie`) VALUES
(1, 26, 'edytor', 5500.00),
(2, 27, 'edytor', 5500.00),
(3, 28, 'edytor', 5500.00),
(4, 29, 'edytor', 5500.00),
(5, 30, 'edytor', 5500.00),
(6, 31, 'moderator', 6300.00),
(7, 32, 'moderator', 6300.00),
(8, 33, 'moderator', 6300.00),
(9, 34, 'admin', 9000.00);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rezyserzy`
--

CREATE TABLE `rezyserzy` (
  `ID` int(11) NOT NULL,
  `imie_nazwisko` varchar(255) NOT NULL,
  `zdjecie` varchar(255) DEFAULT NULL,
  `ranking_popularnosci` int(11) DEFAULT 0,
  `zyciorys` text DEFAULT NULL,
  `ocena` decimal(3,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rezyserzy`
--

INSERT INTO `rezyserzy` (`ID`, `imie_nazwisko`, `zdjecie`, `ranking_popularnosci`, `zyciorys`, `ocena`) VALUES
(1, 'Frank Darabont', 'https://fwcdn.pl/ppo/21/89/12189/450702_1.3.jpg', 1, 'Amerykański reżyser, scenarzysta i producent filmowy.', 8.50),
(2, 'Francis Ford Coppola', 'https://fwcdn.pl/ppo/01/53/153/450699_1.3.jpg', 2, 'Amerykański reżyser, scenarzysta i producent filmowy, uważany za jednego z najwybitniejszych twórców kina.', 9.20),
(3, 'Christopher Nolan', 'https://fwcdn.pl/ppo/08/96/40896/449999_1.3.jpg', 3, 'Brytyjsko-amerykański reżyser, scenarzysta i producent filmowy, znany z innowacyjnych i złożonych narracji.', 9.00),
(4, 'Quentin Tarantino', 'https://fwcdn.pl/ppo/01/11/111/449997_1.3.jpg', 4, 'Amerykański reżyser, scenarzysta, producent i aktor, znany z charakterystycznego stylu i dialogów.', 8.80),
(5, 'Peter Jackson', 'https://fwcdn.pl/ppo/16/06/11606/450674_1.3.jpg', 5, 'Nowozelandzki reżyser, scenarzysta i producent filmowy, twórca trylogii \"Władca Pierścieni\".', 8.90),
(6, 'Robert Zemeckis', 'https://fwcdn.pl/ppo/01/21/121/450739_1.3.jpg', 6, 'Amerykański reżyser i producent filmowy, pionier efektów specjalnych.', 8.70),
(7, 'David Fincher', 'https://fwcdn.pl/ppo/04/59/10459/450510_1.3.jpg', 7, 'Amerykański reżyser filmowy i telewizyjny, znany z mrocznych i trzymających w napięciu produkcji.', 8.60),
(8, 'George Lucas', 'https://fwcdn.pl/ppo/00/67/67/450911_1.3.jpg', 8, 'Amerykański reżyser, scenarzysta, producent i przedsiębiorca, twórca \"Gwiezdnych Wojen\".', 8.50),
(9, 'Sergio Leone', 'https://fwcdn.pl/fpo/79/38/10017938/8029365_1.8.webp', 9, 'Włoski reżyser, twórca spaghetti westernów.', 8.40),
(10, 'David Benioff', 'https://fwcdn.pl/ppo/57/43/65743/456971_1.3.jpg', 10, 'Amerykański scenarzysta, producent telewizyjny i pisarz, współtwórca serialu \"Gra o Tron\".', 8.30),
(11, 'D.B. Weiss', 'https://fwcdn.pl/ppo/49/22/354922/292082.1.jpg', 11, 'Amerykański scenarzysta, producent telewizyjny i pisarz, współtwórca serialu \"Gra o Tron\".', 8.20),
(12, 'Vince Gilligan', 'https://fwcdn.pl/ppo/34/08/53408/451297_1.3.jpg', 12, 'Amerykański scenarzysta, producent i reżyser telewizyjny, twórca seriali \"Breaking Bad\" i \"Better Call Saul\".', 8.90),
(13, 'Marta Kauffman', 'https://fwcdn.pl/ppo/13/97/81397/460434_1.3.jpg', 13, 'Amerykańska scenarzystka i producentka telewizyjna, współtwórczyni serialu \"Przyjaciele\".', 8.00),
(14, 'Matt Duffer', 'https://fwcdn.pl/ppo/73/57/667357/454418_1.3.jpg', 14, 'Amerykański scenarzysta, reżyser i producent telewizyjny, współtwórca serialu \"Stranger Things\".', 8.40),
(15, 'Jonathan Nolan', 'https://fwcdn.pl/ppo/08/97/40897/451280_1.3.jpg', 15, 'Brytyjsko-amerykański scenarzysta, producent i reżyser telewizyjny, współtwórca serialu \"Westworld\".', 8.70),
(16, 'Johan Renck', 'https://fwcdn.pl/ppo/53/00/255300/475527_1.3.jpg', 16, 'Szwedzki reżyser filmowy i telewizyjny, twórca serialu \"Czarnobyl\".', 9.10),
(17, 'Peter Morgan', 'https://fwcdn.pl/ppo/06/53/10653/462626_1.3.jpg', 17, 'Brytyjski scenarzysta i dramaturg, twórca serialu \"The Crown\".', 8.50),
(18, 'Steven Knight', 'https://fwcdn.pl/ppo/72/40/147240/456434_1.3.jpg', 18, 'Brytyjski scenarzysta i reżyser, twórca serialu \"Peaky Blinders\".', 8.80),
(19, 'Guy Ritchie', 'https://fwcdn.pl/ppo/17/63/11763/450020_1.3.jpg', 19, 'Brytyjski scenarzysta i reżyser, twórca serialu \"Sherlock Holmes\".', 8.80),
(20, 'Chris Columbus', 'https://fwcdn.pl/ppo/06/49/10649/450973_1.3.jpg', 20, 'Amerykański reżyser i producent, znany z filmów \"Kevin sam w domu\" i \"Harry Potter i Kamień Filozoficzny\".', 8.10),
(21, 'Jon Favreau', 'https://fwcdn.pl/ppo/29/59/2959/450392_1.3.jpg', 21, 'Amerykański reżyser, scenarzysta, producent i aktor, znany z pracy nad filmami Marvela oraz serialem \"The Mandalorian\".', 8.60),
(22, 'Luc Besson', 'https://fwcdn.pl/ppo/03/09/309/450715_1.3.jpg', 22, 'Francuski reżyser i producent, twórca filmów \"Leon zawodowiec\" i \"Piąty element\".', 7.90),
(23, 'Olivier Nakache', 'https://fwcdn.pl/ppo/68/02/246802/458680_1.3.jpg', 23, 'Francuski reżyser, znany z filmu \"Nietykalni\".', 7.80),
(24, 'Ridley Scott', 'https://fwcdn.pl/ppo/03/46/346/450756_1.7.webp', 24, 'Brytyjski reżyser, twórca filmów \"Gladiator\" i \"Blade Runner\".', 7.80),
(25, 'Anthony i Joe Russo', 'https://fwcdn.pl/nph/1985708/2025/59235_1.8.jpg', 25, 'Amerykańscy bracia reżyserzy, znani z filmów Marvela, w tym \"Avengers: Wojna bez granic\".', 7.70),
(26, 'Bob Persichetti', 'https://m.media-amazon.com/images/M/MV5BNTE2YTM3M2MtYzkzYy00OTEzLWI5Y2YtNGU3ZjY4ZTkwYWE4XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 26, 'Amerykański reżyser animacji, twórca filmu \"Spider-Man: Uniwersum\".', 7.70),
(27, 'Bong Joon-ho', 'https://fwcdn.pl/ppo/15/31/181531/451308_1.3.jpg', 27, 'Południowokoreański reżyser, zdobywca Oscara za film \"Parasite\".', 7.60),
(28, 'David Chase', 'https://fwcdn.pl/ppo/01/92/80192/462049_1.3.jpg', 28, 'Amerykański scenarzysta i producent, twórca serialu \"Rodzina Soprano\".', 8.50),
(29, 'David Simon', 'https://fwcdn.pl/ppo/64/73/176473/462488_1.3.jpg', 29, 'Amerykański dziennikarz i scenarzysta, twórca serialu \"The Wire\".', 8.40),
(30, 'Jason Bateman', 'https://fwcdn.pl/ppo/50/34/55034/450303_1.3.jpg', 30, 'Amerykański aktor i reżyser, znany z serialu \"Ozark\".', 8.30),
(31, 'Hwang Dong-hyuk', 'https://fwcdn.pl/ppo/30/79/933079/479760.3.jpg', 31, 'Południowokoreański reżyser i scenarzysta, twórca serialu \"Squid Game\".', 8.10),
(32, 'Pascal Charrue', 'https://media.themoviedb.org/t/p/w500/4z0axhC1oXySE1RBFydKjIkJbpZ.jpg', 32, 'Francuski reżyserz animacji, twórca serialu \"Arcane\".', 8.00),
(33, 'Scott Frank', 'https://fwcdn.pl/ppo/03/05/10305/463321_1.3.jpg', 33, 'Amerykański scenarzysta i reżyser, twórca serialu \"Gambit królowej\".', 7.90),
(34, 'Baran bo Odar', 'https://fwcdn.pl/ppo/42/91/954291/454416_1.3.jpg', 34, 'Niemiecki reżyser i scenarzysta, twórca serialu \"Dark\".', 7.80),
(35, 'Charlie Brooker', 'https://fwcdn.pl/ppo/75/59/337559/454411_1.3.jpg', 35, 'Brytyjski scenarzysta i producent, twórca serialu \"Black Mirror\".', 7.60),
(36, 'James Cameron', 'https://fwcdn.pl/ppo/00/16/16/450626_1.3.jpg', 36, 'Kanadyjski reżyser, twórca filmów \"Avatar\" i \"Titanic\".', 7.50),
(37, 'Steven Spielberg', 'https://fwcdn.pl/ppo/01/06/106/450655_1.3.jpg', 37, 'Amerykański reżyser, twórca filmów \"Jurassic Park\" i \"E.T.\".', 7.30),
(38, 'Sidney Lumet', 'https://fwcdn.pl/ppo/14/68/11468/450680_1.3.jpg', 38, 'Amerykański reżyser i scenarzysta, znany z intensywnych dramatów społecznych i moralnych. Jego debiut, \"Dwunastu gniewnych ludzi\", uważany jest za arcydzieło kina sądowego. W swojej karierze wyreżyserował ponad 40 filmów, w tym \"Serpico\", \"Pieskie popołudnie\" i \"Sieć\", skupiając się często na tematach etyki, sprawiedliwości i upadku instytucji.', 8.30),
(39, 'Milos Forman', 'https://fwcdn.pl/ppo/03/39/339/450701_1.3.jpg', 39, 'Czesko-amerykański reżyser, dwukrotny laureat Oscara za najlepszą reżyserię. Zasłynął dzięki filmom \"Lot nad kukułczym gniazdem\" oraz \"Amadeusz\", które zdobyły uznanie za mistrzowskie prowadzenie aktorów i głębokie portrety psychologiczne. Jego twórczość łączy europejską wrażliwość z amerykańskim stylem narracji, eksplorując tematy wolności jednostki, buntów i konfliktów z systemem.', 8.40),
(40, 'Damien Chazelle', 'https://fwcdn.pl/ppo/56/43/1155643/450001_1.3.jpg', 40, 'Amerykański reżyser i scenarzysta, znany z zamiłowania do muzyki i perfekcjonizmu wizualnego. Zdobył Oscara za reżyserię filmu \"La La Land\", stając się najmłodszym laureatem w tej kategorii. Jego inne znane dzieła to \"Whiplash\" i \"First Man\", w których eksploruje tematy ambicji, poświęcenia oraz granic ludzkich możliwości. Chazelle wyróżnia się dynamicznym montażem, wyczuciem rytmu i emocjonalną intensywnością.', 8.20),
(41, 'Todd Phillips', 'https://fwcdn.pl/ppo/23/63/12363/450978_1.3.jpg', 41, 'Amerykański reżyser, scenarzysta i producent, który zyskał rozgłos dzięki komediom, takim jak trylogia \"Kac Vegas\". Przełomem w jego karierze był dramat psychologiczny \"Joker\", za który otrzymał nominację do Oscara. Phillips potrafi łączyć elementy rozrywki z mroczniejszymi aspektami ludzkiej psychiki, tworząc filmy o dużym ładunku emocjonalnym i społecznym rezonansie.', 7.90),
(42, 'Clint Eastwood', 'https://fwcdn.pl/ppo/01/22/122/449655_1.7.webp', 42, 'Amerykański reżyser, producent, scenarzysta i aktor, znany ze swojej pracy zarówno jako reżyser, jak i aktor w klasycznych filmach westernowych i dramatycznych. Eastwood zdobył międzynarodowe uznanie za filmy takie jak \"Bez przebaczenia\", \"Gran Torino\" i \"Sully\". Jego prace często poruszają tematy moralności, samotności oraz problemów społecznych, ukazując postacie w skomplikowanych, często trudnych sytuacjach życiowych.', 8.30),
(43, 'Brian De Palma', 'https://fwcdn.pl/ppo/00/27/27/450751_1.3.jpg', 43, 'Amerykański reżyser, scenarzysta i producent, znany z pracy nad thrillerami psychologicznymi i filmami sensacyjnymi. De Palma zdobył popularność dzięki takim produkcjom jak \"Carrie\", \"Scarface\" oraz \"The Untouchables\". Jego styl reżyserii charakteryzuje się wykorzystaniem napięcia, złożonych montażów i wpływem kina noir, co czyni jego filmy pełnymi emocji i napięcia.', 7.90),
(44, 'Roman Polański', 'https://fwcdn.pl/ppo/00/83/83/450608_1.3.jpg', 44, 'Polsko-francuski reżyser, producent i scenarzysta, zdobywca Oscara za reżyserię filmu \"Pianista\". Polański jest znany z mistrzowskiego łączenia elementów thrillera, horroru i dramatu psychologicznego. Jego filmy, takie jak \"Chinatown\", \"Rosemary\'s Baby\" czy \"The Ghost Writer\", charakteryzują się intrygującymi fabułami i wyrafinowaną atmosferą, łącząc mistrzostwo w opowiadaniu historii z głębokimi analizami postaci.', 8.40),
(45, 'Mel Gibson', 'https://fwcdn.pl/ppo/00/39/39/449868_1.7.webp', 45, 'Amerykański reżyser, producent i aktor, znany z kontrowersyjnych filmów i ról w takich produkcjach jak \"Braveheart\" i \"Mad Max\". Gibson zdobył Oscara za reżyserię filmu \"Braveheart\" oraz za produkcję \"Pięćdziesiąt twarzy Greya\". Jego reżyseria w \"Apocalypto\" i \"Zatruty sztylet\" podkreśla jego talent do tworzenia pełnych emocji, wizualnie spektakularnych filmów. Jednocześnie Gibson nie unika trudnych tematów społecznych i historycznych.', 8.30),
(46, 'Darren Aronofsky', 'https://fwcdn.pl/ppo/21/49/12149/450742_1.3.jpg', 46, 'Amerykański reżyser, producent i scenarzysta, znany ze swoich intensywnych i emocjonalnych filmów, które często zgłębiają granice ludzkiego umysłu i psychiki. Jego najbardziej rozpoznawalne dzieła to \"Requiem dla snu\", \"Czarny łabędź\" oraz \"Mother!\". Aronofsky często stosuje nietypowe techniki narracyjne, a jego filmy poruszają tematykę uzależnień, obsesji, przemiany oraz cierpienia. Jego styl reżyserski jest wyjątkowy, pełen napięcia i niepokoju, co sprawia, że jego produkcje często dzielą publiczność.', 8.70),
(47, 'Jean-Pierre Jeunet', 'https://fwcdn.pl/ppo/07/57/10757/456335_1.3.jpg', 47, 'Francuski reżyser i scenarzysta, znany z wyrazistego stylu wizualnego i ciepłych, fantastycznych historii. Jego najbardziej znane filmy to \"Amelia\", \"Delicatessen\" oraz \"Miasto zaginionych dzieci\". Jeunet często wykorzystuje kolorowe, surrealistyczne obrazy, a jego filmy charakteryzują się magiczną atmosferą, oryginalnymi postaciami i kreatywnym podejściem do narracji. Jest mistrzem w tworzeniu filmów, które balansują pomiędzy melancholią a optymizmem, a jego dzieła wciąż pozostają w sercach widzów na całym świecie.', 8.90),
(48, 'Roberto Benigni', 'https://fwcdn.pl/ppo/01/37/137/450690_1.3.jpg', 48, 'Włoski reżyser, aktor i scenarzysta, najbardziej znany z reżyserowania i występowania w filmie \"Życie jest piękne\" (\"La vita è bella\"), który zdobył międzynarodową popularność i nagrody, w tym Oscara za najlepszą rolę męską. Benigni łączy humor z dramatem, tworząc wzruszające opowieści o miłości, nadziei i przetrwaniu w trudnych czasach. Jego styl charakteryzuje się energią, optymizmem, ale także głębokim humanizmem, co sprawia, że jego filmy są poruszające i zapadają w pamięć.', 8.80),
(49, 'Martin Scorsese', 'https://fwcdn.pl/ppo/00/96/96/450689_1.3.jpg', 49, 'Amerykański reżyser, producent i scenarzysta, uważany za jednego z najwybitniejszych twórców filmowych w historii kina. Jego kariera obejmuje takie klasyki jak \"Taksówkarz\", \"Chłopcy z ferajny\" i \"Wściekłe byki\". Scorsese jest mistrzem w kreowaniu intensywnych, psychologicznych portretów postaci oraz w opowiadaniu historii o moralności, przemocy i złożoności ludzkiego ducha. Jego filmy często badają tematykę przestępczości, religii oraz władzy, a jego styl charakteryzuje się dynamiczną kamerą, dbałością o detale i wykorzystaniem muzyki.', 9.70),
(50, 'Marek Koterski', 'https://fwcdn.pl/ppo/12/04/11204/480300.3.jpg', 50, 'Polski reżyser, scenarzysta i aktor, znany przede wszystkim z takich filmów jak \"Dzień świra\" i \"Wszyscy jesteśmy Chrystusami\". Koterski w swoich produkcjach często porusza tematy psychologiczne, społeczne i egzystencjalne, ukazując zmagania jednostki z rzeczywistością. Jego filmy są pełne humoru, ale także głębokiej refleksji nad kondycją człowieka. Charakteryzuje je subtelny, a zarazem ostry realizm, który skłania do zadumy nad życiem i tożsamością.', 8.60),
(51, 'Lenny Abrahamson', 'https://fwcdn.pl/ppo/43/57/184357/456805_1.3.jpg', 51, 'Irlandzki reżyser, producent i scenarzysta, który zdobył międzynarodowe uznanie za takie filmy jak \"Pokój\" oraz \"Frank\". Jego twórczość koncentruje się na postaciach, które zmagają się z różnorodnymi emocjonalnymi i psychologicznymi wyzwaniami, często w kontekście zamkniętych przestrzeni lub nietypowych sytuacji. Abrahamson jest mistrzem subtelnej narracji, która łączy w sobie elementy dramatu i humoru, a także doskonałych portretów ludzkich przeżyć.', 8.40),
(52, 'Gabriele Muccino', 'https://fwcdn.pl/ppo/73/48/137348/458660_1.3.jpg', 52, 'Włoski reżyser i scenarzysta, który zdobył międzynarodową sławę dzięki filmom takim jak \"Szczęściarze\" oraz \"Pursuit of Happyness\". Jego filmy często koncentrują się na relacjach rodzinnych i osobistych zmaganiach bohaterów. Muccino jest znany z umiejętności opowiadania wzruszających historii o relacjach międzyludzkich, które łączą dramatyczne momenty z nadzieją na lepsze jutro.', 8.20),
(53, 'Andrzej Wajda', 'https://fwcdn.pl/ppo/02/89/289/466524_1.3.jpg', 53, 'Polski reżyser i scenarzysta, uznawany za jednego z najwybitniejszych twórców w historii kina. Wajda był twórcą filmów o tematyce historycznej i społecznej, takich jak \"Idź i patrz\", \"Człowiek z marmuru\" oraz \"Katyń\". Jego prace były głęboko związane z historią Polski i społecznymi problemami, co zapewniło mu międzynarodowe uznanie.', 9.10),
(54, 'Jan Komasa', 'https://fwcdn.pl/ppo/85/63/318563/460868_1.3.jpg', 54, 'Polski reżyser i scenarzysta, znany z takich filmów jak \"Ida\" oraz \"Boże Ciało\". Jego twórczość charakteryzuje się głębokim podejściem do tematów społecznych i religijnych. Komasa potrafi poruszać kontrowersyjne kwestie z dużą dozą realizmu, co czyni jego filmy szczególnie ważnymi w kontekście współczesnej polskiej kinematografii.', 8.90),
(55, 'Łukasz Palkowski', 'https://fwcdn.pl/ppo/52/74/195274/420546.1.jpg', 55, 'Polski reżyser i scenarzysta, znany z takich filmów jak \"Ida\" oraz \"Boże Ciało\". Jego twórczość charakteryzuje się głębokim podejściem do tematów społecznych i religijnych. Komasa potrafi poruszać kontrowersyjne kwestie z dużą dozą realizmu, co czyni jego filmy szczególnie ważnymi w kontekście współczesnej polskiej kinematografii.', 8.70),
(56, 'Małgorzata Szumowska', 'https://fwcdn.pl/ppo/04/64/464/454342_1.7.webp', 56, 'Polska reżyserka i scenarzystka, której twórczość obejmuje szerokie spektrum tematów, od dramatów społecznych po kontrowersyjne podejście do tematów obyczajowych. Jej filmy, takie jak \"Body/Ciało\" czy \"W imię...\", są często nagradzane na międzynarodowych festiwalach. Szumowska znana jest z niekonwencjonalnego stylu i krytycznego spojrzenia na społeczne normy.', 8.80),
(57, 'Paweł Pawlikowski', 'https://fwcdn.pl/ppo/09/22/110922/472175_1.3.jpg', 57, 'Polski reżyser, zdobywca Oscara za najlepszy film nieanglojęzyczny za \"Idę\". Jego twórczość charakteryzuje się minimalistycznym stylem, głębokimi portretami postaci i dużym naciskiem na estetykę. Filmy takie jak \"Ida\" oraz \"Zimna wojna\" są doceniane zarówno przez krytyków, jak i widzów na całym świecie.', 9.20),
(58, 'Wojciech Smarzowski', 'https://fwcdn.pl/ppo/03/47/347/453170_1.3.jpg', 58, 'Polski reżyser i scenarzysta, znany z kontrowersyjnych i głęboko społecznym filmów. Jego twórczość często podejmuje tematykę zbrodni, moralności oraz historii Polski. Smarzowski zdobył uznanie za filmy takie jak \"Wołyń\", \"Ida\" i \"Kler\", które wywołały duże dyskusje społeczne.', 8.90),
(59, 'Piotr Domalewski', 'https://fwcdn.pl/ppo/57/72/1265772/476902_1.3.jpg', 59, 'Polski reżyser, scenarzysta i aktor. Jego twórczość koncentruje się na portretach rodzinnych i społeczeństwa, w szczególności w kontekście współczesnych problemów. Zyskał uznanie za filmy takie jak \"Jak pies z kotem\" i \"Ciche dni\", które poruszają ważne tematy, jak życie na wsi, relacje międzyludzkie i przemiany społeczne.', 8.50),
(60, 'Władysław Pasikowski', 'https://fwcdn.pl/ppo/00/79/79/271699.1.jpg', 60, 'Polski reżyser i scenarzysta, znany z filmów sensacyjnych i kryminalnych, które często poruszają tematykę przestępczości, wojny i społeczeństwa. Jego najsłynniejsze dzieła to \"Psie serce\" i \"Kroll\", które zdobyły dużą popularność w latach 90. XX wieku. Pasikowski jest uznawany za twórcę, który wprowadził nową jakość do polskiego kina sensacyjnego.', 8.70),
(61, 'Dan Fogelman', 'https://fwcdn.pl/ppo/77/29/217729/462962_1.7.webp', 61, 'Amerykański reżyser, scenarzysta i producent, znany z tworzenia filmów o silnych emocjach i relacjach międzyludzkich. Jego najbardziej rozpoznawalne filmy to \"Cudowni chłopcy\", \"Wszystko za życie\" oraz serial \"Tacy jesteśmy\". Fogelman zdobył uznanie za zdolność łączenia humoru z dramatem w opowieściach, które poruszają istotne problemy współczesnych społeczeństw.', 8.40),
(62, 'Nicolas Winding Refn', 'https://fwcdn.pl/ppo/34/47/63447/450728_1.3.jpg', 62, 'Duński reżyser, scenarzysta i producent, znany z tworzenia mrocznych, stylizowanych filmów o intensywnej estetyce. Jego najbardziej znane dzieła to \"Drive\", \"Bronson\" i \"Only God Forgives\". Refn często łączy brutalne tematy z artystycznymi i wizualnymi eksperymentami, co zyskało mu oddanych fanów i krytyków.', 8.30),
(63, 'Justin Chadwick', 'https://fwcdn.pl/ppo/78/44/97844/464726_1.3.jpg', 63, 'Brytyjski reżyser i producent filmowy, znany z pracy nad dramatami i filmami historycznymi. Jego najbardziej znane filmy to \"The Other Boleyn Girl\" oraz \"Mandela: Long Walk to Freedom\". Chadwick często skupia się na głębokich portretach psychologicznych postaci oraz na realiach historycznych, w których osadza swoje opowieści.', 7.90),
(64, 'Jordan Vogt-Roberts', 'https://fwcdn.pl/ppo/38/18/1243818/469562_1.3.jpg', 64, 'Amerykański reżyser i scenarzysta, najbardziej znany z reżyserii filmu \"Kong: Wyspa Czaszki\". Vogt-Roberts zdobył uznanie dzięki swojej pracy nad filmami pełnymi akcji i efektów specjalnych, łącząc je z emocjonalnym tłem i solidnym rozwojem postaci. Jego wcześniejsze projekty obejmują również takie filmy jak \"The Kings of Summer\".', 7.50),
(65, 'Lilly Wachowski', 'https://fwcdn.pl/ppo/13/69/11369/450771_1.3.jpg', 65, 'Amerykańska reżyserka, scenarzystka i producentka, znana głównie z pracy nad serią \"Matrix\", którą stworzyła razem z siostrą, Laną. Jej filmy często poruszają tematy tożsamości, technologii oraz wolności jednostki. Lilly jest również pionierką w kwestii reprezentacji osób transpłciowych w kinie, od kiedy sama dokonała zmiany płci.', 8.70),
(66, 'Lilly Wachowski', 'https://fwcdn.pl/ppo/98/82/59882/390404.1.jpg', 66, 'Amerykańska reżyserka, scenarzystka i producentka, znana głównie z pracy nad serią \"Matrix\", którą stworzyła razem z siostrą, Laną. Jej filmy często poruszają tematy tożsamości, technologii oraz wolności jednostki. Lilly jest również pionierką w kwestii reprezentacji osób transpłciowych w kinie, od kiedy sama dokonała zmiany płci.', 8.70),
(67, 'Fred Schepisi', 'https://fwcdn.pl/ppo/26/61/12661/472164_1.3.jpg', 67, 'Australijski reżyser i producent, znany z filmów takich jak \"Rzeka\" oraz \"Rozmowy z innymi kobietami\". Jego prace często łączą elementy dramatyczne i komediowe, a także poruszają kwestie międzyludzkich relacji. Schepisi zdobył międzynarodowe uznanie za swój wkład w kinematografię australijską i amerykańską.', 7.90),
(68, 'Richard Kelly', 'https://fwcdn.pl/ppo/44/05/54405/471487_1.3.jpg', 68, 'Amerykański reżyser, scenarzysta i producent, najbardziej znany z reżyserii kultowego filmu \"Donnie Darko\". Jego filmy często łączą elementy science fiction, psychologii i metafizyki, a ich tematyka często oscyluje wokół tajemnicy, czasu i ludzkiej egzystencji. Kelly zdobył uznanie za swój unikalny styl narracyjny i odważne podejście do niekonwencjonalnych tematów.', 7.80),
(69, 'Richard Attenborough', 'https://fwcdn.pl/ppo/00/02/2/452098_1.3.jpg', 69, 'Brytyjski reżyser, producent i aktor, najbardziej znany z reżyserii filmów takich jak \"Gandhi\" oraz \"Ostatni król Szkocji\". Attenborough zdobył uznanie zarówno za swoją karierę aktorską, jak i reżyserską, a jego filmy często poruszają tematy historyczne, biograficzne oraz ludzkich dramatów. Jako reżyser \"Gandhi\" zdobył dwa Oscary, w tym za najlepszą reżyserię.', 8.40),
(70, 'Christophe Barratier', 'https://fwcdn.pl/ppo/19/60/181960/282752.1.jpg', 70, 'Francuski reżyser i scenarzysta, znany przede wszystkim z filmu \"Les Choristes\", który opowiada historię muzyczną osadzoną w szkole dla chłopców. Barratier w swoich filmach często porusza tematy związane z muzyką, edukacją oraz siłą wspólnoty, a jego reżyseria cechuje się ciepłym podejściem do bohaterów i ich emocjonalnych przeżyć.', 7.90),
(71, 'Giuseppe Tornatore', 'https://fwcdn.pl/ppo/09/10/10910/450733_1.3.jpg', 71, 'Włoski reżyser, scenarzysta i producent, najbardziej znany z filmu \"Cinema Paradiso\", który zdobył Oscara za najlepszy film nieanglojęzyczny. Jego twórczość często koncentruje się na tematach nostalgii, kina, a także emocjonalnych więzi między ludźmi. Tornatore jest mistrzem w łączeniu estetyki z głębokimi, poruszającymi historiami.', 8.60),
(72, 'Stanley Kubrick', 'https://fwcdn.pl/ppo/00/62/62/452006_1.3.jpg', 72, 'Amerykański reżyser, scenarzysta i producent, uznawany za jednego z najwybitniejszych twórców w historii kina. Kubrick jest znany z tworzenia filmów, które zmieniają oblicze gatunków, takich jak \"2001: Odyseja kosmiczna\", \"Mechaniczna pomarańcza\" i \"Lśnienie\". Jego filmy często zawierają złożoną symbolikę, perfekcyjnie dopracowane kadry i mroczne, filozoficzne pytania dotyczące ludzkiej natury.', 9.50);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `statusy_filmow`
--

CREATE TABLE `statusy_filmow` (
  `ID` int(11) NOT NULL,
  `film_id` int(11) DEFAULT NULL,
  `uzytkownik_id` int(11) DEFAULT NULL,
  `status` enum('nie obejrzane','obejrzane','planowane') DEFAULT 'nie obejrzane',
  `ulubione` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `top_aktorzy`
-- (See below for the actual view)
--
CREATE TABLE `top_aktorzy` (
`id` int(11)
,`ranking_popularnosci` int(11)
,`imie_nazwisko` varchar(100)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `top_ocena`
-- (See below for the actual view)
--
CREATE TABLE `top_ocena` (
`id` int(11)
,`zdjecie` varchar(255)
,`tytul` varchar(255)
,`id_rezysera` int(11)
,`srednia_ocena` decimal(3,2)
,`imie_nazwisko` varchar(255)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `top_popularnosc`
-- (See below for the actual view)
--
CREATE TABLE `top_popularnosc` (
`id` int(11)
,`zdjecie` varchar(255)
,`tytul` varchar(255)
,`id_rezysera` int(11)
,`imie_nazwisko` varchar(255)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `top_rezyserzy`
-- (See below for the actual view)
--
CREATE TABLE `top_rezyserzy` (
`id` int(11)
,`ranking_popularnosci` int(11)
,`imie_nazwisko` varchar(255)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `ulubione_filmy`
-- (See below for the actual view)
--
CREATE TABLE `ulubione_filmy` (
`login` varchar(255)
,`tytul` varchar(255)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `ID` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `haslo` varchar(255) NOT NULL,
  `rola` enum('uzytkownik','moderator','edytor','admin') NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`ID`, `login`, `haslo`, `rola`, `email`) VALUES
(1, 'janek_user1', 'haslo1234', 'uzytkownik', 'janek1@x.pl'),
(2, 'ania_user2', 'haslo2345', 'uzytkownik', 'ania2@x.pl'),
(3, 'marek_user3', 'haslo3456', 'uzytkownik', 'marek3@x.pl'),
(4, 'kasia_user4', 'haslo4567', 'uzytkownik', 'kasia4@x.pl'),
(5, 'tomek_user5', 'haslo5678', 'uzytkownik', 'tomek5@x.pl'),
(6, 'ola_user6', 'haslo6789', 'uzytkownik', 'ola6@x.pl'),
(7, 'piotr_user7', 'haslo7890', 'uzytkownik', 'piotr7@x.pl'),
(8, 'gosia_user8', 'haslo8901', 'uzytkownik', 'gosia8@x.pl'),
(9, 'kuba_user9', 'haslo9012', 'uzytkownik', 'kuba9@x.pl'),
(10, 'zosia_user10', 'haslo0123', 'uzytkownik', 'zosia10@x.pl'),
(11, 'bartek_user11', 'haslo1324', 'uzytkownik', 'bartek11@x.pl'),
(12, 'agnieszka_user12', 'haslo2435', 'uzytkownik', 'agnieszka12@x.pl'),
(13, 'dawid_user13', 'haslo3546', 'uzytkownik', 'dawid13@x.pl'),
(14, 'iza_user14', 'haslo4657', 'uzytkownik', 'iza14@x.pl'),
(15, 'grzegorz_user15', 'haslo5768', 'uzytkownik', 'grzegorz15@x.pl'),
(16, 'basia_user16', 'haslo6879', 'uzytkownik', 'basia16@x.pl'),
(17, 'michal_user17', 'haslo7980', 'uzytkownik', 'michal17@x.pl'),
(18, 'aleksandra_user18', 'haslo8091', 'uzytkownik', 'aleksandra18@x.pl'),
(19, 'krzysiek_user19', 'haslo9102', 'uzytkownik', 'krzysiek19@x.pl'),
(20, 'joanna_user20', 'haslo1023', 'uzytkownik', 'joanna20@x.pl'),
(21, 'pawel_user21', 'haslo2134', 'uzytkownik', 'pawel21@x.pl'),
(22, 'julia_user22', 'haslo3245', 'uzytkownik', 'julia22@x.pl'),
(23, 'patryk_user23', 'haslo4356', 'uzytkownik', 'patryk23@x.pl'),
(24, 'natalia_user24', 'haslo5467', 'uzytkownik', 'natalia24@x.pl'),
(25, 'adrian_user25', 'haslo6578', 'uzytkownik', 'adrian25@x.pl'),
(26, 'edytor1', 'haslo1111', 'edytor', 'edytor1@x.pl'),
(27, 'edytor2', 'haslo2222', 'edytor', 'edytor2@x.pl'),
(28, 'edytor3', 'haslo3333', 'edytor', 'edytor3@x.pl'),
(29, 'edytor4', 'haslo4444', 'edytor', 'edytor4@x.pl'),
(30, 'edytor5', 'haslo5555', 'edytor', 'edytor5@x.pl'),
(31, 'moderator1', 'haslo6666', 'moderator', 'moderator1@x.pl'),
(32, 'moderator2', 'haslo7777', 'moderator', 'moderator2@x.pl'),
(33, 'moderator3', 'haslo8888', 'moderator', 'moderator3@x.pl'),
(34, 'admin', 'haslo9999', 'admin', 'admin@x.pl');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `wszyscy_uzytkownicy`
-- (See below for the actual view)
--
CREATE TABLE `wszyscy_uzytkownicy` (
`ID` int(11)
,`login` varchar(255)
,`email` varchar(100)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wystapienia`
--

CREATE TABLE `wystapienia` (
  `id` int(11) NOT NULL,
  `id_filmu` int(11) NOT NULL,
  `id_aktora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wystapienia`
--

INSERT INTO `wystapienia` (`id`, `id_filmu`, `id_aktora`) VALUES
(1, 1, 15),
(2, 2, 6),
(3, 2, 9),
(4, 3, 2),
(5, 3, 14),
(6, 3, 19),
(55, 4, 60),
(8, 5, 73),
(9, 6, 3),
(56, 7, 77),
(11, 8, 11),
(10, 8, 12),
(12, 8, 66),
(57, 9, 29),
(13, 10, 39),
(58, 11, 70),
(59, 12, 4),
(60, 13, 7),
(14, 14, 27),
(61, 15, 63),
(62, 16, 67),
(63, 17, 18),
(64, 18, 79),
(65, 19, 32),
(16, 20, 51),
(15, 20, 65),
(17, 21, 43),
(19, 22, 30),
(18, 22, 73),
(20, 23, 5),
(21, 23, 10),
(22, 24, 19),
(66, 25, 68),
(24, 26, 1),
(23, 26, 80),
(26, 27, 24),
(25, 27, 47),
(27, 28, 35),
(67, 29, 76),
(28, 30, 3),
(68, 31, 40),
(69, 32, 59),
(70, 33, 33),
(71, 34, 13),
(72, 35, 31),
(73, 36, 75),
(74, 37, 53),
(75, 38, 20),
(76, 39, 48),
(77, 40, 25),
(78, 41, 16),
(29, 42, 10),
(79, 43, 26),
(80, 44, 57),
(81, 45, 22),
(82, 46, 36),
(83, 47, 46),
(84, 48, 54),
(85, 49, 28),
(86, 50, 58),
(87, 51, 41),
(88, 52, 72),
(89, 53, 38),
(30, 54, 37),
(90, 55, 50),
(31, 56, 1),
(32, 56, 2),
(33, 56, 66),
(34, 57, 39),
(35, 58, 9),
(36, 59, 21),
(91, 60, 44),
(38, 61, 8),
(37, 61, 9),
(39, 62, 66),
(92, 63, 23),
(93, 64, 6),
(94, 65, 42),
(40, 66, 17),
(41, 66, 24),
(42, 67, 10),
(43, 67, 24),
(95, 68, 8),
(96, 69, 34),
(97, 70, 19),
(98, 71, 10),
(44, 72, 64),
(99, 73, 73),
(100, 74, 52),
(101, 75, 45),
(102, 76, 62),
(103, 77, 69),
(104, 78, 49),
(105, 79, 55),
(106, 80, 11),
(107, 81, 47),
(108, 82, 17),
(109, 83, 15),
(110, 84, 9),
(111, 85, 56),
(45, 86, 64),
(112, 87, 21),
(46, 88, 61),
(47, 89, 71),
(48, 90, 78),
(113, 91, 5),
(114, 92, 74),
(49, 93, 17),
(115, 94, 51),
(51, 95, 3),
(50, 95, 10),
(52, 95, 32),
(53, 96, 10),
(116, 97, 27),
(117, 98, 4),
(118, 99, 3),
(54, 100, 8);

-- --------------------------------------------------------

--
-- Struktura widoku `oceny_uzytkownikow`
--
DROP TABLE IF EXISTS `oceny_uzytkownikow`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `oceny_uzytkownikow`  AS SELECT `uzytkownicy`.`login` AS `login`, `filmy`.`tytul` AS `tytul`, `oceny`.`ocena` AS `ocena` FROM ((`oceny` join `uzytkownicy` on(`oceny`.`uzytkownik_id` = `uzytkownicy`.`ID`)) join `filmy` on(`oceny`.`film_id` = `filmy`.`ID`)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `top_aktorzy`
--
DROP TABLE IF EXISTS `top_aktorzy`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `top_aktorzy`  AS SELECT `aktorzy`.`ID` AS `id`, `aktorzy`.`ranking_popularnosci` AS `ranking_popularnosci`, `aktorzy`.`imie_nazwisko` AS `imie_nazwisko` FROM `aktorzy` ORDER BY `aktorzy`.`ranking_popularnosci` DESC LIMIT 0, 20 ;

-- --------------------------------------------------------

--
-- Struktura widoku `top_ocena`
--
DROP TABLE IF EXISTS `top_ocena`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `top_ocena`  AS SELECT `filmy`.`ID` AS `id`, `filmy`.`zdjecie` AS `zdjecie`, `filmy`.`tytul` AS `tytul`, `filmy`.`rezyser_id` AS `id_rezysera`, `filmy`.`srednia_ocena` AS `srednia_ocena`, `rezyserzy`.`imie_nazwisko` AS `imie_nazwisko` FROM (`filmy` join `rezyserzy` on(`filmy`.`rezyser_id` = `rezyserzy`.`ID`)) ORDER BY `filmy`.`srednia_ocena` DESC LIMIT 0, 100 ;

-- --------------------------------------------------------

--
-- Struktura widoku `top_popularnosc`
--
DROP TABLE IF EXISTS `top_popularnosc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `top_popularnosc`  AS SELECT `filmy`.`ID` AS `id`, `filmy`.`zdjecie` AS `zdjecie`, `filmy`.`tytul` AS `tytul`, `filmy`.`rezyser_id` AS `id_rezysera`, `rezyserzy`.`imie_nazwisko` AS `imie_nazwisko` FROM (`filmy` join `rezyserzy` on(`filmy`.`rezyser_id` = `rezyserzy`.`ID`)) ORDER BY `filmy`.`ranking_popularnosci` ASC LIMIT 0, 100 ;

-- --------------------------------------------------------

--
-- Struktura widoku `top_rezyserzy`
--
DROP TABLE IF EXISTS `top_rezyserzy`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `top_rezyserzy`  AS SELECT `rezyserzy`.`ID` AS `id`, `rezyserzy`.`ranking_popularnosci` AS `ranking_popularnosci`, `rezyserzy`.`imie_nazwisko` AS `imie_nazwisko` FROM `rezyserzy` ORDER BY `rezyserzy`.`ranking_popularnosci` ASC LIMIT 0, 20 ;

-- --------------------------------------------------------

--
-- Struktura widoku `ulubione_filmy`
--
DROP TABLE IF EXISTS `ulubione_filmy`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ulubione_filmy`  AS SELECT `uzytkownicy`.`login` AS `login`, `filmy`.`tytul` AS `tytul` FROM ((`statusy_filmow` join `uzytkownicy` on(`statusy_filmow`.`uzytkownik_id` = `uzytkownicy`.`ID`)) join `filmy` on(`statusy_filmow`.`film_id` = `filmy`.`ID`)) WHERE `statusy_filmow`.`ulubione` = 1 ;

-- --------------------------------------------------------

--
-- Struktura widoku `wszyscy_uzytkownicy`
--
DROP TABLE IF EXISTS `wszyscy_uzytkownicy`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wszyscy_uzytkownicy`  AS SELECT `uzytkownicy`.`ID` AS `ID`, `uzytkownicy`.`login` AS `login`, `uzytkownicy`.`email` AS `email` FROM `uzytkownicy` WHERE `uzytkownicy`.`rola` = 'uzytkownik' ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `aktorzy`
--
ALTER TABLE `aktorzy`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `filmy`
--
ALTER TABLE `filmy`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `rezyser_id` (`rezyser_id`);

--
-- Indeksy dla tabeli `oceny`
--
ALTER TABLE `oceny`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `film_id` (`film_id`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`);

--
-- Indeksy dla tabeli `personel`
--
ALTER TABLE `personel`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`);

--
-- Indeksy dla tabeli `rezyserzy`
--
ALTER TABLE `rezyserzy`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `statusy_filmow`
--
ALTER TABLE `statusy_filmow`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `film_id` (`film_id`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`);

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeksy dla tabeli `wystapienia`
--
ALTER TABLE `wystapienia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_filmu` (`id_filmu`,`id_aktora`),
  ADD KEY `id_aktora` (`id_aktora`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aktorzy`
--
ALTER TABLE `aktorzy`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `filmy`
--
ALTER TABLE `filmy`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `oceny`
--
ALTER TABLE `oceny`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personel`
--
ALTER TABLE `personel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `rezyserzy`
--
ALTER TABLE `rezyserzy`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `statusy_filmow`
--
ALTER TABLE `statusy_filmow`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `wystapienia`
--
ALTER TABLE `wystapienia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `filmy`
--
ALTER TABLE `filmy`
  ADD CONSTRAINT `filmy_ibfk_1` FOREIGN KEY (`rezyser_id`) REFERENCES `rezyserzy` (`ID`);

--
-- Constraints for table `oceny`
--
ALTER TABLE `oceny`
  ADD CONSTRAINT `oceny_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `filmy` (`ID`),
  ADD CONSTRAINT `oceny_ibfk_2` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownicy` (`ID`);

--
-- Constraints for table `personel`
--
ALTER TABLE `personel`
  ADD CONSTRAINT `personel_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownicy` (`ID`);

--
-- Constraints for table `statusy_filmow`
--
ALTER TABLE `statusy_filmow`
  ADD CONSTRAINT `statusy_filmow_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `filmy` (`ID`),
  ADD CONSTRAINT `statusy_filmow_ibfk_2` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownicy` (`ID`);

--
-- Constraints for table `wystapienia`
--
ALTER TABLE `wystapienia`
  ADD CONSTRAINT `wystapienia_ibfk_1` FOREIGN KEY (`id_aktora`) REFERENCES `aktorzy` (`ID`),
  ADD CONSTRAINT `wystapienia_ibfk_2` FOREIGN KEY (`id_filmu`) REFERENCES `filmy` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
