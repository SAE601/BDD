-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 25 fév. 2025 à 11:21
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
-- Structure de la table `actionneurs`
--

DROP TABLE IF EXISTS `actionneurs`;
CREATE TABLE IF NOT EXISTS `actionneurs` (
  `idActionneur` int NOT NULL AUTO_INCREMENT,
  `typeActionneur` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `localisation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dateInstallation` date DEFAULT NULL,
  `idBac` int DEFAULT NULL,
  `datemaintenance` date DEFAULT NULL,
  PRIMARY KEY (`idActionneur`),
  KEY `idBac` (`idBac`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `alertes`
--

DROP TABLE IF EXISTS `alertes`;
CREATE TABLE IF NOT EXISTS `alertes` (
  `idAlerte` int NOT NULL AUTO_INCREMENT,
  `typeAlerte` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dateHeure` datetime NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `idBac` int DEFAULT NULL,
  PRIMARY KEY (`idAlerte`),
  KEY `idBac` (`idBac`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `bacs`
--

DROP TABLE IF EXISTS `bacs`;
CREATE TABLE IF NOT EXISTS `bacs` (
  `idBac` int NOT NULL AUTO_INCREMENT,
  `nomBac` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `capacite` decimal(10,2) DEFAULT NULL,
  `localisation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idPlante` int DEFAULT NULL,
  `energieconsommee` int DEFAULT NULL,
  PRIMARY KEY (`idBac`),
  KEY `idPlante` (`idPlante`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `capteurs`
--

DROP TABLE IF EXISTS `capteurs`;
CREATE TABLE IF NOT EXISTS `capteurs` (
  `idCapteur` int NOT NULL AUTO_INCREMENT,
  `typeCapteur` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `localisation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dateInstallation` date DEFAULT NULL,
  `idBac` int DEFAULT NULL,
  `datemaintenance` date DEFAULT NULL,
  PRIMARY KEY (`idCapteur`),
  KEY `idBac` (`idBac`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
CREATE TABLE IF NOT EXISTS `groupe` (
  `idGroupe` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) COLLATE utf32_unicode_ci NOT NULL,
  PRIMARY KEY (`idGroupe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `meteo`
--

DROP TABLE IF EXISTS `meteo`;
CREATE TABLE IF NOT EXISTS `meteo` (
  `idMeteo` int NOT NULL AUTO_INCREMENT,
  `dateHeure` datetime NOT NULL,
  `temperature` decimal(5,2) DEFAULT NULL,
  `humidite` decimal(5,2) DEFAULT NULL,
  `luminosite` decimal(10,2) DEFAULT NULL,
  `pluie` tinyint(1) DEFAULT NULL,
  `vent` int DEFAULT NULL,
  PRIMARY KEY (`idMeteo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ombrieres`
--

DROP TABLE IF EXISTS `ombrieres`;
CREATE TABLE IF NOT EXISTS `ombrieres` (
  `idOmbriere` int NOT NULL AUTO_INCREMENT,
  `angleActuel` decimal(5,2) DEFAULT NULL,
  `modeFonctionnement` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dateHeure` datetime NOT NULL,
  PRIMARY KEY (`idOmbriere`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `periode`
--

DROP TABLE IF EXISTS `periode`;
CREATE TABLE IF NOT EXISTS `periode` (
  `idPeriode` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) COLLATE utf32_unicode_ci NOT NULL,
  PRIMARY KEY (`idPeriode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `plantes`
--

DROP TABLE IF EXISTS `plantes`;
CREATE TABLE IF NOT EXISTS `plantes` (
  `idPlante` int NOT NULL AUTO_INCREMENT,
  `nomPlante` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `datePlantation` date DEFAULT NULL,
  `idGroupe` int NOT NULL,
  `idPeriode` int NOT NULL,
  PRIMARY KEY (`idPlante`),
  KEY `idGroupe` (`idGroupe`),
  KEY `idPeriode` (`idPeriode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `productionelectrique`
--

DROP TABLE IF EXISTS `productionelectrique`;
CREATE TABLE IF NOT EXISTS `productionelectrique` (
  `idProduction` int NOT NULL AUTO_INCREMENT,
  `dateHeure` datetime NOT NULL,
  `energieProduite` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idProduction`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `recettes`
--

DROP TABLE IF EXISTS `recettes`;
CREATE TABLE IF NOT EXISTS `recettes` (
  `idGroupe` int NOT NULL,
  `idPeriode` int NOT NULL,
  `eauArrosage` decimal(5,2) DEFAULT NULL,
  `arrosage/jour` decimal(5,2) DEFAULT NULL,
  `eauTotalJour` decimal(5,2) DEFAULT NULL,
  `rationNPK` int DEFAULT NULL,
  `azote` decimal(4,2) DEFAULT NULL,
  `tempsActivationAzote` decimal(4,2) DEFAULT NULL,
  `phosphore` decimal(4,2) DEFAULT NULL,
  `tempsActivationPhosphore` decimal(4,2) DEFAULT NULL,
  `potassium` decimal(4,2) DEFAULT NULL,
  `tempsActivationPotassium` decimal(4,2) DEFAULT NULL,
  `quantiteNutriment` decimal(4,2) DEFAULT NULL,
  `seuilHumidite` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`idGroupe`,`idPeriode`) USING BTREE,
  KEY `idGroupe` (`idGroupe`),
  KEY `idPeriode` (`idPeriode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
