-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 27 fév. 2025 à 10:50
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `optiplant`
--
CREATE DATABASE IF NOT EXISTS `optiplant` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `optiplant`;

-- --------------------------------------------------------

--
-- Structure de la table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
CREATE TABLE IF NOT EXISTS `alerts` (
  `idAlert` int NOT NULL AUTO_INCREMENT,
  `AlertType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `idTray` int DEFAULT NULL,
  PRIMARY KEY (`idAlert`),
  KEY `idBac` (`idTray`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `electric_prod`
--

DROP TABLE IF EXISTS `electric_prod`;
CREATE TABLE IF NOT EXISTS `electric_prod` (
  `idProduction` int NOT NULL AUTO_INCREMENT,
  `dateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `producedEnergy` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idProduction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `idGroup` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  PRIMARY KEY (`idGroup`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Déchargement des données de la table `groups`
--

INSERT INTO `groups` (`idGroup`, `name`) VALUES
(1, 'Plantes à feuilles'),
(2, 'Plantes à fruits'),
(3, 'Herbes aromatiques'),
(4, 'Légumes racines'),
(5, 'Plante à fleurs');

-- --------------------------------------------------------

--
-- Structure de la table `irrigation`
--

DROP TABLE IF EXISTS `irrigation`;
CREATE TABLE IF NOT EXISTS `irrigation` (
  `idIrrigation` int NOT NULL AUTO_INCREMENT,
  `dateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idTray` int DEFAULT NULL,
  `idRecipe` int DEFAULT NULL,
  PRIMARY KEY (`idIrrigation`),
  KEY `contrainteirig1` (`idTray`),
  KEY `contrainteirig2` (`idRecipe`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `irrigation`
--

INSERT INTO `irrigation` (`idIrrigation`, `dateTime`, `idTray`, `idRecipe`) VALUES
(1, '2025-02-26 07:49:11', 1, 2),
(2, '2025-02-26 07:49:11', 2, 4),
(3, '2025-02-26 07:53:56', 1, 1),
(4, '2025-02-26 07:53:56', 2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `periods`
--

DROP TABLE IF EXISTS `periods`;
CREATE TABLE IF NOT EXISTS `periods` (
  `idPeriod` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  PRIMARY KEY (`idPeriod`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Déchargement des données de la table `periods`
--

INSERT INTO `periods` (`idPeriod`, `name`) VALUES
(1, 'Semis'),
(2, 'Croissance végétative'),
(3, 'Floraison et fructification'),
(4, 'Développement des racines');

-- --------------------------------------------------------

--
-- Structure de la table `plants`
--

DROP TABLE IF EXISTS `plants`;
CREATE TABLE IF NOT EXISTS `plants` (
  `idPlant` int NOT NULL AUTO_INCREMENT,
  `plantName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `plantDate` date DEFAULT NULL,
  `idGroup` int NOT NULL,
  PRIMARY KEY (`idPlant`),
  KEY `idGroupe` (`idGroup`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `plants`
--

INSERT INTO `plants` (`idPlant`, `plantName`, `plantDate`, `idGroup`) VALUES
(1, 'Menthe', '2025-02-28', 1),
(2, 'Basilic', '2025-02-10', 1),
(3, 'Fraisier', '2025-02-13', 2),
(4, 'Tomate', '2025-02-01', 2);

-- --------------------------------------------------------

--
-- Structure de la table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
CREATE TABLE IF NOT EXISTS `recipes` (
  `idRecipe` int NOT NULL AUTO_INCREMENT,
  `idPeriod` int NOT NULL,
  `idPlant` int NOT NULL,
  `watering` decimal(5,2) DEFAULT NULL,
  `dailyWatering` decimal(5,2) DEFAULT NULL,
  `daily` tinyint(1) NOT NULL,
  `nitrogen` decimal(4,2) DEFAULT NULL,
  `phosphorus` decimal(4,2) DEFAULT NULL,
  `potassium` decimal(4,2) DEFAULT NULL,
  `humidityThreshold` decimal(5,2) DEFAULT NULL,
  `sunlight` int NOT NULL,
  PRIMARY KEY (`idRecipe`),
  KEY `idPeriode` (`idPeriod`),
  KEY `idPlant` (`idPlant`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `recipes`
--

INSERT INTO `recipes` (`idRecipe`, `idPeriod`, `idPlant`, `watering`, `dailyWatering`, `daily`, `nitrogen`, `phosphorus`, `potassium`, `humidityThreshold`, `sunlight`) VALUES
(1, 1, 0, 1.60, 3.00, 1, 5.33, 5.33, 5.33, 50.00, 0),
(2, 2, 0, 12.00, 1.00, 1, 72.00, 24.00, 24.00, 40.00, 0),
(3, 1, 0, 2.00, 3.00, 1, 6.67, 6.67, 6.67, 50.00, 0),
(4, 2, 0, 16.00, 1.00, 1, 64.00, 32.00, 64.00, 40.00, 0),
(5, 3, 0, 16.00, 0.50, 0, 32.00, 64.00, 96.00, 40.00, 0);

-- --------------------------------------------------------

--
-- Structure de la table `shade_house`
--

DROP TABLE IF EXISTS `shade_house`;
CREATE TABLE IF NOT EXISTS `shade_house` (
  `idShadeHouse` int NOT NULL AUTO_INCREMENT,
  `currentAngle` decimal(5,2) DEFAULT NULL,
  `operationMode` tinyint(1) DEFAULT NULL,
  `dateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idShadeHouse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `trays`
--

DROP TABLE IF EXISTS `trays`;
CREATE TABLE IF NOT EXISTS `trays` (
  `idTray` int NOT NULL AUTO_INCREMENT,
  `nameTray` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `idPlant` int DEFAULT NULL,
  PRIMARY KEY (`idTray`),
  KEY `idPlante` (`idPlant`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `trays`
--

INSERT INTO `trays` (`idTray`, `nameTray`, `status`, `idPlant`) VALUES
(1, 'Bac 1', 1, 1),
(2, 'Bac 2', 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `weather`
--

DROP TABLE IF EXISTS `weather`;
CREATE TABLE IF NOT EXISTS `weather` (
  `idWeather` int NOT NULL AUTO_INCREMENT,
  `dateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `temperature` decimal(5,2) DEFAULT NULL,
  `humidity` decimal(5,2) DEFAULT NULL,
  `luminosity` decimal(10,2) DEFAULT NULL,
  `rain` tinyint(1) DEFAULT NULL,
  `wind` int DEFAULT NULL,
  PRIMARY KEY (`idWeather`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `alerts`
--
ALTER TABLE `alerts`
  ADD CONSTRAINT `alerts_ibfk_1` FOREIGN KEY (`idTray`) REFERENCES `trays` (`idTray`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `irrigation`
--
ALTER TABLE `irrigation`
  ADD CONSTRAINT `contrainteirig1` FOREIGN KEY (`idTray`) REFERENCES `trays` (`idTray`),
  ADD CONSTRAINT `contrainteirig2` FOREIGN KEY (`idRecipe`) REFERENCES `recipes` (`idRecipe`);

--
-- Contraintes pour la table `plants`
--
ALTER TABLE `plants`
  ADD CONSTRAINT `contrainte01` FOREIGN KEY (`idGroup`) REFERENCES `groups` (`idGroup`);

--
-- Contraintes pour la table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `contrainte2` FOREIGN KEY (`idPeriod`) REFERENCES `periods` (`idPeriod`);

--
-- Contraintes pour la table `trays`
--
ALTER TABLE `trays`
  ADD CONSTRAINT `contrainte3` FOREIGN KEY (`idPlant`) REFERENCES `plants` (`idPlant`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
