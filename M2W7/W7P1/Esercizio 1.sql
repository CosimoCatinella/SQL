-- Esercizio 1 

-- Fate un elenco di tutte le tabelle. 
Show tables;

-- Visualizzate le prime 10 righe della tabella Album. 
Select *
from album
limit 10;

-- Trovate il numero totale di canzoni della tabella Tracks.

Select count(trackid) NumeroCanzoniTot
from track;

-- Trovate i diversi generi presenti nella tabella Genere.
Select distinct Name Genere
from genre;


-- Esercizio 2 

-- Recuperate il nome di tutte le tracce e del genere associato.

Select t.Name, g.Name
From track t
join genre g on t.GenreId=g.GenreId
order by g.name;

-- Esercizio 3 

-- Recuperate il nome di tutti gli artisti che hanno almeno un album nel database. Esistono artisti senza album nel database?

SELECT DISTINCT Artist.Name
FROM Artist
JOIN Album ON Artist.ArtistId = Album.ArtistId;

SELECT DISTINCT Artist.Name
FROM Artist
LEFT JOIN Album ON Artist.ArtistId = Album.ArtistId
WHERE Album.ArtistId IS NULL;

-- Esercizio 4 

/* Recuperate il nome di tutte le tracce, del genere associato e della tipologia di media. 
Esiste un modo per recuperare il nome della tipologia di media?*/

Select t.name, g.name, mt.Name
from track t
join genre g on t.GenreId = g.GenreId
join mediatype mt on t.MediaTypeId = mt.MediaTypeID
order by t.name;

-- Esercizio 5 
-- Elencate i nomi di tutti gli artisti e dei loro album.

Select a.Name Artist, al.Title NameAlbum
from artist a
join album al on a.ArtistID = al.ArtistID
order by a.Name;