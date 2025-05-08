<?php
/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 29/04/2025
    Consegna:

    by jim_bug // :)
*/
session_start();
require_once "db.php";
// Abilitare la visualizzazione degli errori
ini_set('display_errors', 1);  // Imposta display_errors a On
error_reporting(E_ALL);        // Imposta error_reporting a E_ALL (tutti gli errori)

if ($_POST) {
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';

    if ($username && $password) {
        // query without prepared statement
        $stmt = $pdo->query("SELECT * FROM Utenti WHERE Username = '$username' AND Password = SHA2('$password', 224)");
        $user = $stmt->fetch();

        if ($user) {
            $_SESSION['user_id'] = $user['ID'];
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
    </form>

</body>
</html>

<!-- // :) -->
 