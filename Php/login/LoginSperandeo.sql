/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 28/04/2025
    Esercizio: 

    by jim_bug // :)
*/

CREATE TABLE Utenti (
    ID INT AUTO_INCREMENT,
    Username VARCHAR(30) NOT NULL,
    Password VARCHAR(224) NOT NULL,

    CHECK(LENGTH(Password) > 0 AND LENGTH(Username) > 0),
    PRIMARY KEY(ID),
    UNIQUE(Username)
);


INSERT INTO Utenti VALUES 
    (NULL, 'jim_bug', SHA2('1234', 224)),
    (NULL, 'palinuro', SHA2('12345', 224)),
    (NULL, 'kinki', SHA2('123456', 224)),
    (NULL, 'tinki', SHA2('1234567', 224)),
    (NULL, 'sinki', SHA2('12345678', 224)),
    (NULL, 'alessandro', SHA2('123456789', 224)),
    (NULL, 'sql', SHA2('1234567891', 224));


