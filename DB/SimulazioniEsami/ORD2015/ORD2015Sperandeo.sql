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


-- 1) Categorie (20)
INSERT INTO Categorie (Nome) VALUES
('Concerto Rock'),         ('Concerto Jazz'),        ('Opera Lirica'),
('Mostra Pittura'),        ('Mostra Fotografia'),    ('Teatro Contemporaneo'),
('Teatro Classico'),       ('Cinema Indipendente'),  ('Festival Letterario'),
('Danza Contemporanea'),   ('Danza Classica'),       ('Workshop Artistico'),
('Stand-up Comedy'),       ('Circo Contemporaneo'),  ('Magia e Illusionismo'),
('Laboratorio Bambini'),   ('Presentazione Libro'),  ('Conferenza Scientifica'),
('Degustazione Vino'),     ('Sfilata Moda');

-- 2) Province (20)
INSERT INTO Province (Nome) VALUES
('Milano'),        ('Roma'),          ('Napoli'),
('Torino'),        ('Firenze'),       ('Bologna'),
('Venezia'),       ('Palermo'),       ('Bari'),
('Catania'),       ('Genova'),        ('Verona'),
('Cagliari'),      ('Parma'),         ('Perugia'),
('Trieste'),       ('Lecce'),         ('Siena'),
('Aosta'),         ('Matera');

-- 3) Membri (20)
INSERT INTO Membri (Nome, Cognome, Email, Username, Password) VALUES
('Marco',    'Rossi',      'marco@email.it',      'marco01',   'pwd123'),
('Laura',    'Bianchi',    'laura@email.it',      'laura02',   'pwd234'),
('Paolo',    'Verdi',      'paolo@email.it',      'paolo03',   'pwd345'),
('Giulia',   'Neri',       'giulia@email.it',     'giulia04',  'pwd456'),
('Luca',     'Ferrari',    'luca@email.it',       'luca05',    'pwd567'),
('Sara',     'Romano',     'sara@email.it',       'sara06',    'pwd678'),
('Roberto',  'Esposito',   'roberto@email.it',    'roberto07', 'pwd789'),
('Chiara',   'Russo',      'chiara@email.it',     'chiara08',  'pwd890'),
('Andrea',   'Colombo',    'andrea@email.it',     'andrea09',  'pwd901'),
('Valentina','Ricci',      'valentina@email.it',  'valent10',  'pwd012'),
('Giovanni', 'Marino',     'giovanni@email.it',   'giovan11',  'pwd123a'),
('Francesca','Greco',      'francesca@email.it',  'france12',  'pwd234b'),
('Davide',   'Conti',      'davide@email.it',     'davide13',  'pwd345c'),
('Alice',    'Bruno',      'alice@email.it',      'alice14',   'pwd456d'),
('Daniele',  'Gallo',      'daniele@email.it',    'daniel15',  'pwd567e'),
('Elena',    'Fontana',    'elena@email.it',      'elena16',   'pwd678f'),
('Simone',   'Costa',      'simone@email.it',     'simone17',  'pwd789g'),
('Martina',  'Barbieri',   'martina@email.it',    'martin18',  'pwd890h'),
('Matteo',   'Moretti',    'matteo@email.it',     'matteo19',  'pwd901i'),
('Sofia',    'Lombardi',   'sofia@email.it',      'sofia20',   'pwd012j');

-- 4) Artisti (20)
INSERT INTO Artisti (Nome, Cognome, Data) VALUES
('Mario',    'Bianchi',    '1980-05-12'),
('Alessia',  'Rossi',      '1985-10-25'),
('Carlo',    'Neri',       '1975-03-17'),
('Serena',   'Ferrari',    '1990-08-09'),
('Gabriele', 'Marino',     '1982-12-30'),
('Elisa',    'Romano',     '1988-06-22'),
('Stefano',  'Esposito',   '1977-04-14'),
('Maria',    'Russo',      '1993-11-08'),
('Pietro',   'Colombo',    '1983-07-19'),
('Giorgia',  'Ricci',      '1991-02-28'),
('Riccardo', 'Conti',      '1978-09-03'),
('Federica', 'Bruno',      '1986-01-15'),
('Alberto',  'Gallo',      '1981-04-26'),
('Silvia',   'Fontana',    '1992-12-11'),
('Michele',  'Costa',      '1979-10-05'),
('Ilaria',   'Barbieri',   '1989-03-21'),
('Lorenzo',  'Moretti',    '1984-08-16'),
('Beatrice', 'Lombardi',   '1995-05-29'),
('Giuseppe', 'Vitale',     '1980-11-02'),
('Caterina', 'Santoro',    '1987-07-13');

