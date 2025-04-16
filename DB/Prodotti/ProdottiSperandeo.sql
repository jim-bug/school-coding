/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 14/04/2025
    Consegna: Normalizzare i dati dei prodotti del file (prodotti_e_produttori.csv) fornito inserendoli in un DB relazionale.
              La metodologia di normalizzazione dei dati deve essere valida anche 
              nel caso in cui i prodotti a disposizione siano migliaia e prodotti da centinaia di aziende.
    
    by jim_bug // :)
*/

-- Creazione della tabella Città:
CREATE TABLE Citta (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,

    PRIMARY KEY(ID)
);

-- Creazione della tabella Produttori:
CREATE TABLE Produttori (
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(37) NOT NULL,
    Citta INT NOT NULL,

    PRIMARY KEY(ID),
    UNIQUE(Nome),
    FOREIGN KEY (Citta) REFERENCES Citta(ID)
        ON UPDATE CASCADE
);


-- Creazione della tabella Prodotti:
CREATE TABLE Prodotti (
    Codice VARCHAR(5),
    Nome VARCHAR(12) NOT NULL,
    Produttore INT NOT NULL,

    PRIMARY KEY(Codice),
    FOREIGN KEY (Produttore) REFERENCES Produttori(ID)
        ON UPDATE CASCADE
);



INSERT INTO Citta (Nome) VALUES
    ("Gianna calabro"), -- ID 1
    ("Ferragamo calabro"), -- ID 2
    ("Grasso del friuli"), -- ID 3
    ("Berenice ligure"), -- ID 4
    ("Modiano salentino"), -- ID 5
    ("San Raffaellino"), -- ID 6
    ("Piergiorgio nell'emilia"), -- ID 7
    ("Santino calabro"), -- ID 8
    ("Borgo Giorgio"), -- ID 9
    ("Bettina terme"), -- ID 10
    ("San Oreste terme"), -- ID 11
    ("Settimo Fortunata"), -- ID 12
    ("Stoppani salentino"), -- ID 13
    ("San Michela"), -- ID 14
    ("Rossellini lido"), -- ID 15
    ("San Susanna"), -- ID 16
    ("Renier nell'emilia"), -- ID 17
    ("Domenico del friuli"), -- ID 18
    ("Borgo Piergiuseppe del friuli"), -- ID 19
    ("Quarto Simone sardo"), -- ID 20
    ("Sesto Melania"), -- ID 21
    ("Gianni a mare"), -- ID 22
    ("Pierpaolo terme"), -- ID 23
    ("Lucio veneto"), -- ID 24
    ("San Arnaldo ligure"), -- ID 25
    ("Borgo Gionata nell'emilia"), -- ID 26
    ("Sesto Biagio"), -- ID 27
    ("Tatiana terme"), -- ID 28
    ("Borgo Cristina"); -- ID 29

INSERT INTO Produttori (Nome, Citta) VALUES
    ("Gangemi-Giulietti SPA", 1), -- ID 1
    ("Gargallo-Petrucci e figli", 2), -- ID 2
    ("Calarco e figli", 3), -- ID 3
    ("Palombi s.r.l.", 4), -- ID 4
    ("Camicione, Briccialdi e Meucci Group", 5), -- ID 5
    ("Maglio, Gentileschi e Cimini Group", 6), -- ID 6
    ("Broggini-Torricelli Group", 7), -- ID 7
    ("Manzoni, Mazzanti e Traetta s.r.l.", 8), -- ID 8
    ("Trezzini Group", 9), -- ID 9
    ("Anguissola Group", 10), -- ID 10
    ("Alboni-Ungaretti s.r.l.", 11), -- ID 11
    ("Casale-Zeffirelli Group", 12), -- ID 12
    ("Tozzo s.r.l.", 13), -- ID 13
    ("Agazzi-Luzi SPA", 14), -- ID 14
    ("Bellocchio-Pometta s.r.l.", 15), -- ID 15
    ("Pedroni SPA", 16), -- ID 16
    ("Ruggeri Group", 17), -- ID 17
    ("Rocca, Comolli e Sagese e figli", 18), -- ID 18
    ("Bova e figli", 19), -- ID 19
    ("Giulietti, Bazzi e Marrone SPA", 20), -- ID 20
    ("Volta Group", 21), -- ID 21
    ("Tosi-Scamarcio Group", 22), -- ID 22
    ("Montalcini-Pastine e figli", 23), -- ID 23
    ("Ceri Group", 24), -- ID 24
    ("Silvestri, Gadda e Morellato Group", 25), -- ID 25
    ("Borsiere-Renault s.r.l.", 26), -- ID 26
    ("Trentini SPA", 27), -- ID 27
    ("Carriera SPA", 28), -- ID 28
    ("Ortese SPA", 29); -- ID 29

