/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 25/04/2025
    Consegna: Implementazione database simulazione ordinaria 2011, query.

    by jim_bug // :)
*/

/*
OrdineAppartenenza(ID, Nome)
SpecieAnimale(ID, Nome, Estinzione, OrdineAppartenenza)
TipoFlora(ID, Nome)
Regione(ID, Nome)
Responsabile(ID, Nome, Cognome, Data, Username, Password)
Parco(ID, Nome, Regione, Responsabile)
SpecieFlora(ID, Nome, Stagione, TipoFlora)
EsemplareAnimale(ID, Nome, Data, Sesso, Adulto, SpecieAnimale, Parco)
ParcoFlora(Parco, SpecieFlora)
*/

-- 1) Visualizzare l'elenco di tutti gli esemplari di fauna, suddivisi per specie, presenti nei vari parchi:
SELECT EsemplariAnimale.*, SpecieAnimali.Nome, Parchi.Nome
FROM EsemplariAnimale, SpecieAnimali, Parchi
WHERE EsemplariAnimale.Parco = Parchi.ID AND EsemplariAnimale.Specie = SpecieAnimali.ID
ORDER BY SpecieAnimali.Nome;

-- 2) Visualizzare tutti gli esemplari a rischio di estinzione:
SELECT EsemplariAnimale.*
FROM EsemplariAnimale, SpecieAnimali
WHERE SpecieAnimali.Estinzione = TRUE AND EsemplariAnimale.Specie = SpecieAnimali.ID
ORDER BY EsemplariAnimale.Nome;

-- 3) Calcolare e visualizzare il numero di nascite di un certo esemplare nell'arco di un anno di monitoraggio:
SELECT COUNT(*) AS NumeroNascite
FROM EsemplariAnimale, SpecieAnimali
WHERE SpecieAnimali.Nome = 'Orso bruno' AND Data >= '2022-01-01' AND Data < '2023-01-01' AND
EsemplariAnimale.Specie = SpecieAnimali.ID;

-- 4) Calcolare e visualizzare il numero totale di diverse specie di arbusti presenti nei vari parchi della regione:
SELECT COUNT(*) AS NumeroSpecie
FROM Parchi, ParcoFlora, SpecieFlora, TipiFlora, Regioni
WHERE TipoFlora = 'Arbusti' AND Regioni.Nome = 'Sicilia' AND
Parchi.ID = ParcoFlora.Parco
AND SpecieFlora.ID = ParcoFlora.Specie 
AND SpecieFlora.TipoFlora = TipiFlora.ID;

-- 5) Visualizzare quante specie di pino sono presenti in ciascun parco:
SELECT Parchi.ID, COUNT(*) AS NumeroSpeci
FROM Parchi, ParcoFlora, SpecieFlora, TipiFlora
WHERE SpecieFlora.Nome LIKE 'Pino %' AND
Parchi.ID = ParcoFlora.Parco AND
SpecieFlora.ID = ParcoFlora.Specie AND
SpecieFlora.TipoFlora = TipiFlora.ID
GROUP BY Parchi.ID;

-- 6) Calcolare il numero medio dei cuccioli di ciascuna specie presenti in tutti i parchi della regione:
SELECT SpecieAnimale, AVG(NumeroCuccioli) AS NumeroMedioCuccioli
FROM (
    SELECT Parchi.ID, SpecieAnimali.Nome AS SpecieAnimale, COUNT(*) AS NumeroCuccioli
    FROM Parchi, Regioni, SpecieAnimali, EsemplariAnimale
    WHERE EsemplariAnimale.Adulto = FALSE AND Regioni.Nome = 'Abruzzo' AND
    Regioni.ID = Parchi.Regione AND
    SpecieAnimali.ID = EsemplariAnimale.Specie AND
    EsemplariAnimale.Parco = Parchi.ID
    GROUP BY Parchi.ID, SpecieAnimali.Nome
)
GROUP BY SpecieAnimale;

-- 7) Visualizzare l'esemplare più anziano di ogni specie in un determinato parco:
SELECT SpecieAnimali.Nome, EsemplariAnimale.Nome, MIN(EsemplariAnimale.Data)
FROM SpecieAnimali, EsemplariAnimale, Parchi
WHERE Parchi.Nome = 'Parco del Gennargentu' AND Parchi.ID = EsemplariAnimale.Parco AND SpecieAnimali.ID = EsemplariAnimale.Specie
GROUP BY SpecieAnimali.Nome;

-- // :)
