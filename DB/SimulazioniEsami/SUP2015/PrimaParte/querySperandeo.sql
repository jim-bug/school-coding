/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 11/06/2025
    Consegna: Query proposte nella simulazione ordinaria 2020

    by jim-bug // :)
*/

-- 1) Elenco delle gare di ippica con la relativa specialità che si svolgeranno nel mese di agosto di quest'anno:
SELECT Gare.Denominazione, Specialita.Nome
FROM Gare, Specialita, Tipologie
WHERE Tipologie.Nome = 'Ippica' AND
Data >= '2025-08-01' AND
Data < '2025-09-01' AND
Gare.Specialita = Specialita.ID AND
Specialita.Tipologia = Tipologie.ID
ORDER BY Gare.Denominazione;

-- 2) Classifica di arrivo dei cavalli, ciascuno con il relativo fantino e scuderia, che hanno partecipato alla gara denominata "Coppa del Salto 2022":
SELECT Cavalli.Nome, Posizione, Fantini.Nome, Scuderie.Nome
FROM Cavalli, Partecipazioni, Gare, Fantini, Scuderie
WHERE Gare.Denominazione = 'Coppa del Salto 2022' AND 
Cavalli.ID = Partecipazioni.Cavallo AND 
Partecipazioni.Gara = Gare.Codice AND
Partecipazioni.Fantino = Fantini.ID AND
Cavalli.Scuderia = Scuderie.ID
ORDER BY Posizione;

-- 3) La durata maggiore della gara cui ha partecipato il cavallo "Furia":
CREATE VIEW MassimaDurata AS SELECT MAX(Durata) AS DurataGara
FROM Gare, Partecipazioni, Cavalli
WHERE Cavalli.Nome = 'Furia' AND
Gare.Codice = Partecipazioni.Gara AND
Cavalli.ID = Partecipazioni.Cavallo;

SELECT Durata
FROM Gare, Partecipazioni, Cavalli
WHERE Cavalli.Nome = 'Furia' AND
Gare.Codice = Partecipazioni.Gara AND
Cavalli.ID = Partecipazioni.Cavallo AND 
Durata = (SELECT DurataGara FROM MassimaDurata);

-- 4) Elenco delle gare che si svolgeranno il 19 luglio 2022 con il numero dei cavalli che partecipano purchè vi siano 3 cavalli partecipanti:
SELECT Gare.Codice, Gare.Denominazione, COUNT(*)
FROM Gare, Partecipazioni, Cavalli
WHERE Data = '2022-07-19' AND 
Cavalli.ID = Partecipazioni.Cavallo AND
Partecipazioni.Gara = Gare.Codice
GROUP BY Gare.Codice
HAVING COUNT(*) > 3
ORDER BY Gare.Denominazione;

-- // :)
