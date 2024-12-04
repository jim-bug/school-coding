<?php
require_once "./modules/bibblioteca_moduli.php";
include "./includes/header.php";
?>
<link rel="stylesheet" href="./css/style.css">
<?php
include "./includes/main.php";


list($name, $field) = get_name_file($_GET['type']);
$file = fopen($name, 'r');

?>

<table border="1">
        <tr>
            <?php foreach($field as $value): ?>
                <th><?php echo strtoupper($value); ?></th>
            <?php endforeach; ?>
        </tr>
        <?php 
            while(!feof($file)):
                if(isset($_GET[$field[0]])){        // verifico se è stato richiesto di stampare un solo record
                    $line = search_record_by_id($file, $_GET[$field[0]]);
                }
                else{
                    $line = fgets($file);
                }
                $values = explode("=", $line);
                $len = count($values);
            ?>
                <tr>
                    <?php foreach($values as $key => $value): 
                        if(substr($field[$key], 0, 3) == "fk_"):
                            $fk_name = substr($field[$key], 3);     // ottengo il nome completo della tabella
                            list($name_fk, $field_fk) = get_name_file($fk_name);
                            // Aggiunta del link per far visualizzare una pagina con il record scelto.
                        ?>
                            <td><a href="show.php?type=<?php echo $fk_name; ?>&<?php echo $field_fk[0]; ?>=<?php echo $value; ?>"><?php echo $value; ?></a></td>
                        <?php else: ?>
                            <td><?php echo $value; ?></td>
                        <?php endif; ?>
                    <?php endforeach; ?>
                </tr>
                <?php if(isset($_GET[$field[0]])){
                    break;
                } ?>
            <?php endwhile;?>
</table>

<?php include "./includes/footer.php"; ?>
<!-- // :) -->
