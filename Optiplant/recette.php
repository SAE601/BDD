<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Ajouter une recette</title>
  <style>
    /* Style global */
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      background: #f7f7f7;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      min-height: 100vh;
      padding: 20px;
      display: flex;
      flex-direction: column;
    }

    /* Titre en haut, centré */
    header {
      text-align: center;
      margin-bottom: 20px;
    }

    /* Conteneur pour centrer la fenêtre/formulaire */
    .container {
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    /* Style du formulaire */
    form {
      background: #fff;
      padding: 2rem;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      max-width: 500px;
      width: 100%;
    }

    /* Labels */
    label {
      display: block;
      margin-bottom: 0.5rem;
      color: #555;
      font-weight: 500;
    }

    /* Champs de saisie et sélecteurs */
    input[type="number"],
    select {
      width: 100%;
      padding: 0.75rem;
      border: 1px solid #ccc;
      border-radius: 5px;
      margin-bottom: 1rem;
      font-size: 1rem;
      transition: border-color 0.3s ease;
    }

    input[type="number"]:focus,
    select:focus {
      border-color: #007BFF;
      outline: none;
    }

    /* Bouton de soumission */
    input[type="submit"] {
      width: 100%;
      padding: 0.75rem;
      background: #007BFF;
      border: none;
      border-radius: 5px;
      color: #fff;
      font-size: 1rem;
      cursor: pointer;
      transition: background 0.3s ease;
    }

    input[type="submit"]:hover {
      background: #0056b3;
    }

    /* Bouton de retour */
    .back-button {
      width: 100%;
      padding: 0.75rem;
      background: #f44336; /* Rouge pour le bouton de retour */
      border: none;
      border-radius: 5px;
      color: #fff;
      font-size: 1rem;
      cursor: pointer;
      transition: background 0.3s ease;
      margin-top: 1rem; /* Ajouter de l'espace entre les deux boutons */
    }

    .back-button:hover {
      background: #d32f2f;
    }
  </style>
</head>
<body>
  <header>
    <h1>Ajouter une nouvelle recette</h1>
  </header>
  <div class="container">
    <form action="ajouter_recette.php" method="POST">
      <label for="idPeriod">Période :</label>
      <select name="idPeriod" id="idPeriod" required>
        <option value="">Sélectionnez une période</option>
        <?php
          // Connexion à la base de données
          $conn = new mysqli("localhost", "root", "", "optiplant");
          if ($conn->connect_error) {
            die("Échec de la connexion : " . $conn->connect_error);
          }
          // Récupérer les périodes depuis la base de données
          $sql = "SELECT * FROM periods";
          $result = $conn->query($sql);
          while ($row = $result->fetch_assoc()) {
            echo "<option value='" . $row['idPeriod'] . "'>" . $row['name'] . "</option>";
          }
          $conn->close();
        ?>
      </select>

      <label for="idPlant">Plante :</label>
      <select name="idPlant" id="idPlant" required>
        <option value="">Sélectionnez une plante</option>
        <?php
          // Connexion à la base de données
          $conn = new mysqli("localhost", "root", "", "optiplant");
          if ($conn->connect_error) {
            die("Échec de la connexion : " . $conn->connect_error);
          }
          // Récupérer les plantes depuis la base de données
          $sql = "SELECT * FROM plants";
          $result = $conn->query($sql);
          while ($row = $result->fetch_assoc()) {
            echo "<option value='" . $row['idPlant'] . "'>" . $row['plantName'] . "</option>";
          }
          $conn->close();
        ?>
      </select>

      <label for="watering">Arrosage (en L) :</label>
      <input type="number" name="watering" id="watering" step="0.01" required>

      <label for="dailyWatering">Arrosage quotidien (en L) :</label>
      <input type="number" name="dailyWatering" id="dailyWatering" step="0.01" required>

      <label for="daily">Arrosage quotidien (0 pour non, 1 pour oui) :</label>
      <input type="number" name="daily" id="daily" min="0" max="1" required>

      <label for="nitrogen">Azote (en g) :</label>
      <input type="number" name="nitrogen" id="nitrogen" step="0.01">

      <label for="phosphorus">Phosphore (en g) :</label>
      <input type="number" name="phosphorus" id="phosphorus" step="0.01">

      <label for="potassium">Potassium (en g) :</label>
      <input type="number" name="potassium" id="potassium" step="0.01">

      <label for="humidityThreshold">Seuil d'humidité (%) :</label>
      <input type="number" name="humidityThreshold" id="humidityThreshold" step="0.01">

      <label for="sunlight">Lumière (Lux) :</label>
      <input type="number" name="sunlight" id="sunlight" required>

      <input type="submit" value="Ajouter la recette">
      <p></p>
      <!-- Bouton de retour avec gestion JavaScript -->
      <button type="button" class="back-button" onclick="window.history.back();">Retour</button>
    </form>
  </div>
</body>
</html>
