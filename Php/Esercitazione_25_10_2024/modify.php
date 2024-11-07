<?php include "./includes/header.php"; ?>
    <link rel="stylesheet" href="./css/style_client_car.css">
<?php include "./includes/main.php"; ?>

<?php
        require_once "./modules/concessionaria_moduli.php";
        ini_set('display_errors', 1);
        ini_set('display_startup_errors', 1);
        error_reporting(E_ALL);


        list($name, $field) = get_name_file($_GET["type"]);
        $file = fopen($name, "r");
        list($file_content, $modify_line) = get_filter_content_file($file, $_GET["id"], $field);        // ottengo il contenuto del file su un array filtrato con in aggiunta la riga che voglio modificare

        if(isset($_GET["conferma_mod"])){           // blocco di codice che agisce SE modifico qualche attributo del record.
            // header("Location: ". $_GET["type"]. ".php");

            $record = get_record($_GET, $field);
            array_push($file_content, $record);
            fclose($file);
            $file = fopen($name, "w");
            foreach($file_content as $i){
                fwrite($file, $i);
            }
        }
        fclose($file);
 
?>
            <form action="" method="get">
                <input type="hidden" name="type" value=<?php echo $_GET["type"]?>>
                <input type="hidden" name="id" value=<?php echo $_GET["id"]?>>
                <table border="1" class="form-table">
                <?php foreach(explode("=", $modify_line) as $key => $value): ?>
                    <tr>
                        <?php if(substr($field[$key], 0, 5) == "sesso"): ?>
                                        <td><?php echo $field[$key]?></td>
                                        <td>
                                            <select name="sesso" id="sesso">
                                                <option value="M">M</option>
                                                <option value="F">F</option>
                                                <option value="N">N (not specified)</option>
                                            </select>
                                        </td>
                        <?php elseif(substr($field[$key], 0, 4) == "data"): ?>
                                <td><?php echo $field[$key]?></td>
                                <td><input type="date" name=<?php echo $field[$key]?> value=<?php echo $value ?>></td>
                        <?php else: ?>
                                <td><?php echo $field[$key]?></td>
                                <td><input type="text" name=<?php echo $field[$key] ?> value="<?php echo $value ?>"></td>
                        <?php endif; ?>
                        
                    </tr>
                <?php endforeach; ?>
                <td><input type="submit" name="conferma_mod" value="Conferma" class="bottone-link"></td>
            </table>
        </form>

<?php include "./includes/footer.php"; ?>