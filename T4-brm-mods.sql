-- Name: Jordan Lew

--T4-brm-mods.sql

--
--4(a)
--Add new columns
ALTER TABLE quote
ADD (
    quote_status CHAR(1),
    quote_reason VARCHAR2(200)
);

--Add column comments
COMMENT ON COLUMN quote.quote_status IS
'Status of quote: Y if assigned to a job, N if not assigned';

COMMENT ON COLUMN quote.quote_reason IS
'Reason why quote not converted to a job (blank if assigned)';

--Initialise all quotes as not assigned
UPDATE quote
SET quote_status = 'N';

--Update quotes that have a related job to assigned
UPDATE quote q
SET quote_status = 'Y'
WHERE EXISTS (
    SELECT 1
    FROM job j
    WHERE j.quote_no = q.quote_no
);

COMMIT;

--Show table structure
DESC quote;

--Show updated data
SELECT quote_no, quote_status, quote_reason
FROM quote;


--4(b)
--Create SERVICE table
-- Create SERVICE table
CREATE TABLE service (
service_no NUMBER PRIMARY KEY,
truck_vin CHAR(17) NOT NULL,
service_start_dt DATE NOT NULL,
service_end_dt DATE,

CONSTRAINT fk_service_truck FOREIGN KEY (truck_vin)
    REFERENCES truck(truck_vin),

CONSTRAINT chk_service_dates 
    CHECK (service_end_dt IS NULL OR service_end_dt >= service_start_dt)

);

-- Column comments for SERVICE
COMMENT ON COLUMN service.service_no IS 'Service number';
COMMENT ON COLUMN service.truck_vin IS 'Truck VIN';
COMMENT ON COLUMN service.service_start_dt IS 'Service start date';
COMMENT ON COLUMN service.service_end_dt IS 'Service end date';

-- Create SERVICE_TASK table
CREATE TABLE service_task (
task_no NUMBER PRIMARY KEY,
service_no NUMBER NOT NULL,
emp_no NUMBER NOT NULL,
task_note VARCHAR2(200) NOT NULL,

CONSTRAINT fk_task_service FOREIGN KEY (service_no)
    REFERENCES service(service_no),

CONSTRAINT fk_task_employee FOREIGN KEY (emp_no)
    REFERENCES employee(emp_no)

);

-- Column comments for SERVICE_TASK
COMMENT ON COLUMN service_task.task_no IS 'Service task number';
COMMENT ON COLUMN service_task.service_no IS 'Service number';
COMMENT ON COLUMN service_task.emp_no IS 'Employee number';
COMMENT ON COLUMN service_task.task_note IS 'Service task note';

-- =========================================
-- Verification
-- =========================================

DESC service;
DESC service_task;

SELECT * FROM service;
SELECT * FROM service_task;

COMMIT;


