<?php 
    /*
    * Autore: Ignazio Leonardo Calogero Sperandeo
    * Classe: 5C INF
    * Data: 28/11/2024
    * by jim_bug // :)
    */ 
    include "./includes/header.php"; 
?>
    <link rel="stylesheet" href="./css/style.css">
<?php include "./includes/main.php"; ?>
<h3>Consegna del progetto: </h3>
<p>Occorre gestire le operazioni di prestito dei libri di una biblioteca universitaria. <br />
I prestiti dei libri possono essere effettuati soltanto a studenti. <br />
Per ogni prestito va segnata: <br />
</p>
<ol>
    <li><b>La data del prestito del libro</b></li>
    <li><b>La data di restituzione del libro</b></li>
    <li>
        <b>Stato consegna e riconsegna:</b>
        <ul>
            <li><b>Buono</b></li>
            <li><b>Discreto</b></li>
            <li><b>Cattivo</b></li>
        </ul>
    </li>
</ol>
<p>Per ogni libro va segnato: <br /></p>
<ol>
    <li><b>Titolo</b></li>
    <li><b>Autori</b></li>
    <li><b>Prezzo</b></li>
    <li><b>Codice ISBN</b></li>
    <li>
        <b>Casa editrice</b> con:
            <ul>
                <li><b>Indirizzo</b></li>
                <li><b>Comune</b></li>
                <li><b>Provincia</b></li>
                <li><b>Telefono</b></li>
                <li><b>Email</b></li>
            </ul>
        </li>
</ol>
<p>I dati principali dello studente sono: </p>
<ol>
    <li><b>Cognome</b></li>
    <li><b>Nome</b></li>
    <li><b>Data di Nascita</b></li>
    <li><b>Luogo di Nascita</b></li>
    <li><b>Matricola</b></li>
    <li><b>Telefono</b></li>
</ol>
<?php include "./includes/footer.php"; ?>
<!-- // :) -->