-- 5) Città (20)
INSERT INTO Citta (Nome, Provincia) VALUES
('Milano',        1),
('Monza',         1),
('Roma',          2),
('Frascati',      2),
('Napoli',        3),
('Sorrento',      3),
('Torino',        4),
('Ivrea',         4),
('Firenze',       5),
('Siena',         18),
('Bologna',       6),
('Imola',         6),
('Venezia',       7),
('Mestre',        7),
('Palermo',       8),
('Catania',       10),
('Bari',          9),
('Lecce',         17),
('Genova',        11),
('Trieste',       16);

-- 6) Luoghi (20)
INSERT INTO Luoghi (Indirizzo, Civico, CAP, Citta) VALUES
('Via Roma',             '10',  '20100', 1),
('Corso Italia',         '25',  '20900', 2),
('Via del Corso',        '45',  '00100', 3),
('Piazza Vittorio',      '3',   '00044', 4),
('Via Toledo',           '78',  '80100', 5),
('Corso Umberto',        '15',  '80067', 6),
('Via Po',               '33',  '10100', 7),
('Corso Cavour',         '8',   '10015', 8),
('Piazza Signoria',      '1',   '50100', 9),
('Piazza Campo',         '22',  '53100', 10),
('Via Indipendenza',     '40',  '40100', 11),
('Via Emilia',           '112', '40026', 12),
('Canal Grande',         '55',  '30100', 13),
('Via Piave',            '82',  '30171', 14),
('Via Maqueda',          '27',  '90100', 15),
('Via Etnea',            '63',  '95100', 16),
('Corso Cavour',         '31',  '70100', 17),
('Via San Francesco',    '19',  '73100', 18),
('Via Garibaldi',        '50',  '16100', 19),
('Piazza Unità Italia',  '4',   '34100', 20);

-- 7) Eventi (20)
INSERT INTO Eventi (Titolo, Data, Categoria, Membro, Luogo) VALUES
('Rock Fest',             '2025-06-15', 1,  1,  1),
('Jazz Night',            '2025-07-10', 2,  2,  3),
('Rigoletto',             '2025-08-25', 3,  3,  5),
('Mostra Van Gogh',       '2025-09-05', 4,  4,  7),
('Scatti dal Mondo',      '2025-05-20', 5,  5,  9),
('Teatro Innovativo',     '2025-06-30', 6,  6,  11),
('Amleto',                '2025-07-22', 7,  7,  13),
('Festival Indie',        '2025-08-08', 8,  8,  15),
('Incontri d''Autore',     '2025-09-15', 9,  9,  17),
('Danza Moderna',         '2025-10-02', 10, 10, 19),
('Lago dei Cigni',        '2025-06-18', 11, 11, 2),
('Arte e Creatività',     '2025-07-12', 12, 12, 4),
('Comedy Show',           '2025-08-28', 13, 13, 6),
('Circo Senza Frontiere', '2025-09-08', 14, 14, 8),
('Serate Magiche',        '2025-10-05', 15, 15, 10),
('Colori e Fantasia',     '2025-06-22', 16, 16, 12),
('Il Nuovo Romanzo',      '2025-07-15', 17, 17, 14),
('La Scienza Oggi',       '2025-08-30', 18, 18, 16),
('Vini d''Italia',         '2025-09-12', 19, 19, 18),
('Milano Fashion',        '2025-10-08', 20, 20, 20);

