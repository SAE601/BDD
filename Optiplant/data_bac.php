<?php
// Connexion à la base de données
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "optiplant";
$conn = new mysqli($servername, $username, $password, $dbname);

// Vérifier la connexion
if ($conn->connect_error) {
    die("Échec de la connexion : " . $conn->connect_error);
}

// Requête pour récupérer la plante active et sa période actuelle pour chaque bac
$sql = "SELECT t.idTray, 
       t.nameTray,
       p.plantName, 
       MAX(t.plantDate) AS dateTime, 
       pr.name AS periodName
FROM trays t
LEFT JOIN plants p ON t.idPlant = p.idPlant
LEFT JOIN irrigation i ON t.idTray = i.idTray
LEFT JOIN recipes r ON i.idRecipe = r.idRecipe
LEFT JOIN periods pr ON r.idPeriod = pr.idPeriod
WHERE t.status = 1 
  AND t.idTray = $idTray
GROUP BY t.idTray, t.nameTray, p.plantName, pr.name
ORDER BY MAX(t.plantDate) DESC
LIMIT 1";

$result = $conn->query($sql);

// Vérifier si des résultats sont trouvés
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
		$plantName  = $row["plantName"] ;
		$periodName  = $row["periodName"] ;
		$date  = $row["dateTime"] ;
		$nameTray  = $row["nameTray"] ;
         echo "<p>Bac : " . $row["nameTray"] . " - Plante : " . $row["plantName"] . " - Période : " . $row["periodName"] . " - Date : " . $date. "</p>";
    }
} else {
    echo "<p>Aucune plante active trouvée.</p>";
}

// Fonction pour récupérer la dernière valeur d'un capteur donné
function getLatestSensorValue($conn, $idTray, $sensorType) {
    $sql = "
        SELECT d.value, s.unit 
        FROM Data d
        JOIN Sensor s ON d.idSensor = s.idSensor
        WHERE s.idTray = ? AND s.type = ?
        ORDER BY d.dateTime DESC
        LIMIT 1
    ";
    
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("is", $idTray, $sensorType);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($row = $result->fetch_assoc()) {
        return $row['value'] . " " . $row['unit'];
    } else {
        return "N/A";
    }
}

// Récupération des valeurs
$lux = getLatestSensorValue($conn, $idTray, "Luxmètre");
$tempAir = getLatestSensorValue($conn, $idTray, "Gestion");
$humidite = getLatestSensorValue($conn, $idTray, "Humidité");


$conn->close();

?>

