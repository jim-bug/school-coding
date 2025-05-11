/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 28/04/2025
    Esercizio: 

    by jim_bug // :)
*/

CREATE TABLE Utenti (
    ID INT AUTO_INCREMENT,
    Username VARCHAR(30) NOT NULL,
    Password VARCHAR(255) NOT NULL,

    UNIQUE(Username),
    PRIMARY KEY(ID)
);


INSERT INTO Utenti VALUES 
    (NULL, 'jim_bug', SHA2('1234', 256)),
    (NULL, 'palinuro', SHA2('12345', 256)),
    (NULL, 'kinki', SHA2('123456', 256)),
    (NULL, 'tinki', SHA2('1234567', 256)),
    (NULL, 'sinki', SHA2('12345678', 256)),
    (NULL, 'alessandro', SHA2('123456789', 256)),
    (NULL, 'sql', SHA2('1234567891', 256));

-- // :)
