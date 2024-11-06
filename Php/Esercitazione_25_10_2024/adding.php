<!-- Autore: Ignazio Leonardo Calogero Sperandeo -->
<!-- Data: 25/10/2024 -->
<!-- Consegna: predisporre due file sequenziali con i dati dei clienti e delle auto dell'attività "Concessionaria"; creare due script PHP che leggano i file e li visualizzino. Predisporre i form per l'inserimento dei dati delle pagine "Nuova auto" e "Nuovo cliente"-->
<?php
        require_once "concessionaria_moduli.php";
        header("Location: http://localhost:7777/Php/Esercitazione_25_10_2024/cliente.html");
        list($file_name, $field) = get_name_file($_POST["type"]);
        $file = fopen($file_name, "a");
        fwrite($file, adding_record($_POST, $field));
        fclose($file);
        // :)
?>

