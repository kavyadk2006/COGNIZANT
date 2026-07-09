USE college_db;

-- =====================================================
-- HANDS-ON 3
-- Task 1 : Subqueries
-- =====================================================

-- 35. Students enrolled in more courses than average

SELECT s.student_id,
       s.first_name,
       s.last_name,
       COUNT(e.course_id) AS total_courses
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id
GROUP BY s.student_id, s.first_name, s.last_name
HAVING COUNT(e.course_id) >
(
    SELECT AVG(course_count)
    FROM
    (
        SELECT COUNT(course_id) AS course_count
        FROM enrollments
        GROUP BY student_id
    ) avg_table
);

-- =====================================================

-- 36. Courses where every enrolled student scored A

SELECT c.course_id,
       c.course_name
FROM courses c
WHERE NOT EXISTS
(
    SELECT *
    FROM enrollments e
    WHERE e.course_id = c.course_id
    AND e.grade <> 'A'
);

-- =====================================================

SELECT
professor_id,
CONCAT(first_name,' ',last_name) AS professor_name,
salary,
department_id
FROM professors
WHERE salary =
(
SELECT MAX(salary)
FROM professors p2
WHERE p2.department_id = professors.department_id
);

-- =====================================================

-- 38. Departments whose average professor salary
-- exceeds 85000

SELECT *
FROM
(
    SELECT d.department_id,
           d.dept_name,
           AVG(p.salary) AS average_salary
    FROM departments d
    JOIN professors p
    ON d.department_id = p.department_id
    GROUP BY d.department_id,d.dept_name
) dept_avg
WHERE average_salary > 85000;

-- =====================================================
-- Task 2 : Views
-- =====================================================

-- 39. Student Enrollment Summary View

CREATE VIEW vw_student_enrollment_summary AS
SELECT
s.student_id,
CONCAT(s.first_name,' ',s.last_name) AS student_name,
d.dept_name,
COUNT(e.course_id) AS total_courses,

ROUND(
AVG(
CASE
WHEN e.grade='A' THEN 4
WHEN e.grade='B' THEN 3
WHEN e.grade='C' THEN 2
WHEN e.grade='D' THEN 1
ELSE 0
END
),2) AS GPA

FROM students s
JOIN departments d
ON s.department_id=d.department_id
LEFT JOIN enrollments e
ON s.student_id=e.student_id
GROUP BY
s.student_id,
student_name,
d.dept_name;

-- =====================================================

-- 40. Course Statistics View

CREATE VIEW vw_course_stats AS
SELECT
c.course_name,
c.course_code,

COUNT(e.student_id) AS total_enrollments,

ROUND(
AVG(
CASE
WHEN e.grade='A' THEN 4
WHEN e.grade='B' THEN 3
WHEN e.grade='C' THEN 2
WHEN e.grade='D' THEN 1
ELSE 0
END
),2) AS avg_gpa

FROM courses c
LEFT JOIN enrollments e
ON c.course_id=e.course_id

GROUP BY
c.course_id,
c.course_name,
c.course_code;

-- =====================================================

-- 41. Students with GPA above 3

SELECT *
FROM vw_student_enrollment_summary
WHERE GPA > 3.0;

-- =====================================================