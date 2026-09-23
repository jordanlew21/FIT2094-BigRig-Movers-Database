-- Name: Jordan Lew

--T4-brm-mods.sql

--
--4(a)
-- BRM needs to track whether each quote has been
-- converted into a scheduled job and record a reason
-- when a quote remains unassigned.

--Add new columns
-- Add attributes to store the quote assignment status
-- and the reason a quote was not converted to a job.

ALTER TABLE quote
ADD (
    quote_status CHAR(1),
    quote_reason VARCHAR2(200)
);

--Add column comments
-- Document the purpose of the new attributes within
-- the Oracle database for easier schema maintenance.

COMMENT ON COLUMN quote.quote_status IS
'Status of quote: Y if assigned to a job, N if not assigned';

COMMENT ON COLUMN quote.quote_reason IS
'Reason why quote not converted to a job (blank if assigned)';

--Initialise all quotes as not assigned
-- Initialise existing quotes as unassigned before
-- checking their current relationship with the job table.

UPDATE quote
SET quote_status = 'N';

--Update quotes that have a related job to assigned
-- Identify quotes that already have a related job and
-- update their status to show that they have been assigned.

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
-- BRM needs to record regular truck servicing,
-- including service start/end times and the
-- individual maintenance tasks performed.

--Create SERVICE table
-- Create SERVICE table

-- Store each truck service event and its start
-- and end times, while linking it to the truck.
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

-- Document the purpose of each service attribute
-- within the database for easier maintenance.
COMMENT ON COLUMN service.service_no IS 'Service number';
COMMENT ON COLUMN service.truck_vin IS 'Truck VIN';
COMMENT ON COLUMN service.service_start_dt IS 'Service start date';
COMMENT ON COLUMN service.service_end_dt IS 'Service end date';

-- Create SERVICE_TASK table

-- Store individual maintenance tasks within a service.
-- Each task records the mechanic responsible and
-- a free-text note describing the work performed.
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

-- Document the purpose of each task attribute and
-- its relationship with the service and employee tables.
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


