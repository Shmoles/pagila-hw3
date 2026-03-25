SELECT customer.first_name, customer.last_name, film.title, rental.rental_date
FROM customer
JOIN rental USING (customer_id)
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
WHERE rental.rental_date = (
    SELECT max(r2.rental_date)
    FROM rental r2
    WHERE r2.customer_id = customer.customer_id
)
ORDER BY customer.last_name, customer.first_name;
