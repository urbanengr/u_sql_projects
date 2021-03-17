
/* Valerie Gilbert, Data Science with Python
   Query 1 - Number of rentals per title 
*/

SELECT title AS film_title,
       name AS category_name,
       COUNT(r.rental_id) AS rental_count
  FROM film AS f
  JOIN inventory AS i
    ON f.film_id = i.film_id
  JOIN film_category AS fc
    ON f.film_id = fc.film_id
  JOIN category AS c
    ON c.category_id = fc.category_id
  JOIN rental AS r
    ON r.inventory_id = i.inventory_id
 
 WHERE name
    IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')

GROUP BY title, name
ORDER BY name;



