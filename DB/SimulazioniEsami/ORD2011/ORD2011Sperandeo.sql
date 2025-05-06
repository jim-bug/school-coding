/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 03/05/2025
    Consegna: Implementazione database simulazione ordinaria 2011

    by jim_bug // :)
*/

CREATE TABLE OrdiniAppartenenza (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) UNIQUE NOT NULL,

    PRIMARY KEY (ID)
);

CREATE TABLE SpecieAnimali (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) UNIQUE NOT NULL,
    Estinzione BOOLEAN NOT NULL,
    OrdineAppartenenza INT,

    PRIMARY KEY(ID),
    FOREIGN KEY (OrdineAppartenenza) REFERENCES OrdiniAppartenenza(ID)
        ON UPDATE CASCADE
);

CREATE TABLE TipiFlora (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) UNIQUE NOT NULL,

    PRIMARY KEY(ID)
);

CREATE TABLE SpecieFlora (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) UNIQUE NOT NULL,
    Stagione ENUM('Inverno', 'Estate', 'Autunno', 'Primavera') NOT NULL,
    TipoFlora INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (TipoFlora) REFERENCES TipiFlora(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Regioni (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,

    PRIMARY KEY(ID)
);

CREATE TABLE Responsabili (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Cognome VARCHAR(30) NOT NULL,
    Username VARCHAR(10) UNIQUE NOT NULL,
    Password VARCHAR(20) NOT NULL,
    Data DATE NOT NULL,

    PRIMARY KEY(ID)
);

CREATE TABLE Parchi (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Responsabile INT NOT NULL,
    Regione INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Responsabile) REFERENCES Responsabili(ID)
        ON UPDATE CASCADE,
    FOREIGN KEY (Regione) REFERENCES Regioni(ID)
        ON UPDATE CASCADE
);

CREATE TABLE EsemplariAnimale (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Data DATE NOT NULL,
    Sesso ENUM('M', 'F') NOT NULL,
    Adulto BOOLEAN NOT NULL,
    Specie INT NOT NULL,
    Parco INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Specie) REFERENCES SpecieAnimali(ID)
        ON UPDATE CASCADE,
    FOREIGN KEY (Parco) REFERENCES Parchi(ID)
        ON UPDATE CASCADE
);

CREATE TABLE ParcoFlora (
    Parco INT NOT NULL,
    Specie INT NOT NULL,

    PRIMARY KEY(Parco, Specie),
    FOREIGN KEY (Parco) REFERENCES Parchi(ID)
        ON UPDATE CASCADE,
    FOREIGN KEY (Specie) REFERENCES SpecieFlora(ID)
        ON UPDATE CASCADE
);

-- 1) OrdiniAppartenenza (20)
INSERT INTO OrdiniAppartenenza (Nome) VALUES
('Carnivori'),       ('Erbivori'),        ('Roditori'),       ('Rapaci'),
('Felini'),          ('Canidi'),          ('Cervidi'),        ('Rettili'),
('Anfibi'),          ('Insettivori'),     ('Marsupiali'),     ('Volatili'),
('Primati'),         ('Proboscidati'),    ('Acquatici'),      ('Ungulati'),
('Mustelidi'),       ('Lagomorfi'),       ('Chirotteri'),     ('Cetacei');

-- 2) SpecieAnimali (20)
INSERT INTO SpecieAnimali (Nome, Estinzione, OrdineAppartenenza) VALUES
('Orso bruno',     FALSE, 1),   ('Lupo grigio',    FALSE, 6),
('Lince rossa',    TRUE,  5),   ('Cervo europeo',  FALSE, 7),
('Volpe rossa',    FALSE, 6),   ('Tasso europeo',  FALSE, 17),
('Cinghiale',      FALSE, 16),  ('Aquila reale',   FALSE, 4),
('Falco pellegrino',FALSE, 4),  ('Lepre comune',   FALSE, 18),
('Pipistrello',    FALSE, 19),  ('Scoiattolo',     FALSE, 3),
('Vipera comune',  FALSE, 8),   ('Rana verde',     FALSE, 9),
('Salamandra',     FALSE, 9),   ('Riccio europeo', FALSE, 10),
('Faina',          FALSE, 17),  ('Ghiro',          FALSE, 3),
('Muflone',        FALSE, 16),  ('Capriolo',       FALSE, 7);

