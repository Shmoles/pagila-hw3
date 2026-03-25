SELECT
    title,
    regexp_replace(
        initcap(actors),
        '([A-Za-z]) ([A-Za-z])',
        '\1\2',
        'g'
    ) AS actors
FROM film_list
WHERE category = 'Documentary'
  AND rating = 'G'
ORDER BY title;
