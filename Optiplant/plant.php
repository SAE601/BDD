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

// Récupération des données du formulaire via POST
$idTray  = isset($_POST['tray']) ? intval($_POST['tray']) : 0;
$idPlant = isset($_POST['plant']) ? intval($_POST['plant']) : 0;

// Vérification des données requises
if ($idTray == 0 || $idPlant == 0) {
    die("Données manquantes dans le formulaire.");
}

// Mise à jour de la table trays pour associer le bac à la plante sélectionnée
$updateQuery = "UPDATE trays SET idPlant = ?, plantDate = CURDATE() WHERE idTray = ?";
$stmt = $conn->prepare($updateQuery);
if (!$stmt) {
    die("Erreur de préparation de la requête : " . $conn->error);
}
$stmt->bind_param("ii", $idPlant, $idTray);

if ($stmt->execute()) {
    echo "Mise à jour du bac effectuée avec succès.<br>";
} else {
    die("Erreur lors de la mise à jour du bac : " . $stmt->error);
}
$stmt->close();

$conn->close();

// Rediriger vers une page de confirmation ou une autre page après traitement
header("Location: plantation.php");
exit();
?>
