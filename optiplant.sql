-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 05 fév. 2025 à 16:58
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
  `typeActionneur` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `localisation` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
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
  `typeAlerte` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `dateHeure` datetime NOT NULL,
  `message` text COLLATE utf8mb4_general_ci,
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
  `nomBac` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `capacite` decimal(10,2) DEFAULT NULL,
  `localisation` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
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
  `typeCapteur` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `localisation` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dateInstallation` date DEFAULT NULL,
  `idBac` int DEFAULT NULL,
  `datemaintenance` date DEFAULT NULL,
  PRIMARY KEY (`idCapteur`),
  KEY `idBac` (`idBac`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `irrigation`
--

DROP TABLE IF EXISTS `irrigation`;
CREATE TABLE IF NOT EXISTS `irrigation` (
  `idIrrigation` int NOT NULL AUTO_INCREMENT,
  `dateHeure` datetime NOT NULL,
  `quantiteEau` decimal(10,2) DEFAULT NULL,
  `idBac` int DEFAULT NULL,
  `idRecette` int DEFAULT NULL,
  PRIMARY KEY (`idIrrigation`),
  KEY `idBac` (`idBac`),
  KEY `idRecette` (`idRecette`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `modeFonctionnement` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dateHeure` datetime NOT NULL,
  PRIMARY KEY (`idOmbriere`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `plantes`
--

DROP TABLE IF EXISTS `plantes`;
CREATE TABLE IF NOT EXISTS `plantes` (
  `idPlante` int NOT NULL AUTO_INCREMENT,
  `nomPlante` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `typePlante` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `besoinEau` decimal(5,2) DEFAULT NULL,
  `besoinLumiere` decimal(5,2) DEFAULT NULL,
  `datePlantation` date DEFAULT NULL,
  PRIMARY KEY (`idPlante`)
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
  `idRecette` int NOT NULL AUTO_INCREMENT,
  `nomRecette` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `composition` text COLLATE utf8mb4_general_ci,
  `quantiteEau` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idRecette`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
