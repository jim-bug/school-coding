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
        if($_POST['type'] == "cliente"){
            $file = fopen("./clienti.txt", "r");
        }
        elseif($_POST['type'] == "auto"){
            $file = fopen("./auto.txt", "r");
        }

        while(!feof($file)){
            foreach(explode("=", fgets($file)) as $value){      // suddivido in token la riga letta, basandomi sul separatore di campo, explode ritorna un array e lo scorro con il foreach
                echo $value."<br />";
            }
            echo "<br /><br />";
        }
        fclose($file);
        // :)
        ?>
    </body>
</html>