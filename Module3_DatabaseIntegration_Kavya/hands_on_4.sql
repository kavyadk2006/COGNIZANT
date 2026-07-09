import mysql.connector
import time

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Kavya2006",
    database="college_db"
)

cursor = conn.cursor()

# ----------------------------
# Version 1 : N+1 Problem
# ----------------------------
start = time.time()

cursor.execute("SELECT * FROM enrollments")
enrollments = cursor.fetchall()

count = 1

for row in enrollments:
    cursor.execute(
        "SELECT first_name,last_name FROM students WHERE student_id=%s",
        (row[1],)
    )
    cursor.fetchone()
    count += 1

end = time.time()

print("Version 1 (N+1)")
print("Queries executed:", count)
print("Time:", end-start)

# ----------------------------
# Version 2 : Single JOIN
# ----------------------------

start = time.time()

cursor.execute("""
SELECT
e.enrollment_id,
s.first_name,
s.last_name,
c.course_name,
e.grade
FROM enrollments e
JOIN students s
ON e.student_id=s.student_id
JOIN courses c
ON e.course_id=c.course_id;
""")

cursor.fetchall()

end = time.time()

print("\nVersion 2 (JOIN)")
print("Queries executed: 1")
print("Time:", end-start)

cursor.close()
conn.close()