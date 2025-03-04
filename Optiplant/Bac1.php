<?php
// ID du bac (à remplacer dynamiquement selon votre logique)
$idTray = 1;
// Inclure le fichier contenant les variables
include 'data_bac.php';
include 'alertes.php';

?>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gestion du Bac</title>
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

    /* Conteneur pour les boutons à gauche */
    header .button-container {
      position: absolute;
      left: 20px;
      top: 50%;
      transform: translateY(-50%);
    }

    /* Style commun pour les boutons */
    header button {
      padding: 10px 20px;
      background-color: #333;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      margin-right: 10px;
    }

    header button:hover {
      background-color: #555;
    }

    /* Bouton de retour toujours à droite */
    header .button-right {
      position: absolute;
      right: 20px;
      top: 50%;
      transform: translateY(-50%);
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
    <div class="button-container">
      <button onclick="changePlantation()">Changer la plantation</button>
      <button onclick="addrecette()">Ajouter une recette</button>
    </div>
    <h1>Gestion du Bac </h1>
    <button class="button-right" onclick="goHome()">Retour à l'accueil</button>
  </header>

  <div class="container">
    <div class="tabs">
      <div class="tab" onclick="showTab(0)">Caméra</div>
      <div class="tab" onclick="showTab(1)">Résumé</div>
      <div class="tab" onclick="showTab(2)">Données détaillées</div>
    </div>
<p style="font-size: 24px; font-weight: bold;">Bac sélectionné : <?php echo " " . $nameTray; ?></p>
    <div class="tab-content" id="tab-0">
      <h2>Caméra - Contenu à venir...</h2>
    </div>

    <div class="tab-content" id="tab-1">
      <h2>Résumé - Contenu à venir...</h2>
    </div>

	      

    <div class="tab-content" id="tab-2">
	 
      <div class="growth-stage">
	   <?php
	   if($plantName) :
        // Exemple de la période pour afficher une vidéo différente
        if ($periodName == 'Semis') {
            $videoSource = 'semis.webm';
        } elseif ($periodName == 'Developpement des racines') {
            $videoSource = 'dev.webm';
        } elseif ($periodName == 'Floraison et fructification') {
            $videoSource = 'floraison.webm';
        }
	      elseif ($periodName == 'Croissance végétative') {
            $videoSource = 'Croissance.webm';
        }	
		else {
            $videoSource = 'animation.webm';  // Si la période n'est pas spécifiée
        }
		endif;
        ?>
        <video width="200" height="200" autoplay loop muted>
          <source src="<?php echo htmlspecialchars($videoSource); ?>" type="video/webm">
          Votre navigateur ne supporte pas la lecture de vidéos.
        </video>
      </div>
      <p>Plant : <strong><?php if($plantName) : echo htmlspecialchars($plantName); ?>
	  <?php else: ?>
        Ce bac est vide.
    <?php endif; ?>
	</strong></p>
      <p>Période : <strong><?php if($plantName) : echo htmlspecialchars($periodName); ?></strong></p>
	  	  <?php else: ?>
        ...
    <?php endif; ?>
	        <p>Date : <strong><?php if($plantName) : echo htmlspecialchars($date); ?></strong></p>
	  	  <?php else: ?>
        ...
    <?php endif; ?>
      <div class="separator"></div>

      <div class="details-container">
	  
	  <div class="details-box">
    <h3>Irrigations (dernières 24h)</h3>
    <!-- Un élément qui contiendra la liste des irrigations -->
    <div id="irrigations-list"></div>
</div>

        <div class="details-box">
          <h3>Alertes (derniers 7 jours)</h3>
          <?php if (count($alerts) > 0): ?>
        <?php foreach ($alerts as $alert): ?>
            <p>- <?php echo htmlspecialchars($alert['formattedDate']); ?> : <?php echo htmlspecialchars($alert['message']); ?></p>
        <?php endforeach; ?>
    <?php else: ?>
        <p>Aucune alerte enregistrée.</p>
    <?php endif; ?>
        </div>
      </div>

      <div class="separator"></div>

<div class="details-box" style="width: 100%;">
    <h3>Données du Bac</h3>
    <p>Température sol : <strong id="temp-sol"><?php echo htmlspecialchars($tempAir); ?></strong></p>
    <p>Luminosité : <strong id="temp-air"><?php echo htmlspecialchars($lux); ?></strong></p>
    <p>Humidité : <strong id="humidite"><?php echo htmlspecialchars($humidite); ?></strong></p>
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

    // Sauvegarder l'index de l'onglet actif dans localStorage
    localStorage.setItem('activeTab', index);
}
	


// Vérifier si un onglet actif est stocké et le restaurer
document.addEventListener('DOMContentLoaded', function () {
    let activeTab = localStorage.getItem('activeTab');
    if (activeTab !== null) {
        showTab(parseInt(activeTab));
    } else {
        showTab(2); // Onglet par défaut si rien n'est stocké
    }
});

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

    function addrecette() {
      // Remplacer cette ligne par la logique réelle pour ajouter une recette
      window.location.href = 'recette.php';
    }
  </script>


  
  
  <script>
// Fonction pour récupérer les irrigations depuis le serveur
function fetchIrrigations() {
    fetch('irrigation_bac1.php')  // L'URL de votre fichier PHP
        .then(response => response.json()) // Réponse JSON
        .then(data => {
            // Si des irrigations sont récupérées
            if (data.length > 0) {
                let irrigationHTML = '';
                data.forEach(irrigation => {
                    // Créer le HTML pour chaque irrigation
                    irrigationHTML += `
                        <p>
                            ${irrigation.dateTime} - Recette: ${irrigation.recipeName}
                            <button onclick="toggleDetails('irrigation${irrigation.idIrrigation}')">+</button>
                        </p>
                        <div id="irrigation${irrigation.idIrrigation}" class="irrigation-details" style="display: none;">
                            Détails de l'irrigation : ${irrigation.recipeName}
                        </div>
                    `;
                });
                // Mettre à jour l'élément avec l'ID 'irrigations-list'
                document.getElementById('irrigations-list').innerHTML = irrigationHTML;
            } else {
                // Si aucune irrigation n'est trouvée
                document.getElementById('irrigations-list').innerHTML = "<p>Aucune irrigation trouvée.</p>";
            }
        })
        .catch(error => {
            console.error('Erreur:', error);
        });
}

// Appeler la fonction pour récupérer les irrigations dès que la page est chargée
document.addEventListener('DOMContentLoaded', fetchIrrigations);
</script>
  
  <script>
    setInterval(function(){
        location.reload();
    }, 3000); // Recharge toutes les 3 secondes
</script>

</body>
</html>
