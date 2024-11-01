<!-- Autore: Ignazio Leonardo Calogero Sperandeo -->
<!-- Data: 25/10/2024 -->
<!-- Consegna: predisporre due file sequenziali con i dati dei clienti e delle auto dell'attività "Concessionaria"; creare due script PHP che leggano i file e li visualizzino. Predisporre i form per l'inserimento dei dati delle pagine "Nuova auto" e "Nuovo cliente"-->

<?php
        require_once "concessionaria_moduli.php";
        header("Location: http://localhost:7777/Php/Esercitazione_25_10_2024/cliente.html");
        list($name, $field) = get_name_file($_POST["type"]);
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
            else{
                break;
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
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
    </body>
</html>
