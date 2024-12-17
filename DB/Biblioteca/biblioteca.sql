/*
* Autore: Ignazio Leonardo Calogero Sperandeo
* Data: 15/12/2024
* Consegna: Sulla base dell'Analisi, Progetto Concettuale e Progetto logico, implementare il database con almeno 5-10 record a tabella.
* by jim_bug // :)
*/

CREATE TABLE Nazione (
    ID INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(20) NOT NULL,
    PRIMARY KEY(ID)
);

CREATE TABLE Casa_Editrice (
    ID INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(20) NOT NULL,
    Indirizzo VARCHAR(25) NOT NULL,
    Comune VARCHAR(25) NOT NULL,
    Provincia VARCHAR(25) NOT NULL,
    Telefono VARCHAR(15) NOT NULL,
    Email VARCHAR(25) NOT NULL,
    PRIMARY KEY(ID)
);

CREATE TABLE Universita (
    Codice VARCHAR(10) NOT NULL,
    Nome_Rettore VARCHAR(25) NOT NULL,
    Cognome_Rettore VARCHAR(25) NOT NULL,
    Denominazione VARCHAR(50) NOT NULL,
    PRIMARY KEY(Codice)
);

CREATE TABLE Citta (
    ID INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(20) NOT NULL,
    Nazione INT ,
    PRIMARY KEY(ID),
    FOREIGN KEY (Nazione) REFERENCES Nazione(ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE Sede_Universita (
    ID INT NOT NULL AUTO_INCREMENT,
    Indirizzo VARCHAR(25) NOT NULL,
    Comune VARCHAR(25) NOT NULL,
    Provincia VARCHAR(25) NOT NULL,
    Universita VARCHAR(10),
    Citta INT ,
    PRIMARY KEY(ID),
    FOREIGN KEY (Universita) REFERENCES Universita(Codice)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (Citta) REFERENCES Citta(ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE Facolta (
    Codice VARCHAR(10) NOT NULL,
    Nome_Preside VARCHAR(25) NOT NULL,
    Cognome_Preside VARCHAR(25) NOT NULL,
    Denominazione VARCHAR(40) NOT NULL,
    Universita INT ,
    PRIMARY KEY(Codice),
    FOREIGN KEY (Universita) REFERENCES Sede_Universita(ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE Corso (
    Codice VARCHAR(10) NOT NULL,
    Nome VARCHAR(30) NOT NULL,
    Anni INT NOT NULL,
    Facolta VARCHAR(10),
    PRIMARY KEY(Codice),
    FOREIGN KEY (Facolta) REFERENCES Facolta(Codice)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE Studente (
    Matricola VARCHAR(5) NOT NULL,
    Nome VARCHAR(25) NOT NULL,
    Cognome VARCHAR(25) NOT NULL,
    Data DATE NOT NULL,
    Telefono VARCHAR(15) NOT NULL,
    Citta INT ,
    PRIMARY KEY(Matricola),
    FOREIGN KEY (Citta) REFERENCES Citta(ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE Libro (
    ISBN VARCHAR(13) NOT NULL,
    Anno INT  NOT NULL,
    Prezzo DECIMAL(8, 2)  NOT NULL,
    Titolo VARCHAR(25) NOT NULL,
    Casa_Editrice INT ,
    PRIMARY KEY(ISBN),
    FOREIGN KEY (Casa_Editrice) REFERENCES Casa_Editrice(ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE Autore (
    ID INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(25) NOT NULL,
    Cognome VARCHAR(25) NOT NULL,
    Data DATE NOT NULL,
    Data_Morte DATE,
    Citta_Natale INT ,
    Citta_Morte INT ,
    PRIMARY KEY(ID),
    FOREIGN KEY (Citta_Natale) REFERENCES Citta(ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (Citta_Morte) REFERENCES Citta(ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE Frequenza (
    Studente VARCHAR(5),
    Corso VARCHAR(10),
    Anno INT NOT NULL,
    FOREIGN KEY (Studente) REFERENCES Studente(Matricola)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (Corso) REFERENCES Corso(Codice)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE Prestito (
    Data_Prestito DATE NOT NULL, -- DEFAULT SELECT DATE_FORMAT(NOW(), '%Y-%m-%d');
    Data_Restituzione DATE,
    Stato_Consegna VARCHAR(10) NOT NULL,
    Stato_Restituzione VARCHAR(20) DEFAULT 'Ancora in Prestito',
    Studente VARCHAR(5),
    Libro VARCHAR(13),
    FOREIGN KEY (Studente) REFERENCES Studente(Matricola)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (Libro) REFERENCES Libro(ISBN)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Inserimento occorrenze di Nazione:
INSERT INTO Nazione (Nome) VALUES 
    ('Italia'),
    ('Svizzera'),
    ('Francia'),
    ('Germania'),
    ('Grecia'),
    ('Spagna');

-- Inserimento occorrenze di Casa Editrice:
INSERT INTO Casa_Editrice (Nome, Indirizzo, Comune, Provincia, Telefono, Email) VALUES 
    ('Campania editrice', 'Via Napoli', 'Napoli', 'NA', '391-315-8888', 'napoli@campania.it'),
    ('Sicilia editrice', 'Via Palermo', 'Palermo', 'PA', '391-349-8888', 'palermo@sicilia.it'),
    ('Lombardia editrice', 'Via Lombardia', 'Milano', 'MI', '391-445-8888', 'milano@lombardia.it'),
    ('Firenze editrice', 'Via Firenze', 'Pisa', 'FI', '391-385-8888', 'pisa@firenze.it'),
    ('Piemonte editrice', 'Via Piemonte', 'Torino', 'TO', '391-375-8888', 'torino@piemonte.it');


-- Inserimento occorrenze di Universita:

INSERT INTO Universita (Codice, Nome_Rettore, Cognome_Rettore, Denominazione) VALUES 
    ('UniPA', 'Calogero', 'Lo Busci', 'Università Degli Studi di Palermo'),
    ('UniCA', 'Leonardo', 'Nanna', 'Università Degli Studi di Catania'),
    ('UniNA', 'Giuseppe', 'Cascino', 'Università Degli Studi di Napoli'),
    ('UniPI', 'Lorenzo', 'Castelvecchio', 'Università Degli Studi di Pisa'),
    ('UniPV', 'Federico', 'Buglia', 'Università Degli Studi di Milano'),
    ('UniTO', 'Marco', 'Lutta', 'Università Degli Studi di Torino'),
    ('UniMORE', 'Luigi', 'Tarisca', 'Università Degli Studi di Modena e Reggio Emilia');

-- Inserimento occorrenze di Citta:
INSERT INTO Citta (Nome, Nazione) VALUES 
    ('Palermo', 1),
    ('Catania', 1),
    ('Roma', 1),
    ('Milano', 1),
    ('Torino', 1),
    ('Pisa', 1),
    ('Napoli', 1),
    ('Madrid', 6),
    ('Barcellona', 6),
    ('Parigi', 6),
    ('Marsiglia', 6),
    ('Santorini', 5),
    ('Berlino', 4),
    ('Amburgo', 4),
    ('Zurigo', 2),
    ('Ginevra', 2);

-- Inserimento occorrenze Sede Universitarie:
INSERT INTO Sede_Universita (Universita, Citta, Indirizzo, Comune, Provincia) VALUES 
    ('UniPA', 1, 'Viale Delle Scienze', 'Palermo', 'PA'),
    ('UniMORE', 6, 'Via dei tesori', 'Pisa', 'PI'),
    ('UniCA', 2, 'Via Elefante', 'Catania', 'CA'),
    ('UniPI', 6, 'Via Torre', 'Pisa', 'PI'),
    ('UniNA', 7, 'Via Spagna', 'Napoli', 'NA'),
    ('UniPA', 3, 'Via Colosseo', 'Roma', 'RO'),
    ('UniPV', 5, 'Via Milano', 'Torino', 'TO'),
    ('UniTO', 5, 'Via Torino', 'Torino', 'TO');

-- Inserimento occorrenze Facolta:
INSERT INTO Facolta (Codice, Universita, Denominazione, Nome_Preside, Cognome_Preside) VALUES 
    ('ING01', 1, 'Facoltà di Ingegneria', 'Ignazio Leonardo Calogero', 'Sperandeo'),
    ('ING02', 2, 'Facoltà di Ingegneria', 'Marcus', 'Lo Petto'),
    ('ING03', 3, 'Facoltà di Ingegneria', 'Lorenzo', 'Mastica'),
    ('ING04', 4, 'Facoltà di Ingegneria', 'Renzo', 'Sticata'),
    ('ING05', 5, 'Facoltà di Ingegneria', 'Francesco', 'Teo'),
    ('ING06', 6, 'Facoltà di Ingegneria', 'Checco', 'Lo Bue');

-- Inserimento occorrenze Corso:
INSERT INTO Corso (Codice, Facolta, Nome, Anni) VALUES 
    ('2170', 'ING01','Ingegneria Informatica', 3),
    ('2171', 'ING01','Ingegneria Informatica', 5),
    ('2184', 'ING06','Ingegneria Aereospaziale', 3),
    ('2185', 'ING06','Ingegneria Aereospaziale', 5),
    ('2190', 'ING03','Ingegneria Chimica', 3),
    ('2160', 'ING04','Ingegneria Meccanica', 3),
    ('2161', 'ING06','Ingegneria Meccanica', 5),
    ('2150', 'ING05','Ingegneria Gestionale', 3);

-- Inserimento occorrenze Studente:
INSERT INTO Studente (Matricola, Nome, Cognome, Data, Telefono, Citta) VALUES 
    ('00044', 'Ignazio', 'Sperandeo', '2007-03-15', '391-999-5401', 1),
    ('00041', 'Lorenzo', 'Sperandeo', '2004-03-15', '391-599-5401', 9),
    ('00042', 'Gianluca', 'Casino', '2002-02-15', '311-999-5401', 4),
    ('00043', 'Gianettore', 'Terra', '2000-04-10', '341-999-5401', 5),
    ('00040', 'Giuseppe', 'Esposito', '2001-12-15', '351-999-5401', 2),
    ('00039', 'Giuseppino', 'Buterasi', '1999-03-15', '356-999-5401', 10),
    ('00038', 'Carlo', 'Sanpaolo', '2000-05-20', '301-999-5401', 11);

-- Inserimento occorrenze Libro:
INSERT INTO Libro (ISBN, Anno, Prezzo, Titolo, Casa_Editrice) VALUES
    ('9788804710917', 1881, 19.99, 'I Malavoglia', 1),
    ('9788807900605', 1926, 14.99, 'Uno, nessuno e centomila', 2),
    ('9788804668578', 1980, 22.99, 'Il nome della rosa', 3),
    ('9780142437230', 1605, 18.99, 'Don Chisciotte', 4),
    ('9782253011301', 1862, 24.99, 'I Miserabili', 5);

-- Inserimento occorrenze Autore:
INSERT INTO Autore (Nome, Cognome, Data, Data_Morte, Citta_Natale, Citta_Morte) VALUES 
    ('Giovanni', 'Verga', '1840-09-02', '1922-01-27', 2, 2),
    ('Luigi', 'Pirandello', '1867-06-28', '1936-12-10', 1, 3),
    ('Umberto', 'Eco', '1932-01-05', '2016-02-19', 5, 4),
    ('Miguel', 'De Cervantes', '1547-09-29', '1616-04-23', 8, 8),
    ('Victor', 'Ugo', '1802-02-26', '1885-05-22', 10, 10);


-- Inserimento occorrenze Frequenza:
INSERT INTO Frequenza (Studente, Corso, Anno) VALUES 
    ('00044', '2170', 2024),
    ('00043', '2171', 2024),
    ('00042', '2170', 2019),
    ('00041', '2150', 2024),
    ('00040', '2161', 2024),
    ('00039', '2160', 2019),
    ('00038', '2190', 2024);

-- Inserimento occorrenze Prestito:
INSERT INTO Prestito (Data_Prestito, Data_Restituzione, Stato_Consegna, Stato_Restituzione, Studente, Libro) VALUES 
    ('2024-12-15', NULL, 'Buono', NULL, '00044', '9788807900605');


-- // :)
