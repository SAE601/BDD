<?php
// Connexion à la base de données
$servername = "localhost";
$username = "root";
$password = "";
$database = "optiplant";

$conn = new mysqli($servername, $username, $password, $database);
if ($conn->connect_error) {
    die("Échec de la connexion : " . $conn->connect_error);
}
$conn->set_charset("utf8mb4");

if (isset($_GET['idGroup']) && is_numeric($_GET['idGroup'])) {
    $idGroup = intval($_GET['idGroup']);
    // Requête pour récupérer les plantes du groupe
    $plantsQuery = "SELECT idPlant, namePlant FROM plants WHERE idGroup = ?";
    $stmt = $conn->prepare($plantsQuery);
    $stmt->bind_param("i", $idGroup);
    $stmt->execute();
    $result = $stmt->get_result();

    // Si des plantes sont trouvées, on les affiche
    if ($result->num_rows > 0) {
        echo "<option value=''>-- Sélectionner une plante --</option>";
        while ($plant = $result->fetch_assoc()) {
            echo "<option value='" . $plant['idPlant'] . "'>" . htmlspecialchars($plant['namePlant']) . "</option>";
        }
    } else {
        echo "<option value=''>Aucune plante trouvée</option>";
    }

    $stmt->close();
} else {
    echo "<option value=''>Sélectionner un groupe d'abord</option>";
}

$conn->close();
?>
