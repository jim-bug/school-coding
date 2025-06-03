<?php
$username = 'root';
$password = 'rotoremindme';
$hostname = 'localhost';
$db_name = 'bbM';
$dsn = 'mysql:host=' . $hostname . ';dbname=' . $db_name;
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