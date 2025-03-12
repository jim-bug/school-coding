/*
Autore: Ignazio Leonardo Calogero Sperandeo
Data: 31/01/2025
Consegna: verifica svolto in classe 15/01/2025

by jim_bug // :)
*/

-- Creazione Tabella Discipline:
CREATE TABLE Discipline   (
    IDDisciplina INT AUTO_INCREMENT,
    Descrizione VARCHAR(255),

    PRIMARY KEY(IDDisciplina)
);


-- Creazione Tabella Nazioni:
CREATE TABLE Nazioni   (
    IDNazione INT AUTO_INCREMENT,
    Descrizione VARCHAR(255),

    PRIMARY KEY(IDNazione)
);

-- Creazione Tabella Riviste:
CREATE TABLE Riviste   (
    IDRivista INT AUTO_INCREMENT,
    Titolo VARCHAR(50) NOT NULL,
    Peridocita VARCHAR(20) NOT NULL,
    PrezzoUnitario DECIMAL(5, 2) NOT NULL,
    IDDisciplina INT NOT NULL,
    PRIMARY KEY(IDRivista),
    FOREIGN KEY (IDDisciplina) REFERENCES Discipline(IDDisciplina)
);

-- Creazione Tabella Abbonati:
CREATE TABLE Abbonati   (
    IDAbbonato INT AUTO_INCREMENT,
    Cognome VARCHAR(25) NOT NULL,
    Nome VARCHAR(25) NOT NULL,
    Telefono VARCHAR(16),
    Email VARCHAR(20) NOT NULL,
    Genere VARCHAR(1) NOT NULL,
    IDNazione INT NOT NULL,

    PRIMARY KEY(IDAbbonato),
    FOREIGN KEY (IDNazione) REFERENCES Nazioni(IDNazione)
);

-- Creazione Tabella PuntiVendita:
CREATE TABLE PuntiVendita   (
    IDPuntoVendita INT AUTO_INCREMENT,
    Denominazione VARCHAR(50) NOT NULL,
    Telefono VARCHAR(16) NOT NULL,
    Email VARCHAR(20) NOT NULL,
    Tipologia VARCHAR(50),
    IDNazione INT NOT NULL,

    PRIMARY KEY(IDPuntoVendita),
    FOREIGN KEY (IDNazione) REFERENCES Nazioni(IDNazione)
);

-- Creazione Tabella Abbonamenti:
CREATE TABLE Abbonamenti (
    ID INT AUTO_INCREMENT,
    DataRegistrazione DATE NOT NULL,
    Durata VARCHAR(50) NOT NULL,
    IDRivista INT NOT NULL,
    IDAbbonato INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (IDAbbonato) REFERENCES Abbonati(IDAbbonato),
    FOREIGN KEY (IDRivista) REFERENCES Riviste(IDRivista)
);

-- Creazione Tabella Ordini:
CREATE TABLE Ordini (
    ID INT AUTO_INCREMENT,
    DataRegistrazione DATE NOT NULL,
    Quantita INT NOT NULL,
    IDRivista INT NOT NULL,
    IDPuntoVendita INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (IDRivista) REFERENCES Riviste(IDRivista),
    FOREIGN KEY (IDPuntoVendita) REFERENCES PuntiVendita(IDPuntoVendita)
);


-- Aggiunta Campo: AliquotaIVA
ALTER TABLE Riviste ADD AliquotaIVA DECIMAL(2, 1);

-- Inserimento record Tabella Discipline:
INSERT INTO Discipline (Descrizione) VALUES
    ('Informatica'),
    ('Matematica');

-- Inserimento record Tabella Nazioni:
INSERT INTO Nazioni (Descrizione) VALUES
    ('Svizzera'),
    ('Italia');

-- Inserimento record Tabella Riviste:
INSERT INTO Riviste (Titolo, Peridocita, PrezzoUnitario, IDDisciplina, AliquotaIVA) VALUES
    ('La matematica non capita', 'Mensile', 10.99, 2, 0.2),
    ('Segmentation Fault (core dumped)', 'Mensile', 99.99, 1, 0.2);

-- Inserimento record Tabella Abbonato:
INSERT INTO Abbonati (Cognome, Nome, Telefono, Email, Genere, IDNazione) VALUES
    ('Sperandeo', 'Ignazio', '3333331111', 'io@gmail.com', 'M', 1),
    ('bug', 'jim', NULL, 'bug@gmail.com', 'M', 2);

-- Inserimento record Tabella PuntiVendita:
INSERT INTO PuntiVendita (Denominazione, Telefono, Email, Tipologia, IDNazione) VALUES
    ('ColaEdi', '0914445555', 'kok@gmail.com', 'Edicola', 1),
    ('ColaSci', '0914445554', 'ko@gmail.com', NULL, 2);

-- Inserimento record Tabella Abbonamenti:
INSERT INTO Abbonamenti (DataRegistrazione, Durata, IDRivista, IDAbbonato) VALUES
    ('2024-01-02', 'Annuale', 1, 2),
    ('2024-03-02', 'Triennale', 2, 1);

-- Inserimento record Tabella Ordini:
INSERT INTO Ordini (DataRegistrazione, Quantita, IDRivista, IDPuntoVendita) VALUES 
    ('2024-01-06', 5, 1, 1),
    ('2024-05-06', 30, 2, 2);

