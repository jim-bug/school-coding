<!-- Autore: Ignazio Leonardo Calogero Sperandeo -->
<!-- Data: 25/10/2024 -->
<!-- Consegna: predisporre due file sequenziali con i dati dei clienti e delle auto dell'attività "Concessionaria"; creare due script PHP che leggano i file e li visualizzino. Predisporre i form per l'inserimento dei dati delle pagine "Nuova auto" e "Nuovo cliente"-->


<!DOCTYPE html>
<html>
    <head>
    <title>Finestra di visualizzazione record di <?php echo $_POST["type"]?></title>
    </head>
    <body>
        <?php
        /*
            ini_set('display_errors', 1);
            ini_set('display_startup_errors', 1);
            error_reporting(E_ALL);
        */
        if($_POST["type"] == "cliente"){        // scelgo quale file aprire in base alla richiesta che ho ricevuto, leggendo l'input nascosto all'utente
            $name = "clienti.txt";
        }
        elseif($_POST["type"] == "auto"){
            $name = "auto.txt";
        }

        $file = fopen($name, "r");
        $new_file_content = array();
        while(!feof($file)){
            $line = fgets($file);
            $black_field = urldecode($_POST["id"]);
            $black_line = false;

            foreach(explode("=", $line) as $field){         // scompogno il record in campi così da confrontare quale riga è quella che devo eliminare.
                if($field == $black_field){
                    $black_line = true;
                    break;
                }
            }

            if(!$black_line){
                array_push($new_file_content, $line);
            }
        }

        fclose($file);
        $file = fopen($name, "w");          // riapro il file il scrittura così elimina il contenuto
        foreach($new_file_content as $line){
            fwrite($file, $line);
        }
        fclose($file);
        // :)
        ?>
        <h3>Complimenti, hai rimosso con successo con successo il tuo record!</h3>
        <form  action="./print.php" method="post">
            <input type="hidden" name="type" value=<?php echo $_POST["type"]?>>
            Stampa tutte i clienti che hanno acquistato nella tua concessionaria: <input type="submit" value="Stampa">
        </form>
    </body>
</html>
