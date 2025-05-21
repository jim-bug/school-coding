<?php
session_start();
require_once 'db.php';

    ini_set('display_errors', 1);
    error_reporting(E_ALL);

$status = false;
$error = '';
if($_GET){
    if(!$_SESSION['id']){
        $error = "Utente non autenticato";
    }
    else if($_GET['titolo'] && $_GET['contenuto'] && $_GET['tipo']){
        $stmt = $pdo->prepare("INSERT INTO Note (Titolo, Contenuto, Tipo, Utente) VALUES (?, ?, ?, ?)");
        $status = $stmt->execute([$_GET['titolo'], $_GET['contenuto'], $_GET['tipo'], $_SESSION['id']]);
        if(!$status){
            $error = "Nota non caricata";
        }
    } else {
        $error = "Compila tutti i campi!";
    }
}
?>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="insert.css">
    <title>Carica Nota</title>
</head>
<body>
    <form action="" method='GET'>
        <table>
                <tr>
                    <th>Titolo</th>
                    <th>Contenuto</th>
                    <th>Tipo</th>
                </tr>
                <tr>
                    <td>
                        <input type="text" name="titolo" id="titolo" required>
                    </td>
                    <td>
                        <textarea
                        name="contenuto"
                        id="contenuto"
                        rows="5"
                        required
                        style="width:100%; padding:0.5rem; border:1px solid #ccc; border-radius:4px;"
                        ></textarea>
                    </td>
                    <td>
                            <select name="tipo">
                                <?php 
                                    $query = "SELECT ID, Nome FROM Tipi";
                                    $stmt = $pdo->query($query);
                                    $types = $stmt->fetchAll();
                                    if($types):
                                        foreach($types as $type):

                                ?>
                                        <option value='<?php echo $type['ID']; ?>'><?php echo $type['Nome'] ?></option>
                                <?php
                                    endforeach;
                                    else:
                                ?>
                                    <option value=""></option>
                                <?php
                                    endif;
                                ?>
                        </select> 
                    </td>
                </tr>

                <br>
                <?php if (!empty($error)): ?>
                    <div class="error"><?= htmlspecialchars($error) ?></div>
                <?php elseif ($status): ?>
                    <div class="success">Nota caricata con successo</div>
                <?php endif; ?>
                <tr><td><button type="submit">Carica</button></td></tr>
        </table>
        <p>Visualizza le tue note <a href="dashboard.php">Guarda!</a>.</p>
        <p>Non hai ancora un account? <a href="register.php">Registrati</a>.</p>
        <p>Hai già un account? <a href="login.php">Entra nella tua area personale</a>.</p>
    </form>
</body>
<?php
    $pdo = null;
?>
