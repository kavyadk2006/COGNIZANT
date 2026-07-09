USE college_db;

-- ==========================
-- STEP 15
-- Insert into Departments
-- ==========================

INSERT INTO departments
(department_name, head_of_dept, budget)
VALUES
('Computer Science','Dr. Ramesh Kumar',850000),
('Electronics','Dr. Priya Nair',620000),
('Mechanical','Dr. Suresh Iyer',540000),
('Civil','Dr. Ananya Sharma',430000);

-- ==========================
-- Insert into Professors
-- ==========================

INSERT INTO professors
(first_name,last_name,department_id,salary)
VALUES
('Anand','Krishnan',1,95000),
('Meera','Nair',2,90000),
('Vikram','Singh',3,85000),
('Priya','Rao',4,78000);

-- ==========================
-- Insert into Courses
-- ==========================

INSERT INTO courses
(course_name,department_id,credits,professor_id)
VALUES
('Database Systems',1,4,1),
('Operating Systems',1,4,1),
('Computer Networks',1,3,1),
('Digital Electronics',2,4,2),
('Machine Design',3,4,3);

-- ==========================
-- Insert into Students
-- ==========================

INSERT INTO students
(first_name,last_name,email,enrollment_year,phone_number)
VALUES
('John','Doe','john.doe@college.edu',2022,'9876543210'),
('Jane','Smith','jane.smith@college.edu',2023,'9876543211'),
('Rahul','Verma','rahul.verma@college.edu',2022,'9876543212'),
('Aisha','Khan','aisha.khan@college.edu',2021,'9876543213'),
('Rohit','Sharma','rohit.sharma@college.edu',2022,'9876543214'),
('Sneha','Iyer','sneha.iyer@college.edu',2023,'9876543215'),
('Kavya','DK','kavya.dk@college.edu',2023,'9876543216'),
('Arun','Kumar','arun.kumar@college.edu',2022,'9876543217');

-- ==========================
-- Insert into Enrollments
-- ==========================

INSERT INTO enrollments
(student_id,course_id,grade)
VALUES
(1,1,'A'),
(2,2,'B'),
(3,3,NULL),
(4,1,'B'),
(5,1,'C'),
(6,4,'A'),
(7,2,NULL),
(8,5,'B');