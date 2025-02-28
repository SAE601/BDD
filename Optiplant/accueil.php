<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gestion de l'Ombrière Automatique</title>
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
    }
    
    .weather-banner {
      background-color: #2196F3;
      color: white;
      padding: 10px 20px;
      text-align: center;
      transition: background 1s ease-in-out;
    }
    
    main {
      padding: 20px;
    }
    
    .dashboard {
      background-color: white;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      max-width: 800px;
      margin: 20px auto;
      text-align: center;
    }
    
    .dashboard h2 {
      margin-bottom: 20px;
      font-size: 1.5em;
      color: #333;
    }
    
    .buttons-container {
      display: flex;
      flex-direction: row;
      gap: 20px;
      justify-content: center;
    }
    
    .dashboard-button {
      background-color: #4CAF50;
      color: white;
      padding: 15px 25px;
      text-decoration: none;
      border-radius: 8px;
      font-size: 1.2em;
      transition: background-color 0.3s ease;
      text-align: center;
      flex: 1;
      max-width: 150px;
      position: relative;
    }
    
    .dashboard-button:hover {
      background-color: #45a049;
    }
    
    .info-box {
      display: none;
      position: absolute;
      background-color: white;
      color: black;
      padding: 10px;
      border-radius: 5px;
      box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
      top: 100%;
      left: 50%;
      transform: translateX(-50%);
      width: 200px;
      text-align: center;
      z-index: 10;
    }
    
    .dashboard-button:hover .info-box {
      display: block;
    }
    
    footer {
      text-align: center;
      padding: 10px;
      background-color: #333;
      color: white;
      position: fixed;
      bottom: 0;
      width: 100%;
    }
  </style>
</head>
<body onload="updateWeatherAnimation()">
  <header>
    <h1>Gestion de l'Ombrière Automatique</h1>
  </header>
  
  <div class="weather-banner" id="weather-banner">
    <p id="weather-info">Météo actuelle : 23°C, Ensoleillé, Vent modéré</p>
  </div>
  
  <main>
    <div class="dashboard">
      <h2>Tableau de Bord</h2>
      <div class="buttons-container">
        <div class="dashboard-button">Bac 1
          <div class="info-box">Température: 22°C <br> Humidité: 60% <br> <a href="bac1.php">En savoir plus</a></div>
        </div>
        <div class="dashboard-button">Bac 2
          <div class="info-box">Température: 24°C <br> Humidité: 55% <br> <a href="bac2.php">En savoir plus</a></div>
        </div>
        <div class="dashboard-button">Bac 3
          <div class="info-box">Température: 21°C <br> Humidité: 65% <br> <a href="bac3.php">En savoir plus</a></div>
        </div>
        <div class="dashboard-button">Bac 4
          <div class="info-box">Température: 23°C <br> Humidité: 58% <br> <a href="bac4.php">En savoir plus</a></div>
        </div>
      </div>
    </div>
  </main>
  
  <footer>
    <p>&copy; 2024 Opti'Plant. Tous droits réservés.</p>
  </footer>

  <script>
    function updateWeatherAnimation() {
      const weatherBanner = document.getElementById('weather-banner');
      const weatherInfo = document.getElementById('weather-info').innerText;
      
      if (weatherInfo.includes('Ensoleillé')) {
        weatherBanner.style.background = 'linear-gradient(to right, #ffdb58, #ffa500)';
      } else if (weatherInfo.includes('Pluie')) {
        weatherBanner.style.background = 'linear-gradient(to right, #2a5298, #1e3c72)';
      } else if (weatherInfo.includes('Nuageux')) {
        weatherBanner.style.background = 'linear-gradient(to right, #b3b3b3, #808080)';
      } else if (weatherInfo.includes('Neige')) {
        weatherBanner.style.background = 'linear-gradient(to right, #ffffff, #d9d9d9)';
      }
    }
  </script>
</body>
</html>
