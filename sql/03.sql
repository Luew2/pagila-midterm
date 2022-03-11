/*
 * List the titles of all films in the 'Children' category that have a rating of 'R' or 'NC-17'.
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 */

Select distinct title from film
JOIN film_category USING (film_id)
JOIN category USING (category_id)
WHERE category.name = 'Children' AND (film.rating = 'NC-17' OR film.rating = 'R'); 
