/*
Autore: Ignazio Leonardo Calogero Sperandeo
Data: 09/03/2025
Consegna: Compito di recupero proposto in data 28/02/2025

by jim_bug // :)
*/

-- Creazione della tabella: Nazioni
CREATE TABLE Nazioni (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(25) NOT NULL,

    PRIMARY KEY(ID)
);

-- Creazione della tabella: Tipi
CREATE TABLE Tipi (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(20) NOT NULL,

    PRIMARY KEY(ID)
);

-- Creazione della tabella: Progetti
CREATE TABLE Progetti (
    Codice VARCHAR(5),
    Titolo VARCHAR(50) NOT NULL,
    Anno YEAR NOT NULL,

    UNIQUE(Titolo, Anno),
    PRIMARY KEY(Codice)
);

-- Creazione della tabella: Iscritti
CREATE TABLE Iscritti (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Cognome VARCHAR(30) NOT NULL,
    Data_Nascita DATE NOT NULL,
    Telefono VARCHAR(16) NOT NULL,
    Nazione INT NOT NULL,
    Tipo INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Nazione) REFERENCES Nazioni(ID),
    FOREIGN KEY (Tipo) REFERENCES Tipi(ID)
);

-- Creazione della tabella: Donazioni
CREATE TABLE Donazioni (
    Data DATE NOT NULL,
    Importo DECIMAL(6, 2) NOT NULL,
    Iscritto INT NOT NULL,
    Progetto VARCHAR(5) NOT NULL,

    FOREIGN KEY (Iscritto) REFERENCES Iscritti(ID),
    FOREIGN KEY (Progetto) REFERENCES Progetti(Codice)
);


-- Inserimento dei record della tabella: Nazioni
INSERT INTO Nazioni VALUES 
    (NULL, 'Svizzera'),     -- ID: 1
    (NULL, 'Olanda');       -- ID: 2

-- Inserimento dei record della tabella: Tipi
INSERT INTO Tipi VALUES
    (NULL, 'Socio ordinario'),  -- ID: 1
    (NULL, 'Sostenitore'),      -- ID: 2
    (NULL, 'Affiliato');        -- ID: 3

-- Inserimento dei record della tabella: Progetti
INSERT INTO Progetti VALUES
    ('00001', 'open-source', 2024),
    ('00002', 'La rivolta', 2010);

-- Inserimento dei record della tabella: Iscritti
INSERT INTO Iscritti VALUES
    (NULL, 'Ignazio', 'Sperandeo', '2007-03-15', '3211119999', 1, 1),   -- ID: 1
    (NULL, 'Luigi', 'Van Basten', '2000-04-20', '3334445555', 2, 1);    -- ID: 2

-- Inserimento dei record della tabella: Donazioni
INSERT INTO Donazioni VALUES
    ('2024-06-01', 976.4, 1, '00001'),
    ('2020-07-04', 1000, 2, '00002');

-- // :)
