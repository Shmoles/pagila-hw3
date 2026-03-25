SELECT DISTINCT
    a3.first_name || ' ' || a3.last_name AS "Actor Name"
FROM actor a1
JOIN film_actor fa1 ON a1.actor_id = fa1.actor_id
JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
JOIN actor a2 ON fa2.actor_id = a2.actor_id
JOIN film_actor fa3 ON a2.actor_id = fa3.actor_id
JOIN film_actor fa4 ON fa3.film_id = fa4.film_id
JOIN actor a3 ON fa4.actor_id = a3.actor_id
WHERE a1.first_name = 'RUSSELL'
  AND a1.last_name = 'BACALL'
  AND a3.actor_id <> a1.actor_id
  AND a3.actor_id NOT IN (
      SELECT DISTINCT actor2.actor_id
      FROM actor actor1
      JOIN film_actor x1 ON actor1.actor_id = x1.actor_id
      JOIN film_actor x2 ON x1.film_id = x2.film_id
      JOIN actor actor2 ON x2.actor_id = actor2.actor_id
      WHERE actor1.first_name = 'RUSSELL'
        AND actor1.last_name = 'BACALL'
  )
ORDER BY "Actor Name";
