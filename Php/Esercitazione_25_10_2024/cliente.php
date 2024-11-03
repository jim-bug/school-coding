<!-- Autore: Ignazio Leonardo Calogero Sperandeo -->
<!-- Data: 25/10/2024 -->
<!-- Consegna: predisporre due file sequenziali con i dati dei clienti e delle auto dell'attività "Concessionaria"; creare due script PHP che leggano i file e li visualizzino. Predisporre i form per l'inserimento dei dati delle pagine "Nuova auto" e "Nuovo cliente"-->
<?php
require "concessionaria_moduli.php";
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
// $page = 1;
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Esercizitazione 25/10/2024</title>
        <link rel="stylesheet" href="./css/style_client_car.css">
    </head>
    <body>
        <?php include "index.php"; ?>
        <a href="ncliente.php" class="bottone-link">Nuovo Cliente</a>
        <form action="" method="post">
                <input type="hidden" name="type" value="cliente">
                <div class="table-container">
                    <table border="1" style="margin:auto;margin-top: 35px;">
                        <caption><h2>Campi di ricerca per cliente</h2></caption>
                        <tr>
                            <th>Codice Fiscale</th>
                            <th>Nome</th>
                            <th>Cognome</th>
                            <th>Data</th>
                            <th>Sesso</th>
                            <th>Stato</th>
                            <th>Regione</th>
                            <th>Provincia</th>
                            <th>Città</th>
                            <th>Residenza</th>
                            <th>Numero Civico</th>
                            <th>CAP</th>
                            <th>Numero di telefono</th>
                        </tr>
                        <tr>
                            <td><input type="text" name="cod_fisc" id="code"></td>
                            <td><input type="text" name="nome" id="name"></td>
                            <td><input type="text" name="cognome" id="surname"></td>
                            <td><input type="date" name="data" id="date"></td>
                            <td>
                                <select name="sesso" id="sesso">
                                    <option></option>
                                    <option value="M">M</option>
                                    <option value="F">F</option>
                                    <option value="N">N (not specified)</option>
                                </select>
                            </td>
                            
                            <td><input type="text" name="stato" id="state"></td>
                            <td><input type="text" name="regione" id="region"></td>
                            <td><input type="text" name="provincia" id="province"></td>
                            <td><input type="text" name="citta" id="city"></td>
                            <td><input type="text" name="residenza" id="residence"></td>
                            <td><input type="text" name="num_civ" id="house_number"></td>
                            <td><input type="text" name="cap" id="cap"></td>
                            <td><input type="text" name="tel" id="tel"></td>
                            <th><input type="submit" value="Invio"></th>
                        </tr>
                        <?php 
                            if(isset($_POST["type"])){ 
                                list($name, $field) = get_name_file($_POST["type"]);
                                $file = fopen($name, "r");
                                search_by_field($file, $field, $_POST);
                            }    
                            // if(isset($_POST['new_record'])){
                            //     $page ++;
                            //     search_by_field($file, $field, $_POST, $page);   
                            // }
                        ?>
                    </table>
                </div>
                <!-- <button type="submit" name="new_record">Carica Altri</button> -->
            </form>
            <br />
            <?php fclose($file); ?>
    </body>
</html>
