/*
Nazione(ID, Nome)
Regione(ID, Nome, ID_Nazione(FK))
Città(ID, Nome, ID_Regione(FK))
Fasi(Fase, Punteggio_Singolo, Punteggio_Squadre)
Sedi(Id_Sede, Denominazione, Indirizzo, Città(FK))
Scuole(Id_Scuole, Denominazione, Indirizzo, Città(FK))
Squadre(Id_Squadre, Denominazione, Nazione(FK))

Atleti(Id_Atleta, Cognome, Nome, Luogo_Nascita, Data_Nascita, Id_Scuola(FK))
Gare(Id_Gara, Data, Id_Fase(FK), Id_sede(FK))
Squadre_Gare(Id_Squadra(FK), Id_Gara(FK), Punteggio)
Atleti_Gare(Id_Atleta(FK), Id_Gara(FK), Punteggio_Singolo)
Atleti_Squadre(Id_Atleta(FK), Id_Squadra(FK))
*/
CREATE TABLE Nazioni (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Regioni (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30),
    Nazione INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Nazione) REFERENCES Nazioni(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Citta (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Regione INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Regione) REFERENCES Regioni(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Fasi (
    Denominazione VARCHAR(30) NOT NULL,
    Punteggio_Singolo INT NOT NULL,
    Punteggio_Squadre INT NOT NULL,
    
    PRIMARY KEY(Denominazione)
);

CREATE TABLE Sedi (
    ID INT AUTO_INCREMENT,
    Denominazione VARCHAR(30) NOT NULL,
    Indirizzo VARCHAR(50),
    Citta INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Citta) REFERENCES Citta(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Scuole (
    ID INT AUTO_INCREMENT,
    Denominazione VARCHAR(40) NOT NULL,
    Indirizzo VARCHAR(50),
    Citta INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Citta) REFERENCES Citta(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Squadre (
    ID INT AUTO_INCREMENT,
    Denominazione VARCHAR(30) NOT NULL,
    Nazione INT NOT NULL,

    PRIMARY KEY (ID),
    FOREIGN KEY (Nazione) REFERENCES Nazioni(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Atleti (
    ID INT AUTO_INCREMENT,
    Cognome VARCHAR(30) NOT NULL,
    Nome VARCHAR(30) NOT NULL,
    LuogoNascita VARCHAR(40) NOT NULL,
    Data DATE NOT NULL,
    Scuola INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Scuola) REFERENCES Scuole(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Gare (
    ID INT AUTO_INCREMENT,
    Data DATE NOT NULL,
    Fase VARCHAR(30) NOT NULL,
    Sede INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Fase) REFERENCES Fasi(Denominazione)
        ON UPDATE CASCADE,
    FOREIGN KEY (Sede) REFERENCES Sedi(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Squadre_Gare (
    Squadra INT NOT NULL,
    Gara INT NOT NULL,

    PRIMARY KEY(Squadra, Gara),
    FOREIGN KEY (Squadra) REFERENCES Squadre(ID)
        ON UPDATE CASCADE,
    FOREIGN KEY (Gara) REFERENCES Gare(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Atleti_Gare (
    Atleta INT NOT NULL,
    Gara INT NOT NULL,
    Punteggio INT NOT NULL,

    PRIMARY KEY(Atleta, Gara),
    FOREIGN KEY (Atleta) REFERENCES Atleti(ID)
        ON UPDATE CASCADE,
    FOREIGN KEY (Gara) REFERENCES Gare(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Atleti_Squadre (
    Atleta INT NOT NULL,
    Squadra INT NOT NULL,

    PRIMARY KEY(Atleta, Squadra),
    FOREIGN KEY (Atleta) REFERENCES Atleti(ID)
        ON UPDATE CASCADE,
    FOREIGN KEY (Squadra) REFERENCES Squadre(ID)
        ON UPDATE CASCADE
);
