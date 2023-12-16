-- Week 5 - Wednesday
-- Questions

-- 1. List all customers who live in Texas (use
-- JOINs)

SELECT *
from address

SELECT first_name, last_name, district
from customer
INNER JOIN address
ON address.address_id = customer.address_id
where district = 'Texas'

--These customers live in Texas:
--Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, and Ian Still

-- 2. Get all payments above $6.99 with the Customer's Full
-- Name
select*
from payment

SELECT first_name,last_name,amount
FROM Customer
INNER JOIN payment 
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99


--There are 7 customers with payments above $6.99. Mary Smith (7 payments) and Peter Menard (23 payments), Ida Andrews (1 payment),
--Harold Martino (1 payment), Douglas Graf (1 payment), Alvin Deloach (1 payment), and Alfredo Mcadams (1 payment). In total , 35 payments

-- 3. Show all customers names who have made payments over $175(use
-- subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer_id in (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING sum(amount) >= 175
    ORDER BY sum(amount)
)

--There are 2 customers with payments above $175. Mary Smith and Peter Menard

-- 4. List all customers that live in Nepal (use the city
-- table)

select *
from city

select * 
FROM country

SELECT first_name, last_name, city, country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city 
ON address.city_id = city.city_id
INNER JOIN country 
ON city.country_id = country.country_id
WHERE country.country = 'Nepal'

--There is 1 customer that lives in Nepal, Kevin Schuler. Who lives in Birgunj, Nepal


-- 5. Which staff member had the most
-- transactions?

select *
from staff

SELECT first_name,last_name, COUNT(*) AS transaction_count
FROM staff
INNER JOIN payment 
ON staff.staff_id = payment.staff_id
INNER JOIN rental 
ON payment.rental_id = rental.rental_id
GROUP BY staff.staff_id
ORDER BY transaction_count DESC

--Jon Stephens had the most transactions

-- 6. How many movies of each rating are
-- there?

select rating
from film

select rating, COUNT(*) AS unique_pos_value
from film
GROUP BY rating
ORDER BY unique_pos_value 

--There are:
--224 rated PG-13 Movies
--209 rated NC-17 Movies
--196 rated R Movies
--194 rated PG Movies
--178 rated G Movies


-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer_id in (
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
    GROUP BY customer_id
    HAVING COUNT(*) = 1
)

-- The customers with 1 payment above $6.99 are:
-- Ida Andrews
-- Harold Martino
-- Douglas Graf
-- Alvin Deloach
-- Alfredo Mcadams


-- 8. How many free rentals did our stores give away?

SELECT COUNT(payment.rental_id) AS free_rental_count
FROM payment
INNER JOIN rental 
ON payment.rental_id = rental.rental_id
WHERE payment.amount = 0

-- There was 0 free rentals given away