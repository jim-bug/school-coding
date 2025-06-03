/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 02/06/2025
    Consegna: Query proposte nella simulazione della seconda prova del 16/05/2025

    by jim-bug // :)
*/

-- 1) Elenco alfabetico dei veterinari del centro con la propria e-mail e numero di telefono:
SELECT Operatori.*
FROM Operatori, TipologieOperatore
WHERE TipologiaOperatori.Nome = 'Veterinari' AND Operatori.Tipologia = TipologieOperatore.ID
ORDER BY Operatori.Nome, Cognome;

-- 2) Elenco delle specie trattate nel mese di gennaio del corrente anno (senza duplicati):
SELECT DISTINCT Specie.*
FROM Specie, Animali
WHERE Data >= '2025-01-01' AND Data < '2025-02-01' AND Specie.ID = Animali.Specie
ORDER BY Nome;

-- 3) Elenco del numero di soggetti trattati suddivisi per specie e età nel corso del 2022:
SELECT Specie.Nome, Eta.Nome, COUNT(*) AS NumeroSoggetti
FROM Specie, Eta, Animali
WHERE Data >= '2022-01-01' AND Data < '2023-01-01' AND
Specie.ID = Animali.Specie AND
Animali.Eta = Eta.ID
GROUP BY Specie.Nome, Eta.Nome
ORDER BY Specie.Nome, Eta.Nome;

-- 4) Il veterinario che nel periodo tra il 2021 e il 2022 ha partecipato al maggior numero di interventi chirurgici su mammiferi:
SELECT Operatori.*, COUNT(*)
FROM Includere, Terapie, Animali, Operatori, TipologieOperatori, Specie, Ordini
WHERE TipologiaOperatori.Nome = 'Veterinari' AND
Terapie.Data >= '2021-01-01' AND
Terapie.Data < '2023-01-01' AND
Ordini.Nome = 'Mammiferi' AND
Terapie.Chirurgico = TRUE AND
Includere.Terapia = Terapie.ID AND
Includere.Operatore = Operatori.ID AND
Terapie.Animale = Animali.ID AND
Animali.Specie = Specie.ID AND
Specie.Ordine = Ordini.ID AND
TipologieOperatori.ID = Operatori.Tipologia
GROUP BY Operatori.ID
HAVING COUNT(*) = (
    SELECT MAX(query.NumeroInterventi)
    FROM (
        SELECT COUNT(*) AS NumeroInterventi
        FROM Includere, Terapie, Animali, Operatori, TipologieOperatori, Speice, Ordini
        WHERE TipologiaOperatori.Nome = 'Veterinari' AND
        Terapie.Data >= '2021-01-01' AND
        Terapie.Data < '2023-01-01' AND
        Ordini.Nome = 'Mammiferi' AND
        Terapie.Chirurgico = TRUE AND
        Includere.Terapia = Terapie.ID AND
        Includere.Operatore = Operatori.ID AND
        Terapie.Animale = Animali.ID AND
        Animali.Specie = Specie.ID AN
        Specie.Ordine = Ordini.ID AND
        TipologieOperatori.ID = Operatori.Tipologia
        GROUP BY Operatori.ID
    ) AS query
)
ORDER BY Cognome, Operatori.Nome;


-- Query 4, altro modo:
CREATE VIEW NumeroInterventi AS
SELECT Operatori.*, COUNT(*) AS Numero
FROM Includere, Terapie, Animali, Operatori, TipologieOperatori, Specie, Ordini
WHERE TipologieOperatori.Nome = 'Veterinari' AND
Terapie.Data >= '2021-01-01' AND
Terapie.Data < '2023-01-01' AND
Ordini.Nome = 'Mammiferi' AND
Terapie.Chirurgico = TRUE AND
Includere.Terapia = Terapie.ID AND
Includere.Operatore = Operatori.ID AND
Terapie.Animale = Animali.ID AND
Animali.Specie = Specie.ID AND
Specie.Ordine = Ordini.ID AND
TipologieOperatori.ID = Operatori.Tipologia
GROUP BY Operatori.ID;

SELECT *
FROM NumeroInterventi
WHERE Numero = (SELECT MAX(Numero) FROM NumeroInterventi);


-- Query 3 rivisitata per il codice richiesto:

-- // :)
