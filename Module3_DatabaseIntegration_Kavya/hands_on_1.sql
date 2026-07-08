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