SELECT DISTINCT actor.first_name, actor.last_name
FROM actor
JOIN film_actor USING (actor_id)
JOIN film_category USING (film_id)
JOIN category USING (category_id)
WHERE actor.actor_id NOT IN (
    SELECT actor.actor_id
    FROM actor
    JOIN film_actor USING (actor_id)
    JOIN film_category USING (film_id)
    JOIN category USING (category_id)
    WHERE category.name = 'Horror'
)
AND actor.actor_id IN (
    SELECT actor.actor_id
    FROM actor
    JOIN film_actor USING (actor_id)
    JOIN film_category USING (film_id)
    JOIN category USING (category_id)
    WHERE category.name = 'Children'
)
ORDER BY last_name, first_name;
