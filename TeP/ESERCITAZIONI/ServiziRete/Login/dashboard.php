<?php
/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 29/04/2025
    Consegna:

    by jim_bug // :)
*/

session_start();

if (empty($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}
?>


<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="style.css">
  <title>Dashboard</title>
</head>
<body>
  <div class="dashboard">
    <h1>Benvenuto, <?= htmlspecialchars($_SESSION['username']) ?>!</h1>
    <p>Sei nella tua area riservata.</p>
    <p><a href="logout.php">Esci</a></p>
  </div>
</body>
</html>
<!-- // :) -->
