<?php
        require_once "./modules/concessionaria_moduli.php";
        ini_set('display_errors', 1);
        ini_set('display_startup_errors', 1);
        error_reporting(E_ALL);


?>

<?php include "./includes/header.php"; ?>
    <link rel="stylesheet" href="./css/style_client_car.css">
<?php include "./includes/main.php"; ?>

<?php if(isset($_GET["type"])): 
        add_record($_GET); 
?>
    <p class="links">Record aggiunto con successo.</p>
<?php endif; ?>


    <form action="" method="get">
            <input type="hidden" name="type" value="cliente">
            <div class="table-container">
                <table border="1">
                    <tr>
                        <th>Campo</th>
                        <th>Input</th>
                    </tr>
                    <tr>
                        <td>Nome</td>
                        <td><input type="text" name="nome" id="name"></td>
                    </tr>
                    <tr>
                        <td>Cognome</td>
                        <td><input type="text" name="cognome" id="surname"></td>
                    </tr>
                    <tr>
                        <td>Data</td>
                        <td><input type="date" name="data" id="date"></td>
                    </tr>
                    <tr>
                            <td>Sesso</td>
                            <td>
                                <select name="sesso" id="sesso">
                                    <option value="M">M</option>
                                    <option value="F">F</option>
                                    <option value="N">N (not specified)</option>
                                </select>
                            </td>
                    </tr>
                    <tr>
                        <td>Codice Fiscale</td>
                        <td><input type="text" name="cod_fisc" id="code"></td>
                    </tr>
                    <tr>
                        <td>Stato</td>
                        <td><input type="text" name="stato" id="state"></td>
                    </tr>
                    <tr>
                        <td>Regione</td>
                        <td><input type="text" name="regione" id="region"></td>
                    </tr>
                    <tr>
                        <td>Provincia</td>
                        <td><input type="text" name="provincia" id="province"></td>
                    </tr>
                    <tr>
                        <td>Città</td>
                        <td><input type="text" name="citta" id="city"></td>
                    </tr>
                    <tr>
                        <td>Residenza</td>
                        <td><input type="text" name="residenza" id="residence"></td>
                    </tr>
                    <tr>
                        <td>Numero Civico</td>
                        <td><input type="text" name="num_civ" id="house_number"></td>
                    </tr>
                    <tr>
                        <td>CAP</td>
                        <td><input type="text" name="cap" id="cap"></td>
                    </tr>
                    <tr>
                        <td>Numero di telefono</td>
                        <td><input type="text" name="tel" id="tel"></td>
                    </tr>
                </table>
            </div>
            <input type="submit" value="Invio" class="bottone-link">
        </form>
<?php include "./includes/footer.php"; ?>
