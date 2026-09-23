-- Name: Jordan Lew

/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-brm-insert.sql

--
/*
Indicate if AI was used (Yes/No): Yes
If AI was used:
I used ChatGPT (OpenAI)
Prompt: "Generate SQL insert statements for EMPLOYEE, QUOTE, and JOB tables following assignment constraints"
*/

-- Generate representative employee data covering multiple roles and
-- reporting relationships, including managers, truck dispatchers,
-- mechanics and drivers.
--------------------------------------
-- EMPLOYEE (10 rows)
--------------------------------------

INSERT INTO employee VALUES (1, 'John', 'Smith', '0411111111', NULL, 'B', NULL);
INSERT INTO employee VALUES (2, 'Sarah', 'Jones', '0411111112', NULL, 'B', NULL);

INSERT INTO employee VALUES (3, 'Tom', 'Brown', '0411111113', NULL, 'T', 1);
INSERT INTO employee VALUES (4, 'Emily', 'White', '0411111114', NULL, 'T', 2);

INSERT INTO employee VALUES (5, 'Luke', 'Green', '0411111115', NULL, 'M', 1);

INSERT INTO employee VALUES (6, 'Noah', 'Black', '0411111116', 'LIC123456', 'D', 3);
INSERT INTO employee VALUES (7, 'Liam', 'Gray', '0411111117', 'LIC543210', 'D', 4);

INSERT INTO employee VALUES (8, 'Olivia', 'Taylor', '0411111118', NULL, 'M', 2);
INSERT INTO employee VALUES (9, 'Mason', 'Wilson', '0411111119', 'LIC778811', 'D', 3);
INSERT INTO employee VALUES (10, 'Ava', 'Martin', '0411111120', 'LIC889922', 'D', 4);

INSERT INTO employee VALUES (11, 'Sarah', 'Mitchell', '0411222233', NULL, 'B', NULL);
INSERT INTO employee VALUES (12, 'Michael', 'Johnson', '0411333344', 'LIC11223', 'D', 3);
--------------------------------------
-- Create quote data across multiple customers and dispatchers.
-- Repeated customers and varied quote values provide data for
-- testing customer-level aggregation and comparison queries.

-- QUOTE (30 rows)
--------------------------------------

-- Customer 1 & 2 repeat to satisfy requirement
INSERT INTO quote VALUES (1, TO_DATE('05-May-2026','dd-Mon-yyyy'), TO_DATE('10-May-2026','dd-Mon-yyyy'),'Melbourne','Sydney',1200,1,3);
INSERT INTO quote VALUES (2, TO_DATE('06-May-2026','dd-Mon-yyyy'), TO_DATE('11-May-2026','dd-Mon-yyyy'),'Perth','Adelaide',900,2,3);
INSERT INTO quote VALUES (3, TO_DATE('07-May-2026','dd-Mon-yyyy'), TO_DATE('12-May-2026','dd-Mon-yyyy'),'Brisbane','Melbourne',1500,1,4);
INSERT INTO quote VALUES (4, TO_DATE('08-May-2026','dd-Mon-yyyy'), TO_DATE('13-May-2026','dd-Mon-yyyy'),'Sydney','Perth',2000,2,4);
INSERT INTO quote VALUES (5, TO_DATE('09-May-2026','dd-Mon-yyyy'), TO_DATE('14-May-2026','dd-Mon-yyyy'),'Adelaide','Sydney',1100,3,3);

