<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

$con = mysqli_connect("localhost:3306", "root", "", "registration");

if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}

// Function to fetch and display students by department
function fetchStudentsByDepartment($con, $department_id) {
    $query = "SELECT students.id, students.fname, students.lname, students.department_id, students.address, students.number, students.email, course.course_name, grades.grade
              FROM students
              LEFT JOIN course ON students.course_id = course.course_id
              LEFT JOIN grades ON students.id = grades.student_id
              WHERE students.department_id='$department_id'";

    $query_run = mysqli_query($con, $query);

    if (mysqli_num_rows($query_run) > 0) {
        displayStudentTable($query_run);
    } else {
        echo "No students found for the selected department.";
    }
}

// Function to fetch and display students by ID or first name
function searchStudents($con, $search_id, $search_fname) {
    $query = "SELECT students.id, students.fname, students.lname, students.department_id, students.number, students.email, course.course_name, grades.grade
              FROM students
              LEFT JOIN course ON students.course_id = course.course_id
              LEFT JOIN grades ON students.id = grades.student_id
              WHERE students.id='$search_id' OR students.fname LIKE '%$search_fname%'";

    $query_run = mysqli_query($con, $query);

    if (mysqli_num_rows($query_run) > 0) {
        displayStudentTable($query_run);
    } else {
        echo "No students found matching the search criteria.";
    }
}

// Function to display student information in a table
function displayStudentTable($query_run) {
    echo "
    <style type='text/css'>
        .tg  {border-collapse:collapse;border-color:#93a1a1;border-spacing:0;}
        .tg td{background-color:#fdf6e3;border-color:#93a1a1;border-style:solid;border-width:1px;color:#002b36;
        font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg th{background-color:#657b83;border-color:#93a1a1;border-style:solid;border-width:1px;color:#fdf6e3;
        font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg .tg-9wq8{border-color:inherit;text-align:center;vertical-align:middle}
        .tg .tg-baqh{text-align:center;vertical-align:top}
        .tg .tg-c3ow{border-color:inherit;text-align:center;vertical-align:top}
    </style>
    <table class='tg'>
        <thead>
            <tr>
                <th class='tg-c3ow'>Student ID</th>
                <th class='tg-c3ow'>First Name</th>
                <th class='tg-c3ow'>Last Name</th>
                <th class='tg-c3ow'>Department</th>
                <th class='tg-c3ow'>Address</th>
                <th class='tg-c3ow'>Phone</th>
                <th class='tg-c3ow'>Email</th>
                <th class='tg-c3ow'>Course Name</th>
                <th class='tg-c3ow'>Grade</th>
                <th class='tg-c3ow'>Enrollment</th>
            </tr>
        </thead>
        <tbody>
    ";

    while ($row = mysqli_fetch_assoc($query_run)) {
        echo "<tr>";
        echo "<td class='tg-0pky'>" . $row['id'] . "</td>";
        echo "<td class='tg-0pky'>" . $row['fname'] . "</td>";
        echo "<td class='tg-0pky'>" . $row['lname'] . "</td>";
        echo "<td class='tg-0pky'>" . $row['department_id'] . "</td>";
        echo "<td class='tg-0pky'>" . (isset($row['address']) ? $row['address'] : '') . "</td>";
        echo "<td class='tg-0pky'>" . $row['number'] . "</td>";
        echo "<td class='tg-0pky'>" . $row['email'] . "</td>";
        echo "<td class='tg-0pky'>" . $row['course_name'] . "</td>";
        echo "<td class='tg-0pky'>" . $row['grade'] . "</td>";
        echo "<td class='tg-0pky'><a href='enrollment_info.php?student_id=" . $row['id'] . "'>Enrollment</a></td>";
        echo "</tr>";
    }

    echo "</tbody></table>";
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Student Information</title>
    <link rel="stylesheet" href="style2.css">
</head>
<body>
    <h1>View Student Information</h1>
    <h2>Please select department or enter search criteria.</h2>

    <!-- Button for each department -->
    <button onclick="location.href='view_std_info.php?department=BA'">Business Administration</button>
    <button onclick="location.href='view_std_info.php?department=CE'">Civil Engineering</button>
    <button onclick="location.href='view_std_info.php?department=CS'">Computer Science</button>
    <button onclick="location.href='view_std_info.php?department=EE'">Electrical Engineering</button>
    <button onclick="location.href='view_std_info.php?department=ME'">Mechanical Engineering</button>
    <hr>

    <!-- Search form for student ID and first name -->
    <form action="view_std_info.php" method="GET">
        <label for="inp_search_id">Search by ID:</label>
        <input type="text" name="inp_search_id" id="inp_search_id" placeholder="Student ID">
        <button type="submit">Search</button>
        <hr>
        <label for="inp_search_fname">Search by First Name:</label>
        <input type="text" name="inp_search_fname" id="inp_search_fname" placeholder="First Name">
        <button type="submit">Search</button>
    </form>

    <?php
    if (isset($_GET['department'])) {
        // Fetch students by department
        $department_id = $_GET['department'];
        fetchStudentsByDepartment($con, $department_id);
    } elseif (isset($_GET['inp_search_id']) || isset($_GET['inp_search_fname'])) {
        // Search for students by ID or first name
        $search_id = $_GET['inp_search_id'];
        $search_fname = $_GET['inp_search_fname'];
        searchStudents($con, $search_id, $search_fname);
    } else {
        echo "Please select a department or enter search criteria.";
    }
    ?>
</body>
</html>
