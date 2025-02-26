-- 1. Récupérer toutes les plantes dans un groupe spécifique
SELECT * FROM `plantes` WHERE `idGroupe` = 1;

-- 2. Afficher toutes les alertes liées à un bac particulier
SELECT * FROM `alertes` WHERE `idBac` = 1;

-- 3. Voir la consommation d'énergie totale des bacs
SELECT `nomBac`, SUM(`energieconsommee`) AS `consommation_totale`
FROM `bacs`
GROUP BY `nomBac`;

-- 4. Trouver tous les capteurs installés sur un bac
SELECT * FROM `capteurs` WHERE `idBac` = 1;

-- 5. Afficher les informations sur les périodes de culture
SELECT * FROM `periode`;

-- 6. Récupérer toutes les informations de production d’énergie
SELECT * FROM `productionelectrique`;

-- 7. Lister les différents types d'actionneurs et leur date d'installation
SELECT `typeActionneur`, `dateInstallation` FROM `actionneurs`;

-- 8. Afficher toutes les irrigations qui ont eu lieu dans un bac
SELECT * FROM `irrigation` WHERE `idBac` = 1;

-- 9. Afficher les groupes de plantes et leur période de culture
SELECT g.`nom`, p.`nomPlante`
FROM `groupe` g
JOIN `plantes` p ON g.`idGroupe` = p.`idGroupe`;

-- 10. Trouver le type de recette d'arrosage pour chaque groupe de plantes
SELECT r.`idGroupe`, r.`ratioNPK`, r.`eauArrosage`
FROM `recettes` r
JOIN `groupe` g ON r.`idGroupe` = g.`idGroupe`;

-- 11. Récupérer la météo avec des conditions spécifiques
SELECT * FROM `meteo` WHERE `temperature` > 25.00 AND `pluie` = 1;

-- 12. Afficher la configuration des ombrières
SELECT `idOmbriere`, `angleActuel`, `modeFonctionnement`, `dateHeure` FROM `ombrieres`;

-- 13. Compter le nombre de bacs installés pour chaque plante
SELECT p.`nomPlante`, COUNT(b.`idBac`) AS `nombre_bacs`
FROM `plantes` p
LEFT JOIN `bacs` b ON p.`idPlante` = b.`idPlante`
GROUP BY p.`nomPlante`;

-- 14. Récupérer l'arrosage quotidien pour une recette donnée
SELECT `arrosage_jour`, `quotidien` FROM `recettes` WHERE `idRecette` = 2;

-- 15. Vérifier les alertes pour un bac spécifique avec un message particulier
SELECT * FROM `alertes` WHERE `idBac` = 2 AND `message` LIKE '%urgence%';

-- 16. Lister toutes les plantes et leurs groupes associés
SELECT p.`nomPlante`, g.`nom` AS `groupe_plante`
FROM `plantes` p
JOIN `groupe` g ON p.`idGroupe` = g.`idGroupe`;

-- 17. Obtenir toutes les informations de maintenance des capteurs
SELECT `idCapteur`, `typeCapteur`, `datemaintenance`
FROM `capteurs`
WHERE `datemaintenance` IS NOT NULL;

-- 18. Voir l’historique de production d’électricité
SELECT * FROM `productionelectrique` ORDER BY `dateHeure` DESC LIMIT 10;

-- 19. Compter le nombre de recettes d’arrosage pour chaque groupe
SELECT g.`nom`, COUNT(r.`idRecette`) AS `nombre_recettes`
FROM `groupe` g
JOIN `recettes` r ON g.`idGroupe` = r.`idGroupe`
GROUP BY g.`nom`;

-- 20. Afficher les plantes dans la période "Croissance végétative"
SELECT p.`nomPlante`, p.`datePlantation`
FROM `plantes` p
JOIN `recettes` r ON p.`idGroupe` = r.`idGroupe`
JOIN `periode` pe ON r.`idPeriode` = pe.`idPeriode`
WHERE pe.`nom` = 'Croissance végétative';
