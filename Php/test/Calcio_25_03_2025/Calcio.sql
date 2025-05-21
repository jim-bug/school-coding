-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Giu 14, 2023 alle 18:40
-- Versione del server: 10.4.14-MariaDB
-- Versione PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `calcio`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `contratti`
--

CREATE TABLE `contratti` (
  `CodSquadra` varchar(4) NOT NULL,
  `IDGiocatore` int(3) NOT NULL,
  `DataInizio` date NOT NULL,
  `DataFine` date NOT NULL,
  `Ingaggio` decimal(12,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `contratti`
--

INSERT INTO `contratti` (`CodSquadra`, `IDGiocatore`, `DataInizio`, `DataFine`, `Ingaggio`) VALUES
('IND', 5, '2019-11-12', '2020-03-24', '150000'),
('IND', 6, '2020-01-19', '2020-09-12', '95000'),
('BNV', 4, '2020-01-19', '2021-03-27', '35000'),
('BNV', 5, '2018-01-01', '2019-11-11', '45000'),
('IND', 5, '2020-03-25', '2020-12-31', '85000'),
('JUV', 8, '2020-01-09', '2020-03-26', '200000'),
('BNV', 6, '2020-01-19', '2020-09-12', '0');

-- --------------------------------------------------------

--
-- Struttura della tabella `giocatori`
--

CREATE TABLE `giocatori` (
  `IDGiocatore` int(3) NOT NULL,
  `Cognome` varchar(30) NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `CodRuolo` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `giocatori`
--

INSERT INTO `giocatori` (`IDGiocatore`, `Cognome`, `Nome`, `CodRuolo`) VALUES
(4, 'Soricelli', 'Giuseppe', 'DEF'),
(5, 'Bruni', 'Marco', 'ATK'),
(6, 'Rossi', 'Mario', 'ATK'),
(8, 'Bianchi', 'Dario', 'DEF'),
(10, 'Bruni', 'Francesco', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `ruoli`
--

CREATE TABLE `ruoli` (
  `CodRuolo` varchar(3) NOT NULL,
  `Denominazione` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `ruoli`
--

INSERT INTO `ruoli` (`CodRuolo`, `Denominazione`) VALUES
('ATK', 'Attaccante'),
('DEF', 'Difensore'),
('MED', 'Mediano');

-- --------------------------------------------------------

--
-- Struttura della tabella `squadre`
--

CREATE TABLE `squadre` (
  `CodSquadra` varchar(4) NOT NULL,
  `Denominazione` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `squadre`
--

INSERT INTO `squadre` (`CodSquadra`, `Denominazione`) VALUES
('BNV', 'Benevento'),
('IND', 'Inter'),
('JUV', 'JUVENTUS');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `contratti`
--
ALTER TABLE `contratti`
  ADD KEY `CodSquadra` (`CodSquadra`),
  ADD KEY `IDGiocatore` (`IDGiocatore`);

--
-- Indici per le tabelle `giocatori`
--
ALTER TABLE `giocatori`
  ADD PRIMARY KEY (`IDGiocatore`),
  ADD KEY `CodRuolo` (`CodRuolo`);

--
-- Indici per le tabelle `ruoli`
--
ALTER TABLE `ruoli`
  ADD PRIMARY KEY (`CodRuolo`);

--
-- Indici per le tabelle `squadre`
--
ALTER TABLE `squadre`
  ADD PRIMARY KEY (`CodSquadra`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `giocatori`
--
ALTER TABLE `giocatori`
  MODIFY `IDGiocatore` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `contratti`
--
ALTER TABLE `contratti`
  ADD CONSTRAINT `contratti_fk_giocatori` FOREIGN KEY (`IDGiocatore`) REFERENCES `giocatori` (`IDGiocatore`) ON UPDATE CASCADE,
  ADD CONSTRAINT `contratti_fk_squadre` FOREIGN KEY (`CodSquadra`) REFERENCES `squadre` (`CodSquadra`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `giocatori`
--
ALTER TABLE `giocatori`
  ADD CONSTRAINT `giocatori_ibfk_1` FOREIGN KEY (`CodRuolo`) REFERENCES `ruoli` (`CodRuolo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
