<?php
	/*
	 	Autore:		Ignazio Leonardo Calogero Sperandeo
		Data: 		02/04/2025
		Esercizio: Realizzare una Web Application che consenta di visualizzare i giocatori per ruoli (disponibili).

	*/
	$address = "localhost";
	$user = "root";
	$password = "bazinga :)";
	$db = "Calcio";
	$mysqli = new mysqli($address, $user, $password, $db);
	
	if ($mysqli -> connect_errno){
		echo "Connessione a MySQL fallita".$mysqli -> connect_error;
		die();
	}
	
	$query = "SELECT DISTINCT Denominazione AS ruolo_denominazione 
			  FROM ruoli, giocatori 
			  WHERE ruoli.CodRuolo = giocatori.CodRuolo 
			  ORDER BY Denominazione";
				
	$risultato = $mysqli->query($query);
	
?>

<!DOCTYPE html>
<html lang="it">
	<head>
		<title> Finestra di inserimento </title>
			<style>
				table, th, td {
				border: 1px solid red;
			}	
		
		</style>
		
	</head>

	<body>
		<form method="POST" action="">
			<label for="ruolo_denominazione">Ruolo: </label>
			<select name="ruolo_denominazione" id="ruolo_denominazione">
				<option value="*" selected>Scegli un ruolo</option>
				<?php
					if($risultato):
						while($row = $risultato->fetch_assoc()): 
				?>       
							<option value="<?php echo $row["ruolo_denominazione"] ?>"><?php echo $row["ruolo_denominazione"]?></optio>
				<?php 
						endwhile; 
					endif;	
				?>
			
			</select><br>

			<input type="submit" value="Invia">
			<input type="reset" value="Cancella">
		</form>
		
		<?php
			if ($_POST):	// $_POST è una variabile d'ambiente, in particolare un vettore associativo
				$ruolo_denominazione = $_POST['ruolo_denominazione'];
				
				if($ruolo_denominazione != "*"):
				
					$prepared_query = "SELECT CONCAT(giocatori.cognome, ' ', giocatori.nome) as giocatore, ruoli.denominazione as ruolo_denominazione FROM ruoli, giocatori WHERE ruoli.Denominazione = ? and ruoli.CodRuolo=giocatori.CodRuolo ORDER BY giocatore";
					
					$statement=$mysqli->prepare($prepared_query);
					
					// associo i tipi e i parametri allo statement; s stringa, i intero, d double-float 
					$statement->bind_param("s", $ruolo_denominazione);
					
					// eseguo lo statement
					$statement->execute();
					
					
					// soluzione con bind_result
					// memorizzo lo statement in un buffer
					$statement->store_result();

					// Controllo sul numero di righe dello statement
				
					if($statement->num_rows > 0): 
		?>
						<h2>Giocatori nel ruolo <?php echo $ruolo_denominazione; ?></h2>
						<table>
								<tr>
									<th>Giocatore</td>
									<th>Ruolo</td>
								</tr>
		<?php
						
								// Bind dello statement con nuove variabili
								$statement->bind_result($giocatore, $ruolo);

								// finché effettua fetch dallo statement
						while ($statement->fetch()): 
		?>
									<tr>
										<td><?php echo $giocatore; ?></td> 
										<td><?php echo $ruolo; ?></t>
									</tr>
		<?php 
						endwhile;
		?>
						</table>
					 
		<?php 
					else: 
		?>             <p><b>Nessun risultato con i valori specificati nella ricerca</b></p>
		<?php
				    endif;		// chiude il controllo sulle righe restituirte dallo statement
				endif;			// chiude il controllo sul valore del ruolo
			endif;				// chiude il controllo su $_POST 
			$mysqli->close();
		?>
	</body>
</html>
<!-- // :) -->
