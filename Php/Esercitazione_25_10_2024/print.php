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
            $file = fopen("./clienti.txt", "r");
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
        }
        elseif($_POST['type'] == "auto"){
            $file = fopen("./auto.txt", "r") or die("Errore nel file");
            $field = [
                "Sportelli",
                "Posti",
                "Targa",
                "Marca",
                "Modello",
                "Telaio",
                "Motore",
                "km",
                "Velocita",
                "Cilindrata",
                "Data Revisione",
                "Data Tagliando",
                "Data Immatricolazione"
            ];
            
        }
        $len = count($field);
        echo "<table border=\"1\"><tr>";
        for($i = 0; $i < $len; $i++){
            echo "<th> $field[$i] </th>";
        }
        echo "</tr>";
        while(!feof($file)){
            $line = fgets($file);
            if($line == ""){
                continue;
            }
            echo "<tr>";
            foreach(explode("=", $line) as $value){      // suddivido in token la riga letta, basandomi sul separatore di campo, explode ritorna un array e lo scorro con il foreach
                echo "<td> $value </td>";
            
            }
            echo "</tr>";
        }
        echo "</table>";
        fclose($file);
        // :)
        ?>
    </body>
</html>