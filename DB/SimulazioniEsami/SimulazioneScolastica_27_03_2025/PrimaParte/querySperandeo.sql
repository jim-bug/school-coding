/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 27/03/2025
    Consegna: Simulazione Seconda Prova Informatica, svolgere le seguenti query, prima parte.

    by jim_bug // :)
*/

-- 1) Elenco dei docenti, che hanno fatto richiesta di risorse, con numeri di richieste fatte:
SELECT Cognome, Nome, COUNT(Richieste.ID)
FROM Docenti, Richieste
WHERE Docenti.ID = Richieste.Docente
GROUP BY Docenti.ID
ORDER BY Cognome, Nome;

-- 2) Elenco delle risorse prenotate nel primo quadrimestre:
SELECT Risorse.*
FROM Risorse, Richieste
WHERE Data >= '2024-09-01' AND Data < '2025-02-01' AND Risorse.Codice = Richieste.Risorsa
ORDER BY Denominazione;

-- 3) La categoria maggiormente usata:
SELECT Categorie.*, COUNT(Categorie.ID) AS Conteggio
FROM Categorie, Risorse
WHERE Categorie.ID = Risorse.Categoria
GROUP BY Categorie.ID
HAVING COUNT(Categorie.ID) = (
    SELECT MAX(query.Numero)
    FROM (
        SELECT COUNT(Categorie.ID) AS Numero
        FROM Categorie, Risorse
        WHERE Categorie.ID = Risorse.Categoria
        GROUP BY Categorie.ID
    ) AS query
)
ORDER BY Categorie.Nome;

-- // :)
