--  MULTI JOIN

SELECT * 
FROM actor
INNER JOIN  film_actor
on actor.actor_id = film_actor.actor_id

select * 
FROM film_actor

SELECT * 
FROM film_actor
INNER JOIN  actor
on actor.actor_id = film_actor.actor_id

SELECT * FROM film

SELECT title, fa.film_id  
FROM film_actor AS fa
INNER JOIN film
on fa.film_id = film.film_id

SELECT first_name, last_name, title
FROM film_actor
INNER JOIN actor
on actor.actor_id = film_actor.actor_id
INNER JOIN film
on film_actor.film_id = film.film_id




SELECT title ,first_name, last_name
FROM film_actor
INNER JOIN actor
on actor.actor_id = film_actor.actor_id
INNER JOIN film
on film_actor.film_id = film.film_id


SELECT title ,first_name, last_name
FROM film_actor
INNER JOIN actor
on actor.actor_id = film_actor.actor_id
INNER JOIN film
on film_actor.film_id = film.film_id
WHERE title like 'Wo%'
ORDER BY first_name


-- SUB QUERIES!!!

SELECT customer_id, sum(amount)
FROM payment
GROUP BY customer_id
HAVING sum(amount) < -15000
ORDER BY sum(amount)

SELECT first_name, last_name, email
FROM customer

-- SELECT first_name, last_name, email
-- FROM customer
-- WHERE customer_id IN (
--     SELECT customer_id, sum(amount)  --> ERROR,CAN ONLY HAVE ONE COLUMN
--     FROM payment
--     GROUP BY customer_id
--     HAVING sum(amount) < -15000
--     ORDER BY sum(amount)
-- )


SELECT first_name, last_name, email
FROM customer
WHERE customer_id in (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING sum(amount) < -15000
    ORDER BY sum(amount)
)

--Sub queries can occur in WHERE, FROM, and SELECT 
--                             SELECT CLAUSE USE NOT REALLY A THING

--FROM CLAUSE

select first_name, last_name
FROM (
   SELECT first_name, last_name, title
FROM film_actor
INNER JOIN actor
on actor.actor_id = film_actor.actor_id
INNER JOIN film
on film_actor.film_id = film.film_id 
) AS MULTI_join
WHERE title = 'Alone Trip'

-- SELECT clause
SELECT first_name, last_name, (
    select COUNT(*)
    FROM rental
)
from customer