INSERT INTO quote VALUES (6, TO_DATE('10-May-2026','dd-Mon-yyyy'), TO_DATE('15-May-2026','dd-Mon-yyyy'),'Melbourne','Brisbane',1300,4,3);
INSERT INTO quote VALUES (7, TO_DATE('11-May-2026','dd-Mon-yyyy'), TO_DATE('16-May-2026','dd-Mon-yyyy'),'Perth','Sydney',1700,5,4);
INSERT INTO quote VALUES (8, TO_DATE('12-May-2026','dd-Mon-yyyy'), TO_DATE('17-May-2026','dd-Mon-yyyy'),'Sydney','Melbourne',1400,1,3);
INSERT INTO quote VALUES (9, TO_DATE('13-May-2026','dd-Mon-yyyy'), TO_DATE('18-May-2026','dd-Mon-yyyy'),'Brisbane','Perth',1600,2,4);
INSERT INTO quote VALUES (10, TO_DATE('14-May-2026','dd-Mon-yyyy'), TO_DATE('19-May-2026','dd-Mon-yyyy'),'Adelaide','Melbourne',1000,3,3);

INSERT INTO quote VALUES (11, TO_DATE('15-May-2026','dd-Mon-yyyy'), TO_DATE('20-May-2026','dd-Mon-yyyy'),'Melbourne','Sydney',1200,4,3);
INSERT INTO quote VALUES (12, TO_DATE('16-May-2026','dd-Mon-yyyy'), TO_DATE('21-May-2026','dd-Mon-yyyy'),'Perth','Adelaide',900,5,4);
INSERT INTO quote VALUES (13, TO_DATE('17-May-2026','dd-Mon-yyyy'), TO_DATE('22-May-2026','dd-Mon-yyyy'),'Sydney','Brisbane',1300,1,3);
INSERT INTO quote VALUES (14, TO_DATE('18-May-2026','dd-Mon-yyyy'), TO_DATE('23-May-2026','dd-Mon-yyyy'),'Melbourne','Perth',1800,2,4);
INSERT INTO quote VALUES (15, TO_DATE('19-May-2026','dd-Mon-yyyy'), TO_DATE('24-May-2026','dd-Mon-yyyy'),'Brisbane','Sydney',1500,3,3);

INSERT INTO quote VALUES (16, TO_DATE('20-May-2026','dd-Mon-yyyy'), TO_DATE('25-May-2026','dd-Mon-yyyy'),'Adelaide','Brisbane',1100,4,3);
INSERT INTO quote VALUES (17, TO_DATE('21-May-2026','dd-Mon-yyyy'), TO_DATE('26-May-2026','dd-Mon-yyyy'),'Sydney','Melbourne',1400,5,4);
INSERT INTO quote VALUES (18, TO_DATE('22-May-2026','dd-Mon-yyyy'), TO_DATE('27-May-2026','dd-Mon-yyyy'),'Perth','Sydney',1700,1,3);
INSERT INTO quote VALUES (19, TO_DATE('23-May-2026','dd-Mon-yyyy'), TO_DATE('28-May-2026','dd-Mon-yyyy'),'Melbourne','Adelaide',1000,2,4);
INSERT INTO quote VALUES (20, TO_DATE('24-May-2026','dd-Mon-yyyy'), TO_DATE('29-May-2026','dd-Mon-yyyy'),'Brisbane','Perth',1600,3,3);

INSERT INTO quote VALUES (21, TO_DATE('25-May-2026','dd-Mon-yyyy'), TO_DATE('30-May-2026','dd-Mon-yyyy'),'Sydney','Brisbane',1300,6,3);
INSERT INTO quote VALUES (22, TO_DATE('26-May-2026','dd-Mon-yyyy'), TO_DATE('31-May-2026','dd-Mon-yyyy'),'Perth','Melbourne',1800,7,4);
INSERT INTO quote VALUES (23, TO_DATE('27-May-2026','dd-Mon-yyyy'), TO_DATE('01-Jun-2026','dd-Mon-yyyy'),'Adelaide','Sydney',1100,8,3);
INSERT INTO quote VALUES (24, TO_DATE('28-May-2026','dd-Mon-yyyy'), TO_DATE('02-Jun-2026','dd-Mon-yyyy'),'Melbourne','Brisbane',1200,9,4);
INSERT INTO quote VALUES (25, TO_DATE('29-May-2026','dd-Mon-yyyy'), TO_DATE('03-Jun-2026','dd-Mon-yyyy'),'Sydney','Perth',2000,10,3);

