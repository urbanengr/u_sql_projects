
/* Valerie Gilbert, Data Science with Python
   Query 4 - Identify top ten paying customers by
             name, year & month, and amount paid per month 
*/

/* sub1 formats payment_date and pulls cutomer identification */
WITH sub1 AS (
  	      SELECT p.amount, 
		     DATE_TRUNC('month', p.payment_date) AS pay_month,
		     c.last_name,
		     c.first_name,
		     c.customer_id
		FROM customer AS c
		JOIN payment AS p
		  ON p.customer_id = c.customer_id
	    GROUP BY first_name,last_name, p.amount, p.payment_date, c.customer_id
	   ),

/* sub2 identifies top ten paying customers */
sub2 AS (
         SELECT customer_id,
                SUM(p.amount) AS cust_tot
	 FROM payment AS p

	 GROUP BY customer_id
	 ORDER BY cust_tot DESC
	    LIMIT 10
	)
		
SELECT DISTINCT pay_month,
       first_name||' '||last_name AS fullname,
       COUNT (*) AS pay_countpermon,
       SUM(amount) AS pay_amount
  FROM sub1
  JOIN sub2
    ON sub1.customer_id = sub2.customer_id

GROUP BY pay_month, fullname
ORDER BY fullname;