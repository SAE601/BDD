<?php
// Connexion à la base de données
$host = "127.0.0.1";
$dbname = "optiplant";
$username = "root"; // Remplacez par votre utilisateur MySQL
$password = ""; // Remplacez par votre mot de passe MySQL

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Erreur de connexion : " . $e->getMessage());
}



// Récupération des alertes des 7 derniers jours pour le bac sélectionné
$query = $pdo->prepare("SELECT DATE_FORMAT(dateTime, '%d/%m') AS formattedDate, message 
                        FROM alerts 
                        WHERE idTray = :idTray 
                        AND dateTime >= NOW() - INTERVAL 7 DAY 
                        ORDER BY dateTime DESC");
$query->execute(['idTray' => $idTray]);
$alerts = $query->fetchAll(PDO::FETCH_ASSOC);
?>