-- 3) TipiFlora (20)
INSERT INTO TipiFlora (Nome) VALUES
('Alberi ad alto fusto'), ('Arbusti'),             ('Rampicanti'),
('Piante acquatiche'),    ('Piante erbacee'),      ('Felci'),
('Succulente'),           ('Bulbose'),             ('Conifere'),
('Decidue'),              ('Sempreverdi'),         ('Palme'),
('Fruttiferi selvatici'), ('Piante medicinali'),   ('Orchidee selvatiche'),
('Cespugli spinosi'),     ('Muschi'),              ('Licheni'),
('Funghi'),               ('Erbe aromatiche');

-- 4) SpecieFlora (20)
INSERT INTO SpecieFlora (Nome, Stagione, TipoFlora) VALUES
('Quercia',          'Estate',     1),
('Abete rosso',      'Inverno',    9),
('Ginestra',         'Primavera',  2),
('Edera',            'Autunno',    3),
('Ninfea',           'Estate',     4),
('Margherita',       'Primavera',  5),
('Felce aquilina',   'Estate',     6),
('Semprevivo',       'Estate',     7),
('Narciso',          'Primavera',  8),
('Pino marittimo',   'Inverno',    9),
('Castagno',         'Autunno',    10),
('Leccio',           'Inverno',    11),
('Palma nana',       'Estate',     12),
('Melo selvatico',   'Primavera',  13),
('Genziana',         'Estate',     14),
('Orchidea selvatica','Primavera', 15),
('Rovo',             'Estate',     16),
('Muschio sfagno',   'Autunno',    17),
('Lichene islandico','Inverno',    18),
('Rosmarino',        'Primavera',  20);

-- 5) Regioni (20)
INSERT INTO Regioni (Nome) VALUES
('Sicilia'),        ('Sardegna'),       ('Calabria'),       ('Basilicata'),
('Puglia'),         ('Campania'),       ('Lazio'),          ('Abruzzo'),
('Molise'),         ('Marche'),         ('Umbria'),         ('Toscana'),
('Emilia-Romagna'), ('Liguria'),        ('Piemonte'),       ('Valle d''Aosta'),
('Lombardia'),      ('Veneto'),         ('Trentino'),       ('Friuli');

-- 6) Responsabili (20)
INSERT INTO Responsabili (Nome, Cognome, Username, Password, Data) VALUES
('Mario',    'Rossi',      'mrossi',    'pwd123',     '2023-01-15'),
('Anna',     'Bianchi',    'abianchi',  'pwd234',     '2023-02-12'),
('Giuseppe', 'Verdi',      'gverdi',    'pwd345',     '2023-01-20'),
('Francesca','Neri',       'fneri',     'pwd456',     '2023-03-05'),
('Carlo',    'Russo',      'crusso',    'pwd567',     '2023-02-18'),
('Laura',    'Ferrari',    'lferrari',  'pwd678',     '2023-01-30'),
('Marco',    'Esposito',   'mesposito', 'pwd789',     '2023-03-15'),
('Giulia',   'Romano',     'gromano',   'pwd890',     '2023-02-25'),
('Luca',     'Colombo',    'lcolombo',  'pwd901',     '2023-04-10'),
('Martina',  'Ricci',      'mricci',    'pwd012',     '2023-03-28'),
('Roberto',  'Marino',     'rmarino',   'pwd123a',    '2023-04-20'),
('Alessia',  'Greco',      'agreco',    'pwd234b',    '2023-05-05'),
('Paolo',    'Conti',      'pconti',    'pwd345c',    '2023-04-28'),
('Chiara',   'Bruno',      'cbruno',    'pwd456d',    '2023-05-15'),
('Simone',   'Gallo',      'sgallo',    'pwd567e',    '2023-06-01'),
('Valentina','Fontana',    'vfontana',  'pwd678f',    '2023-05-20'),
('Andrea',   'Costa',      'acosta',    'pwd789g',    '2023-06-12'),
('Elena',    'Barbieri',   'ebarbieri', 'pwd890h',    '2023-05-28'),
('Davide',   'Moretti',    'dmoretti',  'pwd901i',    '2023-06-20'),
('Sofia',    'Lombardi',   'slombardi', 'pwd012j',    '2023-07-05');

