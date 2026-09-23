-- Name: Jordan Lew

/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T6-brm-json.sql

-- 
-- Configure SQL*Plus output so each generated JSON document is
-- displayed without page headings or unnecessary line wrapping.
SET PAGESIZE 100
SET WRAP OFF
SET HEADING OFF

-- Generate one JSON document for each customer containing their
-- personal/business details, contact information, address and
-- aggregated job statistics.
-- The document also contains a nested array of the customer's quotes,
-- including quote details, whether each quote became a job and the
-- corresponding job cost where applicable.
-- JSON_OBJECT and JSON_ARRAYAGG are used to transform relational
-- database records into structured JSON documents.
-- LEFT JOINs ensure customers and quotes are retained even when
-- they do not have an associated job.
SELECT JSON_OBJECT(
    '_id' VALUE c.cust_no,
    'customer_name' VALUE 
        CASE 
            WHEN c.cust_bname IS NOT NULL THEN c.cust_gname || ' ' || c.cust_fname
            ELSE NVL(c.cust_gname, '') || 
                 CASE WHEN c.cust_gname IS NOT NULL AND c.cust_fname IS NOT NULL THEN ' ' ELSE '' END || 
                 NVL(c.cust_fname, '')
        END,
    'customer_business' VALUE NVL(c.cust_bname, '-'),
    'customer_address' VALUE c.cust_street || ', ' || c.cust_town || ', ' || c.cust_pcode,
    'customer_phone' VALUE c.cust_contact_no,
    'customer_stats' VALUE JSON_OBJECT(
        'number_of_quotes' VALUE COUNT(q.quote_no),
        'number_of_jobs' VALUE COUNT(j.job_no),
        'total_paid_jobcost' VALUE 
            CASE WHEN SUM(CASE WHEN j.job_payment_made = 'Y' THEN j.job_cost END) IS NULL 
                 THEN '-' 
                 ELSE TO_CHAR(SUM(CASE WHEN j.job_payment_made = 'Y' THEN j.job_cost END), '$999,999.99') END,
        'total_unpaid_jobcost' VALUE 
            CASE WHEN SUM(CASE WHEN j.job_payment_made = 'N' THEN j.job_cost END) IS NULL 
                 THEN '-' 
                 ELSE TO_CHAR(SUM(CASE WHEN j.job_payment_made = 'N' THEN j.job_cost END), '$999,999.99') END
    ),
    'quotes' VALUE JSON_ARRAYAGG(
        JSON_OBJECT(
            'quote_no' VALUE q.quote_no,
            'quote_prepared_on' VALUE TO_CHAR(q.quote_prepared_date, 'DD-Mon-YYYY'),
            'preferred_start_date' VALUE TO_CHAR(q.quote_pref_start_date, 'DD-Mon-YYYY'),
            'start_location' VALUE q.quote_start_location,
            'end_location' VALUE q.quote_end_location,
            'quote_cost' VALUE TO_CHAR(q.quote_cost, '$999,999.99'),
            'assigned_to_job' VALUE CASE WHEN j.job_no IS NOT NULL THEN 'Y' ELSE 'N' END,
            'job_cost' VALUE 
                CASE WHEN j.job_no IS NULL 
                     THEN '-' 
                     WHEN j.job_cost = q.quote_cost 
                     THEN TO_CHAR(q.quote_cost, '$999,999.99') 
                     ELSE TO_CHAR(j.job_cost, '$999,999.99') END
        )
    )
) AS customer_doc
FROM customer c
LEFT JOIN quote q ON c.cust_no = q.cust_no
LEFT JOIN job j ON q.quote_no = j.quote_no
GROUP BY c.cust_no, c.cust_gname, c.cust_fname, c.cust_bname, c.cust_contact_no, c.cust_street, c.cust_town, c.cust_pcode;




