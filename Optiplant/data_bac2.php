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
       MAX(i.dateTime) AS dateTime, 
       pr.name AS periodName
FROM trays t
LEFT JOIN plants p ON t.idPlant = p.idPlant
LEFT JOIN irrigation i ON t.idTray = i.idTray
LEFT JOIN recipes r ON i.idRecipe = r.idRecipe
LEFT JOIN periods pr ON r.idPeriod = pr.idPeriod
WHERE t.status = 1 
  AND t.idTray = 2
GROUP BY t.idTray, t.nameTray, p.plantName, pr.name
ORDER BY MAX(i.dateTime) DESC
LIMIT 1";

$result = $conn->query($sql);

// Vérifier si des résultats sont trouvés
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
		$plantName  = $row["plantName"] ;
		$periodName  = $row["periodName"] ;
        // echo "<p>Bac : " . $row["nameTray"] . " - Plante : " . $row["plantName"] . " - Période : " . $row["periodName"] . "</p>";
    }
} else {
    echo "<p>Aucune plante active trouvée.</p>";
}

$conn->close();
?>
