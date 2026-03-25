SELECT DISTINCT
    actor2.first_name || ' ' || actor2.last_name AS "Actor Name"
FROM actor actor1
JOIN film_actor fa1 ON actor1.actor_id = fa1.actor_id
JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
JOIN actor actor2 ON fa2.actor_id = actor2.actor_id
WHERE actor1.first_name = 'RUSSELL'
  AND actor1.last_name = 'BACALL'
  AND actor2.actor_id <> actor1.actor_id
ORDER BY "Actor Name";
