<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>ShowCookie</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <!-- <p>Il tuo tema preferito è: <?php // echo $_COOKIE['theme'] ?? 'Nessuno'; ?></p> -->
    <p>Preferenza scelta:
        <?php
            if(isset($_COOKIE['theme'])){
                echo htmlspecialchars($_COOKIE['theme']);
            }
            else{
                echo "Nessuno";
            }
        ?>
    </p>
</body>
<!-- // :) -->
