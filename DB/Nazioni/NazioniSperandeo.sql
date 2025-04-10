/*
 Autore: Ignazio Leonardo Calogero Sperandeo
 Data: 11/02/2025
 Consegna: Effettuare due Query
 by jim_bug // :)
*/

-- DDL:

-- Creazione tabella: Nazioni

CREATE TABLE Nazioni (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    UNIQUE(Nome),

    PRIMARY KEY(ID)
);

-- Creazione della tabella: Regioni
CREATE TABLE Regioni (
    Codice VARCHAR(5),
    Nome VARCHAR(30) NOT NULL,
    ID INT NOT NULL,

    PRIMARY KEY(Codice),
    FOREIGN KEY (ID) REFERENCES Nazioni(ID)
);

-- Creazione della tabella: Citta
CREATE TABLE Citta (
    Codice VARCHAR(5),
    Nome VARCHAR(30) NOT NULL,
    Abitanti INT NOT NULL,
    CodiceR VARCHAR(5) NOT NULL,

    PRIMARY KEY(Codice),
    FOREIGN KEY (CodiceR) REFERENCES Regioni(Codice)
);


-- DML:

-- Inserimento dati nella tabella Nazioni
INSERT INTO Nazioni (Nome) VALUES 
    ('Italia'),
    ('Francia'),
    ('Germania'),
    ('Spagna'),
    ('Portogallo'),
    ('Regno Unito'),
    ('Svizzera'),
    ('Austria'),
    ('Belgio'),
    ('Paesi Bassi');

-- Inserimento dati nella tabella Regioni
INSERT INTO Regioni (Codice, Nome, ID) VALUES 
    ('IT01', 'Lombardia', 1),
    ('IT02', 'Lazio', 1),
    ('IT03', 'Toscana', 1),

    ('FR01', 'Ile-de-France', 2),
    ('FR02', 'Provenza', 2),
    ('FR03', 'Bretagna', 2),

    ('DE01', 'Baviera', 3),
    ('DE02', 'Renania', 3),
    ('DE03', 'Sassonia', 3),

    ('ES01', 'Catalogna', 4),
    ('ES02', 'Andalusia', 4),
    ('ES03', 'Madrid', 4),

    ('PT01', 'Lisbona', 5),
    ('PT02', 'Porto', 5),
    ('PT03', 'Algarve', 5),

    ('UK01', 'Inghilterra', 6),
    ('UK02', 'Scozia', 6),
    ('UK03', 'Galles', 6),

    ('CH01', 'Zurigo', 7),
    ('CH02', 'Ginevra', 7),
    ('CH03', 'Berna', 7),

    ('AT01', 'Vienna', 8),
    ('AT02', 'Tirolo', 8),
    ('AT03', 'Salzburgo', 8),

    ('BE01', 'Fiandre', 9),
    ('BE02', 'Vallonia', 9),
    ('BE03', 'Bruxelles', 9),

    ('NL01', 'Olanda Settentrionale', 10),
    ('NL02', 'Olanda Meridionale', 10),
    ('NL03', 'Utrecht', 10);

-- Inserimento dati nella tabella Citta
INSERT INTO Citta (Codice, Nome, Abitanti, CodiceR) VALUES 
    ('CIT01', 'Milano', 1366180, 'IT01'),
    ('CIT02', 'Bergamo', 120923, 'IT01'),
    ('CIT03', 'Roma', 2872800, 'IT02'),
    ('CIT04', 'Viterbo', 67897, 'IT02'),
    ('CIT05', 'Firenze', 380948, 'IT03'),
    ('CIT06', 'Pisa', 90038, 'IT03'),

    ('CIT07', 'Parigi', 2161000, 'FR01'),
    ('CIT08', 'Versailles', 85416, 'FR01'),
    ('CIT09', 'Marsiglia', 861635, 'FR02'),
    ('CIT10', 'Nizza', 342522, 'FR02'),
    ('CIT11', 'Rennes', 216815, 'FR03'),
    ('CIT12', 'Brest', 140064, 'FR03'),

    ('CIT13', 'Monaco di Baviera', 1488202, 'DE01'),
    ('CIT14', 'Norimberga', 518365, 'DE01'),
    ('CIT15', 'Colonia', 1085664, 'DE02'),
    ('CIT16', 'Düsseldorf', 619294, 'DE02'),
    ('CIT17', 'Lipsia', 597493, 'DE03'),
    ('CIT18', 'Dresda', 556780, 'DE03'),

    ('CIT19', 'Barcellona', 1620343, 'ES01'),
    ('CIT20', 'Girona', 101852, 'ES01'),
    ('CIT21', 'Siviglia', 688711, 'ES02'),
    ('CIT22', 'Granada', 232208, 'ES02'),
    ('CIT23', 'Madrid', 3266126, 'ES03'),
    ('CIT24', 'Alcalá de Henares', 195979, 'ES03'),

    ('CIT25', 'Lisbona', 544851, 'PT01'),
    ('CIT26', 'Sintra', 385406, 'PT01'),
    ('CIT27', 'Porto', 231962, 'PT02'),
    ('CIT28', 'Guimarães', 158124, 'PT02'),
    ('CIT29', 'Faro', 64559, 'PT03'),
    ('CIT30', 'Lagos', 31374, 'PT03'),

    ('CIT31', 'Londra', 8982000, 'UK01'),
    ('CIT32', 'Manchester', 553230, 'UK01'),
    ('CIT33', 'Edimburgo', 536775, 'UK02'),
    ('CIT34', 'Glasgow', 635640, 'UK02'),
    ('CIT35', 'Cardiff', 481082, 'UK03'),
    ('CIT36', 'Swansea', 246466, 'UK03'),

    ('CIT37', 'Zurigo', 428737, 'CH01'),
    ('CIT38', 'Winterthur', 114220, 'CH01'),
    ('CIT39', 'Ginevra', 203856, 'CH02'),
    ('CIT40', 'Losanna', 140920, 'CH02'),
    ('CIT41', 'Berna', 133115, 'CH03'),
    ('CIT42', 'Bienne', 55082, 'CH03'),

    ('CIT43', 'Vienna', 1911191, 'AT01'),
    ('CIT44', 'Innsbruck', 132493, 'AT02'),
    ('CIT45', 'Salzburgo', 156696, 'AT03'),

    ('CIT46', 'Anversa', 523248, 'BE01'),
    ('CIT47', 'Namur', 110939, 'BE02'),
    ('CIT48', 'Bruxelles', 184726, 'BE03'),

    ('CIT49', 'Amsterdam', 905234, 'NL01'),
    ('CIT50', 'Rotterdam', 651446, 'NL02');

-- // :)
