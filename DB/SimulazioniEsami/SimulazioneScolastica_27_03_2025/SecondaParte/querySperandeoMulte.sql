/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 27/03/2025
    Consegna: Simulazione Seconda Prova Informatica, svolgere le seguenti query, seconda parte.

    by jim_bug // :)
*/

-- 1) Per ogni vigile, il numero di multe effettuate:
SELECT Vigili.*, COUNT(Multe.ID) AS Numero_Multe
FROM Vigili, Multe
WHERE Vigili.Matricola = Multe.Vigile
GROUP BY Vigili.Matricola
ORDER BY Cognome, Nome;

-- // :)
