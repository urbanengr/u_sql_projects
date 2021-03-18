
/* Valerie Gilbert, Data Science with Python
   Query 3 - Comparison of two rental stores based on number of rentals per month
*/

/* sub1 formats rental dates into year and month, counts number of rentals */
  WITH sub1 
    AS (SELECT DATE_PART('year', r.rental_date) AS rental_year,
               DATE_PART('month', r.rental_date) AS rental_month,
               s.store_id,
         COUNT (r.rental_id) AS rental_orders
	  FROM store AS s
          JOIN staff AS st
	    ON st.store_id = s.store_id
	  JOIN rental AS r
	    ON r.staff_id = st.staff_id

      GROUP BY s.store_id, r.rental_date
      ORDER BY s.store_id, r.rental_date
     )

SELECT rental_month, 
       rental_year, 
       store_id,
       SUM(rental_orders) AS count_rentals
  FROM sub1

GROUP BY rental_year, rental_month, store_id
ORDER BY rental_month;
