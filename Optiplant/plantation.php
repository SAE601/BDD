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

// Si le paramètre idGroup est défini, c'est une requête AJAX pour récupérer les plantes
if (isset($_GET['idGroup']) && is_numeric($_GET['idGroup'])) {
    $idGroup = intval($_GET['idGroup']);

    // Requête pour récupérer les plantes d'un groupe spécifique
    $plantsQuery = "SELECT idPlant, plantName FROM plants WHERE idGroup = ?";
    $stmt = $conn->prepare($plantsQuery);
    $stmt->bind_param("i", $idGroup);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        echo "<option value=''>-- Sélectionner une plante --</option>";
        while ($plant = $result->fetch_assoc()) {
            echo "<option value='" . $plant['idPlant'] . "'>" . htmlspecialchars($plant['plantName']) . "</option>";
        }
    } else {
        echo "<option value=''>Aucune plante trouvée</option>";
    }
    $stmt->close();
    $conn->close();
    exit;
}

// Sinon, on récupère les données pour afficher le formulaire
$groupsQuery = "SELECT idGroup, name FROM `groups`";
$groupsResult = mysqli_query($conn, $groupsQuery);

$traysQuery = "SELECT idTray, nameTray FROM trays";
$traysResult = mysqli_query($conn, $traysQuery);
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Plantation</title>
    <style>
        /* Style général */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 100%;
            max-width: 500px;
        }

        label {
            display: block;
            font-size: 14px;
            color: #555;
            margin-bottom: 8px;
        }

        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            background-color: #fafafa;
        }

        select:focus {
            border-color: #66afe9;
            outline: none;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #45a049;
        }
		
		    .back-button {
      background-color: #f44336; /* Rouge pour le bouton de retour */
    }

    .back-button:hover {
      background-color: #d32f2f;
    }

        /* Option d'erreur */
        .error {
            color: #ff0000;
        }

        /* Animation de chargement */
        .loading {
            font-size: 16px;
            color: #666;
        }
    </style>

    <script>
        function updatePlants(groupId) {
            console.log("Groupe sélectionné :", groupId); // Debug
            if (groupId === "") {
                document.getElementById("plantSelect").innerHTML = "<option value=''>-- Sélectionner un groupe d'abord --</option>";
                return;
            }

            // Afficher un message de chargement
            document.getElementById("plantSelect").innerHTML = "<option class='loading'>Chargement...</option>";

            // Appel AJAX vers ce même fichier en passant l'idGroup en GET
            fetch('?idGroup=' + groupId)
                .then(response => response.text())
                .then(data => {
                    console.log("Données reçues :", data); // Debug
                    document.getElementById('plantSelect').innerHTML = data;
                })
                .catch(error => {
                    console.error('Erreur AJAX:', error);
                    document.getElementById("plantSelect").innerHTML = "<option class='error'>Erreur de chargement</option>";
                });
        }
    </script>

</head>
<body>
    <div class="container">
        <h2>Nouvelle Plantation</h2>
        <form action="plant.php" method="POST">
            <label for="groupSelect">Choisir un groupe :</label>
            <select id="groupSelect" name="group" onchange="updatePlants(this.value)" required>
                <option value="">-- Sélectionner --</option>
                <?php while ($group = mysqli_fetch_assoc($groupsResult)) {
                    echo "<option value='" . $group['idGroup'] . "'>" . htmlspecialchars($group['name']) . "</option>";
                } ?>
            </select>

            <label for="plantSelect">Choisir une plante :</label>
            <select id="plantSelect" name="plant" required>
                <option value="">-- Sélectionner un groupe d'abord --</option>
            </select>

            <label for="traySelect">Choisir un bac :</label>
            <select id="traySelect" name="tray" required>
                <option value="">-- Sélectionner --</option>
                <?php while ($tray = mysqli_fetch_assoc($traysResult)) {
                    echo "<option value='" . $tray['idTray'] . "'>" . htmlspecialchars($tray['nameTray']) . "</option>";
                } ?>
            </select>

            <button type="submit">Planter</button>
			<p></p>
			  <button type="button" class="back-button" onclick="window.history.back();">Retour</button>
        </form>
		
    </div>
	
</body>
</html>
