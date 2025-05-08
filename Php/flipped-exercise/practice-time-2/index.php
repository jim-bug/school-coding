<?php
    session_start();
    $_SESSION['count'] = ($_SESSION['count'] ?? 0) + 1;
    // Alternativa
    /*
        if(!isset($_SESSION['count'])){
             $_SESSION['count'] = 0;
        }
        $_SESSION['count'] ++;
    */
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Finestra di inserimento</title>
    </head>
    <body>
        <p>Salve, è l'array $_SESSION[] che parla, hai visitato la pagina <?php echo $_SESSION['count']; ?> volte. Complimenti!</p>
    </body>
</html>