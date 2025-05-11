<?php
require_once "db.php";
ini_set('display_errors', 1);
error_reporting(E_ALL);

if ($_POST) {
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';

    if ($username && $password) {
        $query = "INSERT INTO Utenti (Username, Password) VALUES ('$username', '$password')";
        $user = $pdo->exec($query);

        if ($user) {
            header('Location: login.php');
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
  <title>Register</title>
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
 