<!-- Autore: Ignazio Leonardo Calogero Sperandeo -->
<!-- Data: 25/10/2024 -->
<!-- Consegna: predisporre due file sequenziali con i dati dei clienti e delle auto dell'attività "Concessionaria"; creare due script PHP che leggano i file e li visualizzino. Predisporre i form per l'inserimento dei dati delle pagine "Nuova auto" e "Nuovo cliente"-->


<!DOCTYPE html>
<html>
    <head>
        <title>Esercizitazione 25/10/2024</title>
    </head>
    <body>
        <form action="./adding.php" method="post">
                <input type="hidden" name="type" value="cliente">
                <table border="1">
                    <tr>
                        <th>Campo</th>
                        <th>Input</th>
                    </tr>
                    <tr>
                        <td>Nome</td>
                        <td><input type="text" name="nome" id="name"></td>
                    </tr>
                    <tr>
                        <td>Cognome</td>
                        <td><input type="text" name="cognome" id="surname"></td>
                    </tr>
                    <tr>
                        <td>Data</td>
                        <td><input type="date" name="data" id="date"></td>
                    </tr>
                    <tr>
                            <td>Sesso</td>
                            <td>
                                <select name="sesso" id="sesso">
                                    <option value="M">M</option>
                                    <option value="F">F</option>
                                    <option value="N">N (not specified)</option>
                                </select>
                            </td>
                    </tr>
                    <tr>
                        <td>Codice Fiscale</td>
                        <td><input type="text" name="cod_fisc" id="code"></td>
                    </tr>
                    <tr>
                        <td>Stato</td>
                        <td><input type="text" name="stato" id="state"></td>
                    </tr>
                    <tr>
                        <td>Regione</td>
                        <td><input type="text" name="regione" id="region"></td>
                    </tr>
                    <tr>
                        <td>Provincia</td>
                        <td><input type="text" name="provincia" id="province"></td>
                    </tr>
                    <tr>
                        <td>Città</td>
                        <td><input type="text" name="citta" id="city"></td>
                    </tr>
                    <tr>
                        <td>Residenza</td>
                        <td><input type="text" name="residenza" id="residence"></td>
                    </tr>
                    <tr>
                        <td>Numero Civico</td>
                        <td><input type="text" name="num_civ" id="house_number"></td>
                    </tr>
                    <tr>
                        <td>CAP</td>
                        <td><input type="text" name="cap" id="cap"></td>
                    </tr>
                    <tr>
                        <td>Numero di telefono</td>
                        <td><input type="text" name="tel" id="tel"></td>
                    </tr>
                </table>
                <input type="submit" value="Invio">
            </form>
            <br />
            <form  action="./print.php" method="post">
                <input type="hidden" name="type" value="cliente">
                Stampa tutte i clienti che hanno acquistato nella tua concessionaria: <input type="submit" value="Stampa">
            </form>
    </body>
</html>
