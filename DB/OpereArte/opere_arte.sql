/*
* Autore: Ignazio Leonardo Calogero Sperandeo
* Data: 15/12/2024
* Consegna: Sulla base dell'Analisi, Progetto Concettuale e Progetto logico, implementare il database con almeno 5-10 record a tabella.
* by jim_bug // :)
*/


CREATE TABLE Epoche (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(20) NOT NULL,
    UNIQUE(Nome),
    PRIMARY KEY(ID)
);

CREATE TABLE Nazioni (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(20) NOT NULL,
    PRIMARY KEY(ID)
);

CREATE TABLE Tipi (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(20) NOT NULL,
    UNIQUE(Nome),
    PRIMARY KEY(ID)
);

CREATE TABLE Citta (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(20) NOT NULL,
    Nazione INT,
    PRIMARY KEY(ID),
    FOREIGN KEY (Nazione) REFERENCES Nazioni(ID)
);

CREATE TABLE Artisti (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(25) NOT NULL,
    Cognome VARCHAR(25) NOT NULL,
    Data DATE NOT NULL,
    Data_Morte DATE,
    Citta_Natale INT,
    Citta_Morte INT,
    Epoca INT,
    UNIQUE(Nome, Cognome),
    PRIMARY KEY(ID),
    FOREIGN KEY (Citta_Natale) REFERENCES Citta(ID),
    FOREIGN KEY (Citta_Morte) REFERENCES Citta(ID),
    FOREIGN KEY (Epoca) REFERENCES Epoche(ID)
);

CREATE TABLE Musei (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(21) NOT NULL,
    Citta INT,

    PRIMARY KEY(ID),
    FOREIGN KEY (Citta) REFERENCES Citta(ID)
);

CREATE TABLE Opere (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Anno INT NOT NULL,
    Tipo INT,
    Museo INT,

    PRIMARY KEY(ID),
    FOREIGN KEY (Tipo) REFERENCES Tipi(ID),
    FOREIGN KEY (Museo) REFERENCES Musei(ID)
);

CREATE TABLE Realizzazioni (
    Artista INT,
    Opera INT,

    PRIMARY KEY(Artista, Opera),
    FOREIGN KEY (Artista) REFERENCES Artisti(ID),
    FOREIGN KEY (Opera) REFERENCES Opere(ID)
);

INSERT INTO Epoche (Nome) VALUES 
    ('Medioevo'), -- ID 1
    ('Età Moderna'), -- ID 2
    ('Età Contemporanea'), -- ID 3
    ('Barocco'), -- ID 4
    ('Rinascimento'), -- ID 5
    ('Romanticismo'), -- ID 6
    ('Antico'), -- ID 7
    ('Rococò'), -- ID 8
    ('Neoclassico'), -- ID 9
    ('Realismo'), -- ID 10
    ('Impressionismo'), -- ID 11
    ('Contemporanea'); -- ID 12

INSERT INTO Nazioni (Nome) VALUES
    ('Italia'), -- ID 1
    ('Svizzera'), -- ID 2
    ('Grecia'), -- ID 3
    ('Francia'), -- ID 4
    ('Germania'), -- ID 5
    ('Spagna'), -- ID 6
    ('Albania'), -- ID 7
    ('Armenia'), -- ID 8
    ('Bolivia'), -- ID 9
    ('Belgio'), -- ID 10
    ('Canada'); -- ID 11

INSERT INTO Tipi (Nome) VALUES 
    ('Scultura'), -- ID 1
    ('Affresco'), -- ID 2
    ('Fotografia'), -- ID 3
    ('Mosaico'), -- ID 4
    ('Dipinto'), -- ID 5
    ('Disegno'), -- ID 6
    ('Quadro'); -- ID 7


INSERT INTO Citta (Nome, Nazione) VALUES 
    ('Palermo', 1), -- ID 1
    ('Messina', 1), -- ID 2
    ('Catania', 1), -- ID 3
    ('Roma', 1), -- ID 4
    ('Milano', 1), -- ID 5
    ('Torino', 1), -- ID 6
    ('Firenze', 1), -- ID 7
    ('Napoli', 1), -- ID 8
    ('Sardegna', 1), -- ID 9
    ('Bologna', 1), -- ID 10
    ('Salerno', 1), -- ID 11
    ('Madrid', 6), -- ID 12
    ('Barcellona', 6), -- ID 13
    ('Parigi', 6), -- ID 14
    ('Marsiglia', 6), -- ID 15
    ('Santorini', 5), -- ID 16
    ('Berlino', 4), -- ID 17
    ('Amburgo', 4), -- ID 18
    ('Zurigo', 2), -- ID 19
    ('Ginevra', 2); -- ID 20

