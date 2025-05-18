/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 27/03/2025
    Consegna: Simulazione Seconda Prova Informatica, quesito 3 della seconda parte.

    by jim_bug // :)
*/

CREATE TABLE Auto (
    Targa VARCHAR(7),
    Modello VARCHAR(30) NOT NULL,
    Cilindrata INT NOT NULL,
    Colore VARCHAR(20) NOT NULL,

    PRIMARY KEY(Targa)
);

CREATE TABLE Vigili (
    Matricola VARCHAR(5),
    Nome VARCHAR(30) NOT NULL,
    Cognome VARCHAR(30) NOT NULL,
    Data DATE NOT NULL,

    PRIMARY KEY(Matricola)
);

CREATE TABLE Multe (
    ID INT AUTO_INCREMENT,
    Data DATE NOT NULL,
    Motivazione VARCHAR(255) NOT NULL,
    Auto VARCHAR(7) NOT NULL,
    Vigile VARCHAR(5) NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Auto) REFERENCES Auto (Targa)
        ON UPDATE CASCADE,
    FOREIGN KEY (Vigile) REFERENCES Vigili(Matricola)
        ON UPDATE CASCADE
);



INSERT INTO Auto (Targa, Modello, Cilindrata, Colore) VALUES 
    ('AB123CD', 'Fiat Panda', 1200, 'Rosso'),
    ('EF456GH', 'Toyota Yaris', 1500, 'Blu'),
    ('IL789MN', 'Ford Focus', 1600, 'Grigio'),
    ('OP012QR', 'Volkswagen Golf', 2000, 'Nero'),
    ('ST345UV', 'Renault Clio', 1400, 'Bianco');


INSERT INTO Vigili (Matricola, Nome, Cognome, Data) VALUES
    ('V0001', 'Mario', 'Rossi', '1980-05-15'),
    ('V0002', 'Laura', 'Bianchi', '1985-08-22'),
    ('V0003', 'Giuseppe', 'Verdi', '1975-03-10'),
    ('V0004', 'Anna', 'Neri', '1990-11-30'),
    ('V0005', 'Paolo', 'Gialli', '1982-07-25');


INSERT INTO Multe (Data, Motivazione, Auto, Vigile) VALUES
    ('2025-03-15', 'Divieto di sosta', 'AB123CD', 'V0001'),             -- ID 1
    ('2025-03-15', 'Eccesso di velocità', 'EF456GH', 'V0002'),          -- ID 2
    ('2025-03-16', 'Passaggio con semaforo rosso', 'IL789MN', 'V0001'), -- ID 3
    ('2025-03-16', 'Sosta in doppia fila', 'OP012QR', 'V0003'),         -- ID 4
    ('2025-03-17', 'Mancata revisione', 'ST345UV', 'V0004'),            -- ID 5
    ('2025-03-17', 'Uso del telefono alla guida', 'AB123CD', 'V0002'),  -- ID 6
    ('2025-03-18', 'Mancato uso delle cinture', 'IL789MN', 'V0005'),    -- ID 7
    ('2025-03-18', 'Divieto di sosta', 'EF456GH', 'V0003');             -- ID 8

-- // :)
