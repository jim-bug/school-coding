/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 25/04/2025
    Consegna: Implementazione database simulazione straordinaria 2023

    by jim_bug // :)
*/

CREATE TABLE Tipologie (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,

    PRIMARY KEY(ID)
);

CREATE TABLE Regioni (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,

    PRIMARY KEY(ID)
);

CREATE TABLE Apicoltori (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Cognome VARCHAR(30) NOT NULL,
    Username VARCHAR(10) NOT NULL,
    Password VARCHAR(24) NOT NULL,

    UNIQUE(Username),
    PRIMARY KEY(ID)
);

CREATE TABLE Mieli (
    ID INT AUTO_INCREMENT,
    Denominazione VARCHAR(30) NOT NULL,
    Tipologia INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Tipologia) REFERENCES Tipologie(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Province (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Sigla VARCHAR(3) NOT NULL,
    Regione INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Regione) REFERENCES Regioni(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Comuni (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Provincia INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Provincia) REFERENCES Province(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Localita (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Comune INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Comune) REFERENCES Comuni(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Apiari (
    Codice VARCHAR(5) NOT NULL,
    NumeroArnie INT NOT NULL,
    Miele INT NOT NULL,
    Apicoltore INT NOT NULL,
    Localita INT NOT NULL,


    PRIMARY KEY(Codice),    
    FOREIGN KEY (Miele) REFERENCES Mieli(ID)
        ON UPDATE CASCADE,
    FOREIGN KEY (Apicoltore) REFERENCES Apicoltori(ID)
        ON UPDATE CASCADE,
    FOREIGN KEY (Localita) REFERENCES Localita(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Produzioni (
    ID INT AUTO_INCREMENT,
    Anno YEAR NOT NULL,
    Quantita DECIMAL(5, 2) NOT NULL,
    Apiario VARCHAR(5) NOT NULL,

    CHECK(Quantita > 0),
    UNIQUE(Anno, Apiario),
    PRIMARY KEY(ID),
    FOREIGN KEY (Apiario) REFERENCES Apiari(Codice)
        ON UPDATE CASCADE
);


INSERT INTO Tipologie (Nome) VALUES 
    ('Miele ad identità nazionale'),
    ('Miele ad identità regionale'),
    ('Miele ad identità territoriale'),
    ('Miele D.O.P.');

INSERT INTO Regioni (Nome) VALUES 
    ('Sicilia'),
    ('Lombardia'),
    ('Lazio'),
    ('Campania'),
    ('Toscana'),
    ('Emilia-Romagna'),
    ('Puglia'),
    ('Calabria'),
    ('Piemonte'),
    ('Liguria');

INSERT INTO Apicoltori (Nome, Cognome, Username, Password) VALUES 
    ('Mario', 'Rossi', 'mrossi', 'password1'),
    ('Luigi', 'Bianchi', 'lbianchi', 'password2'),
    ('Anna', 'Verdi', 'averdi', 'password3'),
    ('Laura', 'Neri', 'lneri', 'password4'),
    ('Paolo', 'Gialli', 'pgialli', 'password5');

INSERT INTO Mieli (Denominazione, Tipologia) VALUES 
    ('Miele di Acacia', 1),
    ('Miele di Castagno', 2),
    ('Miele di Eucalipto', 3),
    ('Miele di Corbezzolo', 4),
    ('Miele di Arancio', 1);


INSERT INTO Province (Nome, Sigla, Regione) VALUES 
    ('Palermo', 'PA', 1),
    ('Milano', 'MI', 2),
    ('Roma', 'RM', 3),
    ('Napoli', 'NA', 4),
    ('Firenze', 'FI', 5);


INSERT INTO Comuni (Nome, Provincia) VALUES 
    ('Palermo', 1),
    ('Milano', 2),
    ('Roma', 3),
    ('Napoli', 4),
    ('Firenze', 5);


INSERT INTO Localita (Nome, Comune) VALUES 
    ('Centro Storico', 1),
    ('Navigli', 2),
    ('Trastevere', 3),
    ('Vomero', 4),
    ('Oltrarno', 5);


INSERT INTO Apiari (Codice, NumeroArnie, Miele, Apicoltore, Localita) VALUES 
    ('A001', 10, 1, 1, 1),
    ('A002', 15, 2, 2, 2),
    ('A003', 20, 3, 3, 3),
    ('A004', 25, 4, 4, 4),
    ('A005', 30, 5, 5, 5);

INSERT INTO Produzioni (Anno, Quantita, Apiario) VALUES 
    (2023, 100.50, 'A001'),
    (2023, 200.75, 'A002'),
    (2023, 150.00, 'A003'),
    (2023, 300.25, 'A004'),
    (2023, 250.00, 'A005');

-- // :)
