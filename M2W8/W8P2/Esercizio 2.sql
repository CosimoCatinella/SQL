-- Esercizio 1 
-- Identificate tutti i clienti che non hanno effettuato nessun noleggio a gennaio 2006.

SELECT c.first_name, c.last_name, c.email
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id AND MONTH(r.rental_date) = 1 AND YEAR(r.rental_date) = 2006
WHERE r.customer_id IS NULL;

-- Esercizio 2 
-- Elencate tutti i film che sono stati noleggiati più di 10 volte nell’ultimo quarto del 2005

SELECT f.title, COUNT(r.rental_id) AS num_rentals
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
WHERE YEAR(r.rental_date) = 2005 AND QUARTER(r.rental_date) = 4
GROUP BY f.title
HAVING COUNT(r.rental_id) > 10
ORDER BY num_rentals DESC;


-- Esercizio 3 
-- Trovate il numero totale di noleggi effettuati il giorno 1/1/2006.

SELECT COUNT(*) AS total_rentals
FROM rental
WHERE DATE(rental_date) = '2006-01-01';

-- Esercizio 4 
-- Calcolate la somma degli incassi generati nei weekend (sabato e domenica).

SELECT SUM(amount) AS total_weekend_revenue
FROM payment
WHERE DAYOFWEEK(payment_date) IN (1, 7);

-- Esercizio 5 
-- Individuate il cliente che ha speso di più in noleggi.

SELECT c.customer_id, c.first_name Name, c.last_name Surname , SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 1;

-- Esercizio 6 
-- Elencate i 5 film con la maggior durata media di noleggio.


SELECT f.film_id, f.title, AVG(DATEDIFF(r.return_date, r.rental_date)) AS avg_rental_duration
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title
ORDER BY avg_rental_duration DESC
LIMIT 5;

-- Esercizio 7 
-- Calcolate il tempo medio tra due noleggi consecutivi da parte di un cliente

-- Esercizio 8 
-- Individuate il numero di noleggi per ogni mese del 2005.
SELECT MONTH(rental_date) AS month, COUNT(*) AS num_rentals

FROM rental
WHERE YEAR(rental_date) = 2005
GROUP BY MONTH(rental_date)
ORDER BY MONTH(rental_date);

-- Esercizio 9 
-- Trovate i film che sono stati noleggiati almeno due volte lo stesso giorno.

SELECT f.title, r.rental_date, COUNT(*) AS num_rentals
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY f.film_id, r.rental_date
HAVING COUNT(*) >= 2;

-- Esercizio 10 
-- Calcolate il tempo medio di noleggio.

SELECT AVG(DATEDIFF(return_date, rental_date)) AS average_rental_duration
FROM rental
WHERE return_date IS NOT NULL;