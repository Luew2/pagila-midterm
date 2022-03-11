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



with customers as ( select distinct film.film_id --Grab all customer films with F
    from film
    join inventory USING (film_id)
    join rental USING (inventory_id)
    join customer USING (customer_id)
    where position('F' in customer.last_name) > 0 or position('F' in customer.last_name) > 0),
    
actors as ( select distinct film.film_id --Grab all actor films with F
    from film
    join film_actor USING (film_id)
    join actor USING (actor_id)
    where position('F' in actor.last_name) > 0 or position('F' in customer.first_name) > 0)

select distinct film.title from film
    where position('F' in film.title) = 0 and film.film_id not in (slect * from customers)
    and film.film_id not in (Select * from actors) ORDER BY title; -- exclude customer and actor films

    
