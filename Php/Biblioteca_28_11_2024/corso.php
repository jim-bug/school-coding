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
            <input type="hidden" name="type" value="corsi">
            <div class="table-container">
                <table>
                    <caption><h2>Campi di ricerca per Corsi</h2></caption>
                    <tr>
                        <th>Codice</th>
                        <td><input type="text" name="codice"></td>
                    </tr>
                    <tr>
                        <th>Anno</th>
                        <td><input type="text" name="anno"></td>

                    </tr>
                    <tr>
                        <th>Nome Corso</th>
                        <td><input type="text" name="nome"></td>
                    </tr>
                    <tr>
                        <th>Facoltà</th>
                        <td>
                            <select name="fk_facolta">
                                <option value=""> </option>
                                <?php 
                                    list($name, $field) = get_name_file("facolta");
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
            <input type="hidden" name="type" value="corso">
            <input type="submit" class="bottone-link" value="Visualizza">
        </form>
<?php include "./includes/footer.php"; ?>
<!-- // :) -->
