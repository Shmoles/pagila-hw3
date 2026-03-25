SELECT customer_id, first_name, last_name
FROM (
    SELECT
        customer.customer_id,
        customer.first_name,
        customer.last_name,
        sum(
            CASE
                WHEN category.name = 'Action' THEN 1
                ELSE 0
            END
        ) AS action_count
    FROM (
        SELECT
            rental.customer_id,
            inventory.film_id,
            row_number() OVER (
                PARTITION BY rental.customer_id
                ORDER BY rental.rental_date DESC, rental.rental_id DESC
            ) AS rn
        FROM rental
        JOIN inventory USING (inventory_id)
    ) recent
    JOIN customer ON recent.customer_id = customer.customer_id
    JOIN film_category ON recent.film_id = film_category.film_id
    JOIN category ON film_category.category_id = category.category_id
    WHERE rn <= 5
    GROUP BY customer.customer_id, customer.first_name, customer.last_name
) t
WHERE action_count >= 4
ORDER BY customer_id;
