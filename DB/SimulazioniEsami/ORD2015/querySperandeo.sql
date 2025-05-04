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
    WHERE Membro
    GROUP BY Membro
);

-- // :)
