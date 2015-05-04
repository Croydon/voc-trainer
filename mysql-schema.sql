-- phpMyAdmin SQL Dump
-- version 4.2.12
-- http://www.phpmyadmin.net
--
-- Erstellungszeit: 04. Mai 2015 um 20:01
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `voc_chapter`
--

INSERT INTO `voc_chapter` (`id`, `title`, `lang`) VALUES
(1, 'Unit 10', 2),
(2, 'Unit 11', 2),
(3, 'Easy', 2);

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
  `wordID1` int(6) NOT NULL,
  `wordID2` int(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `voc_translation`
--

INSERT INTO `voc_translation` (`id`, `wordID1`, `wordID2`) VALUES
(6, 3, 4),
(7, 5, 6),
(8, 7, 8),
(9, 9, 10),
(10, 11, 12),
(11, 13, 14),
(12, 15, 16),
(13, 17, 18),
(14, 19, 20),
(15, 21, 22),
(16, 23, 24),
(17, 25, 26),
(18, 27, 28),
(19, 29, 30),
(20, 31, 32),
(23, 33, 35),
(24, 34, 36),
(25, 37, 38),
(26, 39, 40),
(27, 41, 42),
(28, 43, 44),
(29, 45, 46),
(30, 47, 48),
(31, 49, 50),
(32, 51, 52),
(33, 53, 54),
(34, 55, 56),
(35, 57, 58),
(36, 59, 60),
(37, 61, 62),
(38, 63, 64),
(39, 65, 66),
(40, 67, 68),
(41, 69, 70),
(42, 71, 72),
(43, 73, 74),
(44, 75, 76),
(45, 77, 78),
(46, 79, 80),
(47, 81, 82),
(48, 83, 84),
(49, 85, 86),
(50, 87, 88),
(51, 89, 88),
(52, 90, 91),
(53, 92, 93),
(54, 94, 95),
(55, 96, 97),
(56, 98, 99),
(57, 100, 101),
(58, 102, 103),
(59, 104, 105),
(60, 106, 107),
(61, 108, 109),
(62, 110, 111),
(63, 112, 113),
(64, 114, 115),
(65, 116, 117),
(66, 118, 119),
(67, 120, 121),
(68, 122, 123),
(69, 124, 125),
(70, 126, 126),
(71, 127, 128),
(72, 129, 130),
(73, 131, 132),
(74, 133, 134),
(75, 135, 136),
(76, 137, 138),
(77, 139, 140),
(78, 141, 142),
(79, 143, 144),
(80, 145, 146),
(81, 147, 148),
(82, 149, 150),
(83, 151, 152),
(84, 153, 154),
(85, 155, 156),
(86, 157, 158),
(87, 159, 160),
(88, 161, 162),
(89, 163, 164),
(90, 165, 166),
(91, 167, 168),
(92, 169, 170),
(93, 171, 172),
(94, 173, 174),
(95, 175, 176),
(96, 177, 178),
(97, 179, 180),
(98, 181, 182),
(99, 183, 184),
(100, 185, 186);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `voc_user`
--

CREATE TABLE IF NOT EXISTS `voc_user` (
`id` int(5) NOT NULL,
  `username` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pw` char(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `voc_word`
--

CREATE TABLE IF NOT EXISTS `voc_word` (
`id` int(6) NOT NULL,
  `word` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `voc_word`
--

INSERT INTO `voc_word` (`id`, `word`) VALUES
(3, 'to starve for sth.'),
(4, 'sich nach etw. sehnen'),
(5, 'to restore'),
(6, 'wiederherstellen'),
(7, 'competitive'),
(8, 'konkurrenzfähig'),
(9, 'homogenization'),
(10, 'Angleichung'),
(11, 'commodity'),
(12, '(Handels-)Ware, Rohstoff'),
(13, 'to apply'),
(14, 'zutreffen'),
(15, 'disparat'),
(16, 'verschieden'),
(17, 'to charge'),
(18, 'stürmen'),
(19, 'to outduel sb.'),
(20, 'jdn. aus dem Feld schlagen'),
(21, 'salvation'),
(22, 'Rettung, Erlösung'),
(23, 'despodent'),
(24, 'bedrückt, mutlos, niedergeschlagen'),
(25, 'pittance'),
(26, 'Hungerlohn'),
(27, 'shift of power'),
(28, 'Kräfteverschiebung, Machtverschiebung'),
(29, 'unprecedented'),
(30, 'nie dagewesen'),
(31, 'spending power'),
(32, 'Kaufkraft'),
(33, 'to splurge on sth.'),
(34, 'bonanza'),
(35, 'für etw. (mit vollen Händen) viel Geld ausgeben'),
(36, 'Goldgrube, unerwartet, großer Gewinn'),
(37, 'consumer goods'),
(38, 'Konsumgüter'),
(39, 'copper'),
(40, 'Kupfer'),
(41, 'cotton'),
(42, 'Baumwolle'),
(43, 'sales'),
(44, 'Umsatz, Verkaufszahlen'),
(45, 'continued'),
(46, 'anhaltend'),
(47, 'emerging'),
(48, 'aufkommend, aufstrebend, Schwellen-'),
(49, 'to descend into sth.'),
(50, 'in etw. verfallen, in etw. (hinab-/ver-)sinken'),
(51, 'capital equipment'),
(52, 'Investitionsgüter, Kapitalausstattung'),
(53, 'to spread'),
(54, 'sich ausbreiten'),
(55, 'to strenghten'),
(56, 'sich verstärken'),
(57, 'to purchase'),
(58, 'kaufen'),
(59, 'chamber of minerals and energy'),
(60, 'Handelskammer für Mineralien und Energie'),
(61, 'expanding exports'),
(62, 'steigende Exporte'),
(63, 'to dine out'),
(64, 'essen gehen'),
(65, 'to absorb'),
(66, 'aufnehmen, integrieren, abschöpfen'),
(67, 'overhaul'),
(68, 'Überdenken, Anpassung'),
(69, 'economic power'),
(70, 'Wirtschaftsmacht'),
(71, 'to challenge'),
(72, 'herausfordern'),
(73, 'to surpass'),
(74, 'überholen'),
(75, 'depressed'),
(76, '(Wirtschaft) angeschlagen, kriselnd'),
(77, 'to pose a threat to sb./sth.'),
(78, 'eine Gefahr/Bedrohung für jdn/etw darstellen'),
(79, 'job security'),
(80, 'Arbeits(platz)sicherheit'),
(81, 'to pity'),
(82, 'bemitleiden'),
(83, 'dominance'),
(84, 'Vorherrschaft'),
(85, 'inevitable'),
(86, 'unvermeidlich'),
(87, 'budget deficit'),
(88, 'Haushaltsdefizit'),
(89, 'to run a deficit'),
(90, 'lower middle class'),
(91, 'untere Mittelklasse'),
(92, 'currency'),
(93, 'Währung'),
(94, 'to impact sb./sth.'),
(95, 'sich auf jdn/etw auswirken, Folgen für jdn/etw hab'),
(96, 'interconnectedness'),
(97, 'Vernetzung'),
(98, 'vastly'),
(99, 'gewaltig'),
(100, 'welfare services'),
(101, 'soziale Einrichtungen'),
(102, 'sanitation'),
(103, 'Müll- und Abwasserentsorgung'),
(104, 'to maintain'),
(105, 'aufrecht erhalten'),
(106, 'multinational corporation'),
(107, 'internationaler Konzern, Unternehmen'),
(108, 'fork'),
(109, 'Gabel'),
(110, 'spoon'),
(111, 'Löffel'),
(112, 'kindergarten'),
(113, 'Kindergarten'),
(114, 'eventually'),
(115, 'letztendlich'),
(116, 'engine'),
(117, 'Motor'),
(118, 'teacher'),
(119, 'Lehrer'),
(120, 'brave'),
(121, 'mutig'),
(122, 'scared'),
(123, 'ängstlich'),
(124, 'cardboard'),
(125, 'Karton/Pappe'),
(126, 'blitzkrieg'),
(127, 'mayor'),
(128, 'Bürgermeister'),
(129, 'plug'),
(130, 'Stecker'),
(131, 'thunder'),
(132, 'Donner'),
(133, 'global warming'),
(134, 'Globale Erwärmung'),
(135, 'government'),
(136, 'Regierung'),
(137, 'differing'),
(138, 'verschieden, unterschiedlich'),
(139, 'state security'),
(140, 'Staatssicherheit'),
(141, 'to unfold'),
(142, 'sich abspielen, sich entwickeln'),
(143, 'connectivity'),
(144, 'Vernetzung, Verbindungen'),
(145, 'to flatten'),
(146, 'ebnen, einebnen'),
(147, 'diffusion'),
(148, 'Verbreitung'),
(149, 'bandwidth'),
(150, 'Bandbreite'),
(151, 'uprising'),
(152, 'Aufstand'),
(153, 'vivid'),
(154, 'anschaulich'),
(155, 'to empower sb.'),
(156, 'jdn stärken, jdn (zu etw) ermächtigen'),
(157, 'spark'),
(158, 'Funke'),
(159, 'to attain'),
(160, 'erlangen'),
(161, 'self-respect'),
(162, 'Selbstachtung'),
(163, 'to squash'),
(164, 'zerquetschen, zunichte machen'),
(165, 'to uncover'),
(166, 'aufdecken, entdecken, enthüllen'),
(167, 'torturer'),
(168, 'Folterer'),
(169, 'to bend'),
(170, 'beugen'),
(171, 'freedom of expression'),
(172, 'Recht auf freie Meinungsäußerung'),
(173, 'betrayal'),
(174, 'Verrat'),
(175, 'cruel'),
(176, 'grausam'),
(177, 'to judge sb.'),
(178, 'jdn verurteilen'),
(179, 'constitution'),
(180, 'Verfassung'),
(181, 'armed'),
(182, 'bewaffnet'),
(183, 'dictatorship'),
(184, 'Diktatur'),
(185, 'outlook'),
(186, 'Perspektive, Einstellung');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `voc_word_unit`
--

CREATE TABLE IF NOT EXISTS `voc_word_unit` (
`id` int(6) NOT NULL,
  `wordTranslation` int(6) NOT NULL,
  `chapter` int(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `voc_word_unit`
--

INSERT INTO `voc_word_unit` (`id`, `wordTranslation`, `chapter`) VALUES
(5, 6, 1),
(6, 7, 1),
(7, 8, 1),
(8, 9, 1),
(9, 10, 1),
(10, 11, 1),
(11, 12, 1),
(12, 13, 1),
(13, 14, 1),
(14, 15, 1),
(15, 16, 1),
(16, 17, 1),
(17, 18, 1),
(18, 19, 1),
(19, 20, 1),
(22, 23, 1),
(23, 24, 1),
(24, 25, 1),
(25, 26, 1),
(26, 27, 1),
(27, 28, 1),
(28, 29, 1),
(29, 30, 1),
(30, 31, 1),
(31, 32, 1),
(32, 33, 1),
(33, 34, 1),
(34, 35, 1),
(35, 36, 1),
(36, 37, 1),
(37, 38, 1),
(38, 39, 1),
(39, 40, 1),
(40, 41, 1),
(41, 42, 1),
(42, 43, 1),
(43, 44, 1),
(44, 45, 1),
(45, 46, 1),
(46, 47, 1),
(47, 48, 1),
(48, 49, 1),
(49, 50, 1),
(50, 51, 1),
(51, 52, 1),
(52, 53, 1),
(53, 54, 1),
(54, 55, 1),
(55, 56, 1),
(56, 57, 1),
(57, 58, 1),
(58, 59, 1),
(59, 60, 1),
(60, 61, 3),
(61, 62, 3),
(62, 63, 3),
(63, 64, 3),
(64, 65, 3),
(65, 66, 3),
(66, 67, 3),
(67, 68, 3),
(68, 69, 3),
(69, 70, 3),
(70, 71, 3),
(71, 72, 3),
(72, 73, 3),
(73, 74, 3),
(74, 75, 3),
(75, 76, 2),
(76, 77, 2),
(77, 78, 2),
(78, 79, 2),
(79, 80, 2),
(80, 81, 2),
(81, 82, 2),
(82, 83, 2),
(83, 84, 2),
(84, 85, 2),
(85, 86, 2),
(86, 87, 2),
(87, 88, 2),
(88, 89, 2),
(89, 90, 2),
(90, 91, 2),
(91, 92, 2),
(92, 93, 2),
(93, 94, 2),
(94, 95, 2),
(95, 96, 2),
(96, 97, 2),
(97, 98, 2),
(98, 99, 2),
(99, 100, 2);

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
 ADD PRIMARY KEY (`id`), ADD KEY `word` (`wordTranslation`), ADD KEY `chapter` (`chapter`), ADD KEY `wordTranslation` (`wordTranslation`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `voc_chapter`
--
ALTER TABLE `voc_chapter`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `voc_lang`
--
ALTER TABLE `voc_lang`
MODIFY `id` int(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `voc_stats`
--
ALTER TABLE `voc_stats`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT für Tabelle `voc_translation`
--
ALTER TABLE `voc_translation`
MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT für Tabelle `voc_user`
--
ALTER TABLE `voc_user`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT für Tabelle `voc_word`
--
ALTER TABLE `voc_word`
MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=187;
--
-- AUTO_INCREMENT für Tabelle `voc_word_unit`
--
ALTER TABLE `voc_word_unit`
MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=100;
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
ADD CONSTRAINT `voc_word_unit_ibfk_4` FOREIGN KEY (`wordTranslation`) REFERENCES `voc_translation` (`id`),
ADD CONSTRAINT `voc_word_unit_ibfk_3` FOREIGN KEY (`chapter`) REFERENCES `voc_chapter` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
