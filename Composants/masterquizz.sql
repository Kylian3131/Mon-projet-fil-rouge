-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 02 avr. 2024 à 10:07
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `masterquizz`
--

-- --------------------------------------------------------

--
-- Structure de la table `participer`
--

CREATE TABLE `participer` (
  `id_utilisateur` int(11) NOT NULL,
  `id_quiz` int(11) NOT NULL,
  `date_participation` date NOT NULL,
  `score` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `questions`
--

CREATE TABLE `questions` (
  `id_questions` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `id_quiz` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `questions`
--

INSERT INTO `questions` (`id_questions`, `question`, `id_quiz`) VALUES
(1, 'Quelle est la capitale de la France ?', 1),
(2, 'Qui a peint la Joconde ?', 1),
(3, 'Quel est l\'océan le plus grand ?', 1),
(4, 'En quelle année l\'homme a-t-il marché sur la lune ?', 1),
(5, 'Quel est le plus long fleuve du monde ?', 1),
(6, 'Qui a écrit \'Les Misérables\' ?', 1),
(7, 'Quel langage est principalement utilisé pour le développement Web Front-end ?', 2),
(8, 'En quelle année a été inventé Internet ?', 2),
(9, 'Quel est le système d\'exploitation le plus utilisé sur les serveurs web ?', 2),
(10, 'Qui est le fondateur de Microsoft ?', 2),
(11, 'Quel est le port standard pour HTTP ?', 2),
(12, 'Qu\'est-ce que SQL ?', 2),
(13, 'Qui est le créateur de Naruto ?', 3),
(14, 'Quel manga a pour personnage principal Luffy ?', 3),
(15, 'Dans \'Death Note\', comment s\'appelle le dieu de la mort ?', 3),
(16, 'Quel est le principal rival de Goku dans \'Dragon Ball\' ?', 3),
(17, 'Dans quel manga trouve-t-on les Titans ?', 3),
(18, 'Qui a écrit \"One Punch Man\" ?', 3),
(19, 'Quel est l\'élément chimique le plus abondant dans l\'univers ?', 5),
(20, 'Quelle vitamine est principalement obtenue à partir de la lumière solaire ?', 5),
(21, 'Quel est l\'animal le plus rapide sur terre ?', 5),
(22, 'Quel est le point d\'ébullition de l\'eau à niveau de la mer ?', 5),
(23, 'Quel gaz est le plus abondant dans l\'atmosphère terrestre ?', 5),
(24, 'Quelle est la distance moyenne de la Terre au Soleil ?', 5),
(25, 'Qui était le premier président des États-Unis ?', 6),
(26, 'Dans quelle ville se trouve le Colisée ?', 6),
(27, 'Quelle civilisation a construit les pyramides ?', 6),
(28, 'Qui est connu comme le père de l\'histoire ?', 6),
(29, 'Quelle guerre a pris fin avec les Traités de Westphalie ?', 6),
(30, 'Dans quelle ville a été signée la Déclaration d\'indépendance des États-Unis ?', 6);

-- --------------------------------------------------------

--
-- Structure de la table `quiz`
--

CREATE TABLE `quiz` (
  `id_quiz` int(11) NOT NULL,
  `nom_quiz` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `quiz`
--

INSERT INTO `quiz` (`id_quiz`, `nom_quiz`) VALUES
(1, 'Culture Générale'),
(2, 'Informatique'),
(3, 'Mangas'),
(5, 'Science et Nature'),
(6, 'Histoire');

-- --------------------------------------------------------

--
-- Structure de la table `reponses`
--

CREATE TABLE `reponses` (
  `id_reponses` int(11) NOT NULL,
  `reponse` varchar(255) NOT NULL,
  `reponse_correct` tinyint(1) NOT NULL,
  `id_questions` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reponses`
--

INSERT INTO `reponses` (`id_reponses`, `reponse`, `reponse_correct`, `id_questions`) VALUES
(1, 'Paris', 1, 1),
(2, 'Lyon', 0, 1),
(3, 'Marseille', 0, 1),
(4, 'Bordeaux', 0, 1),
(5, 'Leonardo da Vinci', 1, 2),
(6, 'Vincent Van Gogh', 0, 2),
(7, 'Pablo Picasso', 0, 2),
(8, 'Claude Monet', 0, 2),
(9, 'Pacifique', 1, 3),
(10, 'Atlantique', 0, 3),
(11, 'Indien', 0, 3),
(12, 'Arctique', 0, 3),
(13, '1969', 1, 4),
(14, '1959', 0, 4),
(15, '1979', 0, 4),
(16, '1989', 0, 4),
(17, 'Le Nil', 1, 5),
(18, 'L\'Amazone', 0, 5),
(19, 'Le Yangtsé', 0, 5),
(20, 'Le Mississippi', 0, 5),
(21, 'Victor Hugo', 1, 6),
(22, 'Alexandre Dumas', 0, 6),
(23, 'Émile Zola', 0, 6),
(24, 'Jean Valjean', 0, 6),
(25, 'JavaScript', 1, 7),
(26, 'Python', 0, 7),
(27, 'Java', 0, 7),
(28, 'C#', 0, 7),
(29, '1969', 1, 8),
(30, '1983', 0, 8),
(31, '1971', 0, 8),
(32, '1990', 0, 8),
(33, 'Linux', 1, 9),
(34, 'Windows Server', 0, 9),
(35, 'macOS Server', 0, 9),
(36, 'Unix', 0, 9),
(37, 'Bill Gates', 1, 10),
(38, 'Steve Jobs', 0, 10),
(39, 'Mark Zuckerberg', 0, 10),
(40, 'Larry Page', 0, 10),
(41, '80', 1, 11),
(42, '443', 0, 11),
(43, '8080', 0, 11),
(44, '21', 0, 11),
(45, 'Structured Query Language', 1, 12),
(46, 'Simple Quality Language', 0, 12),
(47, 'Standard Query Language', 0, 12),
(48, 'Secure Quick Language', 0, 12),
(49, 'Masashi Kishimoto', 1, 13),
(50, 'Eiichiro Oda', 0, 13),
(51, 'Tite Kubo', 0, 13),
(52, 'Akira Toriyama', 0, 13),
(53, 'One Piece', 1, 14),
(54, 'Naruto', 0, 14),
(55, 'Bleach', 0, 14),
(56, 'Dragon Ball', 0, 14),
(57, 'Ryuk', 1, 15),
(58, 'Rem', 0, 15),
(59, 'Sidoh', 0, 15),
(60, 'Gelus', 0, 15),
(61, 'Vegeta', 1, 16),
(62, 'Frieza', 0, 16),
(63, 'Cell', 0, 16),
(64, 'Majin Buu', 0, 16),
(65, 'Attack on Titan', 1, 17),
(66, 'Tokyo Ghoul', 0, 17),
(67, 'Death Note', 0, 17),
(68, 'Naruto', 0, 17),
(69, 'ONE', 1, 18),
(70, 'Yusuke Murata', 0, 18),
(71, 'Eiichiro Oda', 0, 18),
(72, 'Masashi Kishimoto', 0, 18),
(73, 'Hydrogène', 1, 19),
(74, 'Oxygène', 0, 19),
(75, 'Carbone', 0, 19),
(76, 'Azote', 0, 19),
(85, 'Vitamine D', 1, 20),
(86, 'Vitamine C', 0, 20),
(87, 'Vitamine A', 0, 20),
(88, 'Vitamine E', 0, 20),
(89, 'Guépard', 1, 21),
(90, 'Lion', 0, 21),
(91, 'Antilope', 0, 21),
(92, 'Faucon pèlerin', 0, 21),
(93, '100°C', 1, 22),
(94, '90°C', 0, 22),
(95, '110°C', 0, 22),
(96, '95°C', 0, 22),
(97, 'Azote', 1, 23),
(98, 'Oxygène', 0, 23),
(99, 'Dioxyde de carbone', 0, 23),
(100, 'Argon', 0, 23),
(105, 'Rome', 1, 26),
(106, 'Athènes', 0, 26),
(107, 'Istanbul', 0, 26),
(108, 'Alexandrie', 0, 26),
(109, 'Les Égyptiens', 1, 27),
(110, 'Les Romains', 0, 27),
(111, 'Les Mayas', 0, 27),
(112, 'Les Aztèques', 0, 27),
(113, 'Hérodote', 1, 28),
(114, 'Thucydide', 0, 28),
(115, 'Socrate', 0, 28),
(116, 'Platon', 0, 28),
(117, 'La guerre de Trente Ans', 1, 29),
(118, 'La guerre de Cent Ans', 0, 29),
(119, 'La Première Guerre mondiale', 0, 29),
(120, 'La guerre de Sept Ans', 0, 29),
(121, 'Philadelphie', 1, 30),
(122, 'New York', 0, 30),
(123, 'Washington D.C.', 0, 30),
(124, 'Boston', 0, 30),
(125, 'Environ 150 millions de kilomètres', 1, 24),
(126, 'Environ 93 millions de miles', 0, 24),
(127, 'Environ 1 milliard de kilomètres', 0, 24),
(128, 'Environ 250 millions de kilomètres', 0, 24),
(129, 'George Washington', 1, 25),
(130, 'Thomas Jefferson', 0, 25),
(131, 'Abraham Lincoln', 0, 25),
(132, 'John Adams', 0, 25);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilisateur` int(11) NOT NULL,
  `pseudo_utilisateur` varchar(50) NOT NULL,
  `mdp_utilisateur` varchar(160) NOT NULL,
  `email_utilisateur` varchar(50) NOT NULL,
  `score_utilisateur` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `pseudo_utilisateur`, `mdp_utilisateur`, `email_utilisateur`, `score_utilisateur`) VALUES
(1, 'antua', '$2y$10$mzxYT3GwaxSkBpb0tArwO.69e9vI.HDe5huCDTo8SR5/o317u/J8.', 'antua@gmail.com', 0),
(2, 'mateo', '$2y$10$ihqw3hHol6to17lVDWbtOOfSwVA1u0dng6Ij1BhPmI4iQj302w32m', 'mateo@gmail.com', 0),
(3, 'mateoa', '$2y$10$mnrdkMFpbZYTY79tf9FdWe7ew2WMY5oU1qEk5CBnnaePgOCGFl7dK', 'bentoglio.mateo@gmail.com', 0),
(4, 'prout', '$2y$10$5dogjmZVpc8Ca0LXGnOrMuHK0U.FC3tnvycawhcbs1ZKG.hTUuarq', 'prout', 0),
(6, 'ahfir', '$2y$10$ExCS1boYZDRWsDqGp.grJ.hbYNYcThmf.npBYcbu22xQPABB8dTMG', 'admin@gmail.com', 0),
(7, 'brahmi', '$2y$10$1ySjImQnvUj1NEeUMOy5w.klWJWtlimXTgfH6Amq1FPmOFBQvTOkW', 'celia@gmail.fr', 0),
(8, 'FARES', '$2y$10$E0y9WTf89oz3mDW7zLl.P.1jcvLmuRIr7sGtKOErMiwup/mZT7Nzy', 'fares31@gmail.com', 0),
(12, 'bziwbziw31', '$2y$10$7tL8YkvuaknOnXIKzjWivORW1cAWSvnUR4EcF1Pmsx//uzejQmaOS', 'admin@gmail', 0),
(15, 'r', '$2y$10$Ww7FGSongn2nuV1fdq3cvul1WoUVkZrKFkdv13H0.iZmCYId66N0K', 'admin3131@gmail.fr', 0),
(17, 'gtgtgg', '$2y$10$2S2z4XxWHl4ZUXx2lOC3uOanMhEb.MM5qP0kumxtPaPIUpQxLvUdW', 'admin25@gmail.com', 0),
(19, 'rfvfvgv', '$2y$10$GRb8qtKlIkCja0imt4CQm.xUKYN0FR0LjQhil65VqX7vAZF0Yw/oC', 'admin@fvvk.com', 0),
(21, 'adrien', '$2y$10$wRnGSmqofU2cPjtofmSOwuM7vUSX/S7tk3/buRDq3OdXeMFf8C6Sy', 'adrien@gmail.com', 0),
(23, 'pure', '$2y$10$I9fpCN1OIw9D7cdhNL6MMOfk7oNwNxB6nslKu7bwQegGOOYyWr6ie', 'pure@gmail.com', 0),
(24, 'frfrgfrgtgt', '$2y$10$KRvSb0iLocdD2779tywLWOQpZnOCj7O2w0xCuEq5RidIMRfQT7/AC', 'admin@tititititi.fr', 0),
(26, 'rfrfrfrf', '$2y$10$ziPF5plgvkNUs8D53VJoROoVC3Dl0vt3z4s.Kb0Y3Ajqdox1Nev/a', 'admin@tototototo', 0),
(28, 'deefr', '$2y$10$bUOqxHnLGeatgU9PDnvMTuKH8yIPw9vngHW5yyvw5TGuHS293pjOS', 'admin@paza', 0),
(30, 'edeeffrfr', '$2y$10$rNonlH77a.Qz3nmg1ZQ8u.BaEzjgK1qCL4rgZUItDzsmg00nKw.CC', 'admin@adam.fr', 0),
(33, 'azerty', '$2y$10$vxDrhlUNdW4gE2N1CeJiN.QsN5ZI689fV39xaidMM/PG6x9xTUoh.', 'admin@hot.fr', 0),
(34, 'hakimi', '$2y$10$ntH54SLBCio7hswvRQBGfusEtL0zorfr51GtIGIGaekVi9h9NY/HO', 'hakimi@gmail.com', 0),
(37, 'rftrftr', '$2y$10$IfN4lcSQLvmFIetvRBoFFO7KdDIEtIqV1.uBKVniSkHJ5b2UFRO3y', 'admin@gmail.hot', 0),
(39, 'habibbibo', '$2y$10$pCWFc5TnzdmlAA4IVm4nTOVdbVut5F9WZkNAGUYW3Ou2oI0ypIQma', 'admin@co.com', 0),
(40, 'test', '$2y$10$LRyYKTzL94PbHDZcG9XAWuJRKL.uxWIt1tmYJSnTbCvWQK5xEOa36', 'test@gmail.com', 0),
(42, 'ALEX', '$2y$10$BG6Rea80UMUkOV6qhya5p.3XkC2ImjGFLrWN6R/O58/InRT1Ihe0.', 'alex@hotmail.com', 0),
(46, 'antu', '$2y$10$eflKaZuPX8kC1oh3kGq9R.qUwoOyDl4S5Qab/U/PiN0SwrYtRrd6S', 'allons@gmail.com', 0),
(47, 'saucearachide', '$2y$10$AIjOBIO34tOlve35691ene/uxQmkfxUd88YOc/d3aTl6ivaiGJn2y', 'saucearachide@gmail.com', 0),
(48, 'riad', '$2y$10$nPeK7XWsCI299qbo5QZXvODtXcU2eTf5yc5TMNgcb.2oNJzYtFDJm', 'riad@gmail.com', 0),
(49, 'jean', '$2y$10$TOMWaxPcoK2W3bGjs2Om1.gXmzBJWBhU/gLJZxYSEZvuks4UOURDi', 'jean@gmail.com', 0),
(50, 'kylian', '$2y$10$cdF1Z/0eQaebeHgJB3xDCegvDjiedjN.TibWh/ZeXIz06Uy678Au.', 'kylian@gmail.com', 0),
(51, 'Kellyan', '$2y$10$9Tr9ufUYHsEyTf.s/ARNR.rkMeL32rL8PAJ2hYOsmpLpFMkFXhxpe', 'yoyo@gmail.fr', 0),
(52, 'WilerOG', '$2y$10$w1exJ9eJZgP1FeJx4PkP9..mSFQNgRpvIq.biLV824oBB/up9oXLy', 'admin@coco.com', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `participer`
--
ALTER TABLE `participer`
  ADD PRIMARY KEY (`id_utilisateur`,`id_quiz`,`date_participation`),
  ADD KEY `id_quiz` (`id_quiz`);

--
-- Index pour la table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id_questions`),
  ADD KEY `id_quiz` (`id_quiz`);

--
-- Index pour la table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id_quiz`);

--
-- Index pour la table `reponses`
--
ALTER TABLE `reponses`
  ADD PRIMARY KEY (`id_reponses`),
  ADD KEY `id_questions` (`id_questions`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD UNIQUE KEY `pseudo_utilisateur` (`pseudo_utilisateur`),
  ADD UNIQUE KEY `email_utilisateur` (`email_utilisateur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `questions`
--
ALTER TABLE `questions`
  MODIFY `id_questions` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id_quiz` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `reponses`
--
ALTER TABLE `reponses`
  MODIFY `id_reponses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `participer`
--
ALTER TABLE `participer`
  ADD CONSTRAINT `participer_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`) ON DELETE CASCADE,
  ADD CONSTRAINT `participer_ibfk_2` FOREIGN KEY (`id_quiz`) REFERENCES `quiz` (`id_quiz`) ON DELETE CASCADE;

--
-- Contraintes pour la table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`id_quiz`) REFERENCES `quiz` (`id_quiz`) ON DELETE CASCADE;

--
-- Contraintes pour la table `reponses`
--
ALTER TABLE `reponses`
  ADD CONSTRAINT `reponses_ibfk_1` FOREIGN KEY (`id_questions`) REFERENCES `questions` (`id_questions`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
