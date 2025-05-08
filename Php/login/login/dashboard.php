<?php
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
    <h1>Benvenuto, <?php echo $_SESSION['username']; // sono imbattibile nelle xss <script></script> ?>!</h1>
    <p>Sei nella tua area riservata.</p><br>
    <p>flag{complimenti!}</p>
    <p><a href="logout.php">Esci</a></p>
  </div>
</body>
</html>
<!-- // :) -->
