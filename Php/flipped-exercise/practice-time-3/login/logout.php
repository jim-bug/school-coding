<?php
/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 10/05/2025
    Consegna: Rif. flipped-classroom practice-time 3

    by jim_bug // :)
*/
    session_start();
    session_unset();
    session_destroy();
    header('Location: login.php');
    exit;
?>