INSERT INTO quote VALUES (26, TO_DATE('30-May-2026','dd-Mon-yyyy'), TO_DATE('04-Jun-2026','dd-Mon-yyyy'),'Brisbane','Melbourne',1500,6,3);
INSERT INTO quote VALUES (27, TO_DATE('01-Jun-2026','dd-Mon-yyyy'), TO_DATE('05-Jun-2026','dd-Mon-yyyy'),'Perth','Sydney',1700,7,4);
INSERT INTO quote VALUES (28, TO_DATE('02-Jun-2026','dd-Mon-yyyy'), TO_DATE('06-Jun-2026','dd-Mon-yyyy'),'Melbourne','Perth',1800,8,3);
INSERT INTO quote VALUES (29, TO_DATE('03-Jun-2026','dd-Mon-yyyy'), TO_DATE('07-Jun-2026','dd-Mon-yyyy'),'Sydney','Brisbane',1300,9,4);
INSERT INTO quote VALUES (30, TO_DATE('04-Jun-2026','dd-Mon-yyyy'), TO_DATE('08-Jun-2026','dd-Mon-yyyy'),'Adelaide','Melbourne',1000,10,3);

--------------------------------------
-- Create scheduled job data linking quotes to drivers,
-- truck/trailer combinations and dispatchers.
-- The dataset includes repeated combinations and varied job
-- costs to test relationships, aggregation and business rules.

-- JOB (20 rows)
--------------------------------------

-- 10 combinations reused properly across jobs

INSERT INTO job VALUES (1, TO_DATE('05-May-2026 08:00','dd-Mon-yyyy hh24:mi'), TO_DATE('06-May-2026 12:00','dd-Mon-yyyy hh24:mi'),1200,'Y',1,3,6,'TRL01','1HGBH41JXMN109186');
INSERT INTO job VALUES (2, TO_DATE('06-May-2026 09:00','dd-Mon-yyyy hh24:mi'), TO_DATE('07-May-2026 13:00','dd-Mon-yyyy hh24:mi'),900,'Y',2,3,7,'TRL02','2FMDK3GC8BBA12345');
INSERT INTO job VALUES (3, TO_DATE('07-May-2026 10:00','dd-Mon-yyyy hh24:mi'), TO_DATE('08-May-2026 14:00','dd-Mon-yyyy hh24:mi'),1500,'N',3,4,9,'TRL03','3VWFE21C04M000001');
INSERT INTO job VALUES (4, TO_DATE('08-May-2026 11:00','dd-Mon-yyyy hh24:mi'), TO_DATE('09-May-2026 15:00','dd-Mon-yyyy hh24:mi'),2000,'Y',4,4,10,'TRL04','4T1BF1FK5CU123456');
INSERT INTO job VALUES (5, TO_DATE('09-May-2026 12:00','dd-Mon-yyyy hh24:mi'), TO_DATE('10-May-2026 16:00','dd-Mon-yyyy hh24:mi'),1100,'N',5,3,6,'TRL05','5FNRL5H40BB098765');
INSERT INTO job VALUES (6, TO_DATE('10-May-2026 08:00','dd-Mon-yyyy hh24:mi'), TO_DATE('11-May-2026 12:00','dd-Mon-yyyy hh24:mi'),1300,'Y',6,3,7,'TRL06','1FTFW1ET5DFC10112');
INSERT INTO job VALUES (7, TO_DATE('11-May-2026 09:00','dd-Mon-yyyy hh24:mi'), TO_DATE('12-May-2026 13:00','dd-Mon-yyyy hh24:mi'),1700,'Y',7,4,9,'TRL07','2C4RDGCG8ER123789');
INSERT INTO job VALUES (8, TO_DATE('12-May-2026 10:00','dd-Mon-yyyy hh24:mi'), TO_DATE('13-May-2026 14:00','dd-Mon-yyyy hh24:mi'),1400,'N',8,3,10,'TRL08','5XYKT3A69CG234567');
INSERT INTO job VALUES (9, TO_DATE('13-May-2026 11:00','dd-Mon-yyyy hh24:mi'), TO_DATE('14-May-2026 15:00','dd-Mon-yyyy hh24:mi'),1600,'Y',9,4,6,'TRL05','1HGBH41JXMN109186');
INSERT INTO job VALUES (10, TO_DATE('14-May-2026 12:00','dd-Mon-yyyy hh24:mi'), TO_DATE('15-May-2026 16:00','dd-Mon-yyyy hh24:mi'),1000,'N',10,3,7,'TRL08','2FMDK3GC8BBA12345');

