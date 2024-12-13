<?php
require_once "./modules/bibblioteca_moduli.php";
include "./includes/header.php";
?>
<link rel="stylesheet" href="./css/style.css">
<?php
include "./includes/main.php";


list($name, $field) = get_name_file($_GET['type']);


?>
<a href="<?php echo $_GET['type']; ?>.php" class="links" >Aggiungi <?php echo $_GET['type']; ?></a> 
<form action="" method="get">
    <input type="hidden" name='type' name="<?php echo $_GET['type']; ?>">
    <table border="1">
            <tr>
                <?php foreach($field as $value): ?>
                    <th><?php echo show_field_label($value); ?></th>
                <?php endforeach; ?>
            </tr>
            <tr>
                <?php foreach($field as $value):        // for utilizzato per aggiungere la riga di ricerca
                    if(substr($value, 0, 4) == "data"):    // Se il tipo di dato è di tipo date, fornisco un tipo di dato date?>
                        <td><input type="date" name=<?php echo $value; ?>></td>
                    <?php elseif(substr($value, 0, 3) == "fk_"):    // Anzicchè mostrare un tipo di input testuale utilizzo una combobox per far visualizzare le FK già esistenti.
                        $name_fk = substr($value, 3);
                        list($name_fk_file, $field_fk, $display_field) = get_name_file($name_fk);
                        $file_fk = fopen($name_fk_file, 'r'); 
                        ?>
                        <td>
                            <select name=<?php echo $value; ?>>
                                <?php 
                                    while(!feof($file_fk)):
                                        $line = explode('=', fgets($file_fk));
                                        $fk_array = array_combine($field_fk, $line);
                                        $display_text = "";
                                        echo var_dump($fk_array);
                                        // echo $fk_array["codice"];
                                        foreach($display_field as $a){
                                            // echo is_array($fk_array[$a]);
                                            $display_text .= $fk_array[$a]. ', ';
                                        }
                                ?>
                                    <option value=<?php echo $line[0]; ?>><?php echo $display_text; ?></option>
                                    <?php endwhile; fclose($file_fk);?>
                            </select>
                        </td>
                    <?php else: ?>
                        <td><input type="text" name=<?php echo $value; ?>></td>
                    <?php endif; ?>
                <?php endforeach; ?>
            </tr>
            <tr>
                <?php
                    if(isset($_GET['table'])){
                        $file = fopen($name, 'r');
                        search_by_field($file, $field, $_GET);
                        fclose($file);

                    }

                ?>
            </tr>
    </table>
</form>
<?php include "./includes/footer.php"; ?>
<!-- // :) -->
