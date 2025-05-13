/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 28/04/2025
    Esercizio: 

    by jim_bug // :)
*/

CREATE TABLE Utenti (
    ID INT AUTO_INCREMENT,
    Username VARCHAR(30) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,

    PRIMARY KEY(ID)
);

CREATE TABLE Tipi (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL UNIQUE,

    PRIMARY KEY(ID)
);

CREATE TABLE Note (
    ID INT AUTO_INCREMENT,
    Titolo VARCHAR(50) NOT NULL,
    Contenuto VARCHAR(255) NOT NULL,
    Utente INT NOT NULL,
    Tipo INT NOT NULL,
    DataCreazione TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(ID),
    FOREIGN KEY (Utente) REFERENCES Utenti(ID)
        ON UPDATE CASCADE,
    FOREIGN KEY (Tipo) REFERENCES Tipi(ID)
        ON UPDATE CASCADE
);


INSERT INTO Tipi (Nome) VALUES
  ('Personale'),
  ('Lavoro'),
  ('Studio'),
  ('Promemoria'),
  ('Idea');

-- // :)
