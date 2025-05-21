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
            <input type="hidden" name="type" value="frequenza">
            <div class="table-container">
                <table>
                    <caption><h2>Campi di aggiunta per Prestiti</h2></caption>
                    <tr>
                        <th>Anno Frequenza</th>
                        <td><input type="number" name="anno"></td>
                    </tr>
                    <tr>
                        <th>Studente</th>
                        <td>
                            <select name="fk_studente">
                                <option value=""> </option>
                                <?php
                                    $display_text_records = get_fk_text("studente");
                                    echo var_dump($display_text_records);
                                    foreach($display_text_records as $text_record):
                                ?>
                                <option value=<?php echo $text_record['pk']; ?>><?php echo $text_record['text']; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>Corso</th>
                        <td>
                            <select name="fk_corso" id="libro">
                                <option value=""> </option>
                                <?php
                                    $display_text_records = get_fk_text("corso");
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
