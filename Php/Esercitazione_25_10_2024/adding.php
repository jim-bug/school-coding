<!-- Autore: Ignazio Leonardo Calogero Sperandeo -->
<!-- Data: 25/10/2024 -->
<!-- Consegna: predisporre due file sequenziali con i dati dei clienti e delle auto dell'attività "Concessionaria"; creare due script PHP che leggano i file e li visualizzino. Predisporre i form per l'inserimento dei dati delle pagine "Nuova auto" e "Nuovo cliente"-->

<!DOCTYPE html>
<html>
    <head>
        <title>Finestra di agginta record di <?php echo $_POST["type"]?></title>
    </head>
    <body>
        <?php
        /*
        ini_set('display_errors', 1);
        ini_set('display_startup_errors', 1);
        error_reporting(E_ALL);
        */

        if($_POST['type'] == "cliente"){        // scelgo quale file aprire in base alla richiesta che ho ricevuto, leggendo l'input nascosto all'utente
            $file = fopen("./clienti.txt", "a");
        }
        elseif($_POST['type'] == "auto"){
            $file = fopen("./auto.txt", "a");
        }
        
        foreach($_POST as $key => $value){
            if($key != "type"){       // salto il campo hidden e il campo confirm (relativo al submit)
                if($key == array_key_last($_POST)){
                    $record .= $value;
                }
                else{
                    $record .= $value."=";      // separatore di campo
                }
                
            }

        }
        $record.="\n";      // separatore di record
        fwrite($file, $record);
        fclose($file);
        // :)
        ?>
        <h3>Complimenti, hai aggiunto con successo il tuo record!</h3>
        <form  action="./print.php" method="post">
            <input type="hidden" name="type" value=<?php echo $_POST['type'] ?>>
            Stampa tutte i clienti che hanno acquistato nella tua concessionaria: <input type="submit" value="Stampa">
        </form>
    </body>
</html>