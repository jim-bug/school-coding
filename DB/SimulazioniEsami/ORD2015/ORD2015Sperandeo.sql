/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 03/05/2025
    Consegna: Implementazione database simulazione ordinaria 2015

    by jim_bug // :)
*/


CREATE TABLE Categorie (
  ID INT AUTO_INCREMENT,
  Nome VARCHAR(30) NOT NULL UNIQUE,

  PRIMARY KEY(ID)
);

CREATE TABLE Province (
  ID INT AUTO_INCREMENT,
  Nome VARCHAR(30) NOT NULL UNIQUE,

  PRIMARY KEY(ID)
);

CREATE TABLE Membri (
  ID INT AUTO_INCREMENT,
  Nome VARCHAR(30) NOT NULL,
  Cognome VARCHAR(30) NOT NULL,
  Email VARCHAR(20) NOT NULL,
  Username VARCHAR(10) NOT NULL UNIQUE,
  Password VARCHAR(20) NOT NULL,

  PRIMARY KEY(ID)
);

CREATE TABLE Artisti (
  ID INT AUTO_INCREMENT,
  Nome VARCHAR(30) NOT NULL,
  Cognome VARCHAR(30) NOT NULL,
  Data DATE NOT NULL,

  PRIMARY KEY(ID)
);

CREATE TABLE Citta (
  ID INT AUTO_INCREMENT,
  Nome VARCHAR(30) NOT NULL,
  Provincia INT NOT NULL,

  PRIMARY KEY(ID),
  FOREIGN KEY (Provincia) REFERENCES Province(ID)
      ON UPDATE CASCADE
);

CREATE TABLE Luoghi (
  ID INT AUTO_INCREMENT,
  Indirizzo VARCHAR(30) NOT NULL,
  Civico VARCHAR(4) NOT NULL,
  CAP VARCHAR(5) NOT NULL,
  Citta INT NOT NULL,

  PRIMARY KEY(ID),
  FOREIGN KEY (Citta) REFERENCES Citta(ID)
    ON UPDATE CASCADE
);

CREATE TABLE Eventi (
  ID INT AUTO_INCREMENT,
  Titolo VARCHAR(30) NOT NULL,
  Data DATE NOT NULL,
  Categoria INT NOT NULL,
  Membro INT NOT NULL,
  Luogo INT NOT NULL,

  PRIMARY KEY(ID),
  FOREIGN KEY (Categoria) REFERENCES Categorie(ID)
    ON UPDATE CASCADE,
  FOREIGN KEY (Membro) REFERENCES Membri(ID)
    ON UPDATE CASCADE,
  FOREIGN KEY (Luogo) REFERENCES Luoghi(ID)
    ON UPDATE CASCADE
);

CREATE TABLE Post (
  ID INT AUTO_INCREMENT,
  Commento VARCHAR(255) NOT NULL,
  Data DATE NOT NULL,
  Voto ENUM('1', '2', '3', '4', '5') NOT NULL,
  Membro INT NOT NULL,
  Evento INT NOT NULL,

  PRIMARY KEY(ID),
  FOREIGN KEY (Membro) REFERENCES Membri(ID)
    ON UPDATE CASCADE,
  FOREIGN KEY (Evento) REFERENCES Eventi(ID)
    ON UPDATE CASCADE
);


CREATE TABLE CategorieMembri (
  Categoria INT NOT NULL,
  Membro INT NOT NULL,

  PRIMARY KEY(Categoria, Membro),
  FOREIGN KEY (Categoria) REFERENCES Categorie(ID)
    ON UPDATE CASCADE,
   FOREIGN KEY (Membro) REFERENCES Membri(ID)
    ON UPDATE CASCADE
);

CREATE TABLE ArtistiEventi (
  Artista INT NOT NULL,
  Evento INT NOT NULL,

  PRIMARY KEY(Artista, Evento),
  FOREIGN KEY (Artista) REFERENCES Artisti(ID)
    ON UPDATE CASCADE,
  FOREIGN KEY (Evento) REFERENCES Eventi(ID)
    ON UPDATE CASCADE
);



-- 1) Categorie (30)
INSERT INTO Categorie (Nome) VALUES
  ('Categoria1'),  ('Categoria2'),  ('Categoria3'),  ('Categoria4'),
  ('Categoria5'),  ('Categoria6'),  ('Categoria7'),  ('Categoria8'),
  ('Categoria9'),  ('Categoria10'), ('Categoria11'), ('Categoria12'),
  ('Categoria13'), ('Categoria14'), ('Categoria15'), ('Categoria16'),
  ('Categoria17'), ('Categoria18'), ('Categoria19'), ('Categoria20'),
  ('Categoria21'), ('Categoria22'), ('Categoria23'), ('Categoria24'),
  ('Categoria25'), ('Categoria26'), ('Categoria27'), ('Categoria28'),
  ('Categoria29'), ('Categoria30');

-- 2) Province (30)
INSERT INTO Province (Nome) VALUES
  ('Provincia1'),  ('Provincia2'),  ('Provincia3'),  ('Provincia4'),
  ('Provincia5'),  ('Provincia6'),  ('Provincia7'),  ('Provincia8'),
  ('Provincia9'),  ('Provincia10'), ('Provincia11'), ('Provincia12'),
  ('Provincia13'), ('Provincia14'), ('Provincia15'), ('Provincia16'),
  ('Provincia17'), ('Provincia18'), ('Provincia19'), ('Provincia20'),
  ('Provincia21'), ('Provincia22'), ('Provincia23'), ('Provincia24'),
  ('Provincia25'), ('Provincia26'), ('Provincia27'), ('Provincia28'),
  ('Provincia29'), ('Provincia30');

-- 3) Membri (30)
INSERT INTO Membri (Nome, Cognome, Email, Username, Password) VALUES
  ('Nome1','Cognome1','nome1@example.com','user1','pass1'),
  ('Nome2','Cognome2','nome2@example.com','user2','pass2'),
  ('Nome3','Cognome3','nome3@example.com','user3','pass3'),
  ('Nome4','Cognome4','nome4@example.com','user4','pass4'),
  ('Nome5','Cognome5','nome5@example.com','user5','pass5'),
  ('Nome6','Cognome6','nome6@example.com','user6','pass6'),
  ('Nome7','Cognome7','nome7@example.com','user7','pass7'),
  ('Nome8','Cognome8','nome8@example.com','user8','pass8'),
  ('Nome9','Cognome9','nome9@example.com','user9','pass9'),
  ('Nome10','Cognome10','nome10@example.com','user10','pass10'),
  ('Nome11','Cognome11','nome11@example.com','user11','pass11'),
  ('Nome12','Cognome12','nome12@example.com','user12','pass12'),
  ('Nome13','Cognome13','nome13@example.com','user13','pass13'),
  ('Nome14','Cognome14','nome14@example.com','user14','pass14'),
  ('Nome15','Cognome15','nome15@example.com','user15','pass15'),
  ('Nome16','Cognome16','nome16@example.com','user16','pass16'),
  ('Nome17','Cognome17','nome17@example.com','user17','pass17'),
  ('Nome18','Cognome18','nome18@example.com','user18','pass18'),
  ('Nome19','Cognome19','nome19@example.com','user19','pass19'),
  ('Nome20','Cognome20','nome20@example.com','user20','pass20'),
  ('Nome21','Cognome21','nome21@example.com','user21','pass21'),
  ('Nome22','Cognome22','nome22@example.com','user22','pass22'),
  ('Nome23','Cognome23','nome23@example.com','user23','pass23'),
  ('Nome24','Cognome24','nome24@example.com','user24','pass24'),
  ('Nome25','Cognome25','nome25@example.com','user25','pass25'),
  ('Nome26','Cognome26','nome26@example.com','user26','pass26'),
  ('Nome27','Cognome27','nome27@example.com','user27','pass27'),
  ('Nome28','Cognome28','nome28@example.com','user28','pass28'),
  ('Nome29','Cognome29','nome29@example.com','user29','pass29'),
  ('Nome30','Cognome30','nome30@example.com','user30','pass30');

