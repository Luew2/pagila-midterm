/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch similar movies.
 * You've already watched all other movies with the same actors,
 * so now you need a new strategy for finding similar movies.
 * You decide that two movies X and Y are similar if they have been rented by the same customer,
 * and you further quantify this similarity by defining the "similarity score" to be the number of distinct customers that have rented both X and Y.
 *
 * Write a SQL SELECT query that:
 * computes the "similarity score" for all movies with 'AMERICAN CIRCUS'
 * and orders the results from highest to lowest.
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 *
 * NOTE:
 * You do not have to include movies with similarity score 0 in your results (but you may if you like).
 */


WITH circus_customers AS (
    SELECT DISTINCT customer.customer_id FROM film
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
    JOIN customer USING (customer_id)
    WHERE film.title = 'AMERICAN CIRCUS'),
other_movies AS (
    SELECT DISTINCT film.title, circus_customers.customer_id FROM film
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
    JOIN circus_customers USING (customer_id))
SELECT DISTINCT title, count(customer_id) AS score FROM other_movies 
WHERE (title != 'AMERICAN CIRCUS') --Why would we want the movie we have seen?
GROUP BY title
ORDER BY score desc;
