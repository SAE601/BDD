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

// Requête pour récupérer les irrigations associées au bac
$sql_irrigations = "SELECT i.idIrrigation, i.dateTime, r.idRecipe AS recipeName
                    FROM irrigation i
                    LEFT JOIN recipes r ON i.idRecipe = r.idRecipe
                    WHERE i.idTray = $idTray 
                    AND i.dateTime >= NOW() - INTERVAL 1 DAY
                    ORDER BY i.dateTime DESC";

$result_irrigations = $conn->query($sql_irrigations);

// Vérifier si des irrigations sont trouvées
if ($result_irrigations->num_rows > 0) {
    $irrigations = [];

    while ($irrigation = $result_irrigations->fetch_assoc()) {
        $irrigations[] = [
            "idIrrigation" => $irrigation["idIrrigation"],
            "dateTime" => $irrigation["dateTime"],
            "recipeName" => $irrigation["recipeName"]
        ];
    }
    
    // Retourner les irrigations sous forme de tableau JSON
    echo json_encode($irrigations);
} else {
    echo "<p>Aucune irrigation trouvée pour ce bac.</p>";
}

$conn->close();
?>
