<!-- Autore: Ignazio Leonardo Calogero Sperandeo -->
<!-- Data: 18/10/2024 -->
<!-- Consegna: Sperimentazione con i form. -->
<?php

if($_POST['username'] == "jim_bug" && $_POST['password'] == "1234"){
    echo "<p> SUCCESSFUL LOGIC </p>";  
}
else{
    echo "<p> BAD LOGIC </p>"; 
}
?>