<?php
/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 02/06/2025
    Consegna: Porzione di codice significativa che interroghi il database.

    by jim-bug // :)
*/
include_once 'db.php';

?>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simulazione Scolastica</title>
</head>
<body>
    <h1>Simulazione Scolastica</h1>
    <p>Benvenuto nella simulazione scolastica. Qui puoi interagire con il database per visualizzare e gestire i dati.</p>
    <form action="" method="POST">
        <select name="classe_animale">
            <option value="">Seleziona una classe di animali</option>
            <?php
                $animals = $pdo->query("SELECT ID, Nome FROM Ordini")->fetchAll();
                foreach ($animals as $animal):
            ?>
                    <option value="<?= $animal['ID'] ?>"><?= htmlspecialchars($animal['Nome']) ?></option>
            <?php endforeach; ?>
        </select>
        <label for="date_1">Data_1</label>
        <input type="date" name="date_1" id="date_1">
        <label for="date_2">Data_2</label>
        <input type="date" name="date_2" id="date_2">
        <button type="submit">Invia</button>
    </form>

    <?php
    if ($_POST):
        $query = <<<SQL
            SELECT Specie.Nome AS A, Eta.Nome AS B, COUNT(*) AS NumeroSoggetti
            FROM Specie, Eta, Animali
            WHERE Data >= ? AND Data < ? AND
            Specie.ID = Animali.Specie AND
            Animali.Eta = Eta.ID
        SQL;
        $classe_animale = $_POST['classe_animale'];
        $date_1 = $_POST['date_1'];
        $date_2 = $_POST['date_2'];
        $params = [$date_1, $date_2];
        if ($classe_animale) {
            $query .= " AND Specie.Ordine = ?";
            $params[] = $classe_animale;
        }
        $query .= " GROUP BY Specie.Nome, Eta.Nome ORDER BY Specie.Nome";
        $stmt = $pdo->prepare($query);
        $stmt->execute($params);
        $results = $stmt->fetchAll();
        if ($results):
    ?>
        <table border="1">
            <tr>
                <th>Specie</th>
                <th>Età</th>
                <th>Numero Soggetti</th>
            </tr>
            <?php foreach ($results as $row): ?>
                <tr>
                    <?php 
                        foreach ($row as $key => $value) :
                    ?>
                        <td><?= htmlspecialchars($value) ?></td>
                <?php endforeach; ?>
                </tr>
            <?php endforeach; ?>
        </table>
        <?php else: ?>
            <p>Nessun risultato trovato.</p>
        <?php endif; ?>
    <?php endif; ?>
</body>
<?php
    $pdo = null;
?>

<!-- // :) -->
 