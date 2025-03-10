<?php
header('Content-Type: application/json');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Récupération des données du formulaire
    $idPeriod = $_POST['idPeriod'];
    $idPlant = $_POST['idPlant'];
    $watering = $_POST['watering'];
    $dailyWatering = $_POST['dailyWatering'];
    $daily = $_POST['daily'];
    $nitrogen = isset($_POST['nitrogen']) ? $_POST['nitrogen'] : NULL;
    $phosphorus = isset($_POST['phosphorus']) ? $_POST['phosphorus'] : NULL;
    $potassium = isset($_POST['potassium']) ? $_POST['potassium'] : NULL;
    $humidityThreshold = isset($_POST['humidityThreshold']) ? $_POST['humidityThreshold'] : NULL;
    $sunlight = $_POST['sunlight'];

    // Connexion à la base de données
    $conn = new mysqli("localhost", "root", "", "optiplant");

    // Vérification de la connexion
    if ($conn->connect_error) {
        echo json_encode(['success' => false, 'error' => "Échec de la connexion : " . $conn->connect_error]);
        exit;
    }

    // Préparation de la requête d'insertion
    $sql = "INSERT INTO recipes (idPeriod, idPlant, watering, dailyWatering, daily, nitrogen, phosphorus, potassium, humidityThreshold, sunlight)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    if (!$stmt) {
        echo json_encode(['success' => false, 'error' => $conn->error]);
        exit;
    }
    
    $stmt->bind_param("iiidddddds", $idPeriod, $idPlant, $watering, $dailyWatering, $daily, $nitrogen, $phosphorus, $potassium, $humidityThreshold, $sunlight);

    // Exécution de la requête et renvoi de la réponse JSON
    if ($stmt->execute()) {
        echo json_encode(['success' => true]);
    } else {
        echo json_encode(['success' => false, 'error' => "Erreur lors de l'ajout de la recette : " . $stmt->error]);
    }

    // Fermeture de la connexion
    $stmt->close();
    $conn->close();
}
?>

<?php
// Redirige l'utilisateur vers la page de choix de recette
header("Location: recette.php");
exit();
?>