-- Esercizio 1 
-- Elencate il numero di tracce per ogni genere in ordine discendente, escludendo quei generi che hanno meno di 10 tracce.

SELECT g.Name Genere, COUNT(t.trackId) AS NumeroTracce
FROM genre g
JOIN Track t ON g.genreId = t.genreId
GROUP BY g.GenreId, g.Name
HAVING NumeroTracce >= 10
ORDER BY NumeroTracce DESC;

-- Esercizio 2 
-- Trovate le tre canzoni più costose.

SELECT t.Name NomeCanzone, t.UnitPrice AS Prezzo
FROM track t
WHERE t.UnitPrice >= ( 
	SELECT MAX(UnitPrice)
    FROM track)
ORDER BY t.Name, prezzo;

-- Esercizio 3 
-- Elencate gli artisti che hanno canzoni più lunghe di 6 minuti.

SELECT DISTINCT a.Name
FROM artist a
JOIN album al ON a.ArtistId = al.ArtistId
JOIN track t ON al.AlbumId = t.AlbumId
WHERE t.Milliseconds > 360000 
ORDER BY a.Name;

-- Esercizio 4 
-- Individuate la durata media delle tracce per ogni genere.

SELECT g.name, AVG(t.Milliseconds) / 60000 AS DurataMediaInMinuti
FROM genre g
JOIN track t on g.GenreId = t.GenreId
GROUP BY g.name
ORDER BY g.name ASC;

-- Esercizio 5 
-- Elencate tutte le canzoni con la parola “Love” nel titolo, ordinandole alfabeticamente prima per genere e poi per nome.
SELECT t.Name, g.Name
FROM track t
JOIN genre g ON t.GenreId = g.GenreId
WHERE t.Name LIKE "%Love%"
ORDER BY t.Name ASC, g.Name ASC;

-- Esercizio 6 
-- Trovate il costo medio per ogni tipologia di media.

SELECT g.name, AVG(t.UnitPrice) AS CostoMedio
FROM genre g
JOIN track t on g.GenreId = t.GenreId
GROUP BY g.name
ORDER BY CostoMedio DESC, g.name;

-- Esercizio 7 
-- Individuate il genere con più tracce.

SELECT g.Name AS NomeGenere, COUNT(t.TrackId) AS NumeroTracce
FROM genre g
JOIN track t ON g.GenreId = t.GenreId
GROUP BY g.GenreId
ORDER BY COUNT(t.TrackId) DESC
LIMIT 1;

-- Esercizio 8 
-- Trovate gli artisti che hanno lo stesso numero di album dei Rolling Stones.



SELECT a.Name, COUNT(al.AlbumId) AS NumeroAlbum
FROM artist a
LEFT JOIN album al ON a.ArtistId = al.ArtistId
GROUP BY a.ArtistId
HAVING NumeroAlbum = (
    SELECT COUNT(AlbumId)
    FROM album
    WHERE ArtistId = (
        SELECT ArtistId
        FROM artist
        WHERE Name = 'The Rolling Stones'
    )
);

-- Esercizio 9 
-- Trovate l’artista con l’album più costoso.

SELECT a.Name , al.Title AS TitoloAlbum, SUM(t.UnitPrice) AS CostoTotaleAlbum
FROM artist a
JOIN album al ON a.ArtistId = al.ArtistId
JOIN track t ON al.AlbumId = t.AlbumId
GROUP BY al.AlbumId
ORDER BY CostoTotaleAlbum DESC
LIMIT 1;