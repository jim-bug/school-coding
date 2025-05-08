<?php
    if(isset($_GET['theme'])){
        setcookie('theme', $_GET['theme'], time() + (86400 * 365), "/");    // 1 anno
        header("Location: " . "dashboard.php");
        exit;
    }
    $theme = $_COOKIE['theme'] ?? 'Nessuno';
    
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Finestra di inserimento</title>
    </head>
    <body>
        <form action="" method="GET">
            <label for="theme">Tema preferito:</label>
            <select name="theme" id="theme">
                <option value=""></option>
                <option value="Dark">Dark</option>
                <option value="Light">Light</option>
            </select>
            <input type="submit" value="Invia">
        </form>
        <p>Preferenza scelta: <?php echo htmlspecialchars($theme); ?></p>
    </body>
</html>