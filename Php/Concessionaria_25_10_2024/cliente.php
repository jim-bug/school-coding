<?php
    /*
    * Autore: Ignazio Leonardo Calogero Sperandeo
    * Classe: 5C INF
    * Data: 25/10/2024
    * by jim_bug // :)
    */ 
    require "./modules/concessionaria_moduli.php";
?>
    <?php include "./includes/header.php"; ?>
        <link rel="stylesheet" href="./css/style_client_car.css">
    <?php include "./includes/main.php"; ?>

        
        <a href="ncliente.php" class="links">Nuovo Cliente</a>
        <?php if(isset($_GET["id"])):       // riferimento alla funzione print_record() 
            delete_record($_GET); 
        ?>
            <p class="links">Record rimosso con successo.</p>
        <?php endif; ?>

        
        <form action="" method="get">
                <input type="hidden" name="type" value="cliente">
                <div class="table-container">
                    <table>
                        <caption><h2>Campi di ricerca per Cliente</h2></caption>
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
                            <th>
                                <input type="submit" name="submit" value="Invio" class="bottone-link">
                            </th>
                        </tr>
                        <?php
                            list($name, $field) = get_name_file("cliente");
                            $file = fopen($name, "r");
                            if(isset($_GET['type'])){ 
                                search_by_field($file, $field, $_GET);
                            }
                            fclose($file);
                            /*
                            else{
                                search_by_field($file, $field, "cliente", 1);
                            }
                            fclose($file);
                            */
                        ?>
                        
                    </table>
                </div>
                <!-- <button type="submit" name="new_record">Carica Altri</button> -->
            </form>

            <br />
<?php include "./includes/footer.php"; ?>
