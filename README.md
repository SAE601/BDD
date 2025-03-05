# README - Base de Données

Système de gestion de plantation intégrant une base de données optimisée pour le suivi des cultures, de l'irrigation et des conditions environnementales.

## 📌 Description du Projet

Ce projet vise à fournir une base de données relationnelle pour la gestion de plantes en automatisant le suivi des plants, l'irrigation, les capteurs et d'autres paramètres essentiels.

## 🏗 Structure de la Base de Données

La base de données est conçue pour optimiser la gestion des plantations. Elle comprend les entités suivantes :

    trays (bacs de plantation) : Stocke les informations sur les bacs de culture.

    plants (plantes) : Contient la liste des plantes et leur groupe d'appartenance.

    groups (groupes de plantes) : Catégorisation des plantes.

    alerts (alertes) : Historique des alertes liées aux bacs.

    irrigation (arrosage) : Suivi des actions d'irrigation.

    weather (météo) : Données climatiques (température, humidité, luminosité, etc.).

    electric_prod (production électrique) : Suivi de la production d'énergie.

    recipes (recettes de culture) : Réglages des paramètres d'arrosage et de nutriments.

    shade_house (serres ombragées) : Informations sur les serres.

    sensor (capteurs) : Liste et types de capteurs utilisés.

    data (données des capteurs) : Valeurs enregistrées par les capteurs.

    pictures (images) : Historique des images capturées.

## 🚀 Installation
Prérequis

    MySQL ou MariaDB

    Un gestionnaire de base de données (ex: phpMyAdmin...)

Importation de la Base de Données

    Clonez le dépôt :
    git clone https://github.com/SAE601/BDD.git
    cd BDD

    Importez le fichier SQL dans votre serveur de base de données :
    SOURCE chemin/vers/le/fichier.sql;

## 🛠 Utilisation

Une fois la base de données installée, vous pouvez interagir avec les différentes tables via SQL ou une API.

Exemple de requête pour récupérer les alertes actives :
SELECT * FROM alerts WHERE dateTime >= NOW() - INTERVAL 7 DAY;




Voici le token de test de connexion influxdb : 1I0hlifEgawLNtX53D_kW5ECSSJ8VYHyRDRMBMzv2_geFX_73inPo_V0Bq4zkgRPYRQ0tuGVElT-4SuOIqRZNQ==
