<?php
    // Nulla da vedere qui, grazie!
    session_start();
    session_unset();
    session_destroy();
    header('Location: login.php');
    exit;
?>
