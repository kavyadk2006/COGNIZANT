from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, joinedload
from models import Student, Course, Enrollment

# -------------------------------
# Database Connection
# -------------------------------
engine = create_engine(
    "mysql+mysqlconnector://root:Kavya2006@localhost/college_db",
    echo=True
)

Session = sessionmaker(bind=engine)
session = Session()

# --------------------------------
# TASK 83 - READ Students
# --------------------------------
print("\n----- Students -----")

students = session.query(Student).all()

for s in students:
    print(
        s.student_id,
        s.first_name,
        s.last_name,
        s.email,
        s.enrollment_year
    )

# --------------------------------
# TASK 84 - READ Enrollments
# --------------------------------
print("\n----- Enrollments -----")

enrollments = session.query(Enrollment).all()

for e in enrollments:
    print(
        e.student.first_name,
        e.course.course_name,
        e.grade
    )

# --------------------------------
# TASK 85 - UPDATE
# --------------------------------
print("\n----- Update Student -----")

student = session.query(Student).filter_by(student_id=1).first()

if student:
    student.enrollment_year = 2024
    session.commit()
    print("Student Updated Successfully")
else:
    print("Student Not Found")

# --------------------------------
# TASK 86 - DELETE
# --------------------------------
print("\n----- Delete Enrollment -----")

enrollment = session.query(Enrollment).filter_by(enrollment_id=1).first()

if enrollment:
    session.delete(enrollment)
    session.commit()
    print("Enrollment Deleted")
else:
    print("Enrollment Already Deleted")

# --------------------------------
# TASK 88 - joinedload (Fix N+1)
# --------------------------------
print("\n----- joinedload -----")

records = session.query(Enrollment).options(
    joinedload(Enrollment.student),
    joinedload(Enrollment.course)
).all()

for r in records:
    print(
        r.student.first_name,
        r.course.course_name,
        r.grade
    )

print("\nN+1 Problem Fixed using joinedload")
print("Queries reduced from many to one.")

session.close()