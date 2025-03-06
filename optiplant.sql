-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 06 mars 2025 à 06:16
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `alerts`
--

INSERT INTO `alerts` (`idAlert`, `AlertType`, `dateTime`, `message`, `idTray`) VALUES
(1, 'Température ', '2025-02-28 12:42:15', 'Température élevée', 1),
(2, 'Humidité ', '2025-02-28 12:42:15', 'Humidité basse', 1),
(3, 'Vent', '2025-02-28 12:42:15', ' Vent fort', 2);

-- --------------------------------------------------------

--
-- Structure de la table `data`
--

DROP TABLE IF EXISTS `data`;
CREATE TABLE IF NOT EXISTS `data` (
  `idData` int NOT NULL AUTO_INCREMENT,
  `value` int NOT NULL,
  `dateTime` timestamp NULL DEFAULT NULL,
  `idSensor` int NOT NULL,
  PRIMARY KEY (`idData`),
  KEY `idSensor` (`idSensor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `data`
--

INSERT INTO `data` (`idData`, `value`, `dateTime`, `idSensor`) VALUES
(1, 54, '2025-02-28 12:51:58', 1),
(2, 26, '2025-02-28 12:51:58', 2);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `electric_prod`
--

INSERT INTO `electric_prod` (`idProduction`, `dateTime`, `producedEnergy`) VALUES
(1, '2025-02-28 17:54:02', 760.00),
(2, '2025-02-28 14:54:02', 1200.00),
(3, '2025-02-28 20:54:03', 21.00),
(4, '2025-02-28 11:54:03', 2460.00);

-- --------------------------------------------------------

--
-- Structure de la table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `idGroup` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idGroup`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Déchargement des données de la table `groups`
--

INSERT INTO `groups` (`idGroup`, `name`) VALUES
(1, 'Plantes a feuilles'),
(2, 'Plantes a fruits'),
(3, 'Herbes aromatiques'),
(4, 'Légumes'),
(5, 'Plante a fleurs');

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
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idPeriod`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Déchargement des données de la table `periods`
--

INSERT INTO `periods` (`idPeriod`, `name`) VALUES
(1, 'Semis'),
(2, 'Developpement des racines'),
(3, 'Croissance végétative'),
(4, 'Floraison et fructification');

-- --------------------------------------------------------

--
-- Structure de la table `pictures`
--

DROP TABLE IF EXISTS `pictures`;
CREATE TABLE IF NOT EXISTS `pictures` (
  `idPicture` int NOT NULL AUTO_INCREMENT,
  `pathPicture` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `takenDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idPicture`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `pictures`
--

INSERT INTO `pictures` (`idPicture`, `pathPicture`, `takenDate`) VALUES
(1, ' sqddaqefesf\"a', '2025-02-28 14:14:48');

-- --------------------------------------------------------

--
-- Structure de la table `plants`
--

DROP TABLE IF EXISTS `plants`;
CREATE TABLE IF NOT EXISTS `plants` (
  `idPlant` int NOT NULL AUTO_INCREMENT,
  `plantName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `idGroup` int NOT NULL,
  PRIMARY KEY (`idPlant`),
  KEY `idGroupe` (`idGroup`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `plants`
--

INSERT INTO `plants` (`idPlant`, `plantName`, `idGroup`) VALUES
(1, 'Menthe', 1),
(2, 'Basilic', 1),
(3, 'Fraisier', 2),
(4, 'Tomate', 2),
(5, 'Helios', 1);

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
  `sunlight` decimal(2,0) NOT NULL,
  PRIMARY KEY (`idRecipe`),
  KEY `idPeriode` (`idPeriod`),
  KEY `Plant` (`idPlant`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `recipes`
--

INSERT INTO `recipes` (`idRecipe`, `idPeriod`, `idPlant`, `watering`, `dailyWatering`, `daily`, `nitrogen`, `phosphorus`, `potassium`, `humidityThreshold`, `sunlight`) VALUES
(1, 1, 1, 1.60, 3.00, 1, 5.33, 5.33, 5.33, 50.00, 0),
(2, 2, 1, 12.00, 1.00, 1, 72.00, 24.00, 24.00, 40.00, 0),
(3, 1, 3, 2.00, 3.00, 1, 6.67, 6.67, 6.67, 50.00, 0),
(4, 2, 3, 16.00, 1.00, 1, 64.00, 32.00, 64.00, 40.00, 0),
(5, 3, 3, 16.00, 0.50, 0, 32.00, 64.00, 96.00, 40.00, 0);

-- --------------------------------------------------------

--
-- Structure de la table `sensor`
--

DROP TABLE IF EXISTS `sensor`;
CREATE TABLE IF NOT EXISTS `sensor` (
  `idSensor` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `unit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `freq` time NOT NULL,
  `idTray` int NOT NULL,
  PRIMARY KEY (`idSensor`),
  KEY `idTray` (`idTray`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sensor`
--

INSERT INTO `sensor` (`idSensor`, `type`, `name`, `unit`, `freq`, `idTray`) VALUES
(1, 'Humidité ', 'Capteur 1', '%', '00:10:43', 1),
(2, 'Température', 'Capteur 2', '°C', '03:12:00', 1),
(3, 'Luxmètre', 'Capteur 3', 'Lux', '03:05:04', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `shade_house`
--

INSERT INTO `shade_house` (`idShadeHouse`, `currentAngle`, `operationMode`, `dateTime`) VALUES
(1, 90.00, 0, '2025-02-28 12:57:57');

-- --------------------------------------------------------

--
-- Structure de la table `trays`
--

DROP TABLE IF EXISTS `trays`;
CREATE TABLE IF NOT EXISTS `trays` (
  `idTray` int NOT NULL AUTO_INCREMENT,
  `nameTray` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `plantDate` date DEFAULT NULL,
  `idPlant` int DEFAULT NULL,
  `idPeriod` int DEFAULT NULL,
  PRIMARY KEY (`idTray`),
  KEY `idPlante` (`idPlant`),
  KEY `idPeriod` (`idPeriod`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `trays`
--

INSERT INTO `trays` (`idTray`, `nameTray`, `status`, `plantDate`, `idPlant`, `idPeriod`) VALUES
(1, 'Bac 1', 1, '2025-02-05', 1, 1),
(2, 'Bac 2', 1, '2025-02-06', 3, 2);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `weather`
--

INSERT INTO `weather` (`idWeather`, `dateTime`, `temperature`, `humidity`, `luminosity`, `rain`, `wind`) VALUES
(1, '2025-02-28 13:03:38', 26.00, 53.00, 20.00, 0, 47),
(2, '2025-03-14 08:36:44', 12.00, 87.00, 40.00, 1, 63);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `alerts`
--
ALTER TABLE `alerts`
  ADD CONSTRAINT `alerts_ibfk_1` FOREIGN KEY (`idTray`) REFERENCES `trays` (`idTray`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `data`
--
ALTER TABLE `data`
  ADD CONSTRAINT `idSensor` FOREIGN KEY (`idSensor`) REFERENCES `sensor` (`idSensor`) ON DELETE RESTRICT ON UPDATE RESTRICT;

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
  ADD CONSTRAINT `contrainte0022` FOREIGN KEY (`idPlant`) REFERENCES `plants` (`idPlant`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `contrainte2` FOREIGN KEY (`idPeriod`) REFERENCES `periods` (`idPeriod`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `sensor`
--
ALTER TABLE `sensor`
  ADD CONSTRAINT `idTray` FOREIGN KEY (`idTray`) REFERENCES `trays` (`idTray`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `trays`
--
ALTER TABLE `trays`
  ADD CONSTRAINT `bhetdfhrds ` FOREIGN KEY (`idPeriod`) REFERENCES `periods` (`idPeriod`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `contrainte3` FOREIGN KEY (`idPlant`) REFERENCES `plants` (`idPlant`);
--
-- Base de données : `sae_bomari_cmallem`
--
CREATE DATABASE IF NOT EXISTS `sae_bomari_cmallem` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sae_bomari_cmallem`;

-- --------------------------------------------------------

--
-- Structure de la table `alerte`
--

DROP TABLE IF EXISTS `alerte`;
CREATE TABLE IF NOT EXISTS `alerte` (
  `idalerte` int NOT NULL AUTO_INCREMENT,
  `type_alerte` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `message` text COLLATE utf8mb4_general_ci NOT NULL,
  `date_heure` timestamp NOT NULL,
  PRIMARY KEY (`idalerte`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `alimentation`
--

DROP TABLE IF EXISTS `alimentation`;
CREATE TABLE IF NOT EXISTS `alimentation` (
  `idalimentation` int NOT NULL AUTO_INCREMENT,
  `idbacs` int NOT NULL,
  `idrecette` int NOT NULL,
  `date_plantation` timestamp NOT NULL,
  PRIMARY KEY (`idalimentation`),
  KEY `contrainte1` (`idbacs`),
  KEY `contrainte2` (`idrecette`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `alimentation`
--

INSERT INTO `alimentation` (`idalimentation`, `idbacs`, `idrecette`, `date_plantation`) VALUES
(0, 1, 0, '2025-02-25 09:08:44'),
(1, 2, 2, '2025-02-25 08:49:43'),
(2, 3, 5, '2023-10-27 08:00:00'),
(3, 4, 7, '2023-10-22 07:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `bacs`
--

DROP TABLE IF EXISTS `bacs`;
CREATE TABLE IF NOT EXISTS `bacs` (
  `idbacs` int NOT NULL,
  `nom_bac` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `idplante` int NOT NULL,
  `idrecette` int NOT NULL,
  `date_plantation` timestamp NOT NULL,
  `statut` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idbacs`),
  KEY `contrainte3` (`idplante`),
  KEY `contrainte4` (`idrecette`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `bacs`
--

INSERT INTO `bacs` (`idbacs`, `nom_bac`, `idplante`, `idrecette`, `date_plantation`, `statut`) VALUES
(1, 'Bac_1', 1, 0, '2023-10-25 06:00:00', 'Actif'),
(2, 'Bac_2', 2, 2, '2025-02-25 08:49:33', 'Actif'),
(3, 'Bac_3', 3, 5, '2023-10-27 08:00:00', 'Inactif'),
(4, 'bacs_4', 4, 7, '2023-10-22 07:00:00', 'Maintenance');

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
CREATE TABLE IF NOT EXISTS `groupe` (
  `idgroupe` int NOT NULL,
  `nom_groupe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idgroupe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`idgroupe`, `nom_groupe`) VALUES
(1, 'Plantes à feuilles'),
(2, 'Plantes à fruits'),
(3, 'Herbes aromatiques'),
(4, 'Légumes racines'),
(5, 'Plantes à fleures');

-- --------------------------------------------------------

--
-- Structure de la table `irrigation`
--

DROP TABLE IF EXISTS `irrigation`;
CREATE TABLE IF NOT EXISTS `irrigation` (
  `idirrigation` int NOT NULL AUTO_INCREMENT,
  `idrecette` int NOT NULL,
  `date` timestamp NOT NULL,
  PRIMARY KEY (`idirrigation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `meteo`
--

DROP TABLE IF EXISTS `meteo`;
CREATE TABLE IF NOT EXISTS `meteo` (
  `idmeteo` int NOT NULL AUTO_INCREMENT,
  `temperature` decimal(10,0) NOT NULL,
  `humidite` decimal(10,0) NOT NULL,
  `luminosite` decimal(10,0) NOT NULL,
  `pluie` tinyint(1) NOT NULL,
  `vent` int NOT NULL,
  `date_heure` timestamp NOT NULL,
  PRIMARY KEY (`idmeteo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ombriere`
--

DROP TABLE IF EXISTS `ombriere`;
CREATE TABLE IF NOT EXISTS `ombriere` (
  `idombriere` int NOT NULL AUTO_INCREMENT,
  `position_actuelle` decimal(10,0) NOT NULL,
  `position_cible` decimal(10,0) NOT NULL,
  `statut` int NOT NULL,
  `date_heure` timestamp NOT NULL,
  `mode_fonctionnement` tinyint(1) NOT NULL,
  PRIMARY KEY (`idombriere`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `plante`
--

DROP TABLE IF EXISTS `plante`;
CREATE TABLE IF NOT EXISTS `plante` (
  `idplante` int NOT NULL,
  `idgroupe` int NOT NULL,
  `nom_plante` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idplante`),
  KEY `contrainte5` (`idgroupe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `plante`
--

INSERT INTO `plante` (`idplante`, `idgroupe`, `nom_plante`) VALUES
(1, 1, 'Laitue'),
(2, 2, 'Fraisier'),
(3, 3, 'Basilic'),
(4, 4, 'Radis'),
(5, 5, 'Oeillets d Inde');

-- --------------------------------------------------------

--
-- Structure de la table `recette`
--

DROP TABLE IF EXISTS `recette`;
CREATE TABLE IF NOT EXISTS `recette` (
  `idrecette` int NOT NULL,
  `groupe_plante` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `periode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `eau_par_arrosage` float NOT NULL,
  `arrosages_par_jour` int NOT NULL,
  `eau_totale_par_jour` float NOT NULL,
  `ratio_npk` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `azote_n` float NOT NULL,
  `phosphore_p` float NOT NULL,
  `potassium_k` float NOT NULL,
  `qt_totale_nutriments` float NOT NULL,
  `seuil_humidite_min_min` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `seuil_humidite_min_max` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idrecette`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `recette`
--

INSERT INTO `recette` (`idrecette`, `groupe_plante`, `periode`, `eau_par_arrosage`, `arrosages_par_jour`, `eau_totale_par_jour`, `ratio_npk`, `azote_n`, `phosphore_p`, `potassium_k`, `qt_totale_nutriments`, `seuil_humidite_min_min`, `seuil_humidite_min_max`) VALUES
(0, '1', 'Semis', 1.6, 3, 4.8, '1-1-1', 5.33, 5.33, 5.33, 16, '50', '60'),
(1, '1', 'Croissance végétative', 12, 1, 12, '3-1-1', 72, 24, 24, 120, '40', '50'),
(2, '2', 'Semis', 2, 3, 6, '1-1-1', 6.67, 6.67, 6.67, 20, '50', '60'),
(3, '2', 'Croissance végétative', 16, 1, 16, '2-1-2', 64, 32, 64, 160, '40', '50'),
(4, '2', 'Floraison et fructification', 16, 1, 16, '1-2-3', 32, 32, 96, 160, '40', '50'),
(5, '3', 'Semis', 1.2, 3, 3.6, '1-1-1', 4, 4, 4, 12, '50', '60'),
(6, '3', 'Croissance végétative', 8, 1, 8, '2-1-2', 32, 16, 32, 80, '40', '50'),
(7, '4', 'Semis', 2, 3, 6, '1-1-1', 6.67, 6.67, 6.67, 20, '50', '60'),
(8, '4', 'Croissance végétative', 12, 1, 12, '2-1-2', 48, 24, 48, 120, '40', '50'),
(9, '4', 'Développement des racines', 16, 1, 16, '1-1-3', 32, 32, 96, 160, '40', '50'),
(10, '5', 'Semis', 2, 3, 6, '1-1-1', 6.67, 6.67, 6.67, 20, '50', '60'),
(11, '5', 'Croissance végétative', 12, 1, 12, '1-1-3', 24, 24, 72, 120, '40', '50'),
(12, '5', 'Floraison', 16, 1, 16, '1-1-1', 53.33, 53.33, 53.33, 160, '40', '50');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `alimentation`
--
ALTER TABLE `alimentation`
  ADD CONSTRAINT `contrainte1` FOREIGN KEY (`idbacs`) REFERENCES `bacs` (`idbacs`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `contrainte2` FOREIGN KEY (`idrecette`) REFERENCES `recette` (`idrecette`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `bacs`
--
ALTER TABLE `bacs`
  ADD CONSTRAINT `contrainte3` FOREIGN KEY (`idplante`) REFERENCES `plante` (`idplante`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `contrainte4` FOREIGN KEY (`idrecette`) REFERENCES `recette` (`idrecette`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `plante`
--
ALTER TABLE `plante`
  ADD CONSTRAINT `contrainte5` FOREIGN KEY (`idgroupe`) REFERENCES `groupe` (`idgroupe`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
