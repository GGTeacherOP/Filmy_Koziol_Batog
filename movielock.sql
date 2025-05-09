-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Maj 09, 2025 at 09:07 PM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

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
(51, 'The Mandalorian', 'mandalorian.jpg', 'sci-fi', 'serial', 21, 'Łowca nagród w uniwersum Gwiezdnych Wojen opiekuje się tajemniczym dzieckiem.', 8.30, 51);

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
-- Struktura tabeli dla tabeli `osoby`
--

CREATE TABLE `osoby` (
  `ID` int(11) NOT NULL,
  `imie_nazwisko` varchar(255) NOT NULL,
  `zdjecie` varchar(255) DEFAULT NULL,
  `ranking_popularnosci` int(11) DEFAULT 0,
  `zyciorys` text DEFAULT NULL,
  `ocena` decimal(3,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `osoby`
--

INSERT INTO `osoby` (`ID`, `imie_nazwisko`, `zdjecie`, `ranking_popularnosci`, `zyciorys`, `ocena`) VALUES
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
(37, 'Steven Spielberg', 'https://fwcdn.pl/ppo/01/06/106/450655_1.3.jpg', 37, 'Amerykański reżyser, twórca filmów \"Jurassic Park\" i \"E.T.\".', 7.30);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `personel`
--

CREATE TABLE `personel` (
  `ID` int(11) NOT NULL,
  `uzytkownik_id` int(11) DEFAULT NULL,
  `uprawnienia` enum('admin','pracownik','informatyk') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `statusy_filmow`
--

CREATE TABLE `statusy_filmow` (
  `ID` int(11) NOT NULL,
  `film_id` int(11) DEFAULT NULL,
  `uzytkownik_id` int(11) DEFAULT NULL,
  `status` enum('nie obejrzane','obejrzane','planowane') DEFAULT 'nie obejrzane'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `ID` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `haslo` varchar(255) NOT NULL,
  `rola` enum('uzytkownik','pracownik','informatyk','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indeksy dla zrzutów tabel
--

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
-- Indeksy dla tabeli `osoby`
--
ALTER TABLE `osoby`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `personel`
--
ALTER TABLE `personel`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `uzytkownik_id` (`uzytkownik_id`);

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
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `filmy`
--
ALTER TABLE `filmy`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `oceny`
--
ALTER TABLE `oceny`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `osoby`
--
ALTER TABLE `osoby`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `personel`
--
ALTER TABLE `personel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `statusy_filmow`
--
ALTER TABLE `statusy_filmow`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `filmy`
--
ALTER TABLE `filmy`
  ADD CONSTRAINT `filmy_ibfk_1` FOREIGN KEY (`rezyser_id`) REFERENCES `osoby` (`ID`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
