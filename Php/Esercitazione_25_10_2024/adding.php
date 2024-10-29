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
            $field = [
                "nome",
                "cognome",
                "data",
                "sesso",
                "cod_fisc",
                "stato",
                "regione",
                "provincia",
                "citta",
                "residenza",
                "num_civ",
                "cap",
                "tel"
            ];
        }
        elseif($_POST['type'] == "auto"){
            $file = fopen("./auto.txt", "a");
            $field = [
                "sportelli",
                "posti",
                "targa",
                "marca",
                "modello",
                "telaio",
                "motore",
                "km",
                "velocita",
                "cilindrata",
                "rev",
                "tag",
                "imm"
            ];
        }
        else{
            die();
        }
        $i = 0;
        $len = count($field);
        $record = "";
        foreach($_POST as $key => $value){
            if($key != "type"){       // salto il campo hidden e il campo confirm (relativo al submit)
                if($i == ($len - 1)){
                    $record .= $_POST[$field[$i]];          // accedo al valore che ha come chiavi l'i-esimo elemento del vettore campi, in questa maniera non vincolo l'ordine dei campi nell'html con quelli lato server.
                }
                else{
                    $record .= $_POST[$field[$i]]."=";      // separatore di campo
                }
                $i ++;
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
