/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 07/05/2025
    Consegna:

    by jim_bug // :)
*/

-- 1) Trovare matricola e cognome degli impiegati che guadagnano più di 50 milioni:
SELECT Matricola, Cognome
FROM Impiegati
WHERE Stipendio > 50000000;

-- 2) Trovare cognome e stipendio degli impiegati che lavorano a roma:
SELECT Cognome, Stipendio
FROM Impiegati, Dipartimento
WHERE Sede = 'Roma' AND Impiegati.Dipartimento = Dipartimenti.Codice;

-- 3) Trovare cognome degli impiegati e nome del dipartimento in cui lavorano:
SELECT Cognome, Nome
FROM Impiegati, Dipartimenti
WHERE Impiegati.Dipartimento = Dipartimenti.Codice;

-- 4) Trovare cognome degli impiegati che sono direttori di dipartimento:
SELECT Cognome
FROM Impiegati, Dipartimenti
WHERE Impiegati.Matricola = Dipartimenti.Direttore;

-- 5) Trovare i nomi dei progetti e i cognomi dei responsabili:
SELECT Nome, Cognome
FROM Impiegati, Progetti
WHERE Impiegati.Matricola = Progetti.Responsabile;

-- 6) Trovare i nomi dei progetti con bilancio maggiore di 100K e i cognomi degli impiegati che lavorano su di essi:
SELECT Progetti.Nome, Cognome
FROM Impiegati, Progetti
WHERE Bilancio >= 100000 AND Impiegati.Matricola = Partecipazione.Impiegato AND
Progetti.Sigla = Partecipazione.Progetto;

-- 7) Trovare il cognome degli impiegati che guadagnano più del loro direttore di dipartimento:
SELECT Cognome
FROM Impiegati AS I, Impiegati AS Direttore, Dipartimenti
WHERE I.Stipendio > Direttore.Stipendio AND
I.Dipartimento = Dipartimenti.Codice AND
Direttore.Matricola = Dipartimenti.Direttore;

-- 8) Trovare cognome dei direttori di dipartimento e dei responsabili di progetto:
SELECT Direttori.Cognome, Responsabili.Cognome
FROM Impiegati AS Direttori, Impiegati AS Responsabili, Dipartimenti, Progetti
WHERE Direttori.Matricola = Dipartimenti.Direttore AND Responsabili.Matricola = Progetti.Responsabile;

-- 9) Trovare nomi dei dipartimenti in cui lavorano impiegati che guadagnano più di 60K:
SELECT Dipartimenti.Nome
FROM Dipartimenti, Impiegati
WHERE Impiegati.Stipendio > 60000 AND Dipartimenti.Codice = Impiegati.Dipartimento;

-- 10) Trovare nomi dei dipartimenti in cui tutti gli impiegati guadagnano più di 60K:


-- 11) Trovare cognome degli impiegati di stipendio massimo:
SELECT Cognome
FROM Impiegati
WHERE Stipendio = (SELECT MAX(Stipendio) FROM Impiegati);

-- 12) Trovare matricola, e cognome degli impiegati che non lavorano a nessun progetto:
SELECT Matricola, Cognome
FROM Impiegati
LEFT JOIN Partecipazione ON Impiegati.Matricola = Partecipazione.Impiegato
WHERE Partecipazione.Impiegato IS NULL;

-- 13) Trovare matricola e cognome degli impiegati che lavorano a più di un progetto:
SELECT q.Matricola, q.Cognome
FROM (
    SELECT Matricola, Cognome, COUNT(*)
    FROM Impiegati, Partecipazione
    WHERE Partecipazione.Impiegato = Impiegati.Matricola
    GROUP BY Matricola
    HAVING COUNT(*) > 1
) as q

-- 14) Trovare matricola e cognome degli impiegati che lavorano a un solo progetto:
SELECT q.Matricola, q.Cognome
FROM (
    SELECT Matricola, Cognome, COUNT(*)
    FROM Impiegati, Partecipazione
    WHERE Partecipazione.Impiegato = Impiegati.Matricola
    GROUP BY Matricola
    HAVING COUNT(*) = 1
) as q