-- 7) Parchi (20)
INSERT INTO Parchi (Nome, Responsabile, Regione) VALUES
('Parco dell''Etna',            1,  1),
('Parco della Madonie',         2,  1),
('Parco Nazionale d''Abruzzo',   3,  8),
('Parco Gran Paradiso',         4,  16),
('Parco del Circeo',            5,  7),
('Parco dello Stelvio',         6,  19),
('Parco del Gargano',           7,  5),
('Parco dell''Aspromonte',       8,  3),
('Parco dei Sibillini',         9,  10),
('Parco del Gran Sasso',        10, 8),
('Parco della Majella',         11, 8),
('Parco del Cilento',           12, 6),
('Parco del Vesuvio',           13, 6),
('Parco delle Dolomiti',        14, 19),
('Parco della Val Grande',      15, 15),
('Parco dell''Arcipelago Toscano',16, 12),
('Parco delle Cinque Terre',    17, 14),
('Parco della Sila',            18, 3),
('Parco del Pollino',           19, 4),
('Parco del Gennargentu',       20, 2);

-- 8) EsemplariAnimale (20)
INSERT INTO EsemplariAnimale (Nome, Data, Sesso, Adulto, Specie, Parco) VALUES
('Bruto',      '2020-05-10', 'M', TRUE,  1,  3),
('Luna',       '2021-06-15', 'F', TRUE,  2,  3),
('Rosso',      '2022-03-20', 'M', FALSE, 3,  9),
('Cerbiatto',  '2022-07-05', 'M', FALSE, 4,  4),
('Fulvo',      '2021-04-18', 'M', TRUE,  5,  7),
('Striscia',   '2020-08-12', 'F', TRUE,  6,  10),
('Zanna',      '2021-09-25', 'M', TRUE,  7,  12),
('Reale',      '2019-11-30', 'F', TRUE,  8,  1),
('Volo',       '2022-01-10', 'M', FALSE, 9,  4),
('Salto',      '2022-02-05', 'F', FALSE, 10, 19),
('Notte',      '2021-10-15', 'M', TRUE,  11, 14),
('Coda',       '2022-04-08', 'M', FALSE, 12, 17),
('Sibilo',     '2021-07-22', 'F', TRUE,  13, 8),
('Acqua',      '2022-08-15', 'F', FALSE, 14, 3),
('Macchia',    '2021-05-30', 'F', TRUE,  15, 20),
('Spino',      '2022-06-12', 'M', FALSE, 16, 11),
('Fulmine',    '2021-08-05', 'F', TRUE,  17, 5),
('Sonno',      '2022-09-18', 'M', FALSE, 18, 16),
('Corna',      '2020-12-25', 'M', TRUE,  19, 6),
('Salto',      '2022-05-20', 'F', FALSE, 20, 15);

-- 9) ParcoFlora (20)
INSERT INTO ParcoFlora (Parco, Specie) VALUES
(1,  1),  -- Quercia nel Parco dell'Etna
(1,  10), -- Pino marittimo nel Parco dell'Etna
(2,  3),  -- Ginestra nel Parco delle Madonie
(3,  2),  -- Abete rosso nel Parco d'Abruzzo
(3,  6),  -- Margherita nel Parco d'Abruzzo
(4,  2),  -- Abete rosso nel Parco Gran Paradiso
(5,  4),  -- Edera nel Parco del Circeo
(6,  9),  -- Narciso nel Parco dello Stelvio
(7,  5),  -- Ninfea nel Parco del Gargano
(8,  7),  -- Felce nel Parco dell'Aspromonte
(9,  8),  -- Semprevivo nel Parco dei Sibillini
(10, 11), -- Castagno nel Parco del Gran Sasso
(11, 12), -- Leccio nel Parco della Majella
(12, 13), -- Palma nana nel Parco del Cilento
(13, 14), -- Melo selvatico nel Parco del Vesuvio
(14, 15), -- Genziana nel Parco delle Dolomiti
(15, 16), -- Orchidea nel Parco della Val Grande
(16, 17), -- Rovo nel Parco dell'Arcipelago Toscano
(17, 18), -- Muschio nel Parco delle Cinque Terre
(18, 20); -- Rosmarino nel Parco della Sila

-- // :)
