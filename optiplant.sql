-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 26 fév. 2025 à 15:42
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

-- --------------------------------------------------------

--
-- Structure de la table `alertes`
--

DROP TABLE IF EXISTS `alertes`;
CREATE TABLE IF NOT EXISTS `alertes` (
  `idAlert` int NOT NULL AUTO_INCREMENT,
  `typeAlert` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `idTray` int DEFAULT NULL,
  PRIMARY KEY (`idAlert`),
  KEY `idBac` (`idTray`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `bacs`
--

DROP TABLE IF EXISTS `bacs`;
CREATE TABLE IF NOT EXISTS `bacs` (
  `idTray` int NOT NULL AUTO_INCREMENT,
  `nameTray` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `idPlant` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`idTray`),
  KEY `idPlante` (`idPlant`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `bacs`
--

INSERT INTO `bacs` (`idTray`, `nameTray`, `idPlant`, `status`) VALUES
(1, 'Bac 1', 1, 1),
(2, 'Bac 2', 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
CREATE TABLE IF NOT EXISTS `groupe` (
  `idGroup` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  PRIMARY KEY (`idGroup`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`idGroup`, `name`) VALUES
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
-- Structure de la table `meteo`
--

DROP TABLE IF EXISTS `meteo`;
CREATE TABLE IF NOT EXISTS `meteo` (
  `idMeteo` int NOT NULL AUTO_INCREMENT,
  `dateHeure` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `temperature` decimal(5,2) DEFAULT NULL,
  `humidite` decimal(5,2) DEFAULT NULL,
  `luminosite` decimal(10,2) DEFAULT NULL,
  `pluie` tinyint(1) DEFAULT NULL,
  `vent` int DEFAULT NULL,
  PRIMARY KEY (`idMeteo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ombrieres`
--

DROP TABLE IF EXISTS `ombrieres`;
CREATE TABLE IF NOT EXISTS `ombrieres` (
  `idShadenet` int NOT NULL AUTO_INCREMENT,
  `currentAngle` decimal(5,2) DEFAULT NULL,
  `operationMode` tinyint(1) DEFAULT NULL,
  `dateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idShadenet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `periode`
--

DROP TABLE IF EXISTS `periode`;
CREATE TABLE IF NOT EXISTS `periode` (
  `idPeriod` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  PRIMARY KEY (`idPeriod`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Déchargement des données de la table `periode`
--

INSERT INTO `periode` (`idPeriod`, `name`) VALUES
(1, 'Semis'),
(2, 'Croissance végétative'),
(3, 'Floraison et fructification'),
(4, 'Développement des racines');

-- --------------------------------------------------------

--
-- Structure de la table `plantes`
--

DROP TABLE IF EXISTS `plantes`;
CREATE TABLE IF NOT EXISTS `plantes` (
  `idPlant` int NOT NULL AUTO_INCREMENT,
  `plantName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `plantDate` date DEFAULT NULL,
  `idGroup` int NOT NULL,
  PRIMARY KEY (`idPlant`),
  KEY `idGroupe` (`idGroup`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `plantes`
--

INSERT INTO `plantes` (`idPlant`, `plantName`, `plantDate`, `idGroup`) VALUES
(1, 'Menthe', '2025-02-28', 1),
(2, 'Basilic', '2025-02-10', 1),
(3, 'Fraisier', '2025-02-13', 2),
(4, 'Tomate', '2025-02-01', 2);

-- --------------------------------------------------------

--
-- Structure de la table `productionelectrique`
--

DROP TABLE IF EXISTS `productionelectrique`;
CREATE TABLE IF NOT EXISTS `productionelectrique` (
  `idProduction` int NOT NULL AUTO_INCREMENT,
  `dateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `producedEnergy` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idProduction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `recettes`
--

DROP TABLE IF EXISTS `recettes`;
CREATE TABLE IF NOT EXISTS `recettes` (
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
  PRIMARY KEY (`idRecipe`),
  KEY `idPeriode` (`idPeriod`),
  KEY `idPlante` (`idPlant`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `recettes`
--

INSERT INTO `recettes` (`idRecipe`, `idPeriod`, `idPlant`, `watering`, `dailyWatering`, `daily`, `nitrogen`, `phosphorus`, `potassium`, `humidityThreshold`) VALUES
(1, 1, 0, 1.60, 3.00, 1, 5.33, 5.33, 5.33, 50.00),
(2, 2, 0, 12.00, 1.00, 1, 72.00, 24.00, 24.00, 40.00),
(3, 1, 0, 2.00, 3.00, 1, 6.67, 6.67, 6.67, 50.00),
(4, 2, 0, 16.00, 1.00, 1, 64.00, 32.00, 64.00, 40.00),
(5, 3, 0, 16.00, 0.50, 0, 32.00, 64.00, 96.00, 40.00);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `alertes`
--
ALTER TABLE `alertes`
  ADD CONSTRAINT `contrainteAlertes` FOREIGN KEY (`idTray`) REFERENCES `bacs` (`idTray`);

--
-- Contraintes pour la table `bacs`
--
ALTER TABLE `bacs`
  ADD CONSTRAINT `contrainte3` FOREIGN KEY (`idPlant`) REFERENCES `plantes` (`idPlant`);

--
-- Contraintes pour la table `irrigation`
--
ALTER TABLE `irrigation`
  ADD CONSTRAINT `contrainteirig1` FOREIGN KEY (`idTray`) REFERENCES `bacs` (`idTray`),
  ADD CONSTRAINT `contrainteirig2` FOREIGN KEY (`idRecipe`) REFERENCES `recettes` (`idRecipe`);

--
-- Contraintes pour la table `plantes`
--
ALTER TABLE `plantes`
  ADD CONSTRAINT `contrainte01` FOREIGN KEY (`idGroup`) REFERENCES `groupe` (`idGroup`);

--
-- Contraintes pour la table `recettes`
--
ALTER TABLE `recettes`
  ADD CONSTRAINT `contrainte2` FOREIGN KEY (`idPeriod`) REFERENCES `periode` (`idPeriod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
