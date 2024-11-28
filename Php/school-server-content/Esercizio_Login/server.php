<!-- Autore: Ignazio Leonardo Calogero Sperandeo -->
<!-- Data: 18/10/2024 -->
<!-- Consegna: Attraverso l'uso di un form mandare a video lato server i due campi del form. -->
<!DOCTYPE html>
<html>
    <head>
        <title>Esercizio 18/10/2024</title>
    </head>
    <body>
    
        <h1>USER PROFILE OF <?php echo "$_POST[first_name] $_POST[last_name]" ?></h1>
        <?php echo "Hello, $_POST[first_name] $_POST[last_name]"?>
    </body>
</html>