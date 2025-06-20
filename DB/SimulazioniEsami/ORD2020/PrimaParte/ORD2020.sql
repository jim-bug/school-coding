/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 11/06/2025
    Consegna: Codice SQL Ordinaria 2020

    by jim-bug // :)
*/

CREATE TABLE Tipologie (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE Specialita (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL UNIQUE,
    Tipologia INT NOT NULL,

    FOREIGN KEY (Tipologia) REFERENCES Tipologie(ID) ON UPDATE CASCADE
);

CREATE TABLE Nazioni (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE Razze (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE Scuderie (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL UNIQUE,
    Nazione INT NOT NULL,

    FOREIGN KEY (Nazione) REFERENCES Nazioni(ID) ON UPDATE CASCADE
);

CREATE TABLE Fantini (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL,
    Cognome VARCHAR(30) NOT NULL,
    Sesso ENUM('M', 'F') NOT NULL,
    Data DATE NOT NULL
);

CREATE TABLE Gare (
    Codice VARCHAR(10) PRIMARY KEY,
    Data DATE NOT NULL,
    Orario TIME NOT NULL,
    Durata INT NOT NULL,
    Denominazione VARCHAR(30) NOT NULL,
    Specialita INT NOT NULL,

    FOREIGN KEY (Specialita) REFERENCES Specialita(ID) ON UPDATE CASCADE
);

CREATE TABLE Cavalli (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL,
    Sesso ENUM('M', 'F') NOT NULL,
    Anno YEAR NOT NULL,
    Razza INT NOT NULL,
    Scuderia INT NOT NULL,

    FOREIGN KEY (Razza) REFERENCES Razze(ID) ON UPDATE CASCADE,
    FOREIGN KEY (Scuderia) REFERENCES Scuderie(ID) ON UPDATE CASCADE
);

CREATE TABLE Partecipazioni (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Cavallo INT NOT NULL,
    Fantino INT NOT NULL,
    Gara VARCHAR(10) NOT NULL,
    Posizione VARCHAR(3) NOT NULL,
    UNIQUE (Cavallo, Gara),
    UNIQUE (Posizione, Gara),
    UNIQUE (Cavallo, Fantino, Gara),


    FOREIGN KEY (Cavallo) REFERENCES Cavalli(ID) ON UPDATE CASCADE,
    FOREIGN KEY (Fantino) REFERENCES Fantini(ID) ON UPDATE CASCADE,
    FOREIGN KEY (Gara) REFERENCES Gare(Codice) ON UPDATE CASCADE
);




-- // :)
