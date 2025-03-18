/*
Autore: Ignazio Leonardo Calogero Sperandeo
Data: 09/03/2025
Consegna: Compito di recupero proposto in data 28/02/2025, query.
*/

-- Elenco degli iscritti con cognome, nome e telefono di una nazione:
SELECT Iscritti.Cognome, Iscritti.Nome, Iscritti.Telefono
FROM Iscritti, Nazioni
WHERE Nazioni.Nome = 'Olanda' AND Iscritti.Nazione = Nazioni.ID;

-- Tutti i dati degli iscritti di un determinato tipo:
SELECT Iscritti.*
FROM Iscritti, Tipi
WHERE Tipi.Nome = 'Socio ordinario' AND Iscritti.Tipo = Tipi.ID;

-- Elenco delle donazioni con importo e data del versamento, cognome, nome, data di nascita dell'iscritto e titolo del progetto.
SELECT Donazioni.Importo, Donazioni.Importo, Iscritti.Cognome, Iscritti.Nome, Iscritti.Data_Nascita, Progetti.Titolo
FROM Iscritti, Progetti, Donazioni
WHERE Iscritti.ID = Donazioni.Iscritto AND Progetti.Codice = Donazioni.progetto;

-- Tutti i dati delle donazioni effettuate nel secondo trimestre dell'anno 2024 con cognome e nome degli iscritti che hanno effettuato pagamenti:
SELECT Donazioni.*, Iscritti.Cognome, Iscritti.Nome
FROM Iscritti, Progetti, Donazioni
WHERE Donazione.Data >= '2024-04-01' AND Donazione.Data < '2024-07-01' AND 
Iscritti.ID = Donazioni.Iscritto AND 
Progetti.Codice = Donazioni.Progetto;

-- I dati dei progetti che hanno ricevuto donazioni effettuate dai soci ordinari provenienti da Svizzera e Olanda:
SELECT Progetti.*
FROM Iscritti, Progetti, Donazioni, Tipi, Nazioni
WHERE (Nazioni.Nome = 'Svizzera' OR Nazioni.Nome = 'Olanda') AND Tipi.Nome = 'Socio ordinario' AND 
Iscritti.ID = Donazioni.Progetto AND 
Progetti.Codice = Donazioni.Progetto AND 
Iscritti.Tipo = Tipi.ID AND 
Iscritti.Nazione = Nazioni.ID;

-- // :)
