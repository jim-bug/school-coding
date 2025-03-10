/*
* Autore: Ignazio Leonardo Calogero Sperandeo
* Data: 15/12/2024
* Consegna: Sulla base dell'Analisi, Progetto Concettuale e Progetto logico, implementare il database con almeno 5-10 record a tabella.
* by jim_bug // :)
*/

CREATE TABLE Linee (
    Nome VARCHAR(20) NOT NULL,
    Prezzo DECIMAL(4, 2) NOT NULL,
    Tempo TIME NOT NULL,
    PRIMARY KEY(Nome)
);

CREATE TABLE Fermate (
    Nome VARCHAR(50) NOT NULL,
    Comune VARCHAR(20) NOT NULL,
    Indirizzo VARCHAR(20) NOT NULL,
    Civico VARCHAR(5) NOT NULL,

    UNIQUE(Comune, Indirizzo, Civico),
    PRIMARY KEY(Nome)
);

CREATE TABLE TipoLinee (
    ID INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(20),
    PRIMARY KEY(ID)
);

CREATE TABLE TipoPatenti (
    ID INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(20),
    PRIMARY KEY(ID)
);

CREATE TABLE Autisti (
    Matricola VARCHAR(7) NOT NULL,
    Nome VARCHAR(25) NOT NULL,
    Cognome VARCHAR(25) NOT NULL,
    Data DATE NOT NULL,
    Telefono VARCHAR(16) NOT NULL,
    UNIQUE(Telefono),
    PRIMARY KEY(Matricola)
);

CREATE TABLE Corse (
    ID INT NOT NULL AUTO_INCREMENT,
    Data DATE NOT NULL,
    Ora TIME NOT NULL,
    Linea VARCHAR(20),
    Autista VARCHAR(7),
    PRIMARY KEY(ID),

    FOREIGN KEY (Linea) REFERENCES Linee(Nome)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (Autista) REFERENCES Autisti(Matricola)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE Percorso (
    Linea VARCHAR(20),
    Fermata VARCHAR(50),
    Ordine INT NOT NULL,

    FOREIGN KEY (Linea) REFERENCES Linee(Nome)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (Fermata) REFERENCES Fermate(Nome)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE ClassificazioneLinea (
    Linea VARCHAR(20),
    TipoLinea INT,

    FOREIGN KEY (Linea) REFERENCES Linee(Nome)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    
    FOREIGN KEY (TipoLinea) REFERENCES TipoLinee(ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE QualificaPatente (
    Autista VARCHAR(7),
    TipoPatente INT,

    FOREIGN KEY (Autista) REFERENCES Autisti(Matricola)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (TipoPatente) REFERENCES TipoPatenti(ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);




-- Inserimento record tabelle

INSERT INTO Linee (Nome, Prezzo, Tempo) VALUES 
    ('101', 4.30, '01:30:00'),
    ('102', 4.30, '02:30:00'),
    ('103', 4.30, '00:30:00'),
    ('104', 4.30, '02:00:00'),
    ('105', 4.30, '00:40:00');

INSERT INTO Fermate (Nome, Comune, Indirizzo, Civico) VALUES 
    ('CRISPI-GASPERI', 'Palermo', 'Via Franca', '55A'),
    ('GASPERI-CULLOTTA', 'Palermo', 'Via Francesco', '11'),
    ('GASPERI-BAUCINA', 'Palermo', 'Via Gico', '45S'),
    ('CARDUCCI-BESCO', 'Palermo', 'Via Lo Rizzo', '99B'),
    ('CARDUCCI-LIBERTÀ', 'Palermo', 'Via Gennaro', '98A/B'),
    ('REVEL-SCHETTO', 'Palermo', 'Via Galileo', '4'),
    ('PALERMO-MONDELLO', 'Palermo', 'Via Catania', '43'),
    ('VILLABATE-MAGGIO', 'Palermo', 'Via ', '10A');

INSERT INTO TipoPatenti (Nome) VALUES 
    ('A'),
    ('B1'),
    ('C1'),
    ('D1'),
    ('C'),
    ('D');

INSERT INTO TipoLinee (Nome) VALUES
    ('Urbana'),
    ('Extra-Urbana'),
    ('Urbana-Pedaggio'),
    ('Senza pedaggio');

INSERT INTO Autisti (Matricola, Nome, Cognome, Data, Telefono) VALUES 
    ('34AC9', 'Giancarlo', 'Pioscotto', '2000-09-30', '391-323-9999'),
    ('44AB4', 'Carlo', 'Cotto', '1997-12-09', '314-956-4433'),
    ('56M94', 'Alberto', 'Pizzicotto', '1990-12-12', '341-569-3434');


INSERT INTO Percorso (Linea, Fermata, Ordine) VALUES 
    ('101', 'CRISPI-GASPERI', 1),
    ('101', 'GASPERI-CULLOTTA', 2),
    ('101', 'GASPERI-BAUCINA', 3),
    ('101', 'CARDUCCI-BESCO', 4),
    ('101', 'CARDUCCI-LIBERTÀ', 5),
    ('102', 'CARDUCCI-BESCO', 1),
    ('102', 'REVEL-SCHETTO', 2),
    ('102', 'PALERMO-MONDELLO', 3),
    ('101', 'VILLABATE-MAGGIO', 6),
    ('101', 'CARDUCCI-BESCO', 7),
    ('103', 'REVEL-SCHETTO', 1),
    ('103', 'CARDUCCI-LIBERTÀ', 2),
    ('103', 'GASPERI-BAUCINA', 3);

INSERT INTO ClassificazioneLinea (Linea, TipoLinea) VALUES 
    ('101', 1),
    ('102', 1),
    ('103', 1);


iNSERT INTO Corse (Data, Ora, Linea, Autista) VALUES 
    ('2024-01-01', '10:15', '101', '34AC9'),
    ('2024-01-02', '10:15', '101', '34AC9'),
    ('2024-01-03', '10:15', '102', '44AB4'),
    ('2024-02-01', '10:15', '103', '56M94'),
    ('2024-03-01', '10:15', '103', '34AC9');

INSERT INTO QualificaPatente (Autista, TipoPatente) VALUES
    ('34AC9', 6),
    ('44AB4', 6),
    ('56M94', 6);


