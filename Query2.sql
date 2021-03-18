
/* Valerie Gilbert, Data Science with Python
   Query 2 - Provide a table with movie titles and divide them into 4 levels.
*/	

SELECT f.title, 
       c.name,
       f.rental_duration,
       NTILE(4) OVER (ORDER BY f.rental_duration)
  FROM film AS f
  JOIN film_category AS fc
    ON fc.film_id = f.film_id
  JOIN category AS c
    ON c.category_id = fc.category_id

/* Select only the film_ids that are in the family friendly categories */
 WHERE f.film_id
  	IN (SELECT fc.film_id
	      FROM film_category AS fc
	      JOIN category AS c
		ON c.category_id = fc.category_id
	     WHERE c.name
            	IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
	    )

ORDER BY f.rental_duration, NTILE;
