<?php
/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 17/04/2025
    Consegna: Richiesta di codice nella simulazione.
*/
$hostname = 'localhost';
$username = 'root';
$password = 'bazinga :)';
$database = 'GestioneRisorseSperandeo';

$mysql = new mysqli($hostname, $username, $password, $database);
if($mysql -> connect_error){
    die(''. $mysql -> connect_error);
}
$query = 'SELECT Cognome, Nome, COUNT(Richieste.ID)
          FROM Docenti, Richieste
          WHERE Docenti.ID = Richieste.Docente
          GROUP BY Docenti.ID
          ORDER BY Cognome, Nome';   
$risultato = $mysql -> query($query);


?>
<!DOCTYPE html>
<html>
    <head>
        <title>WebApp</title>
    </head>
    <body>
        <table border="1">
            <tr>
                <td>Cognome</td>
                <td>Nome</td>
                <td>Conteggio</td>
            </tr>
            <tr>
        <?php
                foreach($risultato as $row):
                    foreach($row as $key => $value):
        ?>
                        <td><?php echo $value; ?></td>
        <?php 
                endforeach;
        ?>
            </tr>
        <?php
                endforeach;
        ?>
        </table>
    </body>
    <?php $mysql -> close(); ?>
</html>

<!-- // :) -->
