/*
Autore: Ignazio Leonardo Calogero Sperandeo
Data: 20/03/2025
Consegna: Sfruttando PHP con i PDO create un database, create 3 tabelle all'interno del DB stesso e gestite le eccezioni. 
Provate a vedere autonomamente come effettuare delle interrogazioni SQL tramite prepared statements e i bindParam ed eseguitele nel codice PHP.

by jim_bug // :)
*/ 

CREATE TABLE Autori (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Cognome VARCHAR(30) NOT NULL,
    Data DATE NOT NULL,

    PRIMARY KEY(ID)
);

CREATE Libri (
    ISBN VARCHAR(13) NOT NULL,
    Titolo VARCHAR(30),
    Autore INT,

    PRIMARY KEY(ISBN),
    FOREIGN KEY (Autore) REFERENCES Autori(ID)
);

-- Inserimento Autori:
INSERT INTO Autori (Nome, Cognome, Data) VALUES
    ('Ignazio', 'Sperandeo', '2007-03-15'),
    ('Marco', 'Guscio', '2000-09-10'),
    ('Giovanni', 'Bianchi', '1980-05-20'),
    ('Luca', 'Verdi', '1990-11-11'),
    ('Alessandro', 'Rossi', '1975-12-05');

-- Inserimento Libri:
INSERT INTO Libri (ISBN, Titolo, Autore) VALUES
    ('0000000000001', 'Il mare affogato', 1),
    ('0000000000002', 'La sabbia persa', 2),
    ('0000000000003', 'La vita in musica', 3),
    ('0000000000004', 'Il sogno di carta', 1),
    ('0000000000005', 'Note di passione', 1);

-- Query: Seleziona tutti i libri scritti da Ignazio o Marco
SELECT Autori.Nome, Autori.Cognome, Libri.Titolo
FROM Autori, Libri
WHERE (Autori.Nome = 'Ignazio' OR Autori.Nome = 'Marco') AND Autori.ID = Libri.Autore;