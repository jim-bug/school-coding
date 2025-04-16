/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 04/4/2025
    Consegna: consegna su classroom.

    by jim_bug // :)
*/

CREATE TABLE Nazioni (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Regioni (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30),
    Nazione INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Nazione) REFERENCES Nazioni(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Citta (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Regione INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Regione) REFERENCES Regioni(ID)
        ON UPDATE CASCADE
);


CREATE TABLE Fasi (
    Denominazione VARCHAR(30) NOT NULL,
    Punteggio_Singolo INT NOT NULL,
    Punteggio_Squadre INT NOT NULL,
    
    PRIMARY KEY(Denominazione)
);

CREATE TABLE Sedi (
    ID INT AUTO_INCREMENT,
    Denominazione VARCHAR(30) NOT NULL,
    Indirizzo VARCHAR(50),
    Citta INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Citta) REFERENCES Citta(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Scuole (
    ID INT AUTO_INCREMENT,
    Denominazione VARCHAR(40) NOT NULL,
    Indirizzo VARCHAR(50),
    Citta INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Citta) REFERENCES Citta(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Squadre (
    ID INT AUTO_INCREMENT,
    Denominazione VARCHAR(30) NOT NULL,
    Nazione INT NOT NULL,

    PRIMARY KEY (ID),
    FOREIGN KEY (Nazione) REFERENCES Nazioni(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Atleti (
    ID INT AUTO_INCREMENT,
    Cognome VARCHAR(30) NOT NULL,
    Nome VARCHAR(30) NOT NULL,
    LuogoNascita VARCHAR(40) NOT NULL,
    Data DATE NOT NULL,
    Scuola INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Scuola) REFERENCES Scuole(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Gare (
    ID INT AUTO_INCREMENT,
    Data DATE NOT NULL,
    Fase VARCHAR(30) NOT NULL,
    Sede INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Fase) REFERENCES Fasi(Denominazione)
        ON UPDATE CASCADE,
    FOREIGN KEY (Sede) REFERENCES Sedi(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Squadre_Gare (
    Squadra INT NOT NULL,
    Gara INT NOT NULL,

    PRIMARY KEY(Squadra, Gara),
    FOREIGN KEY (Squadra) REFERENCES Squadre(ID)
        ON UPDATE CASCADE,
    FOREIGN KEY (Gara) REFERENCES Gare(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Atleti_Gare (
    Atleta INT NOT NULL,
    Gara INT NOT NULL,
    Punteggio INT NOT NULL,

    PRIMARY KEY(Atleta, Gara),
    FOREIGN KEY (Atleta) REFERENCES Atleti(ID)
        ON UPDATE CASCADE,
    FOREIGN KEY (Gara) REFERENCES Gare(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Atleti_Squadre (
    Atleta INT NOT NULL,
    Squadra INT NOT NULL,

    PRIMARY KEY(Atleta, Squadra),
    FOREIGN KEY (Atleta) REFERENCES Atleti(ID)
        ON UPDATE CASCADE,
    FOREIGN KEY (Squadra) REFERENCES Squadre(ID)
        ON UPDATE CASCADE
);


INSERT INTO Nazioni (Nome) VALUES
    ('Italia'),     -- ID 1
    ('Francia'),    -- ID 2
    ('Germania'),   -- ID 3
    ('Spagna');     -- ID 4

INSERT INTO Regioni (Nome, Nazione) VALUES
    ('Sicilia', 1),         -- ID 1
    ('Lombardia', 1),       -- ID 2
    ('Ile-de-France', 2),   -- ID 3
    ('Bavaria', 3);         -- ID 4

INSERT INTO Citta (Nome, Regione) VALUES
    ('Palermo', 1),    -- ID 1
    ('Milano', 2),     -- ID 2
    ('Parigi', 3),     -- ID 3
    ('Monaco', 4);     -- ID 4

INSERT INTO Sedi (Denominazione, Indirizzo, Citta) VALUES
    ('Palazzetto Sport', 'Via Roma 1', 1),    -- ID 1
    ('Centro Olimpico', 'Via Milano 2', 2),    -- ID 2
    ('Stade National', 'Rue Paris 3', 3);      -- ID 3

INSERT INTO Scuole (Denominazione, Indirizzo, Citta) VALUES
    ('Liceo Einstein', 'Via Scuola 1', 1),     -- ID 1
    ('IIS Volta', 'Via Istituto 2', 2),        -- ID 2
    ('Lycée Victor Hugo', 'Rue École 3', 3);    -- ID 3

INSERT INTO Squadre (Denominazione, Nazione) VALUES
    ('Team Italia A', 1),    -- ID 1
    ('Team Francia A', 2),   -- ID 2
    ('Team Germania A', 3);  -- ID 3

INSERT INTO Atleti (Cognome, Nome, LuogoNascita, Data, Scuola) VALUES
    ('Rossi', 'Mario', 'Palermo', '2005-05-15', 1),     -- ID 1
    ('Bianchi', 'Laura', 'Milano', '2006-08-22', 2),    -- ID 2
    ('Dubois', 'Jean', 'Parigi', '2005-03-10', 3);      -- ID 3

INSERT INTO Gare (Data, Fase, Sede) VALUES
    ('2024-06-01', 'Eliminatoria', 1),    -- ID 1
    ('2024-06-15', 'Semifinale', 2),      -- ID 2
    ('2024-06-30', 'Finale', 3);          -- ID 3

INSERT INTO Fasi (Denominazione, Punteggio_Singolo, Punteggio_Squadre) VALUES
    ('Eliminatoria', 100, 300),
    ('Semifinale', 150, 450),
    ('Finale', 200, 600);

INSERT INTO Squadre_Gare (Squadra, Gara) VALUES
    (1, 1),    
    (2, 1),    
    (3, 1),    
    (1, 2),    
    (2, 2);       

INSERT INTO Atleti_Gare (Atleta, Gara, Punteggio) VALUES
    (1, 1, 85),    
    (2, 1, 92),    
    (3, 1, 88),    
    (1, 2, 95),    
    (2, 2, 91);    

INSERT INTO Atleti_Squadre (Atleta, Squadra) VALUES
    (1, 1),
    (2, 1),
    (3, 2);

-- // :)
