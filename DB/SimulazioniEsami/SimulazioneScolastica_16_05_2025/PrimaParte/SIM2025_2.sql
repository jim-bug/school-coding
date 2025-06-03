/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 02/06/2025
    Consegna: Implementazione SQL della realtà proposta nella simulazione della seconda prova del 16/05/2025

    by jim-bug // :)
*/

CREATE TABLE Enti (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,

    PRIMARY KEY (ID),
    UNIQUE (Nome)
);

CREATE TABLE Cause (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,

    PRIMARY KEY (ID),
    UNIQUE (Nome)
);

CREATE TABLE Esiti (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,

    PRIMARY KEY (ID),
    UNIQUE (Nome)
);

CREATE TABLE Eta (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,

    PRIMARY KEY (ID),
    UNIQUE (Nome)
);

CREATE TABLE Marcaggi (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,

    PRIMARY KEY (ID),
    UNIQUE (Nome)
);

CREATE TABLE Triage (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,

    PRIMARY KEY (ID),
    UNIQUE (Nome)
);

CREATE TABLE Comuni (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,

    PRIMARY KEY (ID),
    UNIQUE (Nome)
);

CREATE TABLE Ordini (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,

    PRIMARY KEY (ID),
    UNIQUE (Nome)
);

CREATE TABLE Specie (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Ordine INT NOT NULL,

    PRIMARY KEY (ID),
    UNIQUE (Nome),

    FOREIGN KEY (Ordine) REFERENCES Ordini(ID) ON UPDATE CASCADE
);

CREATE TABLE Localita (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Comune INT NOT NULL,

    PRIMARY KEY (ID),
    UNIQUE (Nome),

    FOREIGN KEY (Comune) REFERENCES Comuni(ID) ON UPDATE CASCADE
);

CREATE TABLE StatiPelliccia (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,

    PRIMARY KEY (ID),
    UNIQUE (Nome)
);


CREATE TABLE StatiSensorio (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,

    PRIMARY KEY (ID),
    UNIQUE (Nome)
);

CREATE TABLE Localizzazioni (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,

    PRIMARY KEY (ID),
    UNIQUE (Nome)
);

CREATE TABLE Distretti (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,

    PRIMARY KEY (ID),
    UNIQUE (Nome)
);

CREATE TABLE TipologieFrattura (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,

    PRIMARY KEY (ID),
    UNIQUE (Nome)
);

CREATE TABLE TipologieEsame (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,

    PRIMARY KEY (ID),
    UNIQUE (Nome)
);

CREATE TABLE TipologieOperatore (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,

    PRIMARY KEY (ID),
    UNIQUE (Nome)
);

CREATE TABLE Ruoli (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,

    PRIMARY KEY (ID),
    UNIQUE (Nome)
);

CREATE TABLE Farmaci (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,

    PRIMARY KEY (ID),
    UNIQUE (Nome)
);

CREATE TABLE Operatori (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Cognome VARCHAR(30) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Telefono VARCHAR(13) NOT NULL,
    Tipologia INT NOT NULL,

    PRIMARY KEY (ID),
    FOREIGN KEY (Tipologia) REFERENCES TipologieOperatore(ID) ON UPDATE CASCADE
);

CREATE TABLE Indirizzi (
    ID INT AUTO_INCREMENT,
    Denominazione VARCHAR(50) NOT NULL,
    Civico VARCHAR(5) NOT NULL,
    CAP VARCHAR(5) NOT NULL,
    Localita INT NOT NULL,

    UNIQUE(Denominazione, Civico, Localita),
    PRIMARY KEY (ID),
    FOREIGN KEY (Localita) REFERENCES Localita(ID) ON UPDATE CASCADE
);

CREATE TABLE Animali (
    ID INT AUTO_INCREMENT,
    Data DATE NOT NULL,
    DataEsito DATE NOT NULL,
    Triage INT NOT NULL,
    Eta INT NOT NULL,
    Specie INT NOT NULL,
    Causa INT NOT NULL,
    Esito INT NOT NULL,
    Marcaggio INT NOT NULL,
    Localita INT NOT NULL,
    Operatore INT NOT NULL,

    PRIMARY KEY (ID),
    FOREIGN KEY (Triage) REFERENCES Triage(ID) ON UPDATE CASCADE,
    FOREIGN KEY (Eta) REFERENCES Eta(ID) ON UPDATE CASCADE,
    FOREIGN KEY (Specie) REFERENCES Specie(ID) ON UPDATE CASCADE,
    FOREIGN KEY (Causa) REFERENCES Cause(ID) ON UPDATE CASCADE,
    FOREIGN KEY (Esito) REFERENCES Esiti(ID) ON UPDATE CASCADE,
    FOREIGN KEY (Marcaggio) REFERENCES Marcaggi(ID) ON UPDATE CASCADE,
    FOREIGN KEY (Localita) REFERENCES Localita(ID) ON UPDATE CASCADE,
    FOREIGN KEY (Operatore) REFERENCES Operatori(ID) ON UPDATE CASCADE
);

