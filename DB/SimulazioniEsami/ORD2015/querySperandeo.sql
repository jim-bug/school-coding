/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 04/05/2025
    Consegna: Implementazione database simulazione ordinaria 2015, query.

    by jim_bug // :)
*/


-- 1) Elenco degli eventi già svolti, in ordine alfabetico di provincia:
SELECT Eventi.*
FROM Eventi, Luoghi, Citta, Province
WHERE Data <= CURDATE() AND Eventi.Luogo = Luoghi.ID AND
Luoghi.Citta = Citta.ID AND
Citta.Provincia = Province.ID
ORDER BY Province.Nome;

-- 2) Elenco dei membri che non hanno mai inserito un commento:
SELECT Membri.*
FROM Membri
LEFT JOIN Post ON Membri.ID = Post.Membro
WHERE Post.Membro IS NULL;

-- 3) Per ogni evento il voto medio ottenuto in ordine di categoria e titolo:
SELECT Eventi.ID, AVG(Post.Voto)
FROM Eventi, Post, Categorie
WHERE Eventi.ID = Post.Evento AND Categorie.ID = Eventi.Categoria
GROUP BY Eventi.ID
ORDER BY Categorie.Nome, Eventi.Titolo;

-- 4) I dati dell'utente che ha registrato il maggior numeri di eventi:
SELECT Membri.*, COUNT(*) AS NumeroEventi
FROM Membri, Eventi
WHERE Membri.ID = Eventi.Membro
GROUP BY Membri.ID
HAVING COUNT(*) >= ALL (
    SELECT COUNT(*)
    FROM Eventi
    GROUP BY Membro
);

-- 5) Tutti i membri che hanno registrato un numero di eventi superiore alla media, ma che non sono quelli che l'hanno fatto più di tutti:
SELECT Membri.*, COUNT(*) AS NumeroEventi
FROM Membri, Eventi
WHERE Membri.ID = Eventi.Membro
GROUP BY Membri.ID
HAVING COUNT(*) >= (
    SELECT AVG(query.NumeroEventi)
    FROM (
        SELECT COUNT(*) AS NumeroEventi
        FROM Membri, Eventi
        WHERE Membri.ID = Eventi.Membro
        GROUP BY Membri.ID
    ) AS query
) AND COUNT(*) != (
    SELECT MAX(query.NumeroEventi)
    FROM (
        SELECT COUNT(*) AS NumeroEventi
        FROM Membri, Eventi
        WHERE Membri.ID = Eventi.Membro
        GROUP BY Membri.ID
    ) AS query
)
ORDER BY Membri.Nome, Membri.Cognome;

-- 5) Oppure:
CREATE VIEW NumeroEventiPerMembro AS
SELECT Membri.*, COUNT(*) AS NumeroEventi
FROM Membri, Eventi
WHERE Membri.ID = Eventi.Membro
GROUP BY Membri.ID;

SELECT Membri.*, COUNT(*) AS NumeroEventi
FROM NumeroEventiPerMembro
WHERE NumeroEventi >= (
    SELECT AVG(NumeroEventi)
    FROM NumeroEventiPerMembro
) AND NumeroEventi != (
    SELECT MAX(query.NumeroEventi)
    FROM NumeroEventiPerMembro
)
ORDER BY Membri.Nome, Membri.Cognome;

-- // :)
