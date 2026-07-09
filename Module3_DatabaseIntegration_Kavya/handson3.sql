USE college_db;

-- ==========================================
-- Task 39 : Create Student View
-- ==========================================

CREATE OR REPLACE VIEW student_details AS
SELECT
student_id,
first_name,
last_name,
email,
enrollment_year
FROM students;

SELECT * FROM student_details;


-- ==========================================
-- Task 40 : Create Professor View
-- ==========================================

CREATE OR REPLACE VIEW professor_details AS
SELECT
professor_id,
CONCAT(first_name,' ',last_name) AS professor_name,
salary
FROM professors;

SELECT * FROM professor_details;


-- ==========================================
-- Task 41 : Display Students enrolled after 2022
-- ==========================================

SELECT *
FROM student_details
WHERE enrollment_year > 2022;


-- ==========================================
-- Task 42 : Create Stored Procedure
-- ==========================================

DELIMITER $$

CREATE PROCEDURE GetAllStudents()
BEGIN
SELECT * FROM students;
END $$

DELIMITER ;

CALL GetAllStudents();


-- ==========================================
-- Task 43 : Stored Procedure with Parameter
-- ==========================================

DELIMITER $$

CREATE PROCEDURE GetStudent(IN sid INT)
BEGIN
SELECT *
FROM students
WHERE student_id=sid;
END $$

DELIMITER ;

CALL GetStudent(1);


-- ==========================================
-- Task 44 : Transaction
-- ==========================================

START TRANSACTION;

UPDATE students
SET enrollment_year=2024
WHERE student_id=1;

ROLLBACK;


-- ==========================================
-- Task 45 : Commit Transaction
-- ==========================================

START TRANSACTION;

UPDATE students
SET enrollment_year=2024
WHERE student_id=1;

COMMIT;


-- ==========================================
-- Task 46 : Savepoint
-- ==========================================

START TRANSACTION;

UPDATE students
SET enrollment_year=2025
WHERE student_id=2;

SAVEPOINT sp1;

UPDATE students
SET enrollment_year=2026
WHERE student_id=3;

ROLLBACK TO sp1;

COMMIT;


-- ==========================================
-- Task 47 : Verify Final Data
-- ==========================================

SELECT *
FROM students;