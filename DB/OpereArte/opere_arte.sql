/*
* Autore: Ignazio Leonardo Calogero Sperandeo
* Data: 15/12/2024
* Consegna: Sulla base dell'Analisi, Progetto Concettuale e Progetto logico, implementare il database con almeno 5-10 record a tabella.
* by jim_bug // :)
*/


CREATE TABLE Epoca (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(20) NOT NULL,
    PRIMARY KEY(ID)
);

CREATE TABLE Nazione (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(20) NOT NULL,
    PRIMARY KEY(ID)
);

CREATE TABLE Tipo_Opera (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(20) NOT NULL,
    PRIMARY KEY(ID)
);

CREATE TABLE Citta (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(20) NOT NULL,
    Nazione INT UNSIGNED,
    PRIMARY KEY(ID),
    FOREIGN KEY (Nazione) REFERENCES Nazione(ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE Artista (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(25) NOT NULL,
    Cognome VARCHAR(25) NOT NULL,
    Data DATE,
    Data_Morte DATE,
    Citta_Natale INT UNSIGNED,
    Epoca INT UNSIGNED,

    PRIMARY KEY(ID),
    FOREIGN KEY (Citta_Natale) REFERENCES Citta(ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    
    FOREIGN KEY (Epoca) REFERENCES Epoca(ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE Museo (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(20) NOT NULL,
    Citta INT UNSIGNED,

    PRIMARY KEY(ID),
    FOREIGN KEY (Citta) REFERENCES Citta(ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE Opera (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Anno INT NOT NULL,
    Tipo INT UNSIGNED,
    Museo INT UNSIGNED,

    PRIMARY KEY(ID),
    FOREIGN KEY (Tipo) REFERENCES Tipo_Opera(ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (Museo) REFERENCES Museo(ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE Realizzazione (
    Artista INT UNSIGNED,
    Opera INT UNSIGNED,

    FOREIGN KEY (Artista) REFERENCES Artista(ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (Opera) REFERENCES Opera(ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

INSERT INTO Epoca (Nome) VALUES 
    ('Medioevo'),
    ('Età Moderna'),
    ('Età Contemporanea'),
    ('Cubismo'),
    ('Barocco');

INSERT INTO Nazione (Nome) VALUES
    ('Italia'),
    ('Svizzera'),
    ('Grecia'),
    ('Francia'),
    ('Germania'),
    ('Spagna');

INSERT INTO Tipo_Opera (Nome) VALUES 
    ('Scultura'),
    ('Affresco'),
    ('Fotografia'),
    ('Mosaico'),
    ('Dipinto');

INSERT INTO Citta (Nome, Nazione) VALUES 
    ('Palermo', 1),
    ('Catania', 1),
    ('Roma', 1),
    ('Milano', 1),
    ('Torino', 1),
    ('Pisa', 1),
    ('Napoli', 1),
    ('Madrid', 6),
    ('Barcellona', 6),
    ('Parigi', 6),
    ('Marsiglia', 6),
    ('Santorini', 5),
    ('Berlino', 4),
    ('Amburgo', 4),
    ('Zurigo', 2),
    ('Ginevra', 2);

INSERT INTO Artista (Nome, Cognome, Data, Data_Morte, Citta_Natale, Epoca) VALUES 
    ('Rita', 'Pisciuto', '1966-12-01', '2024-12-15', 3, 3),
    ('Miguel', 'Van De Sar', '1950-12-02', '2023-11-15', 8, 3),
    ('Alessandro', 'Vitelloni', '1500-12-01', '1568-12-15', 3, 1),
    ('Luigi', 'Spago', '1610-12-01', '1680-12-15', 3, 5),
    ('Carlo', 'Mascotti', '1888-01-01', '1975-10-09', 9, 4);

INSERT INTO Museo (Nome, Citta) VALUES 
    ('Museo Calcutta', 10),
    ('Museo Romolo', 3),
    ('Museo LEMUÀ', 7),
    ('Museo Lo Pressi', 5),
    ('Museo Cacciatori', 9);

INSERT INTO Opera (Nome, Anno, Tipo, Museo) VALUES 
    ('Il Pensatore Spagnolo', 2010, 1, 1),
    ('Italia Ribelle', 2007, 5, 5),
    ('Orrore di Parigi', 1967, 5, 3),
    ('Il Re di Roma', 1679, 5, 2),
    ('Sua Mestà', 1568, 2, 4),
    ('Il Rè come Leader Supremo', 2010, 5, 1),
    ('Il Francese in Italia', 2010, 4, 1),
    ('La Goccia del Dolore', 2010, 5, 4),
    ('Cavallo Ispiratore', 1974, 3, 5),
    ('Il Pensatore Spagnolo', 1970, 3, 1);

INSERT INTO Realizzazione (Artista, Opera) VALUES 
    (1, 1),
    (2, 8),
    (2, 1),
    (5, 9),
    (2, 9),
    (3, 5),
    (4, 4),
    (5, 3);