INSERT INTO Artisti (Nome, Cognome, Data, Data_Morte, Citta_Natale, Citta_Morte, Epoca) VALUES 
    ('Rita', 'Pisciuto', '1966-12-01', '2024-12-15', 3, 4, 3),  -- ID 1
    ('Miguel', 'Van De Sar', '1950-12-02', '2023-11-15', 8, 5, 3), -- ID 2
    ('Alessandro', 'Vitelloni', '1500-12-01', '1568-12-15', 3, 7, 1), -- ID 3
    ('Luigi', 'Spago', '1610-12-01', '1680-12-15', 3, 7, 5), -- ID 4
    ('Carlo', 'Mascotti', '1888-01-01', '1975-10-09', 9, 8, 4), -- ID 5
    ('Marco', 'Iulos', '1500-01-01', '1580-02-01', 3, 3, 6), -- ID 6
    ('Gianni', 'Rossi', '1800-01-02', '1850-03-01', 1, 7, 7), -- ID 7
    ('Leonardo', 'Blu', '1800-01-01', '1867-12-05', 7, 1, 10), -- ID 8
    ('Calogero', 'Compass', '1450-09-09', '1515-11-01', 3, 1, 5), -- ID 9
    ('Ferdinando', 'Calcutti', '1700-09-04', '1750-12-09', 1, 1, 9), -- ID 10
    ('Vincenzo', 'Presti', '1700-11-30', '1761-12-12', 1, 7, 9), -- ID 11
    ('Cristian', 'Guscio', '1760-04-01', '1810-12-19', 7, 7, 9), -- ID 12
    ('Luca', 'Marsi', '1505-04-04', '1550-12-30', 7, 1, 6), -- ID 13
    ('Mario', 'Sirro', '1510-09-01', '1540-11-11', 1, 7, 6), -- ID 14
    ('Luigi', 'Soffio', '2000-05-01', NULL, 14, NULL, 12), -- ID 15
    ('Giuseppe', 'Calok', '1999-04-02', NULL, 1, NULL, 12), -- ID 16
    ('Vincenzo', 'Cusimano', '1998-03-03', NULL, 15, NULL, 12), -- ID 17
    ('Claudio', 'Lo Ratti', '1997-02-04', NULL, 4, NULL, 12), -- ID 18
    ('Simone', 'Giulietta', '1996-01-05', NULL, 5, NULL, 12), -- ID 19
    ('Jack', 'Tonali', '1995-10-06', NULL, 6, NULL, 12), -- ID 20
    ('Alberto', 'Fressi', '1994-11-07', NULL, 7, NULL, 12), -- ID 21
    ('Davide', 'Lottante', '1993-12-08', NULL, 8, NULL, 12), -- ID 22
    ('Sebastiano', 'Abbato', '1992-07-09', NULL, 9, NULL, 12), -- ID 23
    ('Bruno', 'Abbate', '1991-09-10', NULL, 10, NULL, 12), -- ID 24
    ('Francesca', 'Torcino', '1990-05-11', NULL, 11, NULL, 12), -- ID 25
    ('Rosaria', 'Terrè', '1995-05-12', NULL, 10, NULL, 12), -- ID 26
    ('Emily', 'Armstrong', '1998-06-12', NULL, 4, NULL, 12); -- ID 27

INSERT INTO Musei (Nome, Citta) VALUES 
    ('Museo Calcutta', 10), -- ID 1
    ('Museo Romolo', 3), -- ID 2
    ('Museo LEMUÀ', 7), -- ID 3
    ('Museo Lo Pressi', 5), -- ID 4
    ('Museo Cacciatori', 9), -- ID 5
    ('Galleria degli Uffizi', 6), -- ID 6
    ('Museo del Prado', 11), -- ID 7
    ('Museo del Louvre', 13), -- ID 8
    ('Museo Vaticani', 3), -- ID 9
    ('Galleria Romana', 3), -- ID 10
    ('La Storia', 3), -- ID 11
    ('Museo del Bosco', 9), -- ID 12
    ('La Natura', 1), -- ID 13
    ('La Scienza', 7), -- ID 14
    ('Museo Ruffini', 1); -- ID 15

INSERT INTO Opere (Nome, Anno, Tipo, Museo) VALUES 
    ('Il Pensatore Spagnolo', 2010, 1, 1),  -- ID 1
    ('Italia Ribelle', 2007, 5, 5), -- ID 2
    ('Orrore di Parigi', 1967, 5, 3), -- ID 3
    ('Il Re di Roma', 1679, 5, 2), -- ID 4
    ('Sua Mestà', 1568, 2, 4), -- ID 5
    ('Il Rè come Leader Supremo', 2010, 5, 1), -- ID 6
    ('Il Francese in Italia', 2010, 4, 1), -- ID 7
    ('La Goccia del Dolore', 2010, 5, 4), -- ID 8
    ('Cavallo Ispiratore', 1974, 3, 5), -- ID 9
    ('Il Pensatore Spagnolo', 1970, 3, 1), -- ID 10
    ('Giotto', 1864, 7, 6), -- ID 11
    ('Notte', 2019, 5, 9), -- ID 12
    ('Sole', 1740, 5, 8), -- ID 13
    ('Pensatore', 1800, 3, 6), -- ID 14
    ('Supremo', 1530, 3, 6), -- ID 15
    ('Leader', 1540, 5, 8), -- ID 16
    ('Maestà', 1744, 7, 8), -- ID 17
    ('Pressi', 1859, 1, 13); -- ID 18

INSERT INTO Realizzazioni (Artista, Opera) VALUES 
    (1, 1),  -- ID 1
    (2, 8),  -- ID 2
    (2, 1),  -- ID 3
    (5, 9),  -- ID 4
    (2, 9),  -- ID 5
    (3, 5),  -- ID 6
    (4, 4),  -- ID 7
    (5, 3),  -- ID 8
    (6, 11), -- ID 9
    (7, 18), -- ID 10
    (14, 15), -- ID 11
    (10, 13), -- ID 12
    (9, 15),  -- ID 13
    (11, 17), -- ID 14
    (12, 17); -- ID 15

-- // :)
