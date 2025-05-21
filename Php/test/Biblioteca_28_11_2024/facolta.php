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
                    <caption><h2>Campi di aggiunta per Facoltà</h2></caption>
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
                                    $display_text_records = get_fk_text("facolta");
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
