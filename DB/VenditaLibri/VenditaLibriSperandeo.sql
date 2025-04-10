/*
* Autore: Ignazio Leonardo Calogero Sperandeo
* Data: 15/12/2024
* Consegna: Compito in classe 24/01/2025.
* by jim_bug // :)
*/

-- Dichiarazione  Reparti
CREATE TABLE Reparti (
    idReparto INT AUTO_INCREMENT,
    Descrizione VARCHAR(255) NOT NULL,

    PRIMARY KEY (idReparto)
);

-- Dichirazione Tipologie
CREATE TABLE Tipologie (
    idTipologia INT AUTO_INCREMENT,
    Descrizione VARCHAR(255) NOT NULL,
    Sconto DECIMAL(5, 2),

    PRIMARY KEY (idTipologia)
);

-- Dichiarazione  Libri
CREATE TABLE Libri (
    ISBN VARCHAR(13),
    Titolo VARCHAR(30) NOT NULL,
    Autore VARCHAR(30) NOT NULL,
    Prezzo DECIMAL(5, 2) NOT NULL,
    NumPag INT NOT NULL,
    Formato VARCHAR(20),
    AnnoPub INT NOT NULL,
    Editore VARCHAR(30) NOT NULL,
    Immagine VARCHAR(40) NOT NULL,
    Collana VARCHAR(30) NOT NULL,
    DataArchivio DATE NOT NULL,
    Reparto INT NOT NULL,
    Tipologia INT NOT NULL,

    PRIMARY KEY (ISBN),
    FOREIGN KEY (Reparto) REFERENCES Reparti(idReparto),
    FOREIGN KEY (Tipologia) REFERENCES Tipologie(idTipologia)
);

-- Dichiarazione Carte
CREATE TABLE Carte (
    NumeroCarta VARCHAR(10),
    TipoCarta VARCHAR(30) NOT NULL,
    DataScadenza DATE NOT NULL,

    PRIMARY KEY (NumeroCarta)
);

-- Dichiarazione Utenti
CREATE TABLE Utenti (
    Username VARCHAR(30),
    Cognome VARCHAR(25) NOT NULL,
    Nome VARCHAR(25) NOT NULL,
    Indirizzo VARCHAR(30) NOT NULL,
    Citta VARCHAR(30) NOT NULL,
    CAP VARCHAR(6) NOT NULL,
    Nazione VARCHAR(30) NOT NULL,
    Telefono VARCHAR(16) NOT NULL,
    Fax VARCHAR(16) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    NumeroCarta VARCHAR(10) NOT NULL,
    Fatturazione VARCHAR(2) NOT NULL,

    PRIMARY KEY (Username),
    FOREIGN KEY (NumeroCarta) REFERENCES Carte(NumeroCarta)
);

-- Dichiarazione Ordini
CREATE TABLE Ordini (
    idOrdine INT AUTO_INCREMENT,
    DataReg DATE NOT NULL,
    DataEvasione DATE,
    Stato VARCHAR(30) NOT NULL,
    Username VARCHAR(30) NOT NULL,

    PRIMARY KEY (idOrdine),
    FOREIGN KEY (Username) REFERENCES Utenti(Username)
);

-- Dichiarazione DettagliOrdini
CREATE TABLE DettagliOrdini (
    ID INT AUTO_INCREMENT,
    idOrdine INT NOT NULL,
    ISBN VARCHAR(13) NOT NULL,
    Quantita INT NOT NULL,

    PRIMARY KEY (ID),
    FOREIGN KEY (idOrdine) REFERENCES Ordini(idOrdine),
    FOREIGN KEY (ISBN) REFERENCES Libri(ISBN)
);

-- Inserimento di un nuovo campo "Cellurare" nella tabella Utenti:
ALTER TABLE Utenti ADD Cellulare VARCHAR(16) NOT NULL;

-- Inserimento di Reparti
INSERT INTO Reparti (Descrizione) VALUES
    ('Rep 1'),
    ('Rep 2');

-- Inserimento di Tipologie
INSERT INTO Tipologie (Descrizione, Sconto) VALUES
    ('Romanzo', 0.2),
    ('Poesia', NULL);

-- Inserimento di Libri
INSERT INTO Libri VALUES
    ('1111111111111', 'Il mare', 'Ignazio', 50.2, 356, 'Ebook', 2024, 'Mondadori', './img/mare.jpg', 'Thriller', '2024-01-01', 1, 1),
    ('2222222222222', 'La montagna', 'Giovanni', 40.2, 256, NULL, 2023, 'Rizzoli', 'montagna.jpg', 'Collana 2', '2023-01-01', 2, 2);

-- Inserimento di Carte
INSERT INTO Carte VALUES
    ('0000000001', 'Credito', '2027-01-03'),
    ('0000000002', 'Prepagata', '2028-01-04');

-- Inserimento di Utenti
INSERT INTO Utenti VALUES
    ('jim_bug', 'Ignazio', 'Sperandeo', 'Via bergamo', 'Palermo', '90127', 'Italia', '0913333333', '0913333321', 'io@gmail.com', '0000000001', 'SI', '3333333333'),
    ('Biggy', 'Marco', 'Sperandeo', 'Via Calto', 'Palermo', '90100', 'Italia', '0913323333', '0913331111', 'ok@gmail.com', '0000000002', 'NO', '3333333333');

-- Inserimento di Ordini
INSERT INTO Ordini (DataReg, DataEvasione, Stato, Username) VALUES
    ('2023-01-02', '2023-01-03', 'Spedito', 'jim_bug'),
    ('2024-03-02', NULL, 'Non Spedito', 'Biggy');

-- Inserimento di DettagliOrdini
INSERT INTO DettagliOrdini (idOrdine, ISBN, Quantita) VALUES
    (1, '1111111111111', 3),
    (2, '2222222222222', 5);

-- // :)
