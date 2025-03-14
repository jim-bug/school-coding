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
        <input type="hidden" name="type" value="auto">
            <div class="table-container">
                <table border="1">
                    <th>Campo</th>
                    <th>Input</th>
                    <tr>
                        <td>Targa</td>
                        <td><input type="text" name="targa" id="license"></td>
                    </tr>
                    <tr>
                        <td>Telaio</td>
                        <td><input type="text" name="telaio" id="frame"></td>
                    </tr>
                    <tr>
                        <td>Marca</td>
                        <td><input type="text" name="marca" id="brand"></td>
                    </tr>
                    <tr>
                        <td>Modello</td>
                        <td><input type="text" name="modello" id="model"></td>
                    </tr>
                    <tr>
                        <td>Sportelli</td>
                        <td><input type="text" name="sportelli" id="ports"></td>
                    </tr>
                    <tr>
                        <td>Posti</td>
                        <td><input type="text" name="posti" id="space"></td>
                    </tr>
                    <tr>
                        <td>Motore</td>
                        <td><input type="text" name="motore" id="engine"></td>
                    </tr>
                    <tr>
                        <td>Cilindrata</td>
                        <td><input type="text" name="cilindrata" id="displacement"></td>
                    </tr>
                    <tr>
                        <td>KM Totali</td>
                        <td><input type="text" name="km" id="km"></td>
                    </tr>
                    <tr>
                        <td>Velocita max</td>
                        <td><input type="text" name="velocita" id="speed"></td>
                    </tr>
                    <tr>
                        <td>Data Rev.</td>
                        <td><input type="date" name="data_rev" id="date_rev"></td>
                    </tr>
                    <tr>
                        <td>Data Tag.</td>
                        <td><input type="date" name="data_tag" id="date_tag"></td>
                    </tr>
                    <tr>
                        <td>Data Imm.</td>
                        <td><input type="date" name="data_imm" id="date_imm"></td>
                    </tr>
                </table>
            </div>
        <input type="submit" value="Invio" class="bottone-link">
    </form>
<?php include "./includes/footer.php"; ?>
