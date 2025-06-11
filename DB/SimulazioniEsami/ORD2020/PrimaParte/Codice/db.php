<?php
/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 11/06/2025
    Consegna: Porzione di codice significativa che interroghi il database.

    by jim-bug // :)
*/

    $username = 'root';
    $password = 'rotoremindme';
    $hostname = 'localhost';
    $db_name = 'oo';
    $dsn = "mysql:host=$hostname;dbname=$db_name";
    $options = [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ];
    try{
        $pdo = new PDO($dsn, $username, $password, $options);
    } catch (PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
        exit;
    }
?>