/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 07/05/2025
    Consegna:

    by jim_bug // :)
*/

-- 1) Trovare matricola e cognome degli impiegati che guadagnano più di 50 milioni:
SELECT Matricola, Cognome
FROM Impiegati
WHERE Stipendio > 50000000
ORDER BY Cognome;

-- 2) Trovare cognome e stipendio degli impiegati che lavorano a roma:
SELECT Cognome, Stipendio
FROM Impiegati, Dipartimento
WHERE Sede = 'Roma' AND Impiegati.Dipartimento = Dipartimenti.Codice
ORDER BY Cognome;

-- 3) Trovare cognome degli impiegati e nome del dipartimento in cui lavorano:
SELECT Cognome, Nome
FROM Impiegati, Dipartimenti
WHERE Impiegati.Dipartimento = Dipartimenti.Codice
ORDER BY Cognome;

-- 4) Trovare cognome degli impiegati che sono direttori di dipartimento:
SELECT Cognome
FROM Impiegati, Dipartimenti
WHERE Impiegati.Matricola = Dipartimenti.Direttore
ORDER BY Cognome;

-- 5) Trovare i nomi dei progetti e i cognomi dei responsabili:
SELECT Nome, Cognome
FROM Impiegati, Progetti
WHERE Impiegati.Matricola = Progetti.Responsabile
ORDER BY Nome, Cognome;

-- 6) Trovare i nomi dei progetti con bilancio maggiore di 100K e i cognomi degli impiegati che lavorano su di essi:
SELECT Progetti.Nome, Cognome
FROM Impiegati, Progetti
WHERE Bilancio >= 100000 AND Impiegati.Matricola = Partecipazione.Impiegato AND
Progetti.Sigla = Partecipazione.Progetto
ORDER BY Progetti.Nome, Cognome;

-- 7) Trovare il cognome degli impiegati che guadagnano più del loro direttore di dipartimento:
SELECT Cognome
FROM Impiegati AS I, Impiegati AS Direttore, Dipartimenti
WHERE I.Stipendio > Direttore.Stipendio AND
I.Dipartimento = Dipartimenti.Codice AND
Direttore.Matricola = Dipartimenti.Direttore
ORDER BY Cognome;

-- 8) Trovare cognome dei direttori di dipartimento e dei responsabili di progetto:

-- 9) Trovare nomi dei dipartimenti in cui lavorano impiegati che guadagnano più di 60K:
SELECT Dipartimenti.Nome
FROM Dipartimenti, Impiegati
WHERE Impiegati.Stipendio > 60000 AND Dipartimenti.Codice = Impiegati.Dipartimento
ORDER BY Dipartimenti.Nome;

-- 10) Trovare nomi dei dipartimenti in cui tutti gli impiegati guadagnano più di 60K:

CREATE VIEW NumeroDip AS 
SELECT Dipartimento, COUNT(*) AS Numero
FROM Impiegati
GROUP BY Dipartimento;

CREATE VIEW NumeroDip2 AS
SELECT Dipartimento, COUNT(*) AS Numero
FROM Impiegati
WHERE Stipendio >= 60000
GROUP BY Dipartimento;

SELECT q.Nome
FROM (
    SELECT Dipartimenti.Nome
    FROM NumeroDip, NumeroDip2, Dipartimenti
    WHERE NumeroDip.Dipartimento = NumeroDip2.Dipartimento AND NumeroDip.Numero = NumeroDip2.Numero AND Dipartimenti.Codice = NumeroDip.Dipartimento
) AS q;

-- 11) Trovare cognome degli impiegati di stipendio massimo:
SELECT Cognome
FROM Impiegati
WHERE Stipendio = (SELECT MAX(Stipendio) FROM Impiegati)
ORDER BY Cognome;

-- 12) Trovare matricola, e cognome degli impiegati che non lavorano a nessun progetto:
SELECT Matricola, Cognome
FROM Impiegati
LEFT JOIN Partecipazione ON Impiegati.Matricola = Partecipazione.Impiegato
WHERE Partecipazione.Impiegato IS NULL
ORDER BY Cognome;

-- 13) Trovare matricola e cognome degli impiegati che lavorano a più di un progetto:
SELECT q.Matricola, q.Cognome
FROM (
    SELECT Matricola, Cognome, COUNT(*)
    FROM Impiegati, Partecipazione
    WHERE Partecipazione.Impiegato = Impiegati.Matricola
    GROUP BY Matricola
    HAVING COUNT(*) > 1
) as q
ORDER BY q.Cognome;

-- 14) Trovare matricola e cognome degli impiegati che lavorano a un solo progetto:
SELECT q.Matricola, q.Cognome
FROM (
    SELECT Matricola, Cognome, COUNT(*)
    FROM Impiegati, Partecipazione
    WHERE Partecipazione.Impiegato = Impiegati.Matricola
    GROUP BY Matricola
    HAVING COUNT(*) = 1
) as q
ORDER BY q.Cognome;
