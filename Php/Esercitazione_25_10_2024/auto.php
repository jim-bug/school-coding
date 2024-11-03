<!-- Autore: Ignazio Leonardo Calogero Sperandeo -->
<!-- Data: 25/10/2024 -->
<!-- Consegna: predisporre due file sequenziali con i dati dei clienti e delle auto dell'attività "Concessionaria"; creare due script PHP che leggano i file e li visualizzino. Predisporre i form per l'inserimento dei dati delle pagine "Nuova auto" e "Nuovo cliente"-->
<?php
require "concessionaria_moduli.php";
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Esercizitazione 25/10/2024</title>
        <link rel="stylesheet" href="./css/style_client_car.css">
    </head>
    <body>
        <?php include "index.php"; ?>
        <a href="nauto.php" class="bottone-link">Nuova Auto</a>
        <form action="" method="post">
                <input type="hidden" name="type" value="auto">
                <div class="table-container">
                    <table border="1">
                        <caption><h2>Campi di ricerca per cliente</h2></caption>
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
                            <th><input type="submit" value="Invio"></th>
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
