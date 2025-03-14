/*
* Autore: Ignazio Leonardo Calogero Sperandeo
* Data: 13/02/2025
* Consegna: Svolgere le seguenti query in linguaggio SQL
* by jim_bug // :)
*/

-- 1) Elenco degli Artisti:
SELECT * FROM Artisti;

-- 2) Elenco degli artisti nati negli anni '50 dello scorso secolo:
SELECT * FROM Artisti WHERE Data >= '1950-01-01' AND Data < '1960-01-01';

-- 3) Cognome e nome degli artisti di una data epoca:
SELECT Artisti.Cognome, Artisti.Nome 
FROM Artisti, Epoche
WHERE Epoche.Nome = 'Rinascimento' AND Artisti.Epoca = Epoche.ID;

-- 4) Elenco delle città con cognome e nome degli artisti, che sono nati in quelle città, e che sono relativi a una data epoca:
SELECT Citta.*, Artisti.Cognome, Artisti.Nome 
FROM Artisti, Citta, Epoche
WHERE Epoche.Nome = 'Romanticismo' AND 
Epoche.ID = Artisti.Epoca AND 
Artisti.Citta_Natale = Citta.ID;

-- 5) Elenco delle città con cognome e nome degli artisti di una data epoca di una data nazione:
SELECT Citta.*, Artisti.Cognome, Artisti.Nome
FROM Artisti, Citta, Nazioni, Epoche
WHERE Epoche.Nome = 'Contemporanea' AND Nazioni.Nome = 'Francia' AND 
Artisti.Citta_Natale = Citta.ID AND 
Artisti.Epoca = Epoche.ID AND 
Nazioni.ID = Citta.Nazione;

-- 6) Cognome, nome e città di nascita degli artisti in vita di una data epoca:
SELECT Artisti.Cognome, Artisti.Nome, Citta.*
FROM Artisti, Citta, Epoche
WHERE Artisti.Data_Morte IS NULL AND Epoche.Nome = 'Contemporanea' AND 
Artisti.Citta_Natale = Citta.ID AND 
Artisti.Epoca = Epoche.ID;

-- 7) Elenco dei musei di Parigi e Roma:
SELECT Musei.*
FROM Musei, Citta
WHERE (Citta.Nome = 'Parigi' OR Citta.Nome = 'Roma') AND Citta.ID = Musei.Citta;

-- 8) Nome e anno delle opere presenti nei musei di Parigi e Roma:
SELECT Opere.Nome, Opere.Anno
FROM Musei, Citta, Opere
WHERE (Citta.Nome = 'Parigi' OR Citta.Nome = 'Roma') AND 
Citta.ID = Musei.Citta AND 
Opere.Museo = Musei.ID;

-- 9) Elenco delle opere con il relativo tipo:
SELECT Opere.*
FROM Opere, Tipi
WHERE Opere.Tipo = Tipi.ID;

-- 10) Elenco delle opere per uno specifico tipo:
SELECT Opere.*
FROM Opere, Tipi
WHERE Tipi.Nome = 'Dipinto' AND Opere.Tipo = Tipi.ID;

-- 11) Elenco delle opere di un autore di cui si conosce il cognome:
SELECT Opere.*
FROM Opere, Artisti, Realizzazioni
WHERE Artisti.Cognome = 'Rossi' AND 
Realizzazioni.Artista = Artisti.ID AND 
Realizzazioni.Opera = Opere.ID;

-- 12) Elenco delle opere di tipo "Scultura" di un artista di cui si conosce l'ID:
SELECT Opere.*
FROM Opere, Realizzazioni, Tipi
WHERE Tipi.Nome = 'Scultura' AND 
Realizzazioni.Artista = 1 AND 
Realizzazioni.Opera = Opere.ID AND 
Opere.Tipo = Tipi.ID;

-- 13) Elenco degli artisti che hanno dipinto un "Quadro" nel "Rinascimento" e le cui opere sono nel museo "Galleria degli Uffizi":
SELECT Artisti.*
FROM Artisti, Opere, Realizzazioni, Tipi, Epoche, Musei
WHERE Musei.Nome = 'Galleria degli Uffizi' AND Tipi.Nome = 'Quadro' AND Epoche.Nome = 'Rinascimento' AND 
Opere.Tipo = Tipi.ID AND 
Opere.ID = Realizzazioni.Opera AND 
Opere.Museo = Musei.ID AND 
Artisti.Epoca = Epoche.ID AND 
Realizzazioni.Artista = Artisti.ID;

-- 14) Elenco dei tipi che non hanno opere:
SELECT Tipi.*
FROM Tipi
LEFT JOIN Opere ON Tipi.ID = Opere.Tipo
WHERE Opere.ID IS NULL;

-- 15) Cognome, Nome degli artisti con il nome delle opere da loro realizzate, nati negli anni '90 e ancora vivi:
SELECT Artisti.Cognome, Artistu.Nome, Opere.Nome
FROM Opere, Artisti, Realizzazioni
WHERE Artisti.Data >= '1990-01-01' AND Artisti.Data < '2000-01-01' AND Artisti.Data IS NULL AND 
Artisti.ID = Realizzazioni.Artista AND Opere.ID = Realizzazioni.Opera;

-- 16) Cognome e Nome degli artisti nati a febbraio del 2000:
SELECT Cognome, Nome
FROM Artisti
WHERE Data >= '2000-02-01' AND Data < '2000-03-01';


-- // :)