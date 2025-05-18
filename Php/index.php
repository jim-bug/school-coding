<?php

$username = 'root';
$password = '';
$dbname = 'b';
$hostname = 'localhost';
$options = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
];
try{
    $pdo = new PDO("mysql:host=$hostname;dbname=$dbname", $username, $password, $options);
} catch (PDOException $e){
    echo "Connessione non riuscita";
    die();
}
error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
<!DOCTYPE html>
<html>
    <head>
        <title>Pagina</title>
    </head>
    <body>
    <form action="" method="GET">
    <label for="data_1">Data 1</label>
    <input type="date" name="date_1" id="data_1">

    <label for="data_2">Data 2</label>
    <input type="date" name="date_2" id="data_2">

    <label for="animale">Seleziona animale</label>
    <select name="animale" id="animale">
        <option value="nope">Nessuno</option>
        <?php
            $st = $pdo->query("SELECT ID, Nome FROM Classi ORDER BY Nome")->fetchAll();
            var_dump($st);
            foreach($st as $animal):
        ?>
            <option value="<?php echo htmlspecialchars($animal['ID']); ?>">
                <?php echo htmlspecialchars($animal['Nome']); ?>
            </option>
        <?php endforeach; ?>
    </select>

    <input type="submit" value="Invia">

    <?php
// … codice di connessione e form sopra …

if (!empty($_GET['date_1']) && !empty($_GET['date_2'])) {
    // query base con JOIN
    $sql = "
      SELECT Speci.Nome, Eta, COUNT(*) AS Numero
      FROM Schede
      JOIN Speci ON Speci.ID = Schede.Specie
      JOIN Classi cl  ON Classi.ID = sp.Classe
      WHERE sch.Data >= ?
        AND sch.Data <= ?
    ";
    $params = [$_GET['date_1'], $_GET['date_2']];

    // filtro opzionale per classe
    if ($_GET['animale'] !== 'nope') {
      $sql   .= " AND cl.ID = ?";
      $params[] = $_GET['animale'];
    }

    $sql .= " GROUP BY sp.Nome, sch.Eta";

    $stmt    = $pdo->prepare($sql);
    $stmt->execute($params);
    $animals = $stmt->fetchAll();

    if ($animals):
?>
      <table border="1">
        <tr><th>Nome</th><th>Età</th><th>Numero</th></tr>
        <?php foreach ($animals as $a): ?>
        <tr>
          <td><?php echo htmlspecialchars($a['Nome'],   ENT_QUOTES); ?></td>
          <td><?php echo htmlspecialchars($a['Eta'],    ENT_QUOTES); ?></td>
          <td><?php echo htmlspecialchars($a['Numero'], ENT_QUOTES); ?></td>
        </tr>
        <?php endforeach; ?>
      </table>
<?php
    else:
      echo "<p>NESSUN RISULTATO SULLE DATE SELEZIONATE</p>";
    endif;
} else {
    echo "<p>Per favore inserisci entrambe le date.</p>";
}
$pdo = null;
?>