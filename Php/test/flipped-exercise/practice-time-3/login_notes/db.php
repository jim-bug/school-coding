<?php
/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 29/04/2025
    Consegna: Rif. consegna sul classroom (Web e servizi)

    by jim_bug // :)
*/
$username = 'root';
$password = '';
$address = 'localhost';
$db_name = 'A';
$dsn = "mysql:host=$address;dbname=$db_name;charset=utf8mb4";

$options = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES => false,
];

try {
    $pdo = new PDO($dsn, $username, $password, $options);
    
} catch (PDOException $e) {
    throw new PDOException($e->getMessage(), (int)$e->getCode());
}
?>
<!-- // :) -->
