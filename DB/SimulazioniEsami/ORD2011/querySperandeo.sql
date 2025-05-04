/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 25/04/2025
    Consegna: Implementazione database simulazione ordinaria 2011, query.

    by jim_bug // :)
*/



-- 1) Visualizzare l'elenco di tutti gli esemplari di fauna, suddivisi per specie, presenti nei vari parchi:
SELECT EsemplariAnimale.*, SpecieAnimale.Nome, Parchi.Nome
FROM EsemplariAnimale, SpecieAnimale, Parchi
WHERE EsemplariAnimale.Parco = Parchi.ID AND EsemplariAnimale.Specie = SpecieAnimale.ID;

-- 2) Visualizzare tutti gli esemplari a rischio di estinzione:
SELECT EsemplariAnimale.*
FROM EsemplariAnimale, SpecieAnimale
WHERE SpecieAnimale.Estinzione = True AND EsemplariAnimali.Specie = SpecieAnimale.ID;

-- 3) Calcolare e visualizzare il numero di nascite di un certo esemplare nell'arco di un anno di monitoraggio:
SELECT COUNT(*) AS NumeroNascite
FROM EsemplariAnimale, SpecieAnimali
WHERE SpecieAnimale.Nome = 'Orso' AND Data >= '2022-01-01' AND Data < '2023-01-01' AND
EsemplariAnimali.Specie = SpecieAnimali.ID

-- 4) Calcolare e visualizzare il numero totale di diverse specie di arbusti presenti nei vari parchi della regione:
SELECT COUNT(*) AS NumeroSpecie
FROM Parchi, ParcoFlora, SpecieFlora, TipiFlora, Regioni
WHERE TipoFlora = 'Arbusti' AND Regioni.Nome = 'Sicilia' AND
Parchi.ID = ParcoFlora.Parco
AND SpecieFlora.ID = ParcoFlora.Specie 
AND SpecieFlora.Tipo = TipiFlora.ID;

-- 5) Visualizzare quante specie di pino sono presenti in ciascun parco:
SELECT Parchi.ID, COUNT(*) AS NumeroSpeci
FROM Parchi, ParcoFlora, SpecieFlora
WHERE SpecieFlora.Nome LIKE 'Pino%' AND
Parchi.ID = ParcoFlora.Parco AND
SpecieFlora.ID = ParcoFlora.Flora AND
SpecieFlora.Tipo = TipiFlora.ID
GROUP BY Parchi.ID;

-- 6) Calcolare il numero medio dei cuccioli di ciascuna specie presenti in tutti i parchi della regione:
SELECT query.Specie, AVG(query.NumeroCuccioli) AS NumeroMedioCuccioli
FROM (
    SELECT Parchi.ID, SpecieAnimale.Nome AS Specie, COUNT(*) AS NumeroCuccioli
    FROM Parchi, Regioni, SpecieAnimale, EsemplariAnimale
    WHERE NOT EsemplariAnimale.Adulto AND Regione.Nome = 'Sicilia' AND
    Regione.ID = Parchi.Regione AND
    SpecieAnimale.ID = EsemplariAnimale.Specie AND
    EsemplariAnimale.Parco = Parchi.ID
    GROUP BY Parchi.ID, SpecieAnimale.Nome
) AS query
GROUP BY query.Specie;

-- 7) Visualizzare l'esemplare più anziano di ogni specie in un determinato parco:
SELECT SpecieAnimale.Nome, EsemplariAnimale.Nome, MIN(EsemplariAnimali.Data)
FROM SpecieAnimale, EsemplariAnimale, Parchi
WHERE Parchi.Nome = 'Central Kinki Park' AND Parchi.ID = EsemplariAnimale.Parco AND SpecieAnimale.ID = EsemplariAnimale.Specie
GROUP BY SpecieAnimale.Nome;

-- // :)
