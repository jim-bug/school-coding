/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 11/06/2025
    Consegna: Query proposte nella simulazione ordinaria 2015

    by jim-bug // :)
*/

-- 1) Visualizzare le prenotazione per risorse appartenenti ad una certa categoria di cui è fornita il nome:
SELECT DataInizio, DataFine, Risorse.Nome
FROM Prenotazioni, Risorse, Categorie
WHERE Categoria = 'Tablet' AND
Risorse.Categoria = Categoria.ID AND
Risorse.ID = Prenotazioni.Risorsa
ORDER BY Risorse.Nome;

-- 2) Visualizzare l'elenco delle categorie di cui esiste almeno una risorsa per un centro specificato in base al nome:
SELECT Categorie.*, COUNT(*)
FROM Categorie, Risorse, Centri
WHERE Centri.Nome = 'Centro Catania' AND
Categorie.ID = Risorse.Categoria AND
Risorse.Centro = Centri.ID
GROUP BY Categorie.ID
ORDER BY Categorie.Nome

-- 3) Visualizzare l'elenco delle risorse attualmente in prestito da più di 180 giorni in ordine alfabetico di centro e categoria:
SELECT Risorse.*
FROM Risorse, Categorie, Centri, Prestiti
WHERE DataFine IS NULL AND
DATEDIFF(CUR_DATE, DataInizio) > 180 AND
Prestiti.Risorsa = Risorse.ID AND
Risorse.Categoria = Categorie.ID AND
Risorse.Centro = Centri.ID
ORDER BY Centri.Nome, Categoria.Nome;

-- 4) Visualizzare la categoria più utilizzata, cioè la categoria le cui risorse hanno il maggior numero numero di prestiti:
SELECT Categorie.*, COUNT(*)
FROM Categorie, Risorse, Prestiti
WHERE Categorie.ID = Risorse.Categoria AND Prestiti.Risorsa = Risorse.ID
GROUP BY Categorie.ID
HAVING COUNT(*) = (
    SELECT COUNT(*) AS Utilizzo
    FROM Categorie, Risorse, Prestiti
    WHERE Categorie.ID = Risorse.Categoria AND Prestiti.Risorsa = Risorse.ID
    GROUP BY Categorie.ID
    ORDER BY Utilizzo DESC
    LIMIT 1
);

-- // :)
