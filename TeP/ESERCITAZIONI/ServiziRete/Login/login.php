<?php
/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 29/04/2025
    Consegna: Rif. consegna sul classroom (Web e servizi)s

    by jim_bug // :)
*/
session_start();
require_once "db.php";

$error = '';
if ($_POST) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    if ($username && $password) {
        $stmt = $pdo->prepare(
            'SELECT Username, Password FROM Utenti WHERE Username = ?'
        );
        $stmt->execute([$username]);
        $user = $stmt->fetch();
        if ($user && password_verify($password, $user['Password'])) {
            $_SESSION['username'] = $user['Username'];
            header('Location: dashboard.php');
            exit;
        } else {
            $error = "Invalid username or password";
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
  <title>Login</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
    <form action="" method='POST'>
        <label for="username">Username:</label>
        <input type="text" name="username" id="username" required>
        <br>
        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required>
        <br>
        <button type="submit">Login</button>
        <br>
        <?php if (!empty($error)): ?>
            <div class="error"><?= htmlspecialchars($error) ?></div>
        <?php endif; ?>
        <p>Non hai ancora un account? <a href="register.php">Registrati</a>.</p>
    </form>
</body>
</html>

<!-- // :) -->
 