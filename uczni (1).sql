-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2025 at 09:28 AM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uczni`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `projekty`
--

CREATE TABLE `projekty` (
  `id` int(11) NOT NULL,
  `uczen_id` int(11) NOT NULL,
  `tytul_projektu` varchar(255) NOT NULL,
  `opis_projektu` text NOT NULL,
  `obraz` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczniowie`
--

CREATE TABLE `uczniowie` (
  `id` int(11) NOT NULL,
  `imie` varchar(30) DEFAULT NULL,
  `nazwisko` varchar(30) DEFAULT NULL,
  `wiek` varchar(10) DEFAULT NULL,
  `Zainteresowanie` varchar(500) DEFAULT NULL,
  `tytul_projektu` varchar(255) DEFAULT NULL,
  `opis_projektu` text DEFAULT NULL,
  `obraz` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uczniowie`
--

INSERT INTO `uczniowie` (`id`, `imie`, `nazwisko`, `wiek`, `Zainteresowanie`, `tytul_projektu`, `opis_projektu`, `obraz`) VALUES
(1, 'Blazej', 'Bac', '15', 'Interesuje się graniem w gry komputerowe, rozmawiać z Hubertem i programowaniem', NULL, NULL, NULL),
(2, 'Mikolaj', 'Karolak', '16', 'Kasztanopolis™, spanie, Kasztanopolis™, granie', NULL, NULL, NULL),
(3, 'Hubert', 'Szmyt', '15', 'lubie literature, pisać opowiadania i naprawiać komputery. lubie również rozmawiać z ludźmi irl i na discordzie ', NULL, NULL, NULL),
(4, 'Ormon', 'Nazarov', '15', 'Interesuje się graniem w gry komputerowe i graniem w piłkę nożną', NULL, NULL, NULL),
(5, 'Oleh', 'Kiriazov', '16', '', NULL, NULL, NULL),
(6, 'Zofia', 'Debińska', '15', 'szachy spanie jedzenie', NULL, NULL, NULL),
(7, 'Artem', 'Pobihailo', '15', '', NULL, NULL, NULL),
(8, 'Maks', 'Augusiewicz', '14', 'sport geografia oraz gry komputerowe oraz gotowanie', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wpisy`
--

CREATE TABLE `wpisy` (
  `id` int(11) NOT NULL,
  `uczen_id` int(11) DEFAULT NULL,
  `tytul` varchar(255) NOT NULL,
  `tresc` text NOT NULL,
  `obraz` varchar(255) DEFAULT NULL,
  `data_dodania` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `projekty`
--
ALTER TABLE `projekty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uczen_id` (`uczen_id`);

--
-- Indeksy dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `wpisy`
--
ALTER TABLE `wpisy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uczen_id` (`uczen_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `projekty`
--
ALTER TABLE `projekty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `uczniowie`
--
ALTER TABLE `uczniowie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `wpisy`
--
ALTER TABLE `wpisy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `projekty`
--
ALTER TABLE `projekty`
  ADD CONSTRAINT `projekty_ibfk_1` FOREIGN KEY (`uczen_id`) REFERENCES `uczniowie` (`id`);

--
-- Constraints for table `wpisy`
--
ALTER TABLE `wpisy`
  ADD CONSTRAINT `wpisy_ibfk_1` FOREIGN KEY (`uczen_id`) REFERENCES `uczniowie` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
