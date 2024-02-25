-- Esercizio 1 
-- Effettuate un’esplorazione preliminare del database. 
-- Di cosa si tratta? Quante e quali tabelle contiene? Fate in modo di avere un’idea abbastanza chiara riguardo a con cosa state lavorando.

SHOW Tables;

SELECT *
FROM nicer_but_slower_film_list; 

SELECT *
FROM rental
LIMIT 10;

-- Esercizio 2 
-- Scoprite quanti clienti si sono registrati nel 2006.

SELECT first_name AS Nome, last_name AS Cognome
FROM customer
WHERE create_date >= '2006-01-01' AND (create_date <= '2006-12-31');

-- Esercizio 3 
-- Trovate il numero totale di noleggi effettuati il giorno 1/1/2006.

SELECT COUNT(rental_id) AS Noleggi_01_01_2006
FROM rental
WHERE rental_date = '2006-1-1';

-- Esercizio 4 
-- Elencate tutti i film noleggiati nell’ultima settimana e tutte le informazioni legate al cliente che li ha noleggiat

SELECT c.*, f.title 
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i on r.inventory_id = i.inventory_id
JOIN film f on i.film_id = f.film_id
WHERE r.rental_date BETWEEN  '2006-02-14' AND '2006-02-21';

-- Esercizio 5 
-- Calcolate la durata media del noleggio per ogni categoria di film.

SELECT c.name AS category, AVG(DATEDIFF(return_date, rental_date)) AS avg_rental_duration
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name;




	