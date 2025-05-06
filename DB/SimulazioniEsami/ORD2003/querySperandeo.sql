/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 04/05/2025
    Consegna: Implementazione database simulazione ordinaria 2003, query.

    by jim_bug // :)
*/

-- 1) Dato il nome di una pianta, riportare quanti esemplari di quella pianta sono presenti nel vivaio:
SELECT COUNT(*)
FROM Speci, Tipi
WHERE Speci.Nome = 'Rosa' AND Speci.ID = Tipi.Specie;

-- 2) Dato il nome di una stagione, visualizzare il nome delle piante che fioriscono in quella stagione:
SELECT Tipi.Nome
FROM Tipi, Speci
WHERE Stagione = 'Inverno' AND Tipi.Specie = Speci.ID;

-- 3) Dato il nome di un intervento esterno, tra quelli previsti dal vivaio, riportare il nome e il telefono dei soggetti che hanno richiesto quell'intervento nel corso di un determinato anno solare:
SELECT Clienti.Nome, Telefono
FROM Interventi, Clienti
WHERE Interventi.Data >= '2024-01-01' AND Interventi.Data < '2025-01-01' AND
Interventi.Cliente = Clienti.ID;

-- 4) Dato il nome di un agronomo, riportare quanti esemplari di piante sono sotto la sua responsabilità:
SELECT COUNT(*)
FROM Qualifiche, Personali, Speci
WHERE Qualifiche.Nome = 'Agronomo' AND Personali.Nome = 'Luca' AND
Qualifiche.ID = Personali.Qualifica AND
Speci.Personale = Personali.ID;

-- 5) Visualizzare nome, descrizione, e quantità di esemplari presenti nel vivaio, della pianta più economica da interno:
SELECT Speci.Nome, Speci.Descrizione, COUNT(*)
FROM Tipi, Speci
WHERE Tipi.Costo = (SELECT MIN(Costo)
                    FROM Speci, Tipi
                    WHERE Esterno = FALSE AND
                    Speci.ID = Tipi.Specie)
AND Tipi.Specie = Speci.ID
GROUP BY Speci.Nome;

-- 6) Riportare nome degli interventi richiesti non ancora evasi con il nome e il telefono del richiedente:
SELECT Attivita.Nome, Clienti.Nome, Telefono
FROM Attivita, Interventi, Clienti
WHERE DataEffettuazione IS NULL AND
Attivita.Codice = Interventi.Attivita AND
Clienti.ID = Interventi.Cliente;

-- // :)
