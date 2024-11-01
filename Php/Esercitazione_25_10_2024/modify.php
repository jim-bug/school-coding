<!-- Autore: Ignazio Leonardo Calogero Sperandeo -->
<!-- Data: 25/10/2024 -->
<!-- Consegna: predisporre due file sequenziali con i dati dei clienti e delle auto dell'attività "Concessionaria"; creare due script PHP che leggano i file e li visualizzino. Predisporre i form per l'inserimento dei dati delle pagine "Nuova auto" e "Nuovo cliente"-->

<?php
        ini_set('display_errors', 1);
        ini_set('display_startup_errors', 1);
        error_reporting(E_ALL);
        require_once "concessionaria_moduli.php";
        $file = null;
        $name = null;
        $field = null;
        $file_content = array();
        $modify_line = "";
        if(isset($_POST["type"])){
            global $file;
            global $name;
            global $field;
            list($name, $field) = get_name_file($_POST["type"]);
            $file = fopen($name, "r");
            if (!$file) {
                die("Errore: impossibile aprire il file '$name' per la lettura.");
            }
            global $file_content;
            global $modify_line;
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
            
        }   
        if(isset($_POST["state"])){
            global $file;
            global $name;
            global $field;
            global $file_content;
            global $modify_line;
            fclose($file);
            $file = fopen($name, "w");         // riapro il file il scrittura così elimina il contenuto
            foreach($file_content as $line){
                fwrite($file, $line);
            }
            fwrite($file, adding_record($_POST, $field));
            fclose($file);
        }
        else{
            exit();
        }

?>

<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>

        <form method="post" action="">
            <table border="1">
                <th>Campo</th>
                <th>Input</th>
                <?php foreach(explode("=", $modify_line) as $key => $value): ?>
                <tr>
                    <td> <?php echo $field[$key] ?></td>
                    <?php if($_POST["type"] == "cliente" && $field[$key] == "sesso"): ?>
                    <td>
                            <select name=<?php echo $field[$key] ?>>
                                <option value="M">M</option>
                                <option value="F">F</option>
                                <option value="N">N (not specified)</option>
                            </select>
                    </td>
                    <?php else: ?>
                        <td> <input type="text" name= <?php echo $field[$key] ?> value=<?php echo $value ?>></td> 
                    <?php endif; ?>
                </tr>
                <?php endforeach; ?>
                <tr>
                    <td>
                        <input type="submit" value="Salva Modifica">
                    </td>
                </tr>
            </table>
            <input type="hidden" name="state" value="1">
        </form>
    </body>
</html>
