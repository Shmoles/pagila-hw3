SELECT name, title, "total rentals"
FROM (
    SELECT
        category.name,
        film.title,
        count(*) AS "total rentals",
        row_number() OVER (
            PARTITION BY category.category_id
            ORDER BY count(*) DESC, film.title DESC
        ) AS rn
    FROM category
    JOIN film_category USING (category_id)
    JOIN film USING (film_id)
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
    GROUP BY category.category_id, category.name, film.title
) t
WHERE rn <= 5
ORDER BY name, "total rentals" DESC, title;
