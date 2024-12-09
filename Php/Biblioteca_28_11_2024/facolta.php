<?php
    /*
    * Autore: Ignazio Leonardo Calogero Sperandeo
    * Classe: 5C INF
    * Data: 28/11/2024
    * by jim_bug // :)
    */ 
    require_once "./modules/bibblioteca_moduli.php";

    if(isset($_GET['type'])){
        add_record($_GET);
    }
?>
    <?php include "./includes/header.php"; ?>
        <link rel="stylesheet" href="./css/style.css">
    <?php include "./includes/main.php"; ?>
    <form action="" method="get">
            <input type="hidden" name="type" value="facolta">
            <div class="table-container">
                <table>
                    <caption><h2>Campi di ricerca per Facoltà</h2></caption>
                    <tr>
                        <th>Codice</th>
                        <td><input type="text" name="codice"></td>
                    </tr>
                    <tr>
                        <th>Nome Preside</th>
                        <td><input type="text" name="nome_preside"></td>

                    </tr>
                    <tr>
                        <th>Cognome Preside</th>
                        <td><input type="text" name="cognome_preside"></td>
                    </tr>
                    <tr>
                        <th>Denominazione</th>
                        <td><input type="text" name="denominazione"></td>
                    </tr>
                    <tr>
                        <th>Università</th>
                        <td>
                            <select name="fk_universita">
                                <option value=""> </option>
                                <?php 
                                    list($name, $field) = get_name_file("universita");
                                    $file = fopen($name, 'r');
                                    while(!feof($file)):
                                        $line_fields = explode("=", fgets($file));
                                        $display_text = "$line_fields[0] ($line_fields[1], $line_fields[2])";
                                ?>
                                        <option value=<?php echo $line_fields[0]; ?>> <?php echo $display_text; ?> </option>
                                    <?php endwhile; fclose($file); ?>

                            
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
            <input type="submit" class="bottone-link" value="Aggiungi">
        </form>
        <form action="./show.php">
            <input type="hidden" name="type" value="facolta">
            <input type="submit" class="bottone-link" value="Visualizza">
        </form>
<?php include "./includes/footer.php"; ?>
<!-- // :) -->
