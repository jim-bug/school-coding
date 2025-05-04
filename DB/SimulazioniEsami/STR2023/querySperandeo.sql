/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 25/04/2025
    Consegna: Implementazione database simulazione straordinaria 2023, query.

    by jim_bug // :)
*/



-- 1) L'elenco degli apicoltori che producono miele DOP in una determinata regione:
SELECT Cognome, Apicoltori.Nome
FROM Regioni, Province, Comuni, Localita, Apicoltori, Apiari, Mieli, Tipologie
WHERE Regioni.Nome = 'Campania' AND Tipologie.Nome = 'Miele D.O.P.' AND
Regioni.ID = Province.Regione AND
Province.ID = Comuni.Provincia AND
Comuni.ID = Localita.Comune AND
Localita.ID = Apiari.Localita AND
Mieli.Tipologia = Tipologie.ID AND
Apiari.Miele = Mieli.ID AND
Apicoltori.ID = Apiari.Apicoltore
ORDER BY Cognome, Apicoltori.Nome;

-- 2) Il numero complessivo di apiari per ciascuna regione:
SELECT Regioni.ID, Regioni.Nome, COUNT(Codice)
FROM Regioni, Province, Comuni, Localita, Apiari
WHERE Regioni.ID = Province.Regione 
AND Province.ID = Comuni.Provincia 
AND Comuni.ID = Localita.Comune 
AND Localita.ID = Apiari.Localita
GROUP BY Regioni.ID
ORDER BY Regioni.Nome;

-- 3) Le quantità di miele prodotto in Italia lo scorso anno per ciscuna delle quattro tipologie:
SELECT Tipologie.ID, Tipologie.Nome, SUM(Quantita)
FROM Tipolgie, Mieli, Apiari, Produzioni
WHERE Tipologie.ID = Mieli.Tipologia AND Mieli.ID = Apiari.Miele AND Produzioni.Apiario = Apiari.Codice
GROUP BY Tipologie.ID
ORDER BY Tipologie.Nome;

-- // :)
