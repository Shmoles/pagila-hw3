SELECT actor_id, first_name, last_name, film_id, title, rank, revenue
FROM (
    SELECT
        actor.actor_id,
        actor.first_name,
        actor.last_name,
        film.film_id,
        film.title,
        rank() OVER (
            PARTITION BY actor.actor_id
            ORDER BY sum(payment.amount) DESC, film.film_id
        ) AS rank,
        sum(payment.amount) AS revenue
    FROM actor
    JOIN film_actor USING (actor_id)
    JOIN film USING (film_id)
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
    JOIN payment USING (rental_id)
    GROUP BY actor.actor_id, actor.first_name, actor.last_name, film.film_id, film.title
) t
WHERE rank <= 3
ORDER BY actor_id, rank, film_id;