CREATE TABLE Aiutanti (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Cognome VARCHAR(30) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Telefono VARCHAR(13) NOT NULL,
    Ente INT,

    PRIMARY KEY (ID),
    FOREIGN KEY (Ente) REFERENCES Enti(ID) ON UPDATE CASCADE
);

CREATE TABLE Terapie (
    ID INT AUTO_INCREMENT,
    Data DATE NOT NULL,
    Chirurgico BOOLEAN NOT NULL,
    Animale INT NOT NULL,

    PRIMARY KEY (ID),
    FOREIGN KEY (Animale) REFERENCES Animali(ID) ON UPDATE CASCADE
);

CREATE TABLE Diagnosi (
    ID INT AUTO_INCREMENT,
    Data DATE NOT NULL,
    DataRedazione DATE NOT NULL,
    Temperatura DECIMAL(4,2) NOT NULL,
    Peso DECIMAL(5,2) NOT NULL,
    StatoSensorio INT NOT NULL,
    StatoPelliccia INT NOT NULL,
    Animale INT NOT NULL,
    Operatore INT NOT NULL,

    PRIMARY KEY (ID),
    FOREIGN KEY (Animale) REFERENCES Animali(ID) ON UPDATE CASCADE,
    FOREIGN KEY (Operatore) REFERENCES Operatori(ID) ON UPDATE CASCADE,
    FOREIGN KEY (StatoSensorio) REFERENCES StatiSensorio(ID) ON UPDATE CASCADE,
    FOREIGN KEY (StatoPelliccia) REFERENCES StatiPelliccia(ID) ON UPDATE CASCADE
);

CREATE TABLE Lesioni (
    ID INT AUTO_INCREMENT,
    Distretto INT NOT NULL,
    Localizzazione INT NOT NULL,
    Tipologia INT NOT NULL,
    Diagnosi INT NOT NULL,


    PRIMARY KEY (ID),
    FOREIGN KEY (Distretto) REFERENCES Distretti(ID) ON UPDATE CASCADE,
    FOREIGN KEY (Localizzazione) REFERENCES Localizzazioni(ID) ON UPDATE CASCADE,
    FOREIGN KEY (Tipologia) REFERENCES TipologieFrattura(ID) ON UPDATE CASCADE,
    FOREIGN KEY (Diagnosi) REFERENCES Diagnosi(ID) ON UPDATE CASCADE
);

CREATE TABLE Esami (
    ID INT AUTO_INCREMENT,
    Data DATE NOT NULL,
    Tipologia INT NOT NULL,
    Diagnosi INT NOT NULL,

    PRIMARY KEY (ID),
    FOREIGN KEY (Tipologia) REFERENCES TipologieEsame(ID) ON UPDATE CASCADE,
    FOREIGN KEY (Diagnosi) REFERENCES Diagnosi(ID) ON UPDATE CASCADE
);

CREATE TABLE Fotografie (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Animale INT NOT NULL,

    PRIMARY KEY (ID),
    FOREIGN KEY (Animale) REFERENCES Animali(ID) ON UPDATE CASCADE
);

-- Associazione N:N tra Farmaci e Terapie
CREATE TABLE Contenere (        
    ID INT AUTO_INCREMENT,
    Data DATE NOT NULL,
    Quantita DECIMAL(5,2) NOT NULL,
    Farmaco INT NOT NULL,
    Terapia INT NOT NULL,

    PRIMARY KEY (ID),
    FOREIGN KEY (Farmaco) REFERENCES Farmaci(ID) ON UPDATE CASCADE,
    FOREIGN KEY (Terapia) REFERENCES Terapie(ID) ON UPDATE CASCADE
);

-- Associazione N:N tra Operatore e Terapie
CREATE TABLE Includere (
    ID INT AUTO_INCREMENT,
    Operatore INT NOT NULL,
    Terapia INT NOT NULL,
    Ruolo INT NOT NULL,

    PRIMARY KEY (ID),
    FOREIGN KEY (Operatore) REFERENCES Operatori(ID) ON UPDATE CASCADE,
    FOREIGN KEY (Terapia) REFERENCES Terapie(ID) ON UPDATE CASCADE,
    FOREIGN KEY (Ruolo) REFERENCES Ruoli(ID) ON UPDATE CASCADE
);


-- // :)
