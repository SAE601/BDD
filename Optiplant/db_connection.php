<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

$servername = "localhost";
$username   = "root";
$password   = "";
$database   = "optiplant";

// Connexion à la base de données
$conn = new mysqli($servername, $username, $password, $database);
if ($conn->connect_error) {
    die("Échec de la connexion : " . $conn->connect_error);
}
$conn->set_charset("utf8mb4");

// Requête pour récupérer les plantes et leurs groupes
$query = "SELECT p.idPlant, p.plantName, g.name AS groupName
          FROM plants p
          INNER JOIN `groups` g ON p.idGroup = g.idGroup";
$result = $conn->query($query);

if (!$result) {
    die("Erreur dans la requête : " . $conn->error);
}
?>
