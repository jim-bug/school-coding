/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 27/03/2025
    Consegna: Simulazione Seconda Prova Informatica, prima parte.

    by jim_bug // :)
*/

-- Creazione della tabella Categorie:
CREATE TABLE Categorie (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,

    PRIMARY KEY(ID)
);

-- Creazione della tabella Docenti:
CREATE TABLE Docenti (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Cognome VARCHAR(30) NOT NULL,
    Username VARCHAR(20) NOT NULL,
    Password_Hash VARCHAR(255) NOT NULL,

    PRIMARY KEY(ID),
    UNIQUE(Username)
);

-- Creazione della tabella Risorse:
CREATE TABLE Risorse (
    Codice VARCHAR(5) NOT NULL,
    Denominazione VARCHAR(40) NOT NULL,
    Collocazione VARCHAR(50) NOT NULL,
    Categoria INT NOT NULL,

    PRIMARY KEY(Codice),
    FOREIGN KEY (Categoria) REFERENCES Categorie(ID)
        ON UPDATE CASCADE
);

-- Creazione della tabella Classi:
CREATE TABLE Classi (
    ID INT AUTO_INCREMENT,
    Anno INT NOT NULL,
    Sezione CHAR(1) NOT NULL,
    Indirizzo VARCHAR(30) NOT NULL,
    Anno_Scolastico CHAR(9) NOT NULL,
    
    PRIMARY KEY(ID),
    UNIQUE(Anno, Sezione, Indirizzo, Anno_Scolastico),
    CHECK (Anno BETWEEN 1 AND 5),
    CHECK (Sezione REGEXP '^[A-Z]$'),
    CHECK (Anno_Scolastico REGEXP '^[0-9]{4}/[0-9]{4}$'),
    CHECK (CAST(SUBSTRING(Anno_Scolastico, 1, 4) AS INT) + 1 = CAST(SUBSTRING(Anno_Scolastico, 6, 4) AS INT))
);

-- Creazione della tabella Richieste:
CREATE TABLE Richieste (
    ID INT AUTO_INCREMENT,
    Risorsa VARCHAR(5) NOT NULL,
    Docente INT NOT NULL,
    Data DATE NOT NULL,
    Ora_Inizio TIME NOT NULL,
    Ora_Fine TIME NOT NULL,

    PRIMARY KEY(ID),
    CHECK (Ora_Fine > Ora_Inizio),

    FOREIGN KEY (Risorsa) REFERENCES Risorse(Codice)
        ON UPDATE CASCADE,
    FOREIGN KEY (Docente) REFERENCES Docenti(ID)
        ON UPDATE CASCADE
);

-- Creazione della tabella Richieste-Classi:
CREATE TABLE Richieste_Classi (
    Richiesta INT NOT NULL,
    Classe INT NOT NULL,

    FOREIGN KEY (Richiesta) REFERENCES Richieste(ID)
        ON UPDATE CASCADE,
    FOREIGN KEY (Classe) REFERENCES Classi(ID)
        ON UPDATE CASCADE
);


INSERT INTO Categorie (Nome) VALUES
    ('Laboratorio'),            -- ID 1
    ('Aula Multimediale'),      -- ID 2
    ('Palestra'),               -- ID 3
    ('Biblioteca');             -- ID 4

INSERT INTO Docenti (Nome, Cognome, Username, Password_Hash) VALUES
    ('Mario', 'Rossi', 'mrossi', '$2y$10$abcdef...'),           -- ID 1
    ('Laura', 'Bianchi', 'lbianchi', '$2y$10$ghijkl...'),       -- ID 2
    ('Giuseppe', 'Verdi', 'gverdi', '$2y$10$mnopqr...');        -- ID 3


INSERT INTO Risorse (Codice, Denominazione, Collocazione, Categoria) VALUES
    ('LAB01', 'Laboratorio Informatica 1', 'Piano Terra - Ala Est', 1),
    ('LAB02', 'Laboratorio Fisica', 'Primo Piano - Ala Nord', 1),
    ('AUM01', 'Aula Magna', 'Piano Terra - Centrale', 2),
    ('PAL01', 'Palestra Principale', 'Edificio B', 3);

INSERT INTO Classi (Anno, Sezione, Indirizzo, Anno_Scolastico) VALUES
    (3, 'A', 'Informatica', '2024/2025'),       -- ID 1
    (4, 'B', 'Elettronica', '2024/2025'),       -- ID 2
    (5, 'C', 'Informatica', '2024/2025');       -- ID 3

INSERT INTO Richieste (Risorsa, Docente, Data, Ora_Inizio, Ora_Fine) VALUES
    ('LAB01', 1, '2025-03-28', '08:00:00', '09:30:00'),     -- ID 1
    ('PAL01', 2, '2025-03-28', '10:00:00', '11:30:00'),     -- ID 2
    ('AUM01', 3, '2025-03-29', '09:00:00', '10:30:00');     -- ID 3

INSERT INTO Richieste_Classi (Richiesta, Classe) VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 1); 

-- // :)
