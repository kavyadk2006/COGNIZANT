from sqlalchemy import create_engine, Column, Integer, String, ForeignKey
from sqlalchemy.orm import declarative_base, relationship

Base = declarative_base()

engine = create_engine(
    "mysql+mysqlconnector://root:Kavya2006@localhost/college_db",
    echo=True
)

# -----------------------------
# Department
# -----------------------------
class Department(Base):
    __tablename__ = "departments"

    department_id = Column(Integer, primary_key=True)
    department_name = Column(String(100))
    head_of_dept = Column(String(100))
    budget = Column(Integer)

    professors = relationship("Professor", back_populates="department")
    courses = relationship("Course", back_populates="department")


# -----------------------------
# Student
# -----------------------------
class Student(Base):
    __tablename__ = "students"

    student_id = Column(Integer, primary_key=True)
    first_name = Column(String(50))
    last_name = Column(String(50))
    email = Column(String(100))
    enrollment_year = Column(Integer)
    phone_number = Column(String(15))

    enrollments = relationship("Enrollment", back_populates="student")


# -----------------------------
# Professor
# -----------------------------
class Professor(Base):
    __tablename__ = "professors"

    professor_id = Column(Integer, primary_key=True)
    first_name = Column(String(50))
    last_name = Column(String(50))
    department_id = Column(Integer, ForeignKey("departments.department_id"))
    salary = Column(Integer)

    department = relationship("Department", back_populates="professors")
    courses = relationship("Course", back_populates="professor")


# -----------------------------
# Course
# -----------------------------
class Course(Base):
    __tablename__ = "courses"

    course_id = Column(Integer, primary_key=True)
    course_name = Column(String(100))
    department_id = Column(Integer, ForeignKey("departments.department_id"))
    credits = Column(Integer)
    professor_id = Column(Integer, ForeignKey("professors.professor_id"))
    max_seats = Column(Integer)

    department = relationship("Department", back_populates="courses")
    professor = relationship("Professor", back_populates="courses")
    enrollments = relationship("Enrollment", back_populates="course")


# -----------------------------
# Enrollment
# -----------------------------
class Enrollment(Base):
    __tablename__ = "enrollments"

    enrollment_id = Column(Integer, primary_key=True)
    student_id = Column(Integer, ForeignKey("students.student_id"))
    course_id = Column(Integer, ForeignKey("courses.course_id"))
    grade = Column(String(2))

    student = relationship("Student", back_populates="enrollments")
    course = relationship("Course", back_populates="enrollments")


Base.metadata.create_all(engine)

print("All ORM Models Created Successfully!")