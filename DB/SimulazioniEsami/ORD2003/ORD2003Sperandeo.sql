/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 04/05/2025
    Consegna: Implementazione database simulazione ordinaria 2003

    by jim_bug // :)
*/

CREATE TABLE Clienti (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Cognome VARCHAR(30) NOT NULL,
    Data DATE NOT NULL,
    Privato BOOLEAN NOT NULL,
    Telefono VARCHAR(16) NOT NULL,

    PRIMARY KEY(ID)
);

CREATE TABLE Qualifiche (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) UNIQUE NOT NULL,

    PRIMARY KEY(ID)
);

CREATE TABLE Attivita (
    Codice VARCHAR(5),
    Nome VARCHAR(30) NOT NULL,
    Costo DECIMAL(5, 2)NOT NULL,

    PRIMARY KEY(Codice)
);

CREATE TABLE Personali (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Cognome VARCHAR(30) NOT NULL,
    Anno YEAR,
    Qualifica INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Qualifica) REFERENCES Qualifiche (ID)
        ON UPDATE CASCADE
);

CREATE TABLE Speci (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) UNIQUE NOT NULL,
    Descrizione VARCHAR(128) NOT NULL,
    Img VARCHAR(30) NOT NULL,
    Esterno BOOLEAN NOT NULL,
    Coltivazione VARCHAR(50) NOT NULL,
    Esposizione VARCHAR(30) NOT NULL,
    Stagione ENUM('Inverno', 'Estate', 'Primavera', 'Autunno'),
    Personale INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Personale) REFERENCES Personali(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Tipi (
    ID INT AUTO_INCREMENT,
    Costo DECIMAL(5, 2) NOT NULL,
    Nome VARCHAR(30) UNIQUE NOT NULL,
    Specie INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Specie) REFERENCES Speci(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Interventi (
    ID INT AUTO_INCREMENT,
    Data DATE NOT NULL,
    DataEffettuazione DATE,
    Attivita VARCHAR(5) NOT NULL,
    Cliente INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Attivita) REFERENCES Attivita(Codice)
        ON UPDATE CASCADE,
    FOREIGN KEY (Cliente) REFERENCES Clienti(ID)
        ON UPDATE CASCADE
);

CREATE TABLE SpecieIntervento (
    Specie INT,
    Intervento INT,

    FOREIGN KEY (Specie) REFERENCES Speci(ID)
        ON UPDATE CASCADE,
    FOREIGN KEY (Intervento) REFERENCES Interventi(ID)
        ON UPDATE CASCADE
);

CREATE TABLE PersonaleIntervento (
    Personale INT NOT NULL,
    Intervento INT NOT NULL,

    PRIMARY KEY(Personale, Intervento),
    FOREIGN KEY (Personale) REFERENCES Personali(ID)
        ON UPDATE CASCADE,
    FOREIGN KEY (Intervento) REFERENCES Interventi(ID)
        ON UPDATE CASCADE
);

-- Clienti (20)
INSERT INTO Clienti (Nome, Cognome, Data, Privato, Telefono) VALUES
('Mario', 'Rossi', '2024-01-15', TRUE, '333-1234567'),
('Anna', 'Bianchi', '2024-01-18', TRUE, '333-7654321'),
('Giardini SRL', 'Verdi', '2024-01-25', FALSE, '02-9876543'),
('Carlo', 'Neri', '2024-02-01', TRUE, '333-2345678'),
('Elena', 'Ferrari', '2024-02-05', TRUE, '333-8765432'),
('Paolo', 'Romano', '2024-02-10', TRUE, '333-3456789'),
('Verde Pubblico', 'Comunale', '2024-02-15', FALSE, '02-7654321'),
('Lucia', 'Costa', '2024-02-20', TRUE, '333-4567890'),
('Marco', 'Esposito', '2024-02-25', TRUE, '333-9876543'),
('Villa Fiorita', 'Resort', '2024-03-01', FALSE, '02-6543210'),
('Giovanna', 'Marino', '2024-03-05', TRUE, '333-5678901'),
('Simone', 'Bruno', '2024-03-10', TRUE, '333-0987654'),
('Hotel Giardino', 'SPA', '2024-03-15', FALSE, '02-5432109'),
('Roberto', 'Gallo', '2024-03-20', TRUE, '333-6789012'),
('Laura', 'Conti', '2024-03-25', TRUE, '333-2109876'),
('Andrea', 'Ferrara', '2024-04-01', TRUE, '333-7890123'),
('Parco Relax', 'Resort', '2024-04-05', FALSE, '02-4321098'),
('Giulia', 'Rizzo', '2024-04-10', TRUE, '333-8901234'),
('Davide', 'Greco', '2024-04-15', TRUE, '333-3210987'),
('Comune', 'Montefiore', '2024-04-20', FALSE, '02-3210987');

-- Qualifiche (20)
INSERT INTO Qualifiche (Nome) VALUES
('Agronomo'),
('Giardiniere'),
('Fiorista'),
('Responsabile Acquisti'),
('Addetto Vendite'),
('Impiegato'),
('Esperto Piante Grasse'),
('Specialista Alberi'),
('Addetto Irrigazione'),
('Botanico'),
('Direttore'),
('Esperto Piante Tropicali'),
('Addetto Serre'),
('Esperto Concimi'),
('Tecnico Manutenzione'),
('Addetto Consegne'),
('Esperto Piante Acquatiche'),
('Specialista Bonsai'),
('Responsabile Vivai'),
('Addetto Marketing');

-- Attività (20)
INSERT INTO Attivita (Codice, Nome, Costo) VALUES
('A01', 'Potatura', 80.00),
('A02', 'Piantumazione', 120.00),
('A03', 'Consulenza', 50.00),
('A04', 'Realizzazione Giardino', 200.00),
('A05', 'Manutenzione', 150.00),
('A06', 'Trattamento Parassiti', 90.00),
('A07', 'Impianto Irrigazione', 350.00),
('A08', 'Concimazione', 70.00),
('A09', 'Pulizia Aiuole', 80.00),
('A10', 'Creazione Siepi', 200.00),
('A11', 'Diagnosi Malattie', 60.00),
('A12', 'Allestimento Terrazzi', 250.00),
('A13', 'Creazione Roccioso', 300.00),
('A14', 'Ripristino Prato', 180.00),
('A15', 'Allestimento Vasi', 120.00),
('A16', 'Cura Bonsai', 100.00),
('A17', 'Trapianti', 60.00),
('A18', 'Progettazione', 500.00),
('A19', 'Sopralluogo', 40.00),
('A20', 'Installazione Alberature', 400.00);

-- Personali (20)
INSERT INTO Personali (Nome, Cognome, Anno, Qualifica) VALUES
('Luca', 'Verdi', '2010', 1),  -- Agronomo
('Martina', 'Bianchi', '2012', 2),  -- Giardiniere
('Giorgio', 'Rossi', '2015', 3),  -- Fiorista
('Carla', 'Neri', '2011', 4),  -- Responsabile Acquisti
('Pietro', 'Ferrari', '2014', 5),  -- Addetto Vendite
('Francesca', 'Romano', '2013', 6),  -- Impiegato
('Antonio', 'Costa', '2016', 7),  -- Esperto Piante Grasse
('Sara', 'Esposito', '2017', 8),  -- Specialista Alberi
('Bruno', 'Marino', '2018', 9),  -- Addetto Irrigazione
('Marta', 'Bruno', '2010', 10),  -- Botanico
('Luigi', 'Gallo', '2012', 11),  -- Direttore
('Chiara', 'Conti', '2015', 12),  -- Esperto Piante Tropicali
('Fabio', 'Ferrara', '2016', 13),  -- Addetto Serre
('Serena', 'Rizzo', '2013', 14),  -- Esperto Concimi
('Dario', 'Greco', '2014', 15),  -- Tecnico Manutenzione
('Alessia', 'Lombardi', '2017', 16),  -- Addetto Consegne
('Nicola', 'Russo', '2018', 17),  -- Esperto Piante Acquatiche
('Elisa', 'Colombo', '2015', 18),  -- Specialista Bonsai
('Giovanni', 'Ricci', '2011', 19),  -- Responsabile Vivai
('Isabella', 'Martini', '2012', 20);  -- Addetto Marketing

-- Speci (20)
INSERT INTO Speci (Nome, Descrizione, Img, Esterno, Coltivazione, Esposizione, Stagione, Personale) VALUES
('Rosa', 'Rosa classica a cespuglio', 'rosa.jpg', TRUE, 'Terra ricca, concimata', 'Soleggiata', 'Primavera', 1),
('Ficus Benjamin', 'Pianta da interno con foglie verde scuro', 'ficus.jpg', FALSE, 'Terreno drenante', 'Mezz ombra', NULL, 7),
('Ciclamino', 'Fiore colorato da interno', 'ciclamino.jpg', FALSE, 'Terreno acido', 'Mezz ombra', 'Inverno', 3),
('Ulivo', 'Albero da frutto sempreverde', 'ulivo.jpg', TRUE, 'Terreno ben drenato', 'Soleggiata', NULL, 8),
('Orchidea', 'Fiore esotico da appartamento', 'orchidea.jpg', FALSE, 'Substrato speciale', 'Filtrata', NULL, 12),
('Azalea', 'Arbusto da fiore', 'azalea.jpg', TRUE, 'Terreno acido', 'Mezz ombra', 'Primavera', 2),
('Edera', 'Pianta rampicante', 'edera.jpg', TRUE, 'Qualsiasi', 'Qualsiasi', NULL, 2),
('Cactus', 'Pianta grassa spinosa', 'cactus.jpg', FALSE, 'Terreno sabbioso', 'Soleggiata', 'Estate', 7),
('Amulus', 'Pianta perenne da fiore', 'amulus.jpg', TRUE, 'Terreno umido', 'Soleggiata', 'Estate', 10),
('Bonsai Ginepro', 'Albero in miniatura', 'bonsai.jpg', FALSE, 'Substrato speciale', 'Mezz ombra', NULL, 18),
('Geranio', 'Pianta da balcone', 'geranio.jpg', TRUE, 'Terreno normale', 'Soleggiata', 'Estate', 2),
('Begonia', 'Pianta da fiore', 'begonia.jpg', FALSE, 'Terreno umido', 'Mezz ombra', 'Primavera', 3),
('Lavanda', 'Arbusto profumato', 'lavanda.jpg', TRUE, 'Terreno povero', 'Soleggiata', 'Estate', 1),
('Ninfea', 'Pianta acquatica', 'ninfea.jpg', TRUE, 'Acqua ferma', 'Soleggiata', 'Estate', 17),
('Palma da Salotto', 'Pianta tropicale', 'palma.jpg', FALSE, 'Terreno ricco', 'Filtrata', NULL, 12),
('Pino Mugo', 'Conifera nana', 'pino.jpg', TRUE, 'Terreno acido', 'Soleggiata', NULL, 8),
('Stella di Natale', 'Pianta da fiore invernale', 'stella.jpg', FALSE, 'Terreno normale', 'Filtrata', 'Inverno', 3),
('Agave', 'Pianta grassa a rosetta', 'agave.jpg', TRUE, 'Terreno sabbioso', 'Soleggiata', NULL, 7),
('Felce', 'Pianta ornamentale da foglia', 'felce.jpg', FALSE, 'Terreno umido', 'Ombra', NULL, 13),
('Magnolia', 'Albero da fiore', 'magnolia.jpg', TRUE, 'Terreno ricco', 'Soleggiata', 'Primavera', 8);

-- Tipi (20)
INSERT INTO Tipi (Costo, Nome, Specie) VALUES
(25.00, 'Rosa Peace', 1),
(35.00, 'Rosa Iceberg', 1),
(18.50, 'Ficus Standard', 2),
(22.00, 'Ficus Variegato', 2),
(8.50, 'Ciclamino Rosso', 3),
(8.50, 'Ciclamino Bianco', 3),
(65.00, 'Ulivo Secolare', 4),
(40.00, 'Ulivo Giovane', 4),
(30.00, 'Orchidea Phalaenopsis', 5),
(45.00, 'Orchidea Cymbidium', 5),
(15.00, 'Azalea Japonica', 6),
(17.50, 'Azalea Indica', 6),
(7.50, 'Edera Comune', 7),
(12.00, 'Edera Variegata', 7),
(9.00, 'Cactus Echinopsis', 8),
(14.00, 'Cactus Mammillaria', 8),
(6.50, 'Amulus Giallo', 9),
(6.50, 'Amulus Rosso', 9),
(80.00, 'Bonsai Ginepro Giovane', 10),
(150.00, 'Bonsai Ginepro Antico', 10);

-- Interventi (20)
INSERT INTO Interventi (Data, DataEffettuazione, Attivita, Cliente) VALUES
('2024-01-20', '2024-01-25', 'A01', 1),
('2024-01-22', '2024-01-26', 'A02', 3),
('2024-01-30', '2024-02-05', 'A03', 4),
('2024-02-05', '2024-02-15', 'A04', 7),
('2024-02-10', '2024-02-12', 'A05', 5),
('2024-02-15', '2024-02-20', 'A06', 6),
('2024-02-20', '2024-02-25', 'A07', 10),
('2024-02-25', '2024-03-01', 'A08', 8),
('2024-03-01', '2024-03-05', 'A09', 9),
('2024-03-05', '2024-03-10', 'A10', 13),
('2024-03-10', '2024-03-15', 'A11', 11),
('2024-03-15', '2024-03-20', 'A12', 12),
('2024-03-20', '2024-03-25', 'A13', 17),
('2024-03-25', '2024-03-30', 'A14', 14),
('2024-04-01', NULL, 'A15', 15),
('2024-04-05', NULL, 'A16', 16),
('2024-04-10', NULL, 'A17', 18),
('2024-04-15', NULL, 'A18', 19),
('2024-04-20', NULL, 'A19', 20),
('2024-04-25', NULL, 'A20', 7);

-- SpecieIntervento (20)
INSERT INTO SpecieIntervento (Specie, Intervento) VALUES
(1, 1),  -- Rosa per potatura
(4, 2),  -- Ulivo per piantumazione
(3, 3),  -- Ciclamino per consulenza
(16, 4), -- Pino per realizzazione giardino
(6, 5),  -- Azalea per manutenzione
(9, 6),  -- Amulus per trattamento parassiti
(14, 7), -- Ninfea per impianto irrigazione
(13, 8), -- Lavanda per concimazione
(7, 9),  -- Edera per pulizia aiuole
(16, 10), -- Pino per creazione siepi
(5, 11), -- Orchidea per diagnosi malattie
(2, 12), -- Ficus per allestimento terrazzi
(18, 13), -- Agave per creazione roccioso
(11, 14), -- Geranio per ripristino prato
(8, 15), -- Cactus per allestimento vasi
(10, 16), -- Bonsai per cura bonsai
(12, 17), -- Begonia per trapianti
(20, 18), -- Magnolia per progettazione
(15, 19), -- Palma per sopralluogo
(4, 20);  -- Ulivo per installazione alberature


-- PersonaleIntervento (20)
INSERT INTO PersonaleIntervento (Personale, Intervento) VALUES
(2, 1),  -- Giardiniere per potatura
(8, 2),  -- Specialista alberi per piantumazione
(1, 3),  -- Agronomo per consulenza
(19, 4), -- Responsabile vivai per realizzazione giardino
(2, 5),  -- Giardiniere per manutenzione
(14, 6), -- Esperto concimi per trattamento parassiti
(9, 7),  -- Addetto irrigazione per impianto
(14, 8), -- Esperto concimi per concimazione
(2, 9),  -- Giardiniere per pulizia aiuole
(8, 10), -- Specialista alberi per creazione siepi
(10, 11), -- Botanico per diagnosi malattie
(3, 12), -- Fiorista per allestimento terrazzi
(7, 13), -- Esperto piante grasse per roccioso
(15, 14), -- Tecnico manutenzione per ripristino prato
(3, 15), -- Fiorista per allestimento vasi
(18, 16), -- Specialista bonsai per cura bonsai
(13, 17), -- Addetto serre per trapianti
(1, 18), -- Agronomo per progettazione
(1, 19), -- Agronomo per sopralluogo
(8, 20);  -- Specialista alberi per installazione alberature
-- // :)
