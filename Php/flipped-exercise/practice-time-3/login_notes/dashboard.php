<?php
/*
    // se stai lavorando, leva i commenti // :)
    ini_set('display_errors', 1);
    error_reporting(E_ALL);
*/
  session_start();
  require_once 'db.php';
  if (!isset($_SESSION['id'])) {
      header('Location: login.php');
      exit;
  }

?>


<!DOCTYPE html>
<html lang="it">  
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="dashboard.css">
  <title>Dashboard</title>
</head>
<body>
  <div class="dashboard">
    <h1>Benvenuto, <?= htmlspecialchars($_SESSION['username']) ?>!</h1>
    <p>Sei nella tua area riservata.<br />Adesso puoi visualizzare le tue note per tipologia!</p>
    <form action="" method="GET">
      <select name="tipo">
          <?php 
              $query = "SELECT ID, Nome FROM Tipi ORDER BY Nome";
              $stmt = $pdo->query($query);
              $types = $stmt->fetchAll();
              if($types):
                  foreach($types as $type):
          ?>
                  <option value='<?php echo $type['ID']; ?>'><?php echo htmlspecialchars($type['Nome']) ?></option>
          <?php
              endforeach;
              else:
          ?>
              <option value=""></option>
          <?php
              endif;
          ?>
        </select>
      <button type="submit">Carica</button>
    </form>
    <p>Inserisci una nota: <a href="insert.php">Inserisci</a>.</p>

    <?php
      if($_GET):
        $stmt = $pdo->prepare("
          SELECT Titolo, Contenuto, DataCreazione
          FROM Note
          WHERE Note.Tipo = ? AND Note.Utente = ?
          ORDER BY DataCreazione DESC
        ");
        $stmt->execute([$_GET['tipo'], $_SESSION['id']]);
        $notes = $stmt->fetchAll();
        if($notes):
    ?>
    <table border='1'>
            <tr>
              <th>Titolo</t>
              <th>Contenuto</th>
              <th>Data di Creazione</th>
            </tr>
      <?php
            foreach($notes as $note):
      ?>
            <tr>
      <?php
                foreach($note as $value):
      ?>
                  <td><?php echo htmlspecialchars($value); ?></td>
      <?php 
                endforeach;
      ?>
            </tr>
      <?php
            endforeach;
      ?>
    </table>
    <?php
        endif;
      endif;
    ?>    
    <p><a href="logout.php">Esci</a></p>
  </div>
</body>
</html>
<?php 
$pdo = null;
?>
<!-- // :) -->
