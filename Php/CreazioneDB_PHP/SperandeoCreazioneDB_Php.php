
<?php
/*
Autore: Ignazio Leonardo Calogero Sperandeo
Data: 20/03/2025
Consegna: Sfruttando PHP con i PDO create un database, create 3 tabelle all'interno del DB stesso e gestite le eccezioni. 
Provate a vedere autonomamente come effettuare delle interrogazioni SQL tramite prepared statements e i bindParam ed eseguitele nel codice PHP.

by jim_bug // :)
*/ 


// error_reporting(E_ALL);
// ini_set('display_errors', 1);

function insertRecord(PDO $conn, string $tableName, array $data){
    $colonne = implode(', ', array_keys($data));
    $placeholders = ":" .  implode(", :", array_keys($data));
    $insert = "INSERT INTO $tableName ($colonne) VALUES ($placeholders)";

    $stmt = $conn->prepare($insert);
    foreach( $data as $key => $value ){
        $stmt->bindValue(":".$key, $value);     // stessa funzione di .bindParam(), ma il passaggio avviene per valore.
    }
    $stmt->execute();
}

$authors = [
    [
        'Nome' => 'Ignazio',
        'Cognome' => 'Sperandeo',
        'Data' => '2007-03-15'
    ],
    [
        'Nome' => 'Marco',
        'Cognome' => 'Guscio',
        'Data' => '2000-09-10'
    ],
    [
        'Nome' => 'Giovanni',
        'Cognome' => 'Bianchi',
        'Data' => '1980-05-20'
    ],
    [
        'Nome' => 'Luca',
        'Cognome' => 'Verdi',
        'Data' => '1990-11-11'
    ],
    [
        'Nome' => 'Alessandro',
        'Cognome' => 'Rossi',
        'Data' => '1975-12-05'
    ]
];
$books = [
    [
        'ISBN' => '0000000000001',
        'Titolo' => 'Il mare affogato',
        'Autore' => 1
    ],
    [
        'ISBN' => '0000000000002',
        'Titolo' => 'La sabbia persa',
        'Autore' => 2
    ],
    [
        'ISBN' => '0000000000003',
        'Titolo' => 'La vita in musica',
        'Autore' => 3
    ],
    [
        'ISBN' => '0000000000004',
        'Titolo' => 'Il sogno di carta',
        'Autore' => 1
    ],
    [
        'ISBN' => '0000000000005',
        'Titolo' => 'Note di passione',
        'Autore' => 1
    ]
];

$tables = [
    'CREATE TABLE  IF NOT EXISTS Autori(
        ID INT AUTO_INCREMENT,
        Nome VARCHAR(30) NOT NULL,
        Cognome VARCHAR(30) NOT NULL,
        Data DATE NOT NULL,
        PRIMARY KEY(ID)
    )',
    'CREATE TABLE IF NOT EXISTS Libri (
        ISBN VARCHAR(13) NOT NULL,
        Titolo VARCHAR(30),
        Autore INT,
        PRIMARY KEY(ISBN),
        FOREIGN KEY (Autore) REFERENCES Autori(ID)
    )'
];

$username = 'root';
$password = 'ga5spare}';
$name = 'localhost';
$dsn = "mysql:host=$name";
$options = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
];
$conn = new PDO($dsn, $username, $password, $options);
?>

<!DOCTYPE html>
<html> 
    <head>
        <title>Creazione DB</title>
    </head>
    <body>
        <h1 align="center">Creazione database e tabelle</h1>
        <?php
            try{
                $entry = 'CREATE DATABASE IF NOT EXISTS SperandeoBibliotecaPhp';
                $conn->exec($entry);
                $entry = 'USE SperandeoBibliotecaPhp';
                $conn->exec($entry);
            } catch(PDOException $e){ ?>
                <h2>Errore: <?php echo $entry . "errore -> " . $e->getMessage(); ?></h2>
        <?php 
            } 
        ?>

        <?php
            foreach ($tables as $table):
                try{
                    $conn->exec($table);
                } catch(PDOException $e){ ?>
                    <h2>Errore: <?php echo $table . "errore -> " . $e->getMessage(); ?></h2>
                    
        <?php   } 
            endforeach; 
        ?>

        <?php
            foreach ($authors as $author):
                try{
                    insertRecord($conn, 'Autori', $author); ?>
                    <h5>Inserimento Autore: <?php echo $author['Nome']; ?></h5>
        <?php   } catch(PDOException $e) { ?>
                    <h5>Errore inserimento Autore: <?php echo $author['Nome'] . " " . $e->getMessage(); ?></h5>
        <?php   }
            endforeach;
        ?>

        <?php
            foreach ($books as $book):
                try{
                    insertRecord($conn, 'Libri', $book); ?>
                    <h5>Inserimento Libro: <?php echo $book['Titolo']; ?></h5>
        <?php   } catch(PDOException $e) { ?>
                    <h5>Errore inserimento Libro: <?php echo $book['Titolo'] . " " . $e->getMessage(); ?></h5>
        <?php   }
            endforeach;
        ?>
        <table border="1" align="center">
            <tr>
                <th>Nome</th>
                <th>Cognome</th>
                <th>Titolo</th>
            </tr>
            
                <?php
                    $query = "
                            SELECT Autori.Nome, Autori.Cognome, Libri.Titolo
                            FROM Autori, Libri
                            WHERE (Autori.Nome = :Nome OR Autori.Nome = :Nome_2) AND Autori.ID = Libri.Autore;";
                    // $conn->prepare($query)->execute([':Nome' => 'Ignazio']);
                    $stmt = $conn->prepare($query);
                    $stmt->bindValue(':Nome', 'Ignazio');
                    $stmt->bindValue(':Nome_2', 'Marco');
                    $stmt->execute();
                    $result = $stmt->fetchAll();
                    foreach($result as $row): ?>
                    <tr>
                        <?php foreach($row as $column => $value): ?>
                            <td><?php echo $value; ?></td>
                        <?php endforeach; ?>
                    </tr>
                    <?php endforeach; ?>  
        </table>
        <footer align="center">
            <p><i>Autore: Ignazio Leonardo Calogero Sperandeo</i></p>
            <p><i>Classe: 5C Inf.</i></p>
            <p><i>Data: 23/03/2025</i></p>
        </footer>
    </body> 
</html>
<?php
    $conn = null;
?>