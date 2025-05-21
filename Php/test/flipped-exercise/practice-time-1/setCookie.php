<?php
/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 10/05/2025
    Consegna: Rif. flipped-classroom practice-time 1

    by jim_bug // :)
*/
    if(isset($_GET['theme'])){
        setcookie('theme', $_GET['theme'], time() + (86400 * 365), "/");    // 1 anno
        header("Location: showCookie.php");
        exit;
    }
?>

<!DOCTYPE html>
<html>
    <head>
        <title>SetCookie</title>
    </head>
    <body>
        <form action="" method="GET">
            <label for="theme">Tema preferito:</label>
            <select name="theme" id="theme">
                <option value="Dark">Dark</option>
                <option value="Light">Light</option>
            </select>
            <input type="submit" value="Invia">
        </form>
        
    </body>
</html>
<!-- // :) -->
 