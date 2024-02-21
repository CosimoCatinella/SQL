-- Seleziona tutti i prodotti con un prezzo superiore a 50 euro dalla tabella Prodotti.
Select *
from prodotti 
where Prezzo > 50;

-- Seleziona tutte le email dei clienti il cui nome inizia con la lettera 'A' dalla tabella Clienti.
select *
from clienti
where Email like "A%";

-- Seleziona tutti gli ordini con una quantità maggiore di 10 o con un importo totale inferiore a 100 euro dalla tabella Ordini.

SELECT *
FROM ordini
join dettaglioordine on ordini.IDProdotto = dettaglioordine.IDProdotto
where ordini.quantità > 10 or dettaglioordine.PrezzoTotale < 100;  

-- Seleziona tutti i prezzi dei prodotti il cui nome contiene la parola 'tech' indipendentemente dalla posizione nella tabella Prodotti.

select NomeProdotto, prezzo
from prodotti
where NomeProdotto like "%tech%";

-- Seleziona tutti i clienti che non hanno un indirizzo email nella tabella Clienti.

Select *
from clienti
where Email is null;

-- Seleziona tutti i prodotti il cui nome inizia con 'M' e termina con 'e' indipendentemente dalla lunghezza della parola nella tabella Prodotti.

Select *
from prodotti
Where NomeProdotto like "M%e";