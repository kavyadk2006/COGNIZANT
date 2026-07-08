-- ============================================
-- Hands-On 1
-- Schema Design & Core SQL
-- Database: college_db
-- ============================================

-- Create Database
CREATE DATABASE IF NOT EXISTS college_db;

-- Select Database
USE college_db;

-- ==========================
-- Table: Departments
-- ==========================
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

-- ==========================
-- Table: Students
-- ==========================
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE,
    department_id INT NOT NULL,

    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);

-- ==========================
-- Table: Courses
-- ==========================
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    department_id INT NOT NULL,

    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);

-- ==========================
-- Table: Professors
-- ==========================
CREATE TABLE professors (
    professor_id INT AUTO_INCREMENT PRIMARY KEY,
    professor_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department_id INT NOT NULL,

    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);

-- ==========================
-- Table: Enrollments
-- ==========================
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE,

    FOREIGN KEY (student_id)
    REFERENCES students(student_id),

    FOREIGN KEY (course_id)
    REFERENCES courses(course_id)
);

-- ==========================================================
-- TASK 2: NORMALISATION ANALYSIS
-- ==========================================================

-- 1NF (First Normal Form)
-- All tables contain atomic (single) values in each column.
-- Example violation: storing multiple phone numbers like
-- '9876543210,9123456789' in one phone_number field.

-- 2NF (Second Normal Form)
-- All non-key attributes are fully dependent on the primary key.
-- In the enrollments table, student_id and course_id uniquely
-- identify each enrollment, and enrollment_date depends on the
-- complete enrollment record.

-- 3NF (Third Normal Form)
-- No transitive dependencies exist in the schema.
-- Department details are stored only in the departments table.
-- Storing dept_name inside students would violate 3NF because
-- dept_name depends on department_id, not directly on student_id.

-- 3NF Analysis for Enrollments Table
-- The enrollments table contains only enrollment-specific data.
-- It references students and courses through foreign keys.
-- No department or student details are stored here.
-- Therefore, there are no transitive dependencies.
-- The enrollments table satisfies Third Normal Form (3NF).

-- ==========================================================
-- TASK 3: ALTER TABLE
-- ==========================================================

-- Step 10
ALTER TABLE students
ADD phone_number VARCHAR(15);

-- Step 11
ALTER TABLE courses
ADD max_seats INT DEFAULT 60;

-- Step 12
ALTER TABLE enrollments
ADD CONSTRAINT chk_grade
CHECK (grade IN ('A','B','C','D','F') OR grade IS NULL);

-- Step 13
ALTER TABLE departments
RENAME COLUMN hod_name TO head_of_dept;

-- Step 14
ALTER TABLE students
DROP COLUMN phone_number;