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
        if($_POST['type'] == "cliente"){        // scelgo quale file aprire in base alla richiesta che ho ricevuto, leggendo l'input nascosto all'utente
            $name = "clienti.txt";
            $field = [
                "Nome",
                "Cognome",
                "Data",
                "Sesso",
                "Codice Fiscale",
                "Stato",
                "Regione",
                "Provincia",
                "Citta",
                "Residenza",
                "Civico",
                "CAP",
                "Telefono"
            ];
            $id_index = 4;
        }
        elseif($_POST['type'] == "auto"){
            $name = "auto.txt";
            $field = [
                "Sportelli",
                "Posti",
                "Targa",
                "Marca",
                "Modello",
                "Telaio",
                "Motore",
                "Km",
                "Velocita",
                "Cilindrata",
                "Data Revisione",
                "Data Tagliando",
                "Data Immatricolazione"
            ];
            $id_index = 2;
        }
        else{
            die();
        }

        $file = fopen($name, "r") or die("Errore nella apertura del file $name");
        $len = count($field);

        echo "<table border=\"1\"><tr>";
        for($i = 0; $i < $len; $i++){
            echo "<th> $field[$i] </th>";
        }
        echo "<th> Elimina Record </th></tr>";

        while(!feof($file)){
            $line = fgets($file);
            $values = explode("=", $line);
            if($line == ""){
                continue;
            }
            echo "<tr>";
            foreach($values as $index => $value){      // suddivido in token la riga letta, basandomi sul separatore di campo, explode ritorna un array e lo scorro con il foreach
                if($index == $id_index){        // se trovo l'identificativo del record
                    $id = $value;
                }
                echo "<td> $value </td>";
            }
            echo "<td> <form action=\"delete.php\" method=\"post\"> <input type=\"hidden\" name=\"id\" value=\"".urlencode($id)."\"> <input type=\"hidden\" name=\"type\" value=$_POST[type]> <input type=\"submit\" value=\"Cancella\"> </form>";
            echo "</tr>";
        }
        
        echo "</table>";
        fclose($file);
        // :)
        ?>
    </body>
</html>
