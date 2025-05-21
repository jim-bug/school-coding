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
            <input type="hidden" name="type" value="editrice">
            <input type="hidden" name="id" value=<?php echo count(file("./files/editrice.txt"))+1; ?>>
            <div class="table-container">
                <table>
                    <caption><h2>Campi di aggiunta per Studente</h2></caption>
                    <tr>
                        <th>Nome</th>
                        <td><input type="text" name="nome"></td>
                    </tr>
                    <tr>
                        <th>Indirizzo</th>
                        <td><input type="text" name="indirizzo"></td>

                    </tr>
                    <tr>
                        <th>Provincia</th>
                        <td><input type="text" name="provincia"></td>
                    </tr>
                    <tr>
                        <th>Comune</th>
                        <td><input type="text" name="comune"></td>
                    </tr>
                    <tr>
                        <th>Numero di telefono</th>
                        <td><input type="text" name="telefono"></td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td><input type="text" name="email"></td>
                    </tr>
                </table>
            </div>
            <input type="submit" class="bottone-link" value="Aggiungi">
        </form>

<?php include "./includes/footer.php"; ?>
<!-- // :) -->
