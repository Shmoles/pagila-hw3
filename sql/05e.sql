SELECT f2.title
FROM film_category fc1
JOIN film f1 ON fc1.film_id = f1.film_id
JOIN film_category fc2 ON fc1.category_id = fc2.category_id
JOIN film f2 ON fc2.film_id = f2.film_id
WHERE f1.title = 'AMERICAN CIRCUS'
GROUP BY f2.film_id, f2.title
HAVING count(*) >= 2
ORDER BY f2.title;
