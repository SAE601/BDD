-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 26 fév. 2025 à 12:35
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
  `idAlerte` int NOT NULL AUTO_INCREMENT,
  `typeAlerte` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dateHeure` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `idBac` int DEFAULT NULL,
  PRIMARY KEY (`idAlerte`),
  KEY `idBac` (`idBac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `bacs`
--

DROP TABLE IF EXISTS `bacs`;
CREATE TABLE IF NOT EXISTS `bacs` (
  `idBac` int NOT NULL AUTO_INCREMENT,
  `nomBac` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `idPlante` int DEFAULT NULL,
  `energieconsommee` int DEFAULT NULL,
  PRIMARY KEY (`idBac`),
  KEY `idPlante` (`idPlante`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `bacs`
--

INSERT INTO `bacs` (`idBac`, `nomBac`, `idPlante`, `energieconsommee`) VALUES
(1, 'Bac 1', 1, 20),
(2, 'Bac 2', 3, 30);

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
CREATE TABLE IF NOT EXISTS `groupe` (
  `idGroupe` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  PRIMARY KEY (`idGroupe`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`idGroupe`, `nom`) VALUES
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
  `dateHeure` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idBac` int DEFAULT NULL,
  `idRecette` int DEFAULT NULL,
  PRIMARY KEY (`idIrrigation`),
  KEY `contrainteirig1` (`idBac`),
  KEY `contrainteirig2` (`idRecette`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `irrigation`
--

INSERT INTO `irrigation` (`idIrrigation`, `dateHeure`, `idBac`, `idRecette`) VALUES
(1, '2025-02-26 07:49:11', 1, 2),
(2, '2025-02-26 07:49:11', 2, 4),
(3, '2025-02-26 07:53:56', 1, 1),
(4, '2025-02-26 07:53:56', 2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `matériels`
--

DROP TABLE IF EXISTS `matériels`;
CREATE TABLE IF NOT EXISTS `matériels` (
  `idMateriels` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `famille` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `localisation` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dateInstallation` date NOT NULL,
  `idBac` int NOT NULL,
  `périodeMaintenance` int NOT NULL,
  `unite_periode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idMateriels`),
  KEY `idBac` (`idBac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `meteo`
--

DROP TABLE IF EXISTS `meteo`;
CREATE TABLE IF NOT EXISTS `meteo` (
  `idMeteo` int NOT NULL AUTO_INCREMENT,
  `dateHeure` timestamp NOT NULL,
  `temperature` decimal(5,2) DEFAULT NULL,
  `humidite` decimal(5,2) DEFAULT NULL,
  `luminosite` decimal(10,2) DEFAULT NULL,
  `pluie` tinyint(1) DEFAULT NULL,
  `vent` int DEFAULT NULL,
  PRIMARY KEY (`idMeteo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ombrieres`
--

DROP TABLE IF EXISTS `ombrieres`;
CREATE TABLE IF NOT EXISTS `ombrieres` (
  `idOmbriere` int NOT NULL AUTO_INCREMENT,
  `angleActuel` decimal(5,2) DEFAULT NULL,
  `modeFonctionnement` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dateHeure` timestamp NOT NULL,
  PRIMARY KEY (`idOmbriere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `periode`
--

DROP TABLE IF EXISTS `periode`;
CREATE TABLE IF NOT EXISTS `periode` (
  `idPeriode` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  PRIMARY KEY (`idPeriode`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Déchargement des données de la table `periode`
--

INSERT INTO `periode` (`idPeriode`, `nom`) VALUES
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
  `idPlante` int NOT NULL AUTO_INCREMENT,
  `nomPlante` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `datePlantation` date DEFAULT NULL,
  `idGroupe` int NOT NULL,
  PRIMARY KEY (`idPlante`),
  KEY `idGroupe` (`idGroupe`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `plantes`
--

INSERT INTO `plantes` (`idPlante`, `nomPlante`, `datePlantation`, `idGroupe`) VALUES
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
  `dateHeure` timestamp NOT NULL,
  `energieProduite` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idProduction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `recettes`
--

DROP TABLE IF EXISTS `recettes`;
CREATE TABLE IF NOT EXISTS `recettes` (
  `idRecette` int NOT NULL AUTO_INCREMENT,
  `idGroupe` int NOT NULL,
  `idPeriode` int NOT NULL,
  `eauArrosage` decimal(5,2) DEFAULT NULL,
  `arrosage_jour` decimal(5,2) DEFAULT NULL,
  `quotidien` tinyint NOT NULL,
  `azote` decimal(4,2) DEFAULT NULL,
  `phosphore` decimal(4,2) DEFAULT NULL,
  `potassium` decimal(4,2) DEFAULT NULL,
  `seuilHumidite` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`idRecette`),
  KEY `idGroupe` (`idGroupe`),
  KEY `idPeriode` (`idPeriode`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `recettes`
--

INSERT INTO `recettes` (`idRecette`, `idGroupe`, `idPeriode`, `eauArrosage`, `arrosage_jour`, `quotidien`, `azote`, `phosphore`, `potassium`, `seuilHumidite`) VALUES
(1, 1, 1, 1.60, 3.00, 1, 5.33, 5.33, 5.33, 50.00),
(2, 1, 2, 12.00, 1.00, 1, 72.00, 24.00, 24.00, 40.00),
(3, 2, 1, 2.00, 3.00, 1, 6.67, 6.67, 6.67, 50.00),
(4, 2, 2, 16.00, 1.00, 1, 64.00, 32.00, 64.00, 40.00),
(5, 2, 3, 16.00, 0.50, 0, 32.00, 64.00, 96.00, 40.00);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `alertes`
--
ALTER TABLE `alertes`
  ADD CONSTRAINT `contrainteAlertes` FOREIGN KEY (`idBac`) REFERENCES `bacs` (`idBac`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `bacs`
--
ALTER TABLE `bacs`
  ADD CONSTRAINT `contrainte3` FOREIGN KEY (`idPlante`) REFERENCES `plantes` (`idPlante`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `irrigation`
--
ALTER TABLE `irrigation`
  ADD CONSTRAINT `contrainteirig1` FOREIGN KEY (`idBac`) REFERENCES `bacs` (`idBac`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `contrainteirig2` FOREIGN KEY (`idRecette`) REFERENCES `recettes` (`idRecette`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `matériels`
--
ALTER TABLE `matériels`
  ADD CONSTRAINT `con` FOREIGN KEY (`idBac`) REFERENCES `bacs` (`idBac`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `plantes`
--
ALTER TABLE `plantes`
  ADD CONSTRAINT `contrainte01` FOREIGN KEY (`idGroupe`) REFERENCES `groupe` (`idGroupe`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `recettes`
--
ALTER TABLE `recettes`
  ADD CONSTRAINT `contrainte1` FOREIGN KEY (`idGroupe`) REFERENCES `groupe` (`idGroupe`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `contrainte2` FOREIGN KEY (`idPeriode`) REFERENCES `periode` (`idPeriode`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
