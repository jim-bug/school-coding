<?php
/*
    // se stai lavorando, leva i commenti // :)
    ini_set('display_errors', 1);
    error_reporting(E_ALL);
*/
  session_start();
  require_once 'db.php';
  if (!isset($_SESSION['id'])) {
      header('Location: login.php');
      exit;
  }

?>


<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="dashboard.css">
  <title>Dashboard</title>
</head>
<body>
  <div class="dashboard">
    <h1>Benvenuto, <?= htmlspecialchars($_SESSION['username']) ?>!</h1>
    <p>Sei nella tua area riservata.<br />Adesso puoi visualizzare le tue note per tipologia!</p>
    <form action="" method="GET">
      <select name="tipo">
          <!-- con la select ho detto troppo... -->
        </select>
      <button type="submit">Carica</button>
    </form>
    <p>Inserisci una nota: <a href="insert.php">Inserisci</a>.</p>

    <?php
      if($_GET):
        // Qui manca qualcosa ...
        // E poi l'output lo mettiamo in una _ab__la ?
    ?>  
    <p><a href="logout.php">Esci</a></p>
  </div>
</body>
</html>
<!-- // :) -->
