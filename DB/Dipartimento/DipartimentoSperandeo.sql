/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 07/05/2025
    Consegna:

    by jim_bug // :)
*/

CREATE TABLE Impiegati (
    Matricola VARCHAR(5),
    Cognome VARCHAR(30) NOT NULL,
    Stipendio DECIMAL(9, 2) NOT NULL,
    Dipartimento VARCHAR(5) NOT NULL,

    PRIMARY KEY(Matricola)
);

CREATE TABLE Dipartimenti (
    Codice VARCHAR(5),
    Nome VARCHAR(30) NOT NULL,
    Sede VARCHAR(50) NOT NULL,
    Direttore VARCHAR(5) NOT NULL,

    PRIMARY KEY(Codice),
    FOREIGN KEY (Direttore) REFERENCES Impiegati(Matricola)
        ON UPDATE CASCADE
);
CREATE TABLE Progetti (
    Sigla VARCHAR(5),
    Nome VARCHAR(30) NOT NULL,
    Bilancio DECIMAL(8, 2) NOT NULL,
    Responsabile VARCHAR(5) NOT NULL,

    PRIMARY KEY(Sigla),
    FOREIGN KEY (Responsabile) REFERENCES Impiegati(Matricola)
        ON UPDATE CASCADE
);

CREATE TABLE Partecipazione (
    Impiegato VARCHAR(5) NOT NULL,
    Progetto VARCHAR(5) NOT NULL,

    PRIMARY KEY(Impiegato, Progetto),
    FOREIGN KEY (Impiegato) REFERENCES Impiegati(Matricola)
        ON UPDATE CASCADE,
    FOREIGN KEY (Progetto) REFERENCES Progetti(Sigla)
        ON UPDATE CASCADE
);

ALTER TABLE Impiegati ADD CONSTRAINT FK_Impiegato
FOREIGN KEY (Dipartimento) 
REFERENCES Dipartimenti(Codice) ON UPDATE CASCADE;

-- [1] Disabilito temporaneamente i vincoli FK (MySQL)
SET FOREIGN_KEY_CHECKS = 0;

-- [2] Dipartimenti
INSERT INTO Dipartimenti (Codice, Nome, Sede, Direttore) VALUES
  ('D01','Risorse Umane','Roma','E01'),
  ('D02','Ingegneria','Milano','E03'),
  ('D03','Marketing','Torino','E05'),
  ('D04','Finanza','Napoli','E02'),
  ('D05','Ricerca','Bologna','E04');

-- [3] Impiegati
INSERT INTO Impiegati (Matricola, Cognome, Stipendio, Dipartimento) VALUES
  ('E01','Rossi', 75000.00,'D01'),
  ('E02','Bianchi',82000.00,'D04'),
  ('E03','Verdi', 67000.00,'D02'),
  ('E04','Gialli',91000.00,'D05'),
  ('E05','Neri',  58000.00,'D03'),
  ('E06','Russo', 62000.00,'D02'),
  ('E07','Ferrari',55000.00,'D01'),
  ('E08','Esposito',48000.00,'D03'),
  ('E09','Romano',76000.00,'D05'),
  ('E10','Colombo',53000.00,'D04');

-- [4] Progetti
INSERT INTO Progetti (Sigla, Nome, Bilancio, Responsabile) VALUES
  ('P01','Progetto A',120000.00,'E03'),
  ('P02','Progetto B', 85000.00,'E02'),
  ('P03','Progetto C',200000.00,'E04'),
  ('P04','Progetto D', 45000.00,'E06'),
  ('P05','Progetto E',135000.00,'E09');

-- [5] Partecipazione
INSERT INTO Partecipazione (Impiegato, Progetto) VALUES
  ('E01','P01'),
  ('E03','P01'),
  ('E03','P03'),
  ('E02','P02'),
  ('E06','P02'),
  ('E04','P03'),
  ('E05','P03'),
  ('E06','P04'),
  ('E07','P01'),
  ('E09','P05'),
  ('E10','P02'),
  ('E10','P05'),
  ('E08','P01');

-- [6] Riabilito i vincoli FK
SET FOREIGN_KEY_CHECKS = 1;