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

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Plantes</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
    </style>
</head>
<body>
    <h2>Liste des Plantes et leurs Groupes</h2>
    <table>
        <thead>
            <tr>
                <th>ID Plante</th>
                <th>Nom de la Plante</th>
                <th>Groupe</th>
            </tr>
        </thead>
        <tbody>
            <?php
            // Affichage des résultats dans le tableau
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . htmlspecialchars($row['idPlant']) . "</td>";
                echo "<td>" . htmlspecialchars($row['plantName']) . "</td>";
                echo "<td>" . htmlspecialchars($row['groupName']) . "</td>";
                echo "</tr>";
            }
            ?>
        </tbody>
    </table>

    <?php
    // Fermeture de la connexion
    $conn->close();
    ?>
</body>
</html>