-- 8) Post (20)
INSERT INTO Post (Commento, Data, Voto, Membro, Evento) VALUES
('Evento fantastico!',              '2025-06-16', '5', 1,  1),
('Molto interessante',              '2025-07-11', '4', 2,  2),
('Interpretazione sublime',         '2025-08-26', '5', 3,  3),
('Mostra da non perdere',           '2025-09-06', '4', 4,  4),
('Fotografie emozionanti',          '2025-05-21', '5', 5,  5),
('Innovativo e coinvolgente',       '2025-07-01', '4', 6,  6),
('Classico sempre attuale',         '2025-07-23', '5', 7,  7),
('Film indipendenti interessanti',  '2025-08-09', '3', 8,  8),
('Autori di grande spessore',       '2025-09-16', '4', 9,  9),
('Coreografie moderne stupende',    '2025-10-03', '5', 10, 10),
('Balletto classico impeccabile',   '2025-06-19', '5', 11, 11),
('Workshop molto utile',            '2025-07-13', '4', 12, 12),
('Ho riso tantissimo',              '2025-08-29', '5', 13, 13),
('Spettacolo originale',            '2025-09-09', '4', 14, 14),
('Illusioni sorprendenti',          '2025-10-06', '5', 15, 15),
('Bambini entusiasti',              '2025-06-23', '4', 16, 16),
('Autore molto preparato',          '2025-07-16', '4', 17, 17),
('Conferenza illuminante',          '2025-08-31', '5', 18, 18),
('Ottima selezione di vini',        '2025-09-13', '5', 19, 19),
('Sfilata all''avanguardia',         '2025-10-09', '4', 20, 20);

-- 9) CategorieMembri (20)
INSERT INTO CategorieMembri (Categoria, Membro) VALUES
(1,  1),  -- Marco   - Concerto Rock
(2,  2),  -- Laura   - Concerto Jazz
(3,  3),  -- Paolo   - Opera Lirica
(4,  4),  -- Giulia  - Mostra Pittura
(5,  5),  -- Luca    - Mostra Fotografia
(6,  6),  -- Sara    - Teatro Contemporaneo
(7,  7),  -- Roberto - Teatro Classico
(8,  8),  -- Chiara  - Cinema Indipendente
(9,  9),  -- Andrea  - Festival Letterario
(10, 10), -- Valentina - Danza Contemporanea
(11, 11), -- Giovanni - Danza Classica
(12, 12), -- Francesca - Workshop Artistico
(13, 13), -- Davide  - Stand-up Comedy
(14, 14), -- Alice   - Circo Contemporaneo
(15, 15), -- Daniele - Magia e Illusionismo
(16, 16), -- Elena   - Laboratorio Bambini
(17, 17), -- Simone  - Presentazione Libro
(18, 18), -- Martina - Conferenza Scientifica
(19, 19), -- Matteo  - Degustazione Vino
(20, 20); -- Sofia   - Sfilata Moda

-- 10) ArtistiEventi (20)
INSERT INTO ArtistiEventi (Artista, Evento) VALUES
(1,  1),  -- Mario e Rock Fest
(2,  2),  -- Alessia e Jazz Night
(3,  3),  -- Carlo e Rigoletto
(4,  4),  -- Serena e Mostra Van Gogh
(5,  5),  -- Gabriele e Scatti dal Mondo
(6,  6),  -- Elisa e Teatro Innovativo
(7,  7),  -- Stefano e Amleto
(8,  8),  -- Maria e Festival Indie
(9,  9),  -- Pietro e Incontri d'Autore
(10, 10), -- Giorgia e Danza Moderna
(11, 11), -- Riccardo e Lago dei Cigni
(12, 12), -- Federica e Arte e Creatività
(13, 13), -- Alberto e Comedy Show
(14, 14), -- Silvia e Circo Senza Frontiere
(15, 15), -- Michele e Serate Magiche
(16, 16), -- Ilaria e Colori e Fantasia
(17, 17), -- Lorenzo e Il Nuovo Romanzo
(18, 18), -- Beatrice e La Scienza Oggi
(19, 19), -- Giuseppe e Vini d'Italia
(20, 20); -- Caterina e Milano Fashion

-- // :)
