<?php
/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 29/04/2025
    Consegna: Rif. consegna sul classroom (Web e servizi)

    by jim_bug // :)
*/

    session_start();
    session_unset();
    session_destroy();
    header('Location: login.php');
    exit;
?>
