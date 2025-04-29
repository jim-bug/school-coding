/*
    Autore: Ignazio Leonardo Calogero Sperandeo
    Data: 24/04/2025
    Consegna: Implementazione database simulazione ordinaria 2023, query.

    by jim_bug // :)
*/



-- 1) L’elenco in ordine alfabetico dei giochi classificati per uno specifico argomento:
SELECT *
FROM Videogiochi
WHERE Videogiochi.Categoria = 4
ORDER BY Titolo;

-- 2) La classifica degli studenti di una certa classe virtuale, in base alle monete raccolte per un certo gioco:
SELECT Studenti.*, SUM(Attivita.Monete) AS MoneteTotali
FROM Studenti, Fare, Attivita, Iscrivere
WHERE Iscrivere.Classe_Virtuale = 5 AND Stato = TRUE 
AND Iscrivere.Studente = Matricola 
AND Videogioco = 2 
AND Attivita.ID = Fare.Attivita 
AND Fare.Studente = Matricola
AND Attivita.Punteggio < Fare.Punteggio
GROUP BY Matricola
ORDER BY Monete DESC;

-- 3) Il numero di classi in cui è utilizzato ciascun videogioco del catalogo:
SELECT ID, Titolo, COUNT(Includere.Classe_Virtuale) AS NumeroClassi
FROM Videogiochi, Includere
WHERE Includere.Videogioco = Videogiochi.ID
GROUP BY ID
ORDER BY Titolo;

-- // :)
