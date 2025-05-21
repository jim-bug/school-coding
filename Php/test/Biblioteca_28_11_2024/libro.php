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
    error_reporting(E_ALL);
    ini_set('display_errors', 1);
?>
    <?php include "./includes/header.php"; ?>
        <link rel="stylesheet" href="./css/style.css">
    <?php include "./includes/main.php"; ?>
    <form action="" method="get">
            <input type="hidden" name="type" value="libro">
            <div class="table-container">
                <table>
                    <caption><h2>Campi di aggiunta per Libro</h2></caption>
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
                            <select name="fk_editrice">
                                <option value=""></option>
                                <?php
                                    $display_text_records = get_fk_text("editrice");
                                    echo var_dump($display_text_records);
                                    foreach($display_text_records as $text_record):
                                ?>
                                <option value=<?php echo $text_record['pk']; ?>><?php echo $text_record['text']; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
            <input type="submit" class="bottone-link" value="Aggiungi">
        </form>
<?php include "./includes/footer.php"; ?>
<!-- // :) -->
