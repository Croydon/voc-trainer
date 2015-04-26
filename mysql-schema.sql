-- phpMyAdmin SQL Dump
-- version 4.2.12
-- http://www.phpmyadmin.net
--
-- Erstellungszeit: 26. Apr 2015 um 14:17
-- Server Version: 5.5.42-log
-- PHP-Version: 5.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `voc_chapter`
--

CREATE TABLE IF NOT EXISTS `voc_chapter` (
`id` int(5) NOT NULL,
  `title` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `lang` int(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `voc_chapter`
--

INSERT INTO `voc_chapter` (`id`, `title`, `lang`) VALUES
(1, 'Unit 10', 2),
(2, 'Unit 11', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `voc_lang`
--

CREATE TABLE IF NOT EXISTS `voc_lang` (
`id` int(2) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `voc_lang`
--

INSERT INTO `voc_lang` (`id`, `name`) VALUES
(1, 'Deutsch'),
(2, 'English');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `voc_stats`
--

CREATE TABLE IF NOT EXISTS `voc_stats` (
`id` int(11) NOT NULL,
  `word_unit` int(6) NOT NULL,
  `user` int(5) NOT NULL,
  `section` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `voc_translation`
--

CREATE TABLE IF NOT EXISTS `voc_translation` (
`id` int(6) NOT NULL,
  `word_unit1` int(6) NOT NULL,
  `word_unit2` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `voc_user`
--

CREATE TABLE IF NOT EXISTS `voc_user` (
`id` int(5) NOT NULL,
  `username` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pw` char(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `voc_word`
--

CREATE TABLE IF NOT EXISTS `voc_word` (
`id` int(6) NOT NULL,
  `word` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `voc_word_unit`
--

CREATE TABLE IF NOT EXISTS `voc_word_unit` (
`id` int(6) NOT NULL,
  `word` int(6) NOT NULL,
  `chapter` int(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `voc_chapter`
--
ALTER TABLE `voc_chapter`
 ADD PRIMARY KEY (`id`), ADD KEY `lang` (`lang`);

--
-- Indizes für die Tabelle `voc_lang`
--
ALTER TABLE `voc_lang`
 ADD PRIMARY KEY (`id`), ADD KEY `id` (`id`);

--
-- Indizes für die Tabelle `voc_stats`
--
ALTER TABLE `voc_stats`
 ADD PRIMARY KEY (`id`), ADD KEY `word` (`word_unit`,`user`), ADD KEY `user` (`user`);

--
-- Indizes für die Tabelle `voc_translation`
--
ALTER TABLE `voc_translation`
 ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `voc_user`
--
ALTER TABLE `voc_user`
 ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `voc_word`
--
ALTER TABLE `voc_word`
 ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `voc_word_unit`
--
ALTER TABLE `voc_word_unit`
 ADD PRIMARY KEY (`id`), ADD KEY `word` (`word`), ADD KEY `chapter` (`chapter`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `voc_chapter`
--
ALTER TABLE `voc_chapter`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `voc_lang`
--
ALTER TABLE `voc_lang`
MODIFY `id` int(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `voc_stats`
--
ALTER TABLE `voc_stats`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `voc_translation`
--
ALTER TABLE `voc_translation`
MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `voc_word`
--
ALTER TABLE `voc_word`
MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `voc_word_unit`
--
ALTER TABLE `voc_word_unit`
MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `voc_chapter`
--
ALTER TABLE `voc_chapter`
ADD CONSTRAINT `voc_chapter_ibfk_1` FOREIGN KEY (`lang`) REFERENCES `voc_lang` (`id`);

--
-- Constraints der Tabelle `voc_stats`
--
ALTER TABLE `voc_stats`
ADD CONSTRAINT `voc_stats_ibfk_3` FOREIGN KEY (`word_unit`) REFERENCES `voc_word_unit` (`id`),
ADD CONSTRAINT `voc_stats_ibfk_2` FOREIGN KEY (`user`) REFERENCES `voc_user` (`id`);

--
-- Constraints der Tabelle `voc_word_unit`
--
ALTER TABLE `voc_word_unit`
ADD CONSTRAINT `voc_word_unit_ibfk_1` FOREIGN KEY (`word`) REFERENCES `voc_word` (`id`),
ADD CONSTRAINT `voc_word_unit_ibfk_3` FOREIGN KEY (`chapter`) REFERENCES `voc_chapter` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
