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
    PRIMARY KEY(ID)
);


CREATE TABLE Contenere (
    Linea VARCHAR(20),
    Fermata VARCHAR(50),
    Ordine UNSIGNED INT NOT NULL,

    FOREIGN KEY (Linea) REFERENCES Linee(Nome)
        ON DELETE SET NULL
        ON UPDATE CASCADE
    FOREIGN KEY (Fermata) REFERENCES Fermate(Nome)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);





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


