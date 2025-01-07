<?php
    require_once "./modules/bibblioteca_moduli.php";
    include "./includes/header.php";
?>
<link rel="stylesheet" href="./css/style.css">
<?php

include "./includes/main.php";


list($name, $field) = get_name_file($_GET['type']);
$content_file = array_filter(file($name), fn($line) => $line != "");        // filtro il contenuto del file senza le righe vuote
?>
<a href="<?php echo $_GET['type']; ?>.php" class="links" >Aggiungi <?php echo $_GET['type']; ?></a>
<style>
    .bottone-link:hover {
        background-color: red;
    }
</style>
<form action="" method="get">
    <input type="hidden" name="type" value=<?php echo $_GET['type']; ?>>
    <table border="1">
            <tr>
                <?php foreach($field as $value): ?>
                    <th><?php echo show_field_label($value); ?></th>
                <?php endforeach; ?>
                <th><input type="submit" value="Invio" class="bottone-link"></th>
            </tr>
            <tr>
                <?php foreach($field as $value): ?>
                    <td><input type="text" name=<?php echo $value ?>></td>
                <?php endforeach; ?>
                
            </tr>

            <?php 

                
                if(isset($_GET[$field[0]])){
                    search_by_field($content_file, $field, $_GET);
                }
                else{
                    search_by_field($content_file, $field, []);
                }
            ?>
    </table>
</form>
<?php include "./includes/footer.php"; ?>
<!-- // :) -->
