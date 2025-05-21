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
    

        <a href="nauto.php" class="links">Nuova Auto</a>
        <?php if(isset($_GET["id"])):       // riferimento alla funzione print_record() 
            delete_record($_GET); 
        ?>
            <p class="links">Record rimosso con successo.</p>
        <?php endif; ?>

        <form action="" method="get">
                <input type="hidden" name="type" value="auto">
                <div class="table-container">
                    <table>
                        <caption><h2>Campi di ricerca per Auto</h2></caption>
                        <tr>
                            <th>Targa</th>
                            <th>Telaio</th>
                            <th>Sportelli</th>
                            <th>Posti</th>
                            <th>Marca</th>
                            <th>Modello</th>
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
                            <td><input type="date" name="data_rev"></td>
                            <td><input type="date" name="data_tag"></td>
                            <td><input type="date" name="data_imm"></td>
                            <th><input type="submit" value="Invio" class="bottone-link"></th>
                        </tr>
                        <?php 
                             if(isset($_GET["targa"])){ 
                                list($name, $field) = get_name_file($_GET["type"]);
                                $file = fopen($name, "r");
                                search_by_field($file, $field, $_GET);
                                fclose($file);
                            }     
                        ?>
                    </table>
                </div>
                
            </form>
            <br />
    </body>
</html>
