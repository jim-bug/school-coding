<?php
    /*
    * Autore: Ignazio Leonardo Calogero Sperandeo
    * Classe: 5C INF
    * Data: 25/10/2024
    * by jim_bug // :)
    */ 
    require "./modules/concessionaria_moduli.php";
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);
?>
    <?php include "./includes/header.php"; ?>
        <link rel="stylesheet" href="./css/style_client_car.css">
    <?php include "./includes/main.php"; ?>



        <a href="nauto.php" class="links">Nuova Auto</a>
        <form action="" method="post">
                <input type="hidden" name="type" value="auto">
                <div class="table-container">
                    <table border="1">
                        <caption><h2>Campi di ricerca per Auto</h2></caption>
                        <tr>
                            <th>Targa</th>
                            <th>Telaio</th>
                            <th>Marca</th>
                            <th>Modello</th>
                            <th>Sportelli</th>
                            <th>Posti</th>
                            <th>Motore</th>
                            <th>Cilindrata</th>
                            <th>KM</th>
                            <th>Velocità</th>
                            <th>Data Revisione</th>
                            <th>Data Tagliando</th>
                            <th>Data Immatricolazione</th>
                            <th>
                                <label for="print">Stampa</label>
                                <input type="checkbox" name="print" value="1">
                            </th>
                        </tr>
                        <tr>
                            <td><input type="text" name="targa"></td>
                            <td><input type="text" name="telaio"></td>
                            <td><input type="text" name="marca"></td>
                            <td><input type="text" name="modello"></td>
                            <td><input type="text" name="sportelli"></td>
                            <td><input type="text" name="posti"></td>
                            <td><input type="text" name="motore"></td>
                            <td><input type="text" name="cilindrata"></td>
                            <td><input type="text" name="km"></td>
                            <td><input type="text" name="velocita"></td>
                            <td><input type="date" name="rev"></td>
                            <td><input type="date" name="tag"></td>
                            <td><input type="date" name="imm"></td>
                            <th><input type="submit" value="Invio" class="bottone-link"></th>
                        </tr>
                        <?php 
                            if(isset($_POST["type"])){ 
                                list($name, $field) = get_name_file($_POST["type"]);
                                $file = fopen($name, "r");
                                search_by_field($file, $field, $_POST, 2);
                            }    
                        ?>
                    </table>
                </div>
                
            </form>
            <br />
    </body>
</html>
