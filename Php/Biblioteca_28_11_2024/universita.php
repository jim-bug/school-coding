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
            <input type="hidden" name="type" value="universita">
            <div class="table-container">
                <table>
                    <caption><h2>Campi di ricerca per Università</h2></caption>
                    <tr>
                        <th>Codice</th>
                        <td><input type="text" name="codice"></td>
                    </tr>
                    <tr>
                        <th>Nome Rettore</th>
                        <td><input type="text" name="nome_rettore"></td>

                    </tr>
                    <tr>
                        <th>Cognome Rettore</th>
                        <td><input type="text" name="cognome_rettore"></td>
                    </tr>
                    <tr>
                        <th>Denominazione</th>
                        <td><input type="text" name="denominazione"></td>
                    </tr>
                    <tr>
                        <th>Citta</th>
                        <td><input type="text" name="citta"></td>
                    </tr>
                </table>
            </div>
            <input type="submit" class="bottone-link" value="Aggiungi">
        </form>
        <form action="./show.php">
            <input type="hidden" name="type" value="universita">
            <input type="submit" class="bottone-link" value="Visualizza">
        </form>
<?php include "./includes/footer.php"; ?>
<!-- // :) -->
