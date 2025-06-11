<?php
/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 11/06/2025
    Consegna: Porzione di codice significativa che interroghi il database.

    by jim-bug // :)
*/
include_once 'db.php';
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

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
        <select name="nomi_cavallo">
            <option value="">Seleziona un Cavallo</option>
            <?php
                $cavalli = $pdo->query("SELECT ID, Nome FROM Cavalli")->fetchAll();
                foreach ($cavalli as $cavallo):
            ?>
                    <option value="<?= $cavallo['ID'] ?>"><?= htmlspecialchars($cavallo['Nome']) ?></option>
            <?php endforeach; ?>
        </select>
        <input type="submit" value="Invia">
    </form>

    <?php
    if ($_POST):
        $query = <<<SQL
            SELECT MAX(Durata) AS DurataGara
            FROM Gare, Partecipazioni, Cavalli
            WHERE Gare.Codice = Partecipazioni.Gara AND
            Partecipazioni.Cavallo = ?;
        SQL;
        $stmt = $pdo->prepare($query);
        $stmt->execute([$_POST['nomi_cavallo']]);
        $results = $stmt->fetch();
        if ($results):
    ?>
        <table border="1">
            <tr>
                <th>Durata Gara</th>
            </tr>
            <tr>
                <td><?php echo $results['DurataGara']?></td>
            </tr>
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
 