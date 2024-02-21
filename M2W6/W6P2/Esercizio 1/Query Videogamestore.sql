-- Seleziona tutti gli impiegati con una laurea in Economia.

SELECT Nome N, TitoloStudio TS 
FROM Impiegato 
WHERE TitoloStudio = "Laurea in Economia";

-- Seleziona gli impiegati che lavorano come Cassiere o che hanno un Diploma di Informatica.

SELECT impiegato.nome, servizio_impiegato.Carica, impiegato.TitoloStudio
FROM impiegato
JOIN servizio_impiegato 
ON impiegato.CodiceFiscale = servizio_impiegato.CodiceFiscale
WHERE servizio_impiegato.Carica = "Cassiere" 
OR (impiegato.TitoloStudio = "Laurea in Informatica");

-- Seleziona i nomi e i titoli degli impiegati che hanno iniziato a lavorare dopo il 1 gennaio 2023.

SELECT Nome, TitoloStudio
FROM impiegato
JOIN servizio_impiegato ON impiegato.CodiceFiscale = servizio_impiegato.CodiceFiscale
WHERE servizio_impiegato.DataInizio > 2023 - 01 - 01;

-- Seleziona i titoli di studio distinti tra gli impiegati.

SELECT DISTINCT TitoloStudio
FROM impiegato;

-- Seleziona gli impiegati con un titolo di studio diverso da "Laurea in Economia".

SELECT *
FROM impiegato
WHERE TitoloStudio != "Lauera in Economia";

-- Seleziona gli impiegati che hanno iniziato a lavorare prima del 1 luglio 2023 e sono Commessi.

SELECT Nome
FROM impiegato
JOIN servizio_impiegato ON impiegato.CodiceFiscale = servizio_impiegato.CodiceFiscale
WHERE servizio_impiegato.DataInizio < 2023 - 07 - 01 AND servizio_impiegato.Carica = "Commesso";

-- Seleziona i titoli e gli sviluppatori dei videogiochi distribuiti nel 2020.videogioco

SELECT titolo, sviluppatore
FROM videogioco
WHERE AnnoDistribuzione >= 2020 - 01 - 01 AND AnnoDistribuzione <= 2020 - 12 - 31;	

-- Seleziona i titoli dei videogiochi disponibili nei settori 1 o 3 del negozio 5.

SELECT titolo
FROM videogioco
JOIN store ON videogioco.CodiceStore = store.CodiceStore
WHERE videogioco.CodiceStore = 5;


