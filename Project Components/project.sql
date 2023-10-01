-- Create a new database
CREATE DATABASE IF NOT EXISTS registration;

-- Use the newly created database
USE registration;

-- Create a table to store student information
CREATE TABLE IF NOT EXISTS students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    number VARCHAR(15) NOT NULL,
    course_id INT,
    department_id VARCHAR(2),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE IF NOT EXISTS course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    department_id VARCHAR(2),
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE IF NOT EXISTS department (
    department_id VARCHAR(2) PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS grades (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade FLOAT,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE IF NOT EXISTS enrollment (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

INSERT INTO department (department_id, department_name)
VALUES
    ('CS', 'Computer Science'),
    ('ME', 'Mechanical Engineering'),
    ('EE', 'Electrical Engineering'),
    ('CE', 'Civil Engineering'),
    ('BA', 'Business Administration');

INSERT INTO course (course_name, department_id)
VALUES
    ('Introduction to Programming', 'CS'),
    ('Database Management', 'CS'),
    ('Mechanics of Materials', 'ME'),
    ('Electromagnetic Fields', 'EE'),
    ('Marketing Management', 'BA');

INSERT INTO students (fname, lname, email, address, number, course_id, department_id)
VALUES
    ('John', 'Doe', 'johndoe@example.com', '123 Main St', '123-456-7890', 1, 'CS'),
    ('Jane', 'Smith', 'janesmith@example.com', '456 Elm St', '987-654-3210', 2, 'CS'),
    ('Alice', 'Johnson', 'alicejohnson@example.com', '789 Oak St', '555-123-4567', 3, 'ME'),
    ('Bob', 'Williams', 'bobwilliams@example.com', '321 Pine St', '777-888-9999', 4, 'EE'),
    ('Eva', 'Brown', 'evabrown@example.com', '555 Cedar St', '111-222-3333', 5, 'BA');

-- Assuming student_id and course_id correspond to existing records in the students and course tables
INSERT INTO grades (student_id, course_id, grade)
VALUES
    (1, 1, 95),
    (2, 1, 88),
    (3, 3, 92),
    (4, 4, 89),
    (5, 5, 78);

-- Assuming student_id and course_id correspond to existing records in the students and course tables
INSERT INTO enrollment (student_id, course_id, enrollment_date)
VALUES
    (1, 1, '2023-01-15'),
    (2, 1, '2023-01-20'),
    (3, 3, '2023-02-10'),
    (4, 4, '2023-02-15'),
    (5, 5, '2023-03-01');


-- queries used in PHP scripts
INSERT INTO enrollment (student_id, course_id, enrollment_date) VALUES (LAST_INSERT_ID(), ?, ?);

insert into students(fname,lname,email,department,address,number, course_id)values(?, ?, ?, ?, ?, ?, ?);

// Query to fetch student information including department and course details
    $query = "SELECT students.id, students.fname, students.lname, students.department, students.address, students.number, students.email, course.course_name, grades.grade 
              FROM students 
              LEFT JOIN course ON students.course_id = course.course_id
              LEFT JOIN grades ON students.id = grades.student_id
              WHERE students.id='$inp_search_id'";

// Query used to edit records              
$query = "SELECT students.id, students.fname, students.lname, students.department, students.address, students.number, students.email, course.course_name, grades.grade 
                  FROM students 
                  LEFT JOIN course ON students.course_id = course.course_id
                  LEFT JOIN grades ON students.id = grades.student_id
                  WHERE students.id='$input_id_var' ";
//  Update Queries
$update_query = "UPDATE students SET department_id = '$new_department_id' WHERE id = $student_id";
$sql = "UPDATE students SET fname = '$fname', lname = '$lname', email = '$email', department_id = '$department_id', address = '$address', number = '$number' WHERE id = $id";
$query = "SELECT * FROM students WHERE id='$input_id_var' ";

// used in inserting records
("INSERT INTO students (fname, lname, email, department_id, address, number, course_id) VALUES (?, ?, ?, ?, ?, ?, ?)");
("INSERT INTO enrollment (student_id, course_id, enrollment_date) VALUES (LAST_INSERT_ID(), ?, ?)");
 
 // Query to fetch enrollment information for the selected student
    $query = "SELECT enrollment.enrollment_id, enrollment.course_id, course.course_name, enrollment.enrollment_date
              FROM enrollment
              LEFT JOIN course ON enrollment.course_id = course.course_id
              WHERE enrollment.student_id='$student_id'";

// Function to fetch and display students by department
function fetchStudentsByDepartment($con, $department_id) 
    $query = "SELECT students.id, students.fname, students.lname, students.department_id, students.address, students.number, students.email, course.course_name, grades.grade
              FROM students
              LEFT JOIN course ON students.course_id = course.course_id
              LEFT JOIN grades ON students.id = grades.student_id
              WHERE students.department_id='$department_id'";

// Function to fetch and display students by ID or first name
function searchStudents($con, $search_id, $search_fname) 
    $query = "SELECT students.id, students.fname, students.lname, students.department_id, students.number, students.email, course.course_name, grades.grade
              FROM students
              LEFT JOIN course ON students.course_id = course.course_id
              LEFT JOIN grades ON students.id = grades.student_id
              WHERE students.id='$search_id' OR students.fname LIKE '%$search_fname%'";