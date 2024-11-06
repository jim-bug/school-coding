<!-- Autore: Ignazio Leonardo Calogero Sperandeo -->
<!-- Data: 25/10/2024 -->
<!-- Consegna: predisporre due file sequenziali con i dati dei clienti e delle auto dell'attività "Concessionaria"; creare due script PHP che leggano i file e li visualizzino. Predisporre i form per l'inserimento dei dati delle pagine "Nuova auto" e "Nuovo cliente"-->
<?php
        require_once "./modules/concessionaria_moduli.php";
        ini_set('display_errors', 1);
        ini_set('display_startup_errors', 1);
        error_reporting(E_ALL);
        header("Location: ". $_POST["type"]. ".php");
        
        list($file_name, $field) = get_name_file($_POST["type"]);
        $file = fopen($file_name, "a");
        fwrite($file, get_record($_POST, $field));
        fclose($file);
        // :)
?>

