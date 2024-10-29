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
            $name = "./clienti.txt";
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
            $name = "./auto.txt";
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
        $file = fopen($name, "r");
        $file_content = array();
        $modify_line = "";
        while(!feof($file)){
                $line = fgets($file);
                $id = $_POST["id"];
                $state_line = false;

                foreach(explode("=", $line) as $value){
                    if($value == $id){
                        $state_line = true;     // se trovo la riga che ha come identificativo quello scelto.
                        break;
                    }
                }
                if(!$state_line){
                    array_push($file_content, $line);
                }
                else{
                    $modify_line = $line;
                }
        }

        fclose($file);
        $file = fopen($name, "w");         // riapro il file il scrittura così elimina il contenuto
        foreach($file_content as $line){
            fwrite($file, $line);
        }

        // realizzo la tabella per modificare il record.
        echo "<form action=\"adding.php\" method=\"post\">";
        echo "<table border=\"1\">";
        echo "<th>Campo</th>";
        echo "<th>Input</th>";
        foreach(explode("=", $modify_line) as $key => $value){
                echo "<tr>";
                echo "<td> $field[$key] </td>";
                if($_POST["type"] == "cliente" && $field[$key] == "sesso"){
                    echo <<<SECTION_HTML
                        <td>
                            <select name="$field[$key]">
                                <option value="M">M</option>
                                <option value="F">F</option>
                                <option value="N">N (not specified)</option>
                            </select>
                        </td>
                    SECTION_HTML; 
                }
                else{
                    echo "<td> <input type=\"text\" name=\"$field[$key]\" value=\"$value\"></td>"; 
                }
                
                echo "</tr>";
        }
        echo "<input type=\"hidden\" name=\"type\" value=\"$_POST[type]\">";
        echo "<tr><td><input type=\"submit\" value=\"Salva Modifica\"></tr></td>";
        echo "</table></form>";
        fclose($file);
        
        // :)
        ?>
    </body>
</html>