/*
* Autore: Ignazio Leonardo Calogero Sperandeo
* Data: 13/02/2025
* Consegna: Svolgere le seguenti query in linguaggio SQL
* by jim_bug // :)
*/

-- 1) Elenco degli Artisti:
SELECT * FROM Artisti;

-- 2) Elenco degli artisti nati negli anni '50 dello scorso secolo:
SELECT * 
FROM Artisti
WHERE Data >= '1950-01-01' AND Data < '1960-01-01'
ORDER BY Cognome, Nome;

-- 3) Cognome e nome degli artisti di una data epoca:
SELECT Cognome, Artisti.Nome 
FROM Artisti, Epoche
WHERE Epoche.Nome = 'Rinascimento' AND Artisti.Epoca = Epoche.ID
ORDER BY Cognome, Artisti.Nome;

-- 4) Elenco delle città con cognome e nome degli artisti, che sono nati in quelle città, e che sono relativi a una data epoca:
SELECT Citta.* AS Citta, Cognome, Artisti.Nome 
FROM Artisti, Citta, Epoche
WHERE Epoche.Nome = 'Romanticismo' AND 
Epoche.ID = Artisti.Epoca AND 
Artisti.Citta_Natale = Citta.ID
ORDER BY Cognome, Artisti.Nome;

-- 5) Elenco delle città con cognome e nome degli artisti di una data epoca di una data nazione:
SELECT Citta.* AS Citta, Cognome, Artisti.Nome
FROM Artisti, Citta, Nazioni, Epoche
WHERE Epoche.Nome = 'Contemporanea' AND Nazioni.Nome = 'Francia' AND 
Artisti.Citta_Natale = Citta.ID AND 
Artisti.Epoca = Epoche.ID AND 
Nazioni.ID = Citta.Nazione
ORDER BY Cognome, Artisti.Nome;

-- 6) Cognome, nome e città di nascita degli artisti in vita di una data epoca:
SELECT Cognome, Artisti.Nome, Citta.Nome AS Citta
FROM Artisti, Citta, Epoche
WHERE Artisti.Data_Morte IS NULL AND Epoche.Nome = 'Contemporanea' AND 
Artisti.Citta_Natale = Citta.ID AND 
Artisti.Epoca = Epoche.ID
ORDER BY Artisti.Cognome, Artisti.Nome;

-- 7) Elenco dei musei di Parigi e Roma:
SELECT Musei.*
FROM Musei, Citta
WHERE (Citta.Nome = 'Parigi' OR Citta.Nome = 'Roma') AND Citta.ID = Musei.Citta;

-- 8) Nome e anno delle opere presenti nei musei di Parigi e Roma:
SELECT Opere.Nome, Anno
FROM Musei, Citta, Opere
WHERE (Citta.Nome = 'Parigi' OR Citta.Nome = 'Roma') AND 
Citta.ID = Musei.Citta AND 
Opere.Museo = Musei.ID;

-- 9) Elenco delle opere con il relativo tipo:
SELECT Opere.*, Tipi.Nome AS NomeTipo
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
Opere.Tipo = Tipi.ID
ORDER BY Opere.Nome;

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
SELECT Cognome, Artisti.Nome, Opere.Nome AS NomeOpera
FROM Opere, Artisti, Realizzazioni
WHERE Artisti.Data >= '1990-01-01' AND Artisti.Data < '2000-01-01' AND Artisti.Data_Morte IS NULL AND 
Artisti.ID = Realizzazioni.Artista AND Opere.ID = Realizzazioni.Opera
ORDER BY Cognome, Artisti.Nome;

-- 16) Cognome e Nome degli artisti nati a febbraio del 2000:
SELECT Cognome, Nome
FROM Artisti
WHERE Data >= '2000-02-01' AND Data < '2000-03-01'
ORDER BY Cognome, Nome;

-- 17) Numero di opere d'arte:
SELECT COUNT(*) AS NumeroOpere
FROM Opere;

-- 18) Numero di opere d'arte per ciascun tipo:
SELECT Tipi.NomeTipo AS NomeTipo, COUNT(*) AS NumeroOpere
FROM Opere, Tipi
WHERE Opere.Tipo = Tipi.ID
GROUP BY Tipi.Nome;

-- 19) Numero di opere d'arte per ciascun tipo in un determinato museo:
SELECT Tipi.Nome AS NomeTipo, COUNT(*) AS NumeroOpere
FROM Opere, Tipi, Musei
WHERE Musei.Nome = 'Galleria degli Uffizi' AND 
Opere.Tipo = Tipi.ID AND 
Opere.Museo = Musei.ID
GROUP BY Tipi.Nome;

-- 20) Numero di opere d'arte per ciascun tipo in un determinato museo purché in numero almeno pari a 2:
SELECT Tipi.Nome AS NomeTipo, COUNT(*) AS NumeroOpere
FROM Opere, Tipi, Musei
WHERE Musei.Nome = 'Galleria degli Uffizi' AND 
Opere.Tipo = Tipi.ID AND
Opere.Museo = Musei.ID
GROUP BY Tipi.Nome
HAVING COUNT(*) >= 2;

-- 21) Museo con il maggior numero di quadri:
SELECT Musei.Nome, COUNT(*) AS NumeroOpere
FROM Opere, Tipi
WHERE Tipi.Nome = 'Quadro' AND Opere.Tipo = Tipi.ID AND Opere.Museo = Musei.ID
GROUP BY Musei.ID
HAVING COUNT(*) = (
    SELECT MAX(OpereMusei.Numero_Opere)
    FROM (
        SELECT COUNT(Opere.ID) AS Numero_Opere
        FROM Opere, Tipi, Musei
        WHERE Tipi.Nome = 'Quadro' AND Opere.Tipo = Tipi.ID AND Opere.Museo = Musei.ID
        GROUP BY Musei.ID
    ) AS OpereMusei
);

-- 22) Elenco dei musei che non hanno quadri:
SELECT Nome
FROM Musei
WHERE ID NOT IN (
    SELECT DISTINCT Opere.Museo
    FROM Opere, Tipi
    WHERE Tipi.Nome = 'Quadro' AND Opere.Tipo = Tipi.ID
);

-- 23) Elenco dei musei che hanno quadri:
SELECT DISTINCT Musei.Nome
FROM Opere, Tipi, Musei
WHERE Tipi.Nome = 'Quadro' AND
Opere.Tipo = Tipi.ID AND
Musei.ID = Opere.Museo;


-- 24) Per ogni artista, di cui si vuole cognome e nome, conoscere il numero di opere presenti in uno specifico museo:
SELECT Cognome, Artisti.Nome, COUNT(*) AS NumeroOpere
FROM Opere, Artisti, Realizzazioni, Musei
WHERE Musei.Nome = 'Museo del Louvre' AND 
Opere.ID = Realizzazioni.Opera AND 
Artisti.ID = Realizzazioni.Artista AND
Opere.Museo = Musei.ID
GROUP BY Artisti.ID
ORDER BY Cognome, Artisti.Nome;

-- 25) Per ogni museo, quante opere sono presenti per ciascun artista:
SELECT Musei.Nome, Artisti.*, COUNT(*) AS NumeroOpere
FROM Opere, Artisti, Realizzazioni, Musei
WHERE Opere.ID = Realizzazioni.Opera AND 
Realizzazioni.Artista = Artisti.ID AND 
Musei.ID = Opere.Museo
GROUP BY Musei.ID, Artisti.ID;

-- 26) Per ogni museo, quante opere sono presenti per ciascun artista, ma ottenere solo l'elenco di quelli per cui il numero di opere è superiore alla media:
SELECT Musei.Nome, AS NomeMuseo, Artisti.*, COUNT(*) AS NumeroOpere
FROM Opere, Artisti, Realizzazioni, Musei
WHERE Opere.ID = Realizzazioni.Opera AND
Realizzazioni.Artista = Artisti.ID AND
Musei.ID = Opere.Museo
GROUP BY Musei.ID, Artisti.ID
HAVING COUNT(*) > (
    SELECT AVG(OpereArtisti.NumeroOpere)
    FROM (
        SELECT COUNT(Opere.ID) AS NumeroOpere
        FROM Opere, Artisti, Realizzazioni, Musei
        WHERE Opere.ID = Realizzazioni.Opera AND Realizzazioni.Artista = Artisti.ID AND Musei.ID = Opere.Museo
        GROUP BY Musei.ID, Artisti.Cognome, Artisti.Nome
    ) AS OpereArtisti
);


-- // :)