-- 4) Artisti (30)
INSERT INTO Artisti (Nome, Cognome, Data) VALUES
  ('Artista1','Uno','1970-01-01'),
  ('Artista2','Due','1971-02-02'),
  ('Artista3','Tre','1972-03-03'),
  ('Artista4','Quattro','1973-04-04'),
  ('Artista5','Cinque','1974-05-05'),
  ('Artista6','Sei','1975-06-06'),
  ('Artista7','Sette','1976-07-07'),
  ('Artista8','Otto','1977-08-08'),
  ('Artista9','Nove','1978-09-09'),
  ('Artista10','Dieci','1979-10-10'),
  ('Artista11','Undici','1980-11-11'),
  ('Artista12','Dodici','1981-12-12'),
  ('Artista13','Tredici','1982-01-13'),
  ('Artista14','Quattordici','1983-02-14'),
  ('Artista15','Quindici','1984-03-15'),
  ('Artista16','Sedici','1985-04-16'),
  ('Artista17','Diciassette','1986-05-17'),
  ('Artista18','Diciotto','1987-06-18'),
  ('Artista19','Diciannove','1988-07-19'),
  ('Artista20','Venti','1989-08-20'),
  ('Artista21','Ventuno','1990-09-21'),
  ('Artista22','Ventidue','1991-10-22'),
  ('Artista23','Ventitré','1992-11-23'),
  ('Artista24','Ventiquattro','1993-12-24'),
  ('Artista25','Venticinque','1994-01-25'),
  ('Artista26','Ventisei','1995-02-26'),
  ('Artista27','Ventisette','1996-03-27'),
  ('Artista28','Ventotto','1997-04-28'),
  ('Artista29','Ventinove','1998-05-29'),
  ('Artista30','Trenta','1999-06-30');

-- 5) Città (30)
INSERT INTO Citta (Nome, Provincia) VALUES
  ('Citta1',1),  ('Citta2',2),  ('Citta3',3),  ('Citta4',4),
  ('Citta5',5),  ('Citta6',6),  ('Citta7',7),  ('Citta8',8),
  ('Citta9',9),  ('Citta10',10),('Citta11',11),('Citta12',12),
  ('Citta13',13),('Citta14',14),('Citta15',15),('Citta16',16),
  ('Citta17',17),('Citta18',18),('Citta19',19),('Citta20',20),
  ('Citta21',21),('Citta22',22),('Citta23',23),('Citta24',24),
  ('Citta25',25),('Citta26',26),('Citta27',27),('Citta28',28),
  ('Citta29',29),('Citta30',30);

-- 6) Luoghi (30)
INSERT INTO Luoghi (Indirizzo, Civico, CAP, Citta) VALUES
  ('Via Roma','1','10001',1),  ('Via Milano','2','10002',2),
  ('Via Napoli','3','10003',3),('Via Torino','4','10004',4),
  ('Via Venezia','5','10005',5),('Via Firenze','6','10006',6),
  ('Via Genova','7','10007',7),('Via Bologna','8','10008',8),
  ('Via Palermo','9','10009',9),('Via Bari','10','10010',10),
  ('Via Parma','11','10011',11),('Via Modena','12','10012',12),
  ('Via Livorno','13','10013',13),('Via Pisa','14','10014',14),
  ('Via Siena','15','10015',15),('Via Ancona','16','10016',16),
  ('Via Pescara','17','10017',17),('Via Trieste','18','10018',18),
  ('Via Udine','19','10019',19),('Via Bari','20','10020',20),
  ('Via Lecce','21','10021',21),('Via Cagliari','22','10022',22),
  ('Via Trieste','23','10023',23),('Via Ravenna','24','10024',24),
  ('Via Rimini','25','10025',25),('Via Piacenza','26','10026',26),
  ('Via Grosseto','27','10027',27),('Via Taranto','28','10028',28),
  ('Via Brindisi','29','10029',29),('Via Foggia','30','10030',30);

