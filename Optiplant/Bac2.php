
<?php
// Inclure le fichier contenant les variables
include 'data_bac2.php';
?>

<!DOCTYPE html>




<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gestion du Bac 2</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      color: #333;
      line-height: 1.6;
    }

    header {
      background-color: #4CAF50;
      color: white;
      padding: 20px;
      text-align: center;
      position: relative;
    }

    header .button-left, header .button-right {
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      padding: 10px 20px;
      background-color: #333;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    header .button-left {
      left: 20px;
    }

    header .button-right {
      right: 20px;
    }

    header .button-left:hover, header .button-right:hover {
      background-color: #555;
    }

    .dashboard-nav {
      display: flex;
      justify-content: center;
      gap: 20px;
      background-color: #333;
      padding: 10px;
      margin-top: 20px;
      border-radius: 8px;
    }

    .dashboard-nav a {
      color: white;
      padding: 10px 20px;
      text-decoration: none;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }

    .dashboard-nav a:hover {
      background-color: #45a049;
    }

    .container {
      max-width: 900px;
      margin: 20px auto;
      padding: 20px;
      background: white;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .tabs {
      display: flex;
      justify-content: space-around;
      background: #ddd;
      padding: 10px;
      border-radius: 8px;
      margin-bottom: 20px;
    }

    .tab {
      padding: 10px;
      cursor: pointer;
      background: #bbb;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }

    .tab.active {
      background: #4CAF50;
      color: white;
    }

    .tab-content {
      display: none;
      opacity: 0;
      transform: translateX(100%);
      transition: opacity 0.5s ease, transform 0.5s ease;
    }

    .tab-content.active {
      display: block;
      opacity: 1;
      transform: translateX(0);
    }

    .details-container {
      display: flex;
      justify-content: space-between;
      flex-wrap: wrap;
      gap: 20px;
    }

    .details-box {
      flex: 1;
      background: #e9e9e9;
      padding: 10px;
      border-radius: 5px;
      min-width: 250px;
    }

    .growth-stage {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 10px;
    }

    .growth-stage img {
      width: 100px;
      height: auto;
      border-radius: 5px;
    }

    .separator {
      width: 100%;
      height: 2px;
      background: #ccc;
      margin: 10px 0;
    }

    .irrigation-details {
      display: none;
      margin-top: 5px;
      font-size: 0.9em;
      background: #ddd;
      padding: 5px;
      border-radius: 5px;
    }
  </style>
</head>
<body>
  <!-- Tableau de bord en haut de la page -->
  <div class="dashboard-nav">
    <a href="bac1.php">Bac 1</a>
    <a href="bac2.php">Bac 2</a>
    <a href="bac3.php">Bac 3</a>
    <a href="bac4.php">Bac 4</a>
  </div>

  <header>
    <button class="button-left" onclick="changePlantation()">Changer la plantation</button>
    <h1>Gestion du Bac 2</h1>
    <button class="button-right" onclick="goHome()">Retour à l'accueil</button>
  </header>

  <div class="container">
    <div class="tabs">
      <div class="tab active" onclick="showTab(0)">Caméra</div>
      <div class="tab" onclick="showTab(1)">Résumé</div>
      <div class="tab" onclick="showTab(2)">Données détaillées</div>
    </div>

    <div class="tab-content active" id="tab-0">
      <h2>Caméra - Contenu à venir...</h2>
    </div>

    <div class="tab-content" id="tab-1">
      <h2>Résumé - Contenu à venir...</h2>
    </div>

    <div class="tab-content" id="tab-2">
      <div class="growth-stage">
        <video width="200" height="200" autoplay loop muted>
          <source src="animation.webm" type="video/webm">
          Votre navigateur ne supporte pas la lecture de vidéos.
        </video>
      </div>
			<p>Plant : <strong><?php echo htmlspecialchars($plantName); ?></strong></p>
			<p>Période : <strong><?php echo htmlspecialchars($periodName); ?></strong></p>
      <div class="separator"></div>

      <div class="details-container">
        <div class="details-box">
          <h3>Irrigations (dernières 24h)</h3>
          <p>08:00 - 500ml <button onclick="toggleDetails('irrigation1')">+</button></p>
          <div id="irrigation1" class="irrigation-details">Recette:<p>30mg N,</p><p>30mg P</p><p>30mg P</p><p>30mg P</p><p>30mg P</p><p>30mg P</p><p>30mg P</p></div>
          <p>14:00 - 600ml <button onclick="toggleDetails('irrigation2')">+</button></p>
          <div id="irrigation2" class="irrigation-details">Recette: 60mg N, 40mg P</div>
          <p>20:00 - 550ml <button onclick="toggleDetails('irrigation3')">+</button></p>
          <div id="irrigation3" class="irrigation-details">Recette: 55mg N, 35mg P</div>
        </div>

        <div class="details-box">
          <h3>Alertes (derniers 7 jours)</h3>
          <p>- 21/02 : Température élevée</p>
          <p>- 23/02 : Humidité basse</p>
          <p>- 25/02 : Vent fort</p>
        </div>
      </div>

      <div class="separator"></div>

      <div class="details-box" style="width: 100%;">
        <h3>Données du Bac</h3>
        <p>Température sol : 18°C</p>
        <p>Température air : 22°C</p>
        <p>Humidité : 60%</p>
      </div>
    </div>
  </div>

  <script>
    function showTab(index) {
      let tabs = document.querySelectorAll('.tab');
      let contents = document.querySelectorAll('.tab-content');

      tabs.forEach((tab, i) => {
        if (i === index) {
          tab.classList.add('active');
        } else {
          tab.classList.remove('active');
        }
      });

      contents.forEach((content, i) => {
        if (i === index) {
          content.classList.add('active');
        } else {
          content.classList.remove('active');
        }
      });
    }

    function toggleDetails(id) {
      let element = document.getElementById(id);
      element.style.display = element.style.display === 'block' ? 'none' : 'block';
    }

    function goHome() {
      window.location.href = 'accueil.php';
    }

    function changePlantation() {
      // Remplacer cette ligne par la logique réelle de changement de plantation
      window.location.href = 'plantation.php';
    }
  </script>
</body>
</html>
