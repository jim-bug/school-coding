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


-- // :)
