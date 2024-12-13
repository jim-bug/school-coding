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
            <input type="hidden" name="type" value="studente">
            <div class="table-container">
                <table>
                    <caption><h2>Campi di ricerca per Studente</h2></caption>
                    <tr>
                        <th>Matricola</th>
                        <td><input type="text" name="matricola" id="code"></td>
                    </tr>
                    <tr>
                        <th>Nome</th>
                        <td><input type="text" name="nome" id="name"></td>

                    </tr>
                    <tr>
                        <th>Cognome</th>
                        <td><input type="text" name="cognome" id="surname"></td>
                    </tr>
                    <tr>
                        <th>Data</th>
                        <td><input type="date" name="data" id="date"></td>
                    </tr>
                    <tr>
                        <th>Città Nascita</th>
                        <td><input type="text" name="citta" id="city"></td>
                    </tr>
                    <tr>
                        <th>Telefono</th>
                        <td><input type="text" name="telefono"></td>
                    </tr>
                </table>
            </div>
            <input type="submit" class="bottone-link" value="Aggiungi">
        </form>
        <form action="./show.php">
            <input type="hidden" name="type" value="studente">
            <input type="submit" class="bottone-link" value="Visualizza">
        </form>
<?php include "./includes/footer.php"; ?>
<!-- // :) -->
