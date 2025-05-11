/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 10/05/2025
    Consegna: Rif. flipped-classroom practice-time 3

    by jim_bug // :)
*/

CREATE TABLE Utenti (
    ID INT AUTO_INCREMENT,
    Username VARCHAR(15) NOT NULL,
    Password VARCHAR(20) NOT NULL,      

    PRIMARY KEY(ID),
    UNIQUE(Username)
);

INSERT INTO Utenti VALUES 
    (NULL, 'jim_bug', '1234'),
    (NULL, 'palinuro', '12345'),
    (NULL, 'kinki', '123456'),
    (NULL, 'tinki', '1234567'),
    (NULL, 'sinki', '12345678'),
    (NULL, 'alessandro', '123456789'),
    (NULL, 'sql', '1234567891');

-- // :)
