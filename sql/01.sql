/*
 * You want to watch a movie tonight.
 * But you're superstitious,
 * and don't want anything to do with the letter 'F'.
 * List the titles of all movies that:
 * 1) do not have the letter 'F' in their title,
 * 2) have no actors with the letter 'F' in their names (first or last),
 * 3) have never been rented by a customer with the letter 'F' in their names (first or last).
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 *
 */



WITH customers AS ( 
    SELECT DISTINCT film.film_id --Grab all customer films with F
    FROM film
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
    JOIN customer USING (customer_id)
    WHERE position('F' IN customer.last_name) > 0 
    oOR position('F' IN customer.last_name) > 0),
    
actors AS ( 
    SELECT DISTINCT film.film_id --Grab all actor films with F
    FROM film
    JOIN film_actor USING (film_id)
    JOIN actor USING (actor_id)
    WHERE position('F' IN actor.last_name) > 0 
    OR position('F' IN actor.first_name) > 0)

SELECT DISTINCT film.title FROM film
    WHERE position('F' IN film.title) = 0 
    AND film.film_id NOT IN (SELECT * FROM customers)
    AND film.film_id NOT IN (SELECT * FROM actors) 
    ORDER BY title; -- exclude customer and actor films

    
