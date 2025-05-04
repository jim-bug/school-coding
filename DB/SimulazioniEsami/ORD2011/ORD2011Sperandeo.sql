/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 03/05/2025
    Consegna: Implementazione database simulazione ordinaria 2011

    by jim_bug // :)
*/

CREATE TABLE OrdiniAppartenenza (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) UNIQUE NOT NULL,

    PRIMARY KEY (ID)
);

CREATE TABLE SpecieAnimali (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) UNIQUE NOT NULL,
    Estinzione BOOLEAN NOT NULL,
    OrdineAppartenenza INT,

    PRIMARY KEY(ID),
    FOREIGN KEY (OrdineAppartenenza) REFERENCES OrdiniAppartenenza(ID)
        ON UPDATE CASCADE
);

CREATE TABLE TipiFlora (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) UNIQUE NOT NULL,

    PRIMARY KEY(ID)
);

CREATE TABLE SpecieFlora (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) UNIQUE NOT NULL,
    Stagione ENUM('Inverno', 'Estate', 'Autunno', 'Primavera') NOT NULL,
    TipoFlora INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (TipoFlora) REFERENCES TipiFlora(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Regioni (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,

    PRIMARY KEY(ID)
);

CREATE TABLE Responsabili (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Cognome VARCHAR(30) NOT NULL,
    Username VARCHAR(10) UNIQUE NOT NULL,
    Password VARCHAR(20) NOT NULL,
    Data DATE NOT NULL,

    PRIMARY KEY(ID)
);

CREATE TABLE Parchi (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Responsabile INT NOT NULL,
    Regione INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Responsabile) REFERENCES Responsabili(ID)
        ON UPDATE CASCADE,
    FOREIGN KEY (Regione) REFERENCES Regioni(ID)
        ON UPDATE CASCADE
);

CREATE TABLE EsemplariAnimale (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Data DATE NOT NULL,
    Sesso ENUM('M', 'F') NOT NULL,
    Adulto BOOLEAN NOT NULL,
    Specie INT NOT NULL,
    Parco INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Specie) REFERENCES SpecieAnimali(ID)
        ON UPDATE CASCADE,
    FOREIGN KEY (Parco) REFERENCES Parchi(ID)
        ON UPDATE CASCADE
);

CREATE TABLE ParcoFlora (
    Parco INT NOT NULL,
    Specie INT NOT NULL,

    PRIMARY KEY(Parco, Specie),
    FOREIGN KEY (Parco) REFERENCES Parchi(ID)
        ON UPDATE CASCADE,
    FOREIGN KEY (Specie) REFERENCES SpecieFlora(ID)
        ON UPDATE CASCADE
);

-- 1) Ordini di appartenenza
INSERT INTO OrdiniAppartenenza (Nome) VALUES
  ('Carnivori'),
  ('Erbivori'),
  ('Insettivori');

-- 2) Specie animali
INSERT INTO SpecieAnimali (Nome, Estinzione, OrdineAppartenenza) VALUES
  ('Orso',        FALSE,  1),
  ('Lupo',        FALSE,  1),
  ('Cervo',       FALSE,  2),
  ('Farfalla',    FALSE,  3),
  ('Lince',       TRUE,   1);

-- 3) Tipi di flora
INSERT INTO TipiFlora (Nome) VALUES
  ('Alberi'),
  ('Arbusti'),
  ('Erbe');

-- 4) Specie di flora
INSERT INTO SpecieFlora (Nome, Stagione, TipoFlora) VALUES
  ('Pino domestico',  'Inverno',   1),
  ('Rosmarino',       'Estate',    2),
  ('Lavanda',         'Primavera', 3);

-- 5) Regioni
INSERT INTO Regioni (Nome) VALUES
  ('Sicilia'),
  ('Toscana');

-- 6) Responsabili
INSERT INTO Responsabili (Nome, Cognome, Username, Password, Data) VALUES
  ('Mario', 'Rossi',    'mrossi',   'pass123', '2025-04-01'),
  ('Lucia', 'Bianchi',  'lbianchi', 'pwd456',  '2025-03-15');

-- 7) Parchi
INSERT INTO Parchi (Nome, Responsabile, Regione) VALUES
  ('Parco Etna',            1, 1),
  ('Parco della Maremma',   2, 2);

-- 8) Esemplari di animale
INSERT INTO EsemplariAnimale (Nome, Data, Sesso, Adulto, Specie, Parco) VALUES
  ('Orsetto Etneo',    '2024-06-10', 'M', FALSE, 1, 1),
  ('Lupo Appenninico',  '2023-11-20', 'F', TRUE,  2, 2),
  ('Cerbiatta',        '2024-02-05', 'F', FALSE, 3, 2),
  ('Lince Sicula',     '2022-09-11', 'F', TRUE,  5, 1);

-- 9) Associazioni Parco–Flora
INSERT INTO ParcoFlora (Parco, Specie) VALUES
  (1, 1),  -- Pino in Parco Etna
  (1, 2),  -- Rosmarino in Parco Etna
  (2, 3);  -- Lavanda in Parco Maremma

-- // :)