INSERT INTO Prodotti VALUES
    ("P0001", "Alias", 1), 
    ("P0002", "Delectus", 2), 
    ("P0003", "Nam", 3), 
    ("P0004", "Dolor", 4), 
    ("P0005", "Dolorum", 5), 
    ("P0006", "Quaerat", 6), 
    ("P0007", "Autem", 7), 
    ("P0008", "Deleniti", 8), 
    ("P0009", "Enim", 9), 
    ("P0010", "Praesentium", 2), 
    ("P0011", "Reiciendis", 10), 
    ("P0012", "Voluptatem", 11), 
    ("P0013", "Error", 12), 
    ("P0014", "Ex", 13), 
    ("P0015", "Delectus", 9), 
    ("P0016", "Eveniet", 14), 
    ("P0017", "Molestiae", 15), 
    ("P0018", "Libero", 4), 
    ("P0019", "Sequi", 10), 
    ("P0020", "Rerum", 16), 
    ("P0021", "Delectus", 8), 
    ("P0022", "Suscipit", 17), 
    ("P0023", "Praesentium", 13), 
    ("P0024", "Corrupti", 17), 
    ("P0025", "Sint", 3), 
    ("P0026", "Alias", 18), 
    ("P0027", "Qui", 19), 
    ("P0028", "Saepe", 11), 
    ("P0029", "Magnam", 7), 
    ("P0030", "Porro", 10), 
    ("P0031", "Odit", 20), 
    ("P0032", "Ipsa", 21), 
    ("P0033", "Accusantium", 11), 
    ("P0034", "Est", 19), 
    ("P0035", "Quos", 4), 
    ("P0036", "Ullam", 17), 
    ("P0037", "Dolorem", 13), 
    ("P0038", "Ut", 18), 
    ("P0039", "Possimus", 22), 
    ("P0040", "Perspiciatis", 23), 
    ("P0041", "Quisquam", 4), 
    ("P0042", "Ipsam", 1), 
    ("P0043", "Voluptatibus", 24), 
    ("P0044", "Beatae", 25), 
    ("P0045", "Facilis", 9), 
    ("P0046", "Deserunt", 20), 
    ("P0047", "Sed", 18), 
    ("P0048", "Natus", 14), 
    ("P0049", "Voluptatibus", 5), 
    ("P0050", "Eaque", 25), 
    ("P0051", "Ipsum", 19), 
    ("P0052", "Illum", 26), 
    ("P0053", "Molestiae", 10), 
    ("P0054", "Assumenda", 16), 
    ("P0055", "Eos", 20), 
    ("P0056", "Amet", 9), 
    ("P0057", "Ipsam", 27), 
    ("P0058", "Expedita", 1), 
    ("P0059", "Laboriosam", 8), 
    ("P0060", "Nulla", 7), 
    ("P0061", "Velit", 6), 
    ("P0062", "Unde", 11), 
    ("P0063", "Unde", 10), 
    ("P0064", "Et", 20), 
    ("P0065", "Facilis", 10), 
    ("P0066", "Laborum", 28), 
    ("P0067", "Velit", 23), 
    ("P0068", "Dolorem", 22), 
    ("P0069", "Inventore", 12), 
    ("P0070", "Ad", 2), 
    ("P0071", "Magnam", 21), 
    ("P0072", "Rem", 12), 
    ("P0073", "Quis", 11), 
    ("P0074", "Aspernatur", 24), 
    ("P0075", "Suscipit", 26), 
    ("P0076", "Distinctio", 28), 
    ("P0077", "Libero", 19), 
    ("P0078", "Adipisci", 9), 
    ("P0079", "Porro", 12), 
    ("P0080", "Sunt", 1), 
    ("P0081", "Assumenda", 25), 
    ("P0082", "Alias", 29), 
    ("P0083", "Excepturi", 22), 
    ("P0084", "Aperiam", 25), 
    ("P0085", "Accusantium", 21), 
    ("P0086", "Et", 1), 
    ("P0087", "Ullam", 23), 
    ("P0088", "Itaque", 16), 
    ("P0089", "Atque", 10), 
    ("P0090", "Assumenda", 15), 
    ("P0091", "Laborum", 29), 
    ("P0092", "Ut", 29), 
    ("P0093", "Nisi", 11), 
    ("P0094", "Deleniti", 17), 
    ("P0095", "Esse", 11), 
    ("P0096", "Occaecati", 20), 
    ("P0097", "Nostrum", 27), 
    ("P0098", "Dicta", 23), 
    ("P0099", "Magnam", 23), 
    ("P0100", "Ipsa", 25);

-- // :)
