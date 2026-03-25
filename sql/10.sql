SELECT customer_id, name, total_payment, percentile
FROM (
    SELECT
        customer_id,
        first_name || ' ' || last_name AS name,
        total_payment,
        ntile(100) OVER (ORDER BY total_payment) AS percentile
    FROM (
        SELECT
            customer.customer_id,
            customer.first_name,
            customer.last_name,
            sum(payment.amount) AS total_payment
        FROM customer
        JOIN payment USING (customer_id)
        GROUP BY customer.customer_id, customer.first_name, customer.last_name
    ) t
) t2
WHERE percentile >= 90
ORDER BY name;
