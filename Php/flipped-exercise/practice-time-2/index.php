<?php
/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 10/05/2025
    Consegna: Rif. flipped-classroom practice-time 2

    by jim_bug // :)
*/
    session_start();
    // $_SESSION['count'] = ($_SESSION['count'] ?? 0) + 1;
    if(!isset($_SESSION['count'])){
            $_SESSION['count'] = 0;
    }
    $_SESSION['count'] ++;
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Counter</title>
    </head>
    <body>
        <p>Salve, è l'array $_SESSION[] che parla, hai visitato la pagina <?php echo $_SESSION['count']; ?> volte. Complimenti!</p>
    </body>
</html>
<!-- // :) -->
