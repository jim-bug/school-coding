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
    Nazione INT NOT NULL,
    PRIMARY KEY(ID),
    FOREIGN KEY (Nazione) REFERENCES Nazioni(ID)
);

CREATE TABLE Artisti (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(25) NOT NULL,
    Cognome VARCHAR(25) NOT NULL,
    Data DATE NOT NULL,
    Data_Morte DATE,
    Citta_Natale INT NOT NULL,
    Citta_Morte INT,
    Epoca INT NOT NULL,
    UNIQUE(Nome, Cognome),
    PRIMARY KEY(ID),
    FOREIGN KEY (Citta_Natale) REFERENCES Citta(ID),
    FOREIGN KEY (Citta_Morte) REFERENCES Citta(ID),
    FOREIGN KEY (Epoca) REFERENCES Epoche(ID)
);

CREATE TABLE Musei (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Citta INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Citta) REFERENCES Citta(ID)
);

CREATE TABLE Opere (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Anno INT NOT NULL,
    Tipo INT NOT NULL,
    Museo INT NOT NULL,
    CONSTRAINT check_anno CHECK(Anno > 0),
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
    ('Naturalismo'), -- ID 3
    ('Barocco'), -- ID 4
    ('Rinascimento'), -- ID 5
    ('Romanticismo'), -- ID 6
    ('Verismo'), -- ID 7
    ('Rococò'), -- ID 8
    ('Neoclassicismo'), -- ID 9
    ('Realismo'), -- ID 10
    ('Impressionismo'), -- ID 11
    ('Contemporanea'),   -- ID 12
    ('Espressionismo'), -- ID 13
    ('Cubismo'), -- ID 14
    ('Futurismo'), -- ID 15
    ('Arte digitale'), -- ID 16
    ('Surrealismo'), -- ID 17
    ('Neorealismo'), -- ID 18
    ('Impressionismo lume'), -- ID 19
    ('Postmodernismo'), -- ID 20
    ('Minimalismo'), -- ID 21
    ('Pop Art'), -- ID 22
    ('Arte povera'), -- ID 23
    ('Dadaismo'), -- ID 24
    ('Decostruttivismo'), -- ID 25
    ('Neo-astrattismo'), -- ID 26
    ('Iperealismo'), -- ID 27
    ('Concettualismo'), -- ID 28
    ('Arte astratta'), -- ID 29
    ('Arte cinetica'), -- ID 30
    ('Hyperrealismo'), -- ID 31
    ('Transavanguardia'), -- ID 32
    ('Fauvismo'), -- ID 33
    ('Esoterismo artistico'), -- ID 34
    ('Arte concettuale'), -- ID 35
    ('Performance art'), -- ID 36
    ('Arte digitale 2.0'), -- ID 37
    ('Tecnocultura'), -- ID 38
    ('Arte fluida'), -- ID 39
    ('Arte e natura'); -- ID 40

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
    ('Canada'), -- ID 11
    ('Stati Uniti'), -- ID 12
    ('Canada'), -- ID 13
    ('Australia'), -- ID 14
    ('Giappone'), -- ID 15
    ('Russia'), -- ID 16
    ('Cina'), -- ID 17
    ('India'), -- ID 18
    ('Messico'), -- ID 19
    ('Brasile'), -- ID 20
    ('Argentina'), -- ID 21
    ('Inghilterra'), -- ID 22
    ('Scozia'), -- ID 23
    ('Irlanda'), -- ID 24
    ('Svezia'), -- ID 25
    ('Norvegia'), -- ID 26
    ('Finlandia'), -- ID 27
    ('Danimarca'), -- ID 28
    ('Olanda'), -- ID 29
    ('Belgio'), -- ID 30
    ('Svizzera'), -- ID 31
    ('Austria'), -- ID 32
    ('Portogallo'), -- ID 33
    ('Polonia'), -- ID 34
    ('Romania'), -- ID 35
    ('Bulgaria'), -- ID 36
    ('Serbia'), -- ID 37
    ('Croazia'), -- ID 38
    ('Slovenia'), -- ID 39
    ('Slovacchia'); -- ID 40

INSERT INTO Tipi (Nome) VALUES 
    ('Scultura'), -- ID 1
    ('Affresco'), -- ID 2
    ('Fotografia'), -- ID 3
    ('Mosaico'), -- ID 4
    ('Dipinto'), -- ID 5
    ('Disegno'), -- ID 6
    ('Quadro'), -- ID 7
    ('Acquerello'), -- ID 8
    ('Marmo'), -- ID 9
    ('Olio su tela'), -- ID 10
    ('Arte digitale'), -- ID 11
    ('Stampa'), -- ID 12
    ('Litografia'), -- ID 13
    ('Stampa su tessuto'), -- ID 14
    ('Arazzo'), -- ID 15
    ('Fotorealismo'), -- ID 16
    ('Land Art'), -- ID 17
    ('Vetro'), -- ID 18
    ('Ceramica'), -- ID 19
    ('Assemblaggio'), -- ID 20
    ('Stencil'), -- ID 21
    ('Arte sonora'), -- ID 22
    ('Grafico'), -- ID 23
    ('Arte performativa'), -- ID 24
    ('Installazione'), -- ID 25
    ('Mix media'), -- ID 26
    ('Grafica digitale'), -- ID 27
    ('Scultura geometrica'), -- ID 28
    ('Fotografia pittorica'), -- ID 29
    ('Cartone'), -- ID 30
    ('Stencil su tela'), -- ID 31
    ('Scultura in legno'); -- ID 32


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
    ('Parigi', 4), -- ID 14
    ('Marsiglia', 4), -- ID 15
    ('Santorini', 3), -- ID 16
    ('Berlino', 5), -- ID 17
    ('Amburgo', 5), -- ID 18
    ('Zurigo', 2), -- ID 19
    ('Ginevra', 2), -- ID 20
    ('Vienna', 32), -- ID 21
    ('Londra', 22), -- ID 22
    ('Oslo', 28), -- ID 23
    ('Atene', 3), -- ID 24
    ('Copenhagen', 28), -- ID 25
    ('Lisbona', 33), -- ID 26
    ('Stoccolma', 28), -- ID 27
    ('Edimburgo', 22), -- ID 28
    ('Bruxelles', 29), -- ID 29
    ('Zurigo', 2), -- ID 30
    ('New York', 12); -- ID 31

INSERT INTO Artisti (Nome, Cognome, Data, Data_Morte, Citta_Natale, Citta_Morte, Epoca) VALUES 
    ('Rita', 'Pisciuto', '1966-12-01', '2024-12-15', 3, 4, 12),  -- ID 1
    ('Miguel', 'Van De Sar', '1950-12-02', '2023-11-15', 8, 5, 12), -- ID 2
    ('Alessandro', 'Vitelloni', '1455-12-01', '1510-12-15', 3, 7, 1), -- ID 3
    ('Luigi', 'Spago', '1610-12-01', '1680-12-15', 3, 7, 5), -- ID 4
    ('Carlo', 'Mascotti', '1730-01-01', '1810-10-09', 9, 8, 4), -- ID 5
    ('Marco', 'Iulos', '1500-01-01', '1580-02-01', 3, 3, 5), -- ID 6
    ('Gianni', 'Rossi', '1800-01-02', '1850-03-01', 1, 7, 6), -- ID 7
    ('Leonardo', 'Blu', '1800-01-01', '1867-12-05', 7, 1, 9), -- ID 8
    ('Calogero', 'Compass', '1450-09-09', '1515-11-01', 3, 1, 4), -- ID 9
    ('Ferdinando', 'Calcutti', '1700-09-04', '1750-12-09', 1, 1, 8), -- ID 10
    ('Vincenzo', 'Presti', '1700-11-30', '1761-12-12', 1, 7, 8), -- ID 11
    ('Cristian', 'Guscio', '1760-04-01', '1810-12-19', 8, 8, 8), -- ID 12
    ('Luca', 'Marsi', '1505-04-04', '1550-12-30', 7, 1, 5), -- ID 13
    ('Mario', 'Sirro', '1510-09-01', '1540-11-11', 1, 7, 5), -- ID 14
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
    ('Emily', 'Armstrong', '1998-06-12', NULL, 4, NULL, 12), -- ID 27
    ('Cristian', 'Garamella', '1955-04-01', NULL, 7, 7, 12), -- ID 28
    ('Giuseppe', 'Rossi', '1995-12-04', NULL, 8, NULL, 12), -- ID 29
    ('Carlo', 'Verdi', '1987-04-02', NULL, 4, NULL, 8), -- ID 30
    ('Paola', 'Giuliano', '1990-11-01', NULL, 5, NULL, 12), -- ID 31
    ('Giovanni', 'Dante', '1991-10-15', NULL, 2, NULL, 12), -- ID 32
    ('Alessandra', 'Conti', '1999-06-10', NULL, 3, NULL, 6), -- ID 33
    ('Matteo', 'Corvo', '2000-02-21', NULL, 7, NULL, 9), -- ID 34
    ('Claudia', 'Mazza', '1996-05-16', NULL, 6, NULL, 5), -- ID 35
    ('Carlo', 'Fabbri', '1992-12-25', NULL, 4, NULL, 2), -- ID 36
    ('Sara', 'Gilli', '2001-01-10', NULL, 2, NULL, 8), -- ID 37
    ('Luca', 'Prada', '1993-09-20', NULL, 6, NULL, 9), -- ID 38
    ('Francesca', 'Bruni', '1998-05-18', NULL, 4, NULL, 3), -- ID 39
    ('Simone', 'Bianco', '2000-03-22', NULL, 1, NULL, 12), -- ID 40
    ('Gianni', 'Vitali', '1985-02-10', '2023-07-01', 2, NULL, 5), -- ID 41
    ('Maria', 'Giovanni', '1992-01-01', NULL, 9, NULL, 8), -- ID 42
    ('Paolo', 'Santoro', '1995-07-12', NULL, 1, NULL, 6), -- ID 43
    ('Nina', 'Bianchi', '2000-08-30', NULL, 7, NULL, 3); -- ID 44

INSERT INTO Musei (Nome, Citta) VALUES 
    ('Museo Calcutta', 10), -- ID 1
    ('Museo Romolo', 3), -- ID 2
    ('Museo LEMUÀ', 7), -- ID 3
    ('Museo Lo Pressi', 5), -- ID 4
    ('Museo Cacciatori', 9), -- ID 5
    ('Galleria degli Uffizi', 7), -- ID 6
    ('Museo del Prado', 11), -- ID 7
    ('Museo del Louvre', 14), -- ID 8
    ('Museo Vaticani', 4), -- ID 9
    ('Galleria Romana', 4), -- ID 10
    ('La Storia', 4), -- ID 11
    ('Museo del Bosco', 9), -- ID 12
    ('La Natura', 1), -- ID 13
    ('La Scienza', 7), -- ID 14
    ('Museo Ruffini', 1), -- ID 15
    ('Museo Milano', 5), -- ID 16
    ('Museo Napoli', 8), -- ID 17
    ('Museo Bari', 28), -- ID 18
    ('Museo Torino', 6), -- ID 19
    ('Museo Palermo', 1), -- ID 20
    ('Museo Venezia', 22), -- ID 21
    ('Museo Cagliari', 9), -- ID 22
    ('Museo Bologna', 10), -- ID 23
    ('Museo Roma', 4), -- ID 24
    ('Museo Firenze', 7), -- ID 25
    ('Museo Genova', 27), -- ID 26
    ('Museo Trieste', 2), -- ID 27
    ('Museo Lecce', 13), -- ID 28
    ('Museo Palermo II', 11), -- ID 29
    ('Museo Milano II', 5), -- ID 30
    ('Museo Monza', 3); -- ID 31

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
    ('Pressi', 1859, 1, 13), -- ID 18
    ('Il Viaggio dell Anima', 2023, 5, 6), -- ID 19
    ('Il Mistero di Firenze', 2015, 7, 6), -- ID 20
    ('Luce di Roma', 1600, 5, 2), -- ID 21
    ('L Abisso di Napoli', 1750, 5, 8), -- ID 22
    ('Storie di Venezia', 1780, 7, 9), -- ID 23
    ('Il Vento di Torino', 1820, 3, 4), -- ID 24
    ('L Essenza di Milano', 1890, 7, 5), -- ID 25
    ('La Forza di Messina', 1930, 5, 10), -- ID 26
    ('Il Cuore della Sicilia', 2005, 4, 1), -- ID 27
    ('Alba su Firenze', 1970, 5, 6), -- ID 28
    ('Il Cavalier di Roma', 1620, 7, 2), -- ID 29
    ('Mistero in Spagna', 1825, 3, 7), -- ID 30
    ('Il Dolore di Parigi', 1700, 5, 8), -- ID 31
    ('La Luce dell Anima', 2020, 5, 3), -- ID 32
    ('Sogno d Inverno', 1880, 7, 9), -- ID 33
    ('Oltre il Tempo', 1850, 5, 4), -- ID 34
    ('Scena da Venezia', 1910, 5, 10), -- ID 35
    ('Luce nel Buio', 1999, 3, 5), -- ID 36
    ('Il Respiro della Natura', 1950, 7, 4), -- ID 37
    ('Il Viandante', 1760, 5, 7), -- ID 38
    ('Fiamma di Torino', 1810, 5, 6), -- ID 39
    ('Ritratto di un Viaggio', 1955, 7, 2), -- ID 40
    ('Storie di Luce', 1990, 3, 5), -- ID 41
    ('L Incontro', 1775, 5, 4), -- ID 42
    ('Sogno di Barcellona', 1925, 7, 6), -- ID 43
    ('Il Ritorno', 1680, 5, 9), -- ID 44
    ('Alba sulle Alpi', 1850, 5, 7), -- ID 45
    ('Tra le Ombre', 2015, 7, 6), -- ID 46
    ('Il Potere di Venezia', 1800, 7, 3), -- ID 47
    ('Firenze al Tramonto', 1900, 5, 8), -- ID 48
    ('Il Silenzio del Bosco', 1995, 5, 2), -- ID 49
    ('L Essenza della Libertà', 2000, 5, 7), -- ID 50
    ('Eterno Sogno', 1955, 3, 1); -- ID 51

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
    (12, 17), -- ID 15
    (10, 17), -- ID 16
    (16, 12), -- ID 17
    (17, 9), -- ID 18
    (18, 13), -- ID 19
    (19, 9), -- ID 20
    (20, 10), -- ID 21
    (21, 12), -- ID 22
    (22, 9), -- ID 23
    (23, 15), -- ID 24
    (24, 14), -- ID 25
    (25, 17), -- ID 26
    (26, 14), -- ID 27
    (27, 13), -- ID 28
    (28, 12), -- ID 29
    (29, 11), -- ID 30
    (30, 10), -- ID 31
    (31, 13); -- ID 32

-- // :)
