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
            <input type="hidden" name="type" value="libro">
            <div class="table-container">
                <table>
                    <caption><h2>Campi di ricerca per Libro</h2></caption>
                    <tr>
                        <th>Codice</th>
                        <td><input type="text" name="codice" id="codice"></td>
                    </tr>
                    <tr>
                        <th>Titolo</th>
                        <td><input type="text" name="titolo" id="titolo"></td>

                    </tr>
                    <tr>
                        <th>Autore</th>
                        <td><input type="text" name="autore" id="autore"></td>
                    </tr>
                    <tr>
                        <th>Prezzo</th>
                        <td><input type="text" name="prezzo" id="prezzo"></td>
                    </tr>
                    <tr>
                        <th>Case editrici</th>
                        <td>
                            <select name="id_editrice">
                                <option value=""></option>
                                <?php
                                    list($name, $fields) = get_name_file("editrice");
                                    $file = fopen($name, 'r');
                                    while(!feof($file)):
                                        $line_fields = explode("=", fgets($file));
                                        $display_text = "$line_fields[1] ($line_fields[2], $line_fields[3], $line_fields[4])";
                                ?>
                                <option value=<?php echo $line_fields[0]; ?>><?php echo $display_text; ?></option>
                                <?php endwhile; fclose($file); ?>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
            <input type="submit" class="bottone-link" value="Aggiungi">
        </form>
        <form action="./show.php">
            <input type="hidden" name="type" value="libro">
            <input type="submit" class="bottone-link" value="Visualizza">
        </form>
<?php include "./includes/footer.php"; ?>
<!-- // :) -->
