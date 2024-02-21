-- Esercizio 1 
-- Recuperate tutte le tracce che abbiano come genere “Pop” o “Rock”.

Select t.name, g.name
from track t
join genre g on t.GenreId = g.GenreId
where g.name = "Pop" or g.name = "Rock"
order by t.name;

-- Esercizio 2 
-- Elencate tutti gli artisti e/o gli album che inizino con la lettera “A”.

Select a.name, al.title
from artist a
join album al on a.ArtistId = al.ArtistId
where a.name Like "A%" Or al.title like "A%"
order by a.name;

-- Esercizio 3 
-- Elencate tutte le tracce che hanno come genere “Jazz” o che durano meno di 3 minuti.

select t.name
from track t
join genre g on t.GenreId = g.GenreId
where g.Name = "Jazz" or t.Milliseconds / 6000 < 3;

-- Esercizio 4 
-- Recuperate tutte le tracce più lunghe della durata media.

select Name
from track
where Milliseconds > (
	select AVG(Milliseconds)
    from track);
    
-- Esercizio 5 
-- Individuate i generi che hanno tracce con una durata media maggiore di 4 minuti.

Select g.name Gener
from genre g
join track t on g.GenreId = t.TrackId
Where t.Milliseconds / 6000 > 4;

-- Esercizio 6 
-- Individuate gli artisti che hanno rilasciato più di un album.

Select a.name
from artist a
join album al on a.ArtistId = al.ArtistId
group by a.name
Having count(al.AlbumId) > 1
order by a.name;

-- Esercizio 7 
-- Trovate la traccia più lunga in ogni album.

select al.title, t.name
from track t
join album al on t.AlbumId = al.AlbumId
Where (al.AlbumId, t.Milliseconds) in 
	( select AlbumId, MAX(Milliseconds)
	  from track
      group by AlbumId
	)
order by al.title;

-- Esercizio 8 
-- Individuate la durata media delle tracce per ogni album.


select al.title, AVG(t.Milliseconds) AS DurataMedia
from album al 
join track t on al.AlbumId = t.AlbumId 
group by al.AlbumId
order by al.title;

-- Esercizio 9 
-- Individuate gli album che hanno più di 20 tracce e mostrate il nome dell’album e il numero di tracce in esso contenute.
select al.title, count(t.albumid) as NumeroTracce
from album al
join track t on al.AlbumId = t.AlbumId
group by t.AlbumId
having count(t.AlbumId) > 20
order by count(t.AlbumId);

