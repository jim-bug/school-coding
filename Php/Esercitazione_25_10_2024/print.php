<!-- Autore: Ignazio Leonardo Calogero Sperandeo -->
<!-- Data: 25/10/2024 -->
<!-- Consegna: predisporre due file sequenziali con i dati dei clienti e delle auto dell'attività "Concessionaria"; creare due script PHP che leggano i file e li visualizzino. Predisporre i form per l'inserimento dei dati delle pagine "Nuova auto" e "Nuovo cliente"-->
<?php
        require_once "concessionaria_moduli.php";
        list($file_name, $field) = get_name_file($_POST["type"]);
        $file = fopen($file_name, "r");
        $len = count($field);
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Finestra di visualizzazione record di <?php echo $_POST["type"]?></title>
        <style>
            table {
                border-collapse:collapse;
            }
            th, td {
                padding: 5px;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <table border="1" style="border-collapse: collapse;">
            <tr>
                <?php for($i = 0; $i < $len; $i++): ?>
                    <th> <?php echo $field[$i] ?> </th>
                <?php endfor; ?>
                <th> Elimina</th>
                <th> Modifica</th>
            </tr>

            <?php while(!feof($file)):
                $line = fgets($file);
                $values = explode("=", $line);
                if($line == ""){
                    continue;
                }
            ?>

            <tr>
                <?php foreach($values as $index => $value):?>  
                    <td> <?php echo $value ?></td>
                <?php endforeach; ?>
                <td> <form action="delete.php" method="post"> <input type="hidden" name="id" value=<?php echo $values[0] ?>> <input type="hidden" name="type" value=<?php echo $_POST["type"] ?>> <input type="submit" value="Cancella"> </form>
                <td> <form action="modify.php" method="post"> <input type="hidden" name="id" value=<?php echo $values[0] ?>> <input type="hidden" name="type" value=<?php echo $_POST["type"] ?>> <input type="submit" value="Modifica"> </form>
            </tr>
            <?php endwhile; ?>
        </table>
        <?php fclose($file); ?>
    </body>
</html>
