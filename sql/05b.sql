SELECT f2.title
FROM film_actor fa1
JOIN film f1 ON fa1.film_id = f1.film_id
JOIN film_actor fa2 ON fa1.actor_id = fa2.actor_id
JOIN film f2 ON fa2.film_id = f2.film_id
WHERE f1.title = 'AMERICAN CIRCUS'
GROUP BY f2.film_id, f2.title
HAVING count(*) >= 2
ORDER BY f2.title;