-- 7) Eventi (30)
INSERT INTO Eventi (Titolo, Data, Categoria, Membro, Luogo) VALUES
  ('Evento1','2025-01-01',1,1,1),  ('Evento2','2025-01-02',2,2,2),
  ('Evento3','2025-01-03',3,3,3),  ('Evento4','2025-01-04',4,4,4),
  ('Evento5','2025-01-05',5,5,5),  ('Evento6','2025-01-06',6,6,6),
  ('Evento7','2025-01-07',7,7,7),  ('Evento8','2025-01-08',8,8,8),
  ('Evento9','2025-01-09',9,9,9),  ('Evento10','2025-01-10',10,10,10),
  ('Evento11','2025-01-11',11,11,11),('Evento12','2025-01-12',12,12,12),
  ('Evento13','2025-01-13',13,13,13),('Evento14','2025-01-14',14,14,14),
  ('Evento15','2025-01-15',15,15,15),('Evento16','2025-01-16',16,16,16),
  ('Evento17','2025-01-17',17,17,17),('Evento18','2025-01-18',18,18,18),
  ('Evento19','2025-01-19',19,19,19),('Evento20','2025-01-20',20,20,20),
  ('Evento21','2025-01-21',21,21,21),('Evento22','2025-01-22',22,22,22),
  ('Evento23','2025-01-23',23,23,23),('Evento24','2025-01-24',24,24,24),
  ('Evento25','2025-01-25',25,25,25),('Evento26','2025-01-26',26,26,26),
  ('Evento27','2025-01-27',27,27,27),('Evento28','2025-01-28',28,28,28),
  ('Evento29','2025-01-29',29,29,29),('Evento30','2025-01-30',30,30,30), ('Evento31','2025-06-30',30,30,30);

-- 8) Post (30)
INSERT INTO Post (Commento, Data, Voto, Membro, Evento) VALUES
  ('Commento1','2025-02-01','1',1,1),  ('Commento2','2025-02-02','2',2,2),
  ('Commento3','2025-02-03','3',3,3),  ('Commento4','2025-02-04','4',4,4),
  ('Commento5','2025-02-05','5',5,5),  ('Commento6','2025-02-06','1',6,6),
  ('Commento7','2025-02-07','2',7,7),  ('Commento8','2025-02-08','3',8,8),
  ('Commento9','2025-02-09','4',9,9),  ('Commento10','2025-02-10','5',10,10),
  ('Commento11','2025-02-11','1',11,11),('Commento12','2025-02-12','2',12,12),
  ('Commento13','2025-02-13','3',13,13),('Commento14','2025-02-14','4',14,14),
  ('Commento15','2025-02-15','5',15,15),('Commento16','2025-02-16','1',16,16),
  ('Commento17','2025-02-17','2',17,17),('Commento18','2025-02-18','3',18,18),
  ('Commento19','2025-02-19','4',19,19),('Commento20','2025-02-20','5',20,20),
  ('Commento21','2025-02-21','1',21,21),('Commento22','2025-02-22','2',22,22),
  ('Commento23','2025-02-23','3',23,23),('Commento24','2025-02-24','4',24,24),
  ('Commento25','2025-02-25','5',25,25),('Commento26','2025-02-26','1',26,26),
  ('Commento27','2025-02-27','2',27,27),('Commento28','2025-02-28','3',28,28),
  ('Commento29','2025-03-01','4',29,29),('Commento30','2025-03-02','5',30,30);

-- 9) CategorieMembri (30)
INSERT INTO CategorieMembri (Categoria, Membro) VALUES
  (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),
  (11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),
  (19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),
  (27,27),(28,28),(29,29),(30,30);

-- 10) ArtistiEventi (30)
INSERT INTO ArtistiEventi (Artista, Evento) VALUES
  (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),
  (11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),
  (19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),
  (27,27),(28,28),(29,29),(30,30);

-- // :)
