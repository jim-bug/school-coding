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
            <input type="hidden" name="type" value="prestito">
            <div class="table-container">
                <table>
                    <caption><h2>Campi di ricerca per Prestiti</h2></caption>
                    <tr>
                        <th>Data Prestito</th>
                        <td><input type="date" name="richiesta" id="code"></td>
                    </tr>
                    <tr>
                        <th>Data restituzione</th>
                        <td><input type="date" name="restituzione" id="name"></td>

                    </tr>
                    <tr>
                        <th>Stato Consegna</th>
                            <td>
                                <select name="consegna" id="stato_consegna">
                                    <option value=""></option>
                                    <option value="Buono">Buono</option>
                                    <option value="Discreto">Discreto</option>
                                    <option value="Cattivo">Cattivo</option>
                                </select>
                            </td>
                    </tr>
                    <tr>
                        <th>Stato Restituzione</th>
                        <td>
                            <select name="riconsegna" id="stato_riconsegna">
                                <option value=""></option>
                                <option value="Buono">Buono</option>
                                <option value="Discreto">Discreto</option>
                                <option value="Cattivo">Cattivo</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>Studente</th>
                        <td>
                            <select name="fk_studente" id="studente">
                                <option value=""> </option>
                                <?php 
                                    list($name, $field) = get_name_file("studente");
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
                    <tr>
                        <th>Libro</th>
                        <td>
                            <select name="fk_libro" id="libro">
                                <option value=""> </option>
                                <?php 
                                    list($name, $field) = get_name_file("libro");
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
            <input type="hidden" name="type" value="prestito">
            <input type="submit" class="bottone-link" value="Visualizza">
        </form>
<?php include "./includes/footer.php"; ?>
<!-- // :) -->
