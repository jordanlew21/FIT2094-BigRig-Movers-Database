-- Name: Jordan Lew

--T3-brm-dm.sql

--
--3(a)

-- Create sequences to automatically generate unique IDs for
-- employees, quotes and jobs when new records are inserted.
-- Drop sequences if they already exist
DROP SEQUENCE employee_seq;
DROP SEQUENCE quote_seq;
DROP SEQUENCE job_seq;

-- Create EMPLOYEE sequence
CREATE SEQUENCE employee_seq
START WITH 300
INCREMENT BY 5;

-- Create QUOTE sequence
CREATE SEQUENCE quote_seq
START WITH 300
INCREMENT BY 5;

-- Create JOB sequence
CREATE SEQUENCE job_seq
START WITH 300
INCREMENT BY 5;

--3(b)

-- Add a new Truck Dispatcher, Aurello Brown, and assign
-- the employee to the existing manager Sarah Mitchell.
-- The manager's employee number is retrieved using a
-- subquery rather than being hard-coded.
INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
)
VALUES (
    employee_seq.NEXTVAL,
    'Aurello',
    'Brown',
    '0431952053',
    NULL,
    'T',
    (SELECT emp_no
     FROM employee
     WHERE UPPER(emp_gname) = 'SARAH'
       AND UPPER(emp_fname) = 'MITCHELL')
);
COMMIT;

--3(c)
-- Create a quote and scheduled job for Victoria Ella
-- from Flintstone Store, demonstrating how related
-- customer, employee and operational records are created.

-- INSERT QUOTE

INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
)
VALUES (
    quote_seq.NEXTVAL,
    TO_DATE('17-May-2026','dd-Mon-yyyy'),
    TO_DATE('25-May-2026','dd-Mon-yyyy'),
    '29 Kuranda Road, Adelaide SA 5030',
    '9 Albatros Drive, Mount Gambier SA 5270',
    1000,
    (SELECT cust_no
     FROM customer
     WHERE UPPER(cust_bname) = 'FLINTSTONE STORE'
       AND UPPER(cust_gname) = 'VICTORIA'
       AND UPPER(cust_fname) = 'ELLA'),
    (SELECT emp_no
     FROM employee
     WHERE UPPER(emp_gname) = 'AURELLO'
       AND UPPER(emp_fname) = 'BROWN')
);
COMMIT;

-- INSERT JOB

-- Create a scheduled job for the quote, linking the quote
-- to the dispatcher, driver, truck and trailer while
-- recording the planned pickup, drop-off and payment status.
INSERT INTO job (
    job_no,
    job_pickup_dt,
    job_intended_dropoff_dt,
    job_cost,
    job_payment_made,
    quote_no,
    sched_emp_no,
    driver_emp_no,
    truck_vin,
    trailer_code
)
VALUES (
    job_seq.NEXTVAL,
    TO_DATE('25-May-2026 09:00','dd-Mon-yyyy hh24:mi'),
    TO_DATE('25-May-2026 14:00','dd-Mon-yyyy hh24:mi'),
    1000,
    'Y',
    quote_seq.CURRVAL,
    (SELECT emp_no
     FROM employee
     WHERE UPPER(emp_gname) = 'AURELLO'
       AND UPPER(emp_fname) = 'BROWN'),
    (SELECT emp_no
     FROM employee
     WHERE UPPER(emp_gname) = 'MICHAEL'
       AND UPPER(emp_fname) = 'JOHNSON'),
    '1HGBH41JXMN109186',
    'TRL08'
);

COMMIT;

--3(d)

-- Update the scheduled job after a change to the booking.
-- The pickup time is moved to 2:00 PM and the existing
-- job cost is increased by 20%.

UPDATE job
SET job_pickup_dt = TO_DATE('25-May-2026 14:00','dd-Mon-yyyy hh24:mi'),
    job_cost = job_cost + (job_cost * 0.20)
WHERE quote_no = (
    SELECT q.quote_no
    FROM quote q
    JOIN customer c ON q.cust_no = c.cust_no
    WHERE UPPER(c.cust_gname) = 'VICTORIA'
      AND UPPER(c.cust_fname) = 'ELLA'
      AND UPPER(c.cust_bname) = 'FLINTSTONE STORE'
      AND q.quote_prepared_date = TO_DATE('17-May-2026','dd-Mon-yyyy')
);
COMMIT;

--3(e)
-- Cancel the scheduled job for Victoria Ella from
-- Flintstone Store by identifying the job through its
-- related quote and customer details.

DELETE FROM job
WHERE quote_no = (
    SELECT q.quote_no
    FROM quote q
    JOIN customer c ON q.cust_no = c.cust_no
    WHERE UPPER(c.cust_gname) = 'VICTORIA'
      AND UPPER(c.cust_fname) = 'ELLA'
      AND UPPER(c.cust_bname) = 'FLINTSTONE STORE'
      AND q.quote_prepared_date = TO_DATE('17-May-2026','dd-Mon-yyyy')
);
COMMIT;


