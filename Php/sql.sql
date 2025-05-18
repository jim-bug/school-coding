CREATE TABLE Classi (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50)
);

CREATE TABLE Speci (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50),
    Classe INT,
    FOREIGN KEY (Classe) REFERENCES Classi(ID)
);

CREATE TABLE Schede (
    ID INT PRIMARY KEY,
    Data DATE,
    Eta INT,
    Specie INT,
    FOREIGN KEY (Specie) REFERENCES Speci(ID)
);

INSERT INTO Classi (ID, Nome) VALUES
(1, 'Mammiferi'),
(2, 'Uccelli'),
(3, 'Rettili'),
(4, 'Anfibi'),
(5, 'Pesci');
INSERT INTO Speci (ID, Nome, Classe) VALUES
(1, 'Volpe Rossa', 1),
(2, 'Riccio Europeo', 1),
(3, 'Cinghiale', 1),
(4, 'Capriolo', 1),
(5, 'Tasso', 1),
(6, 'Lupo Appenninico', 1),

(7, 'Gufo Reale', 2),
(8, 'Poiana', 2),
(9, 'Civetta', 2),
(10, 'Airone Cenerino', 2),
(11, 'Germano Reale', 2),
(12, 'Falco Pellegrino', 2),

(13, 'Lucertola Muraiola', 3),
(14, 'Serpente Biacco', 3),
(15, 'Tartaruga Comune', 3),
(16, 'Geco', 3),
(17, 'Vipera Aspis', 3),
(18, 'Camaleonte', 3),

(19, 'Rana Verde', 4),
(20, 'Rospo Comune', 4),
(21, 'Salamandra Pezzata', 4),
(22, 'Ululone dal Ventre Giallo', 4),
(23, 'Tritone Crestato', 4),
(24, 'Raganella Italiana', 4),

(25, 'Trota Fario', 5),
(26, 'Persico Reale', 5),
(27, 'Carpa Comune', 5),
(28, 'Luccio', 5),
(29, 'Salmone', 5),
(30, 'Anguilla', 5);
INSERT INTO Schede (ID, Data, Eta, Specie) VALUES
(1, '2025-04-01', 2, 1),
(2, '2025-04-03', 1, 2),
(3, '2025-04-10', 4, 3),
(4, '2025-04-15', 3, 4),
(5, '2025-04-20', 5, 5),
(6, '2025-04-25', 1, 6),

(7, '2025-04-02', 2, 7),
(8, '2025-04-04', 3, 8),
(9, '2025-04-06', 1, 9),
(10, '2025-04-08', 2, 10),
(11, '2025-04-12', 4, 11),
(12, '2025-04-14', 2, 12),

(13, '2025-04-05', 2, 13),
(14, '2025-04-07', 1, 14),
(15, '2025-04-09', 2, 15),
(16, '2025-04-11', 3, 16),
(17, '2025-04-13', 4, 17),
(18, '2025-04-17', 2, 18),

(19, '2025-04-01', 1, 19),
(20, '2025-04-03', 2, 20),
(21, '2025-04-05', 2, 21),
(22, '2025-04-07', 3, 22),
(23, '2025-04-09', 4, 23),
(24, '2025-04-11', 1, 24),

(25, '2025-04-02', 3, 25),
(26, '2025-04-04', 2, 26),
(27, '2025-04-06', 2, 27),
(28, '2025-04-08', 3, 28),
(29, '2025-04-10', 1, 29),
(30, '2025-04-12', 4, 30);
