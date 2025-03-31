<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

$address = "localhost";
$user = "root";
$password = "lass";
$db = "Calcio";
$mysqli = new mysqli($address, $user, $password, $db);

if ($mysqli -> connect_errno){
	echo "Connessione a MySQL fallita" . $mysqli -> connect_error;
	exit();
}

$query = "SELECT DISTINCT Denominazione AS ruolo_denominazione 
		  FROM ruoli, giocatori 
		  WHERE ruoli.CodRuolo=giocatori.CodRuolo ORDER BY Denominazione";	
$risultato = $mysqli->query($query);
	
	//var_dump($risultato);
	
?>

<!DOCTYPE html>
<html>
	<head>
		<title> Finestra di inserimento </title>
		<style>
			table, th, td {
				border: 1px solid red;
			}	
		</style>	
	</head>
	<body>
		<form method="POST" action="<?php echo htmlentities($_SERVER['PHP_SELF']); /* METHOD="post" è il metodo che voglio utilizzare per inviare i dati al server. Esso usa il protocollo HTTP e viene popolato un vettore associativo ($_POST) con il valore dei campi. Uso la funzione htmlentities per convertire eventuali caratteri presenti nell'URL in entità HTML evitando così eventuali azioni di hacking tramite URL */ ?>">
			<label for="ruolo_denominazione">Ruolo: </label>
			<select name="ruolo_denominazione" id="ruolo_denominazione">
				<option value="*" selected>Scegli un ruolo</option>
		<?php
					
					if($risultato)
					    // è possibile usare il foreach o il while con fetch_assoc	
					    // while($row = $risultato->fetch_assoc())
						foreach($risultato as $row):
		?>
							<option value=<?php echo $row["ruolo_denominazione"] ?>><?php echo $row["ruolo_denominazione"]?></option>
						<?php endforeach; ?>
			</select>
            <br />
			<input type="submit" value="Invia">
			<input type="reset" value="Cancella">
		</form>
		
		<?php
			if($_POST):	// $_POST è una variabile d'ambiente, in particolare un vettore associativo
				$ruolo_denominazione = $_POST['ruolo_denominazione'];
				if($ruolo_denominazione != "*"):
					$query = "SELECT CONCAT(giocatori.cognome, ' ', giocatori.nome) AS giocatore, ruoli.denominazione AS ruolo_denominazione 
                    FROM ruoli, giocatori 
                    WHERE ruoli.Denominazione = '$ruolo_denominazione' AND ruoli.CodRuolo=giocatori.CodRuolo ORDER BY giocatore";

					$risultato = $mysqli->query($query);
					// var_dump($risultato);
					if($risultato->num_rows > 0):
		?>
						<h2>Giocatori nel ruolo <?php echo $ruolo_denominazione; ?></h2>
						<table>
						
							<tr>
								<th>Giocatore</td>
								<th>Ruolo</td>
							</tr>
						
		<?php			
						// è possibile usare il foreach o il while con fetch_assoc 	
						// while($row = $risultato->fetch_assoc())
						foreach($risultato as $row):
		?>
							<tr>
								<td><?php echo $row["giocatore"]; ?></td>
								<td><?php echo $row["ruolo_denominazione"]; ?></td>
							</tr>					
		<?php		
						endforeach; // chiude foreach o while
		?>
					</table>			
		<?php
					endif;	// chiude if($risultato->num_rows
				endif; // chiuse if($ruolo_denominazione
			endif;  // chiude if($_POST)
				
			// chiusura connessione
			$mysqli->close();
		?>
	</body>
</html>
