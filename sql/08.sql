SELECT f2.title
FROM (
    SELECT DISTINCT r1.customer_id
    FROM rental r1
    JOIN inventory i1 USING (inventory_id)
    JOIN film f1 USING (film_id)
    WHERE f1.title = 'BUCKET BROTHERHOOD'
) bb
JOIN rental r2 ON bb.customer_id = r2.customer_id
JOIN inventory i2 USING (inventory_id)
JOIN film f2 USING (film_id)
WHERE f2.title <> 'BUCKET BROTHERHOOD'
GROUP BY f2.film_id, f2.title
HAVING count(DISTINCT bb.customer_id) >= 3
ORDER BY f2.title;