INSERT INTO job VALUES (11, TO_DATE('15-May-2026 08:00','dd-Mon-yyyy hh24:mi'), TO_DATE('16-May-2026 12:00','dd-Mon-yyyy hh24:mi'),1200,'Y',11,3,9,'TRL01','3VWFE21C04M000001');
INSERT INTO job VALUES (12, TO_DATE('16-May-2026 09:00','dd-Mon-yyyy hh24:mi'), TO_DATE('17-May-2026 13:00','dd-Mon-yyyy hh24:mi'),900,'Y',12,4,10,'TRL02','4T1BF1FK5CU123456');
INSERT INTO job VALUES (13, TO_DATE('17-May-2026 10:00','dd-Mon-yyyy hh24:mi'), TO_DATE('18-May-2026 14:00','dd-Mon-yyyy hh24:mi'),1300,'N',13,3,6,'TRL03','5FNRL5H40BB098765');
INSERT INTO job VALUES (14, TO_DATE('18-May-2026 11:00','dd-Mon-yyyy hh24:mi'), TO_DATE('19-May-2026 15:00','dd-Mon-yyyy hh24:mi'),1800,'Y',14,4,7,'TRL04','1FTFW1ET5DFC10112');
INSERT INTO job VALUES (15, TO_DATE('19-May-2026 12:00','dd-Mon-yyyy hh24:mi'), TO_DATE('20-May-2026 16:00','dd-Mon-yyyy hh24:mi'),1500,'N',15,3,9,'TRL05','2C4RDGCG8ER123789');

INSERT INTO job VALUES (16, TO_DATE('20-May-2026 08:00','dd-Mon-yyyy hh24:mi'), TO_DATE('21-May-2026 12:00','dd-Mon-yyyy hh24:mi'),1100,'Y',16,3,10,'TRL06','5XYKT3A69CG234567');
INSERT INTO job VALUES (17, TO_DATE('21-May-2026 09:00','dd-Mon-yyyy hh24:mi'), TO_DATE('22-May-2026 13:00','dd-Mon-yyyy hh24:mi'),1400,'Y',17,4,6,'TRL07','1HGBH41JXMN109186');
INSERT INTO job VALUES (18, TO_DATE('22-May-2026 10:00','dd-Mon-yyyy hh24:mi'), TO_DATE('23-May-2026 14:00','dd-Mon-yyyy hh24:mi'),1700,'N',18,3,7,'TRL08','2FMDK3GC8BBA12345');
INSERT INTO job VALUES (19, TO_DATE('23-May-2026 11:00','dd-Mon-yyyy hh24:mi'), TO_DATE('24-May-2026 15:00','dd-Mon-yyyy hh24:mi'),1000,'Y',19,4,9,'TRL01','3VWFE21C04M000001');
INSERT INTO job VALUES (20, TO_DATE('24-May-2026 12:00','dd-Mon-yyyy hh24:mi'), TO_DATE('25-May-2026 16:00','dd-Mon-yyyy hh24:mi'),1600,'Y',20,3,10,'TRL02','4T1BF1FK5CU123456');

COMMIT;


