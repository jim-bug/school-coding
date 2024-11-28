<!DOCTYPE html>
<html>
<head>
	<title> Esercizio_15/10/2024 </title>
</head>
<body>

<?php

$clienti = [
	nome => "Ignazio Leonardo Calogero",
	cognome => "Sperandeo",
	anno => "2007",
	codice_fiscale => "AAAAAAAAAAAAAAAA",
	numero_telefono => "333 333 3333"
];
echo "<h1> Stampa di un Array Associativo </h1>";
foreach($clienti as $k => $v){
	echo "<p style=\"color:red\"> $k: $v <br /></p>";
}

?>
</body>
</html>
