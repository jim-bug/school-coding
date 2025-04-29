/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 24/04/2025
    Consegna: Implementazione database simulazione ordinaria 2023

    by jim_bug // :)
*/

CREATE TABLE Cataloghi (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,

    PRIMARY KEY(ID)
);

CREATE TABLE Classi (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,

    PRIMARY KEY(ID)
);

CREATE TABLE Materie (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,

    PRIMARY KEY(ID)
);

CREATE TABLE Studenti (
    Matricola VARCHAR(5) NOT NULL,
    Nome VARCHAR(30) NOT NULL,
    Cognome VARCHAR(30) NOT NULL,
    DataNascita DATE NOT NULL,

    PRIMARY KEY(Matricola)
);

CREATE TABLE Docenti (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Cognome VARCHAR(30) NOT NULL,
    Username VARCHAR(10) NOT NULL,
    Password VARCHAR(24) NOT NULL,

    UNIQUE(Username),
    PRIMARY KEY(ID)
);

CREATE TABLE Videogiochi (
    ID INT AUTO_INCREMENT,
    Titolo VARCHAR(40) NOT NULL,
    Descrizione_Breve VARCHAR(160) NOT NULL,
    Descrizione VARCHAR(255) NOT NULL,
    Img1 VARCHAR(50) NOT NULL,
    Img2 VARCHAR(50) NOT NULL,
    Img3 VARCHAR(50) NOT NULL,
    Categoria INT NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY (Categoria) REFERENCES Cataloghi(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Attivita (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Punteggio INT NOT NULL,
    Monete INT NOT NULL,
    Videogioco INT NOT NULL,

    CHECK(Monete > 0),
    CHECK(Punteggio > 0),
    PRIMARY KEY(ID),
    FOREIGN KEY (Videogioco) REFERENCES Videogiochi(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Classi_Virtuali (
    ID INT AUTO_INCREMENT,
    Codice VARCHAR(5) NOT NULL,
    Classe INT NOT NULL,
    Materia INT NOT NULL,
    Docente INT NOT NULL,

    UNIQUE(Classe, Materia),
    UNIQUE(Codice),
    PRIMARY KEY(ID),
    
    FOREIGN KEY (Classe) REFERENCES Classi(ID)
        ON UPDATE CASCADE,
    FOREIGN KEY (Materia) REFERENCES Materie(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Includere (
    Classe_Virtuale INT NOT NULL,
    Videogioco INT NOT NULL,

    FOREIGN KEY (Classe_Virtuale) REFERENCES Classi_Virtuali(ID)
        ON UPDATE CASCADE,
    FOREIGN KEY (Videogioco) REFERENCES Videogiochi(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Fare (
    Punteggio INT NOT NULL,
    Studente VARCHAR(5) NOT NULL,
    Attivita INT NOT NULL,

    CHECK(Punteggio > 0),
    FOREIGN KEY (Studente) REFERENCES Studenti(Matricola)
        ON UPDATE CASCADE,
    FOREIGN KEY (Attivita) REFERENCES Attivita(ID)
        ON UPDATE CASCADE
);

CREATE TABLE Iscrivere (
    DataInvito DATE NOT NULL,
    Stato BOOLEAN NOT NULL,
    Studente VARCHAR(5) NOT NULL,
    Classe_Virtuale INT NOT NULL,

    FOREIGN KEY (Studente) REFERENCES Studenti(Matricola)
        ON UPDATE CASCADE,
    FOREIGN KEY (Classe_Virtuale) REFERENCES Classi_Virtuali(ID)
        ON UPDATE CASCADE
);




-- Populate Cataloghi
INSERT INTO Cataloghi (Nome) VALUES 
('Educational'), ('Puzzle'), ('Strategy'), ('Adventure'), ('Simulation'),
('Math'), ('Science'), ('History'), ('Language'), ('Art'),
('Music'), ('Geography'), ('Programming'), ('Physics'), ('Chemistry'),
('Biology'), ('Economics'), ('Literature'), ('Philosophy'), ('Psychology'),
('Sociology'), ('Political Science'), ('Engineering'), ('Medicine'), ('Law'),
('Business'), ('Agriculture'), ('Architecture'), ('Design'), ('Film'),
('Theater'), ('Dance'), ('Sports'), ('Health'), ('Nutrition'),
('Astronomy'), ('Geology'), ('Meteorology'), ('Oceanography'), ('Anthropology'),
('Archaeology'), ('Linguistics'), ('Statistics'), ('Robotics'), ('Artificial Intelligence'),
('Cybersecurity'), ('Data Science'), ('Virtual Reality'), ('Augmented Reality'), ('Blockchain');

-- Populate Classi
INSERT INTO Classi (Nome) VALUES 
('1A'), ('1B'), ('1C'), ('1D'), ('1E'),
('2A'), ('2B'), ('2C'), ('2D'), ('2E'),
('3A'), ('3B'), ('3C'), ('3D'), ('3E'),
('4A'), ('4B'), ('4C'), ('4D'), ('4E'),
('5A'), ('5B'), ('5C'), ('5D'), ('5E'),
('6A'), ('6B'), ('6C'), ('6D'), ('6E'),
('7A'), ('7B'), ('7C'), ('7D'), ('7E'),
('8A'), ('8B'), ('8C'), ('8D'), ('8E'),
('9A'), ('9B'), ('9C'), ('9D'), ('9E'),
('10A'), ('10B'), ('10C'), ('10D'), ('10E');

-- Populate Materie
INSERT INTO Materie (Nome) VALUES 
('Mathematics'), ('Physics'), ('Chemistry'), ('Biology'), ('History'),
('Geography'), ('Italian'), ('English'), ('French'), ('German'),
('Latin'), ('Greek'), ('Philosophy'), ('Psychology'), ('Sociology'),
('Law'), ('Economics'), ('Art'), ('Music'), ('Physical Education'),
('Computer Science'), ('Technology'), ('Religion'), ('Civics'), ('Astronomy'),
('Geology'), ('Meteorology'), ('Oceanography'), ('Anthropology'), ('Archaeology'),
('Linguistics'), ('Statistics'), ('Robotics'), ('Artificial Intelligence'), ('Cybersecurity'),
('Data Science'), ('Virtual Reality'), ('Augmented Reality'), ('Blockchain'), ('Calculus'),
('Algebra'), ('Geometry'), ('Trigonometry'), ('Number Theory'), ('Probability'),
('Differential Equations'), ('Linear Algebra'), ('Discrete Math'), ('Topology'), ('Logic');

-- Populate Studenti
INSERT INTO Studenti (Matricola, Nome, Cognome, DataNascita) VALUES 
('S0001', 'Mario', 'Rossi', '2010-05-15'), ('S0002', 'Luigi', 'Bianchi', '2010-06-20'),
('S0003', 'Anna', 'Verdi', '2010-07-10'), ('S0004', 'Laura', 'Neri', '2010-08-05'),
('S0005', 'Paolo', 'Gialli', '2010-09-12'), ('S0006', 'Giulia', 'Blu', '2010-10-18'),
('S0007', 'Francesco', 'Marrone', '2010-11-22'), ('S0008', 'Elena', 'Rosa', '2010-12-30'),
('S0009', 'Andrea', 'Arancio', '2011-01-14'), ('S0010', 'Sofia', 'Viola', '2011-02-19'),
('S0011', 'Davide', 'Celeste', '2011-03-25'), ('S0012', 'Chiara', 'Grigio', '2011-04-08'),
('S0013', 'Matteo', 'Oro', '2011-05-17'), ('S0014', 'Alessia', 'Argento', '2011-06-21'),
('S0015', 'Luca', 'Bronzo', '2011-07-03'), ('S0016', 'Martina', 'Rame', '2011-08-11'),
('S0017', 'Federico', 'Platino', '2011-09-16'), ('S0018', 'Elisa', 'Ottone', '2011-10-24'),
('S0019', 'Riccardo', 'Ferro', '2011-11-29'), ('S0020', 'Valentina', 'Acciaio', '2011-12-31'),
('S0021', 'Gabriele', 'Stagno', '2012-01-07'), ('S0022', 'Giorgia', 'Alluminio', '2012-02-14'),
('S0023', 'Simone', 'Titanio', '2012-03-20'), ('S0024', 'Aurora', 'Zinco', '2012-04-25'),
('S0025', 'Daniele', 'Rame', '2012-05-30'), ('S0026', 'Beatrice', 'Nichel', '2012-06-05'),
('S0027', 'Antonio', 'Cromo', '2012-07-10'), ('S0028', 'Vittoria', 'Molibdeno', '2012-08-15'),
('S0029', 'Christian', 'Tungsteno', '2012-09-20'), ('S0030', 'Alice', 'Vanadio', '2012-10-25'),
('S0031', 'Samuele', 'Manganese', '2012-11-30'), ('S0032', 'Greta', 'Ferro', '2012-12-05'),
('S0033', 'Leonardo', 'Cobalto', '2013-01-10'), ('S0034', 'Emma', 'Nichel', '2013-02-15'),
('S0035', 'Tommaso', 'Rame', '2013-03-20'), ('S0036', 'Sara', 'Zinco', '2013-04-25'),
('S0037', 'Pietro', 'Stagno', '2013-05-30'), ('S0038', 'Noemi', 'Alluminio', '2013-06-05'),
('S0039', 'Nicola', 'Titanio', '2013-07-10'), ('S0040', 'Viola', 'Oro', '2013-08-15'),
('S0041', 'Emanuele', 'Argento', '2013-09-20'), ('S0042', 'Rebecca', 'Bronzo', '2013-10-25'),
('S0043', 'Filippo', 'Platino', '2013-11-30'), ('S0044', 'Camilla', 'Ottone', '2013-12-05'),
('S0045', 'Alessandro', 'Ferro', '2014-01-10'), ('S0046', 'Giada', 'Acciaio', '2014-02-15'),
('S0047', 'Dario', 'Stagno', '2014-03-20'), ('S0048', 'Claudia', 'Alluminio', '2014-04-25'),
('S0049', 'Mirko', 'Titanio', '2014-05-30'), ('S0050', 'Serena', 'Zinco', '2014-06-05');

-- Populate Docenti
INSERT INTO Docenti (Nome, Cognome, Username, Password) VALUES 
('Giovanni', 'Rossi', 'grossi', 'password1'), ('Maria', 'Bianchi', 'mbianchi', 'password2'),
('Paolo', 'Verdi', 'pverdi', 'password3'), ('Anna', 'Neri', 'aneri', 'password4'),
('Luigi', 'Gialli', 'lgialli', 'password5'), ('Laura', 'Blu', 'lblu', 'password6'),
('Marco', 'Marrone', 'mmarrone', 'password7'), ('Elena', 'Rosa', 'erosa', 'password8'),
('Andrea', 'Arancio', 'aarancio', 'password9'), ('Sofia', 'Viola', 'sviola', 'password10'),
('Davide', 'Celeste', 'dceleste', 'password11'), ('Chiara', 'Grigio', 'cgrigio', 'password12'),
('Matteo', 'Oro', 'moro', 'password13'), ('Alessia', 'Argento', 'aargento', 'password14'),
('Luca', 'Bronzo', 'lbronzo', 'password15'), ('Martina', 'Rame', 'mrame', 'password16'),
('Federico', 'Platino', 'fplatino', 'password17'), ('Elisa', 'Ottone', 'eottone', 'password18'),
('Riccardo', 'Ferro', 'rferro', 'password19'), ('Valentina', 'Acciaio', 'vacciaio', 'password20'),
('Gabriele', 'Stagno', 'gstagno', 'password21'), ('Giorgia', 'Alluminio', 'galluminio', 'password22'),
('Simone', 'Titanio', 'stitanio', 'password23'), ('Aurora', 'Zinco', 'azinco', 'password24'),
('Daniele', 'Nichel', 'dnichel', 'password25'), ('Beatrice', 'Cromo', 'bcromo', 'password26'),
('Antonio', 'Molibdeno', 'amolibde', 'password27'), ('Vittoria', 'Tungsteno', 'vtungste', 'password28'),
('Christian', 'Vanadio', 'cvanadio', 'password29'), ('Alice', 'Manganese', 'amangane', 'password30'),
('Samuele', 'Cobalto', 'scobalto', 'password31'), ('Greta', 'Ferro', 'gferro', 'password32'),
('Leonardo', 'Nichel', 'lnichel', 'password33'), ('Emma', 'Rame', 'erame', 'password34'),
('Tommaso', 'Zinco', 'tzinco', 'password35'), ('Sara', 'Stagno', 'sstagno', 'password36'),
('Pietro', 'Alluminio', 'pallumin', 'password37'), ('Noemi', 'Titanio', 'ntitanio', 'password38'),
('Nicola', 'Oro', 'noro', 'password39'), ('Viola', 'Argento', 'vargento', 'password40'),
('Emanuele', 'Bronzo', 'ebronzo', 'password41'), ('Rebecca', 'Platino', 'rplatino', 'password42'),
('Filippo', 'Ottone', 'fottone', 'password43'), ('Camilla', 'Ferro', 'cferro', 'password44'),
('Alessandro', 'Acciaio', 'aacciaio', 'password45'), ('Giada', 'Stagno', 'gstagno2', 'password46'),
('Dario', 'Alluminio', 'dallumin', 'password47'), ('Claudia', 'Titanio', 'ctitanio', 'password48'),
('Mirko', 'Zinco', 'mzinco', 'password49'), ('Serena', 'Nichel', 'snichel', 'password50');

-- Populate Videogiochi
INSERT INTO Videogiochi (Titolo, Descrizione_Breve, Descrizione, Img1, Img2, Img3, Categoria) VALUES 
('Math Adventure', 'Solve math problems to advance', 'A fun adventure game where you solve math problems to unlock new levels and defeat enemies.', 'math1.jpg', 'math2.jpg', 'math3.jpg', 1),
('Word Quest', 'Build vocabulary through gameplay', 'Explore a fantasy world while learning new words and their meanings.', 'word1.jpg', 'word2.jpg', 'word3.jpg', 9),
('Science Explorer', 'Discover scientific concepts', 'Travel through different scientific environments and conduct experiments.', 'sci1.jpg', 'sci2.jpg', 'sci3.jpg', 2),
('History Heroes', 'Meet historical figures', 'Interact with historical figures and learn about important events.', 'hist1.jpg', 'hist2.jpg', 'hist3.jpg', 8),
('Geo Challenge', 'Test your geography knowledge', 'Identify countries, capitals, and landmarks in this fast-paced quiz game.', 'geo1.jpg', 'geo2.jpg', 'geo3.jpg', 12),
('Code Combat', 'Learn programming through play', 'Use real programming concepts to solve puzzles and defeat enemies.', 'code1.jpg', 'code2.jpg', 'code3.jpg', 13),
('Art Studio', 'Create digital masterpieces', 'Learn art techniques while creating your own digital artwork.', 'art1.jpg', 'art2.jpg', 'art3.jpg', 10),
('Music Maestro', 'Compose and learn music', 'Explore music theory while composing your own songs.', 'music1.jpg', 'music2.jpg', 'music3.jpg', 11),
('Physics Playground', 'Experiment with physics', 'Build contraptions and see how physics principles affect them.', 'phys1.jpg', 'phys2.jpg', 'phys3.jpg', 14),
('Chem Lab', 'Virtual chemistry experiments', 'Mix chemicals safely in this virtual chemistry laboratory.', 'chem1.jpg', 'chem2.jpg', 'chem3.jpg', 15),
('Bio Explorer', 'Journey through the human body', 'Explore biological systems and learn how they work.', 'bio1.jpg', 'bio2.jpg', 'bio3.jpg', 16),
('Econ Sim', 'Run your own business', 'Learn economics by managing resources in a simulated economy.', 'econ1.jpg', 'econ2.jpg', 'econ3.jpg', 17),
('Lit Quest', 'Explore classic literature', 'Interact with characters from famous books and analyze themes.', 'lit1.jpg', 'lit2.jpg', 'lit3.jpg', 18),
('Philo Thinker', 'Philosophy puzzle game', 'Solve ethical dilemmas and learn about philosophical concepts.', 'philo1.jpg', 'philo2.jpg', 'philo3.jpg', 19),
('Psych Lab', 'Psychology experiments', 'Participate in classic psychology experiments and learn the theories.', 'psych1.jpg', 'psych2.jpg', 'psych3.jpg', 20),
('Socio City', 'Build a society', 'Create a virtual society and see how sociological principles apply.', 'socio1.jpg', 'socio2.jpg', 'socio3.jpg', 21),
('Law Quest', 'Legal system adventure', 'Navigate the legal system and learn about laws and rights.', 'law1.jpg', 'law2.jpg', 'law3.jpg', 22),
('PolSim', 'Political simulation', 'Run for office and make policy decisions in this political sim.', 'pol1.jpg', 'pol2.jpg', 'pol3.jpg', 23),
('EngiBuild', 'Engineering challenges', 'Design and test structures using engineering principles.', 'engi1.jpg', 'engi2.jpg', 'engi3.jpg', 24),
('MedSim', 'Medical simulation', 'Diagnose and treat patients in this medical training game.', 'med1.jpg', 'med2.jpg', 'med3.jpg', 25),
('BizTycoon', 'Business management', 'Start and grow your own business in this economic sim.', 'biz1.jpg', 'biz2.jpg', 'biz3.jpg', 26),
('AgriSim', 'Farming simulation', 'Manage a farm and learn about agricultural science.', 'agri1.jpg', 'agri2.jpg', 'agri3.jpg', 27),
('ArchDesign', 'Architecture design', 'Design buildings while learning architectural principles.', 'arch1.jpg', 'arch2.jpg', 'arch3.jpg', 28),
('Design Studio', 'Graphic design game', 'Create designs while learning about color theory and composition.', 'design1.jpg', 'design2.jpg', 'design3.jpg', 29),
('Film Maker', 'Create short films', 'Learn film techniques while making your own movies.', 'film1.jpg', 'film2.jpg', 'film3.jpg', 30),
('Theater Game', 'Acting and drama', 'Participate in virtual plays and learn theater techniques.', 'theater1.jpg', 'theater2.jpg', 'theater3.jpg', 31),
('Dance Academy', 'Learn dance styles', 'Follow choreography and learn different dance forms.', 'dance1.jpg', 'dance2.jpg', 'dance3.jpg', 32),
('Sports Science', 'Physics of sports', 'Explore the science behind various sports and athletic performance.', 'sports1.jpg', 'sports2.jpg', 'sports3.jpg', 33),
('Health Hero', 'Nutrition and fitness', 'Learn about healthy living through gameplay challenges.', 'health1.jpg', 'health2.jpg', 'health3.jpg', 34),
('NutriQuest', 'Nutrition education', 'Make food choices and learn about balanced diets.', 'nutri1.jpg', 'nutri2.jpg', 'nutri3.jpg', 35),
('Astro Explorer', 'Space exploration', 'Travel through the solar system and learn astronomy.', 'astro1.jpg', 'astro2.jpg', 'astro3.jpg', 36),
('Geo Detective', 'Geology investigation', 'Identify rocks and learn about earth processes.', 'geol1.jpg', 'geol2.jpg', 'geol3.jpg', 37),
('Weather Sim', 'Meteorology simulation', 'Predict weather patterns and learn about climate.', 'weather1.jpg', 'weather2.jpg', 'weather3.jpg', 38),
('Ocean Quest', 'Marine biology', 'Explore ocean ecosystems and marine life.', 'ocean1.jpg', 'ocean2.jpg', 'ocean3.jpg', 39),
('Anthro Adventure', 'Cultural exploration', 'Learn about human cultures and societies.', 'anthro1.jpg', 'anthro2.jpg', 'anthro3.jpg', 40),
('Archaeo Dig', 'Virtual archaeology', 'Excavate sites and analyze artifacts.', 'archaeo1.jpg', 'archaeo2.jpg', 'archaeo3.jpg', 41),
('Lingua Land', 'Language learning', 'Practice vocabulary and grammar in a virtual world.', 'lingua1.jpg', 'lingua2.jpg', 'lingua3.jpg', 42),
('Stats Challenge', 'Statistics puzzles', 'Solve problems using statistical methods.', 'stats1.jpg', 'stats2.jpg', 'stats3.jpg', 43),
('Robot Builder', 'Robotics programming', 'Design and program virtual robots.', 'robot1.jpg', 'robot2.jpg', 'robot3.jpg', 44),
('AI Lab', 'Artificial intelligence', 'Train AI models and see how they learn.', 'ai1.jpg', 'ai2.jpg', 'ai3.jpg', 45),
('Cyber Defender', 'Cybersecurity game', 'Protect systems from attacks and learn security concepts.', 'cyber1.jpg', 'cyber2.jpg', 'cyber3.jpg', 46),
('Data Quest', 'Data science adventure', 'Analyze data to solve mysteries and make discoveries.', 'data1.jpg', 'data2.jpg', 'data3.jpg', 47),
('VR Explorer', 'Virtual reality education', 'Explore educational environments in VR.', 'vr1.jpg', 'vr2.jpg', 'vr3.jpg', 48),
('AR Creator', 'Augmented reality design', 'Create AR experiences and learn development techniques.', 'ar1.jpg', 'ar2.jpg', 'ar3.jpg', 49),
('Blockchain Tycoon', 'Cryptocurrency game', 'Learn blockchain concepts by managing a crypto economy.', 'block1.jpg', 'block2.jpg', 'block3.jpg', 50),
('Algebra Adventure', 'Solve algebraic equations', 'Navigate through levels by solving increasingly complex equations.', 'alg1.jpg', 'alg2.jpg', 'alg3.jpg', 6),
('Geometry World', 'Explore geometric shapes', 'Learn geometry by solving puzzles in a 3D world.', 'geo1.jpg', 'geo2.jpg', 'geo3.jpg', 6),
('Trigonometry Quest', 'Master trigonometric functions', 'Apply trig concepts to solve real-world problems.', 'trig1.jpg', 'trig2.jpg', 'trig3.jpg', 6),
('Number Theory', 'Explore prime numbers', 'Discover patterns in numbers and solve number theory problems.', 'num1.jpg', 'num2.jpg', 'num3.jpg', 6),
('Probability Game', 'Learn probability through play', 'Make predictions and calculate odds in various scenarios.', 'prob1.jpg', 'prob2.jpg', 'prob3.jpg', 6),
('Calc Challenge', 'Calculus learning game', 'Apply calculus concepts to solve physics problems.', 'calc1.jpg', 'calc2.jpg', 'calc3.jpg', 6),
('Linear Algebra', 'Matrix operations game', 'Learn linear algebra through interactive visualizations.', 'lin1.jpg', 'lin2.jpg', 'lin3.jpg', 6),
('Discrete Math', 'Logic and sets game', 'Solve problems using discrete mathematics concepts.', 'disc1.jpg', 'disc2.jpg', 'disc3.jpg', 6),
('Topology Explorer', 'Shape transformation game', 'Learn topological concepts by manipulating shapes.', 'top1.jpg', 'top2.jpg', 'top3.jpg', 6),
('Logic Puzzles', 'Deductive reasoning game', 'Solve increasingly complex logic puzzles.', 'log1.jpg', 'log2.jpg', 'log3.jpg', 6);

-- Populate Attivita
INSERT INTO Attivita (Nome, Punteggio, Monete, Videogioco) VALUES 
('Basic Addition', 100, 10, 1), ('Word Matching', 150, 15, 2),
('Chemical Reactions', 200, 20, 3), ('Historical Timeline', 120, 12, 4),
('Country Identification', 180, 18, 5), ('Loop Challenges', 250, 25, 6),
('Color Theory', 110, 11, 7), ('Note Identification', 130, 13, 8),
('Gravity Experiments', 220, 22, 9), ('Element Combinations', 190, 19, 10),
('Organ Systems', 160, 16, 11), ('Supply and Demand', 210, 21, 12),
('Literary Analysis', 140, 14, 13), ('Ethical Dilemmas', 170, 17, 14),
('Memory Tests', 230, 23, 15), ('Social Structures', 150, 15, 16),
('Case Studies', 180, 18, 17), ('Policy Decisions', 240, 24, 18),
('Bridge Building', 200, 20, 19), ('Diagnosis Practice', 260, 26, 20),
('Market Analysis', 190, 19, 21), ('Crop Rotation', 170, 17, 22),
('Building Design', 210, 21, 23), ('Logo Creation', 130, 13, 24),
('Shot Composition', 150, 15, 25), ('Improvisation', 180, 18, 26),
('Dance Routines', 220, 22, 27), ('Physics of Sports', 190, 19, 28),
('Meal Planning', 160, 16, 29), ('Nutrient Balance', 140, 14, 30),
('Planet Identification', 230, 23, 31), ('Rock Classification', 170, 17, 32),
('Weather Prediction', 200, 20, 33), ('Marine Ecosystems', 180, 18, 34),
('Cultural Comparison', 150, 15, 35), ('Artifact Dating', 210, 21, 36),
('Language Translation', 190, 19, 37), ('Data Analysis', 240, 24, 38),
('Robot Programming', 220, 22, 39), ('Neural Networks', 260, 26, 40),
('Encryption', 200, 20, 41), ('Data Visualization', 180, 18, 42),
('VR Environment', 230, 23, 43), ('AR Application', 190, 19, 44),
('Blockchain Transactions', 210, 21, 45), ('Equation Solving', 170, 17, 46),
('Shape Properties', 150, 15, 47), ('Angle Calculation', 180, 18, 48),
('Prime Numbers', 220, 22, 49), ('Probability Scenarios', 190, 19, 50);

-- Populate Classi_Virtuali
INSERT INTO Classi_Virtuali (Codice, Classe, Materia, Docente) VALUES 
('CV001', 1, 1, 1), ('CV002', 2, 2, 2),
('CV003', 3, 3, 3), ('CV004', 4, 4, 4),
('CV005', 5, 5, 5), ('CV006', 6, 6, 6),
('CV007', 7, 7, 7), ('CV008', 8, 8, 8),
('CV009', 9, 9, 9), ('CV010', 10, 10, 10),
('CV011', 11, 11, 11), ('CV012', 12, 12, 12),
('CV013', 13, 13, 13), ('CV014', 14, 14, 14),
('CV015', 15, 15, 15), ('CV016', 16, 16, 16),
('CV017', 17, 17, 17), ('CV018', 18, 18, 18),
('CV019', 19, 19, 19), ('CV020', 20, 20, 20),
('CV021', 21, 21, 21), ('CV022', 22, 22, 22),
('CV023', 23, 23, 23), ('CV024', 24, 24, 24),
('CV025', 25, 25, 25), ('CV026', 26, 26, 26),
('CV027', 27, 27, 27), ('CV028', 28, 28, 28),
('CV029', 29, 29, 29), ('CV030', 30, 30, 30),
('CV031', 31, 31, 31), ('CV032', 32, 32, 32),
('CV033', 33, 33, 33), ('CV034', 34, 34, 34),
('CV035', 35, 35, 35), ('CV036', 36, 36, 36),
('CV037', 37, 37, 37), ('CV038', 38, 38, 38),
('CV039', 39, 39, 39), ('CV040', 40, 40, 40),
('CV041', 41, 41, 41), ('CV042', 42, 42, 42),
('CV043', 43, 43, 43), ('CV044', 44, 44, 44),
('CV045', 45, 45, 45), ('CV046', 46, 46, 46),
('CV047', 47, 47, 47), ('CV048', 48, 48, 48),
('CV049', 49, 49, 49), ('CV050', 50, 50, 50);

-- Populate Includere
INSERT INTO Includere (Classe_Virtuale, Videogioco) VALUES 
(1, 1), (2, 2),
(3, 3), (4, 4),
(5, 5), (6, 6),
(7, 7), (8, 8),
(9, 9), (10, 10),
(11, 11), (12, 12),
(13, 13), (14, 14),
(15, 15), (16, 16),
(17, 17), (18, 18),
(19, 19), (20, 20),
(21, 21), (22, 22),
(23, 23), (24, 24),
(25, 25), (26, 26),
(27, 27), (28, 28),
(29, 29), (30, 30),
(31, 31), (32, 32),
(33, 33), (34, 34),
(35, 35), (36, 36),
(37, 37), (38, 38),
(39, 39), (40, 40),
(41, 41), (42, 42),
(43, 43), (44, 44),
(45, 45), (46, 46),
(47, 47), (48, 48),
(49, 49), (50, 50);

-- Populate Fare
INSERT INTO Fare (Punteggio, Studente, Attivita) VALUES 
(105, 'S0001', 1), (155, 'S0002', 2),
(205, 'S0003', 3), (125, 'S0004', 4),
(185, 'S0005', 5), (255, 'S0006', 6),
(115, 'S0007', 7), (135, 'S0008', 8),
(225, 'S0009', 9), (195, 'S0010', 10),
(165, 'S0011', 11), (215, 'S0012', 12),
(145, 'S0013', 13), (175, 'S0014', 14),
(235, 'S0015', 15), (155, 'S0016', 16),
(185, 'S0017', 17), (245, 'S0018', 18),
(205, 'S0019', 19), (265, 'S0020', 20),
(195, 'S0021', 21), (175, 'S0022', 22),
(215, 'S0023', 23), (135, 'S0024', 24),
(155, 'S0025', 25), (185, 'S0026', 26),
(225, 'S0027', 27), (195, 'S0028', 28),
(165, 'S0029', 29), (145, 'S0030', 30),
(235, 'S0031', 31), (175, 'S0032', 32),
(205, 'S0033', 33), (185, 'S0034', 34),
(155, 'S0035', 35), (215, 'S0036', 36),
(195, 'S0037', 37), (245, 'S0038', 38),
(225, 'S0039', 39), (265, 'S0040', 40),
(205, 'S0041', 41), (185, 'S0042', 42),
(235, 'S0043', 43), (195, 'S0044', 44),
(215, 'S0045', 45), (175, 'S0046', 46),
(155, 'S0047', 47), (185, 'S0048', 48),
(225, 'S0049', 49), (195, 'S0050', 50);

-- Populate Iscrivere
INSERT INTO Iscrivere (DataInvito, Stato, Studente, Classe_Virtuale) VALUES 
('2023-01-10', TRUE, 'S0001', 1), ('2023-01-11', TRUE, 'S0002', 2),
('2023-01-12', TRUE, 'S0003', 3), ('2023-01-13', TRUE, 'S0004', 4),
('2023-01-14', TRUE, 'S0005', 5), ('2023-01-15', TRUE, 'S0006', 6),
('2023-01-16', TRUE, 'S0007', 7), ('2023-01-17', TRUE, 'S0008', 8),
('2023-01-18', TRUE, 'S0009', 9), ('2023-01-19', TRUE, 'S0010', 10),
('2023-01-20', TRUE, 'S0011', 11), ('2023-01-21', TRUE, 'S0012', 12),
('2023-01-22', TRUE, 'S0013', 13), ('2023-01-23', TRUE, 'S0014', 14),
('2023-01-24', TRUE, 'S0015', 15), ('2023-01-25', TRUE, 'S0016', 16),
('2023-01-26', TRUE, 'S0017', 17), ('2023-01-27', TRUE, 'S0018', 18),
('2023-01-28', TRUE, 'S0019', 19), ('2023-01-29', TRUE, 'S0020', 20),
('2023-01-30', TRUE, 'S0021', 21), ('2023-01-31', TRUE, 'S0022', 22),
('2023-02-01', TRUE, 'S0023', 23), ('2023-02-02', TRUE, 'S0024', 24),
('2023-02-03', TRUE, 'S0025', 25), ('2023-02-04', TRUE, 'S0026', 26),
('2023-02-05', TRUE, 'S0027', 27), ('2023-02-06', TRUE, 'S0028', 28),
('2023-02-07', TRUE, 'S0029', 29), ('2023-02-08', TRUE, 'S0030', 30),
('2023-02-09', TRUE, 'S0031', 31), ('2023-02-10', TRUE, 'S0032', 32),
('2023-02-11', TRUE, 'S0033', 33), ('2023-02-12', TRUE, 'S0034', 34),
('2023-02-13', TRUE, 'S0035', 35), ('2023-02-14', TRUE, 'S0036', 36),
('2023-02-15', TRUE, 'S0037', 37), ('2023-02-16', TRUE, 'S0038', 38),
('2023-02-17', TRUE, 'S0039', 39), ('2023-02-18', TRUE, 'S0040', 40),
('2023-02-19', TRUE, 'S0041', 41), ('2023-02-20', TRUE, 'S0042', 42),
('2023-02-21', TRUE, 'S0043', 43), ('2023-02-22', TRUE, 'S0044', 44),
('2023-02-23', TRUE, 'S0045', 45), ('2023-02-24', TRUE, 'S0046', 46),
('2023-02-25', TRUE, 'S0047', 47), ('2023-02-26', TRUE, 'S0048', 48),
('2023-02-27', TRUE, 'S0049', 49), ('2023-02-28', TRUE, 'S0050', 50);

-- // :)
