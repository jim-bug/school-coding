<?php
/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 12/05/2025
    Consegna: Rif. consegna sul classroom (Web e servizi)

    by jim_bug // :)
*/
require_once "db.php";

$success = false;
$error = '';
if ($_POST) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    if ($username && $password) {
        try {
            $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
            $stmt = $pdo->prepare(
                'INSERT INTO Utenti (Username, Password) VALUES (?, ?)'
            );
            if ($stmt->execute([$username, $hashedPassword])) {
                $success = true;
            } else {
                $error = "Registration failed";
            }
        } catch (PDOException $e) {
            $error = "Registration failed";
        }
    } else {
        $error = "Please fill in all fields";
    }
}

// chiusura della connessione al database
$pdo = null;
?>

<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="utf-8">
  <title>Register</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
    <?php if ($success): ?>
        <div class="success">
            Registrazione avvenuta con successo. 
            <a href="login.php">Effettua il login</a>.
        </div>
  <?php else: ?>
    <form action="" method="POST">
      <label for="username">Username:</label>
      <input type="text" name="username" id="username" required>
      <br>
      <label for="password">Password:</label>
      <input type="password" name="password" id="password" required>
      <br>
      <button type="submit">Register</button>
      <?php if (!empty($error)): ?>
            <div class="error"><?= htmlspecialchars($error) ?></div>
      <?php endif; ?>
      <p>Hai già un account? <a href="login.php">Entra nella tua area personale</a>.</p>
    </form>
  <?php endif; ?>

</body>
</html>

<!-- // :) -->
 