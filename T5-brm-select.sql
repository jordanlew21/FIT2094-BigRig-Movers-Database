-- Name: Jordan Lew

--T5-brm-select.sql

--
/* (a) */
-- Identify customers who have submitted multiple quotes and whose
-- average quoted cost is above the overall average quote cost.
-- Display the customer name, number of quotes and average quoted cost,
-- using the business name where available and the customer's full name otherwise.
-- Results are ordered by average quoted cost from highest to lowest.
COLUMN customer_name FORMAT A20
COLUMN num_quotes FORMAT A10
COLUMN avg_quoted_cost FORMAT A15
SELECT 
    c.cust_no,
    CASE 
        WHEN c.cust_bname IS NOT NULL 
        THEN c.cust_bname
        ELSE c.cust_gname || ' ' || c.cust_fname
    END AS customer_name,
    COUNT(q.quote_no) AS num_quotes,
    TO_CHAR(AVG(q.quote_cost), '$999,990.00') AS avg_quoted_cost
FROM customer c
JOIN quote q ON c.cust_no = q.cust_no
GROUP BY c.cust_no, c.cust_bname, c.cust_gname, c.cust_fname
HAVING COUNT(q.quote_no) > 1
   AND AVG(q.quote_cost) > (
       SELECT AVG(quote_cost) 
       FROM quote
   )
ORDER BY AVG(q.quote_cost) DESC, c.cust_no;



/* (b) */
-- Display every employee with their full name, role, manager and
-- number of jobs scheduled.
-- A self-join is used to retrieve each employee's manager from the
-- employee table, while a subquery counts jobs only for Truck Dispatchers.
-- Employees without a manager are displayed as "No Manager".
-- Results are ordered by employee number.
COLUMN emp_name FORMAT A20
COLUMN manager_name FORMAT A15
SELECT 
    e.emp_no,
    e.emp_gname || ' ' || e.emp_fname AS emp_name,
    CASE e.emp_role
        WHEN 'B' THEN 'Manager'
        WHEN 'T' THEN 'Truck Dispatcher'
        WHEN 'M' THEN 'Mechanic'
        WHEN 'D' THEN 'Driver'
    END AS emp_role_full,
    CASE 
        WHEN m.emp_no IS NULL THEN 'No Manager'
        ELSE m.emp_gname || ' ' || m.emp_fname
    END AS manager_name,
    CASE 
        WHEN e.emp_role = 'T' 
        THEN (SELECT COUNT(*) 
              FROM job j 
              WHERE j.sched_emp_no = e.emp_no)
        ELSE NULL
    END AS jobs_dispatched  
FROM employee e
LEFT JOIN employee m 
    ON e.emp_no_manager = m.emp_no

ORDER BY e.emp_no;



/* (c) */
-- Analyse each truck and trailer combination to show how often it
-- has been used and the total job cost associated with it.
-- The query also classifies combinations as High Use, Standard Use
-- or Never Used by comparing usage with the average across used combinations.
-- Formatting is applied to present monetary values in a consistent
-- fixed-width currency format, including "No jobs" for unused combinations.
-- Results are ordered by number of jobs, then truck VIN and trailer code.
COLUMN TRUCK_REGO FORMAT A10
COLUMN TRAILER_CODE FORMAT A15
SELECT 
    c.truck_vin,
    t.truck_rego,
    c.trailer_code,
    TO_CHAR(tr.trailer_purchase_cost, '$999,990.00') AS trailer_purchase_cost,

    COUNT(j.job_no) AS num_jobs,

    CASE 
        WHEN COUNT(j.job_no) = 0 
        THEN LPAD('No jobs', 17, ' ')
        ELSE LPAD(TO_CHAR(SUM(j.job_cost), '$999,990.00'), 17, ' ')
    END AS total_quote_cost,

    CASE 
        WHEN COUNT(j.job_no) = 0 THEN 'Never Used'
        WHEN COUNT(j.job_no) > (
            SELECT AVG(job_count)
            FROM (
                SELECT COUNT(*) AS job_count
                FROM job j2
                GROUP BY j2.truck_vin, j2.trailer_code
            )
        )
        THEN 'High Use'
        ELSE 'Standard Use'
    END AS usage
FROM combination c
JOIN truck t 
    ON c.truck_vin = t.truck_vin
JOIN trailer tr 
    ON c.trailer_code = tr.trailer_code
LEFT JOIN job j 
    ON j.truck_vin = c.truck_vin 
   AND j.trailer_code = c.trailer_code

GROUP BY 
    c.truck_vin, 
    t.truck_rego, 
    c.trailer_code, 
    tr.trailer_purchase_cost

ORDER BY 
    COUNT(j.job_no) DESC,
    c.truck_vin,
    c.trailer_code;



