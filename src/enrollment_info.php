<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

$con = mysqli_connect("localhost:3306", "root", "", "registration");

if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}

if (isset($_GET['student_id'])) {
    $student_id = $_GET['student_id'];

    // Query to fetch enrollment information for the selected student
    $query = "SELECT enrollment.enrollment_id, enrollment.course_id, course.course_name, enrollment.enrollment_date
              FROM enrollment
              LEFT JOIN course ON enrollment.course_id = course.course_id
              WHERE enrollment.student_id='$student_id'";
    
    $query_run = mysqli_query($con, $query);

    if (mysqli_num_rows($query_run) > 0) {
        ?>
        <h1>Enrollment Information for Student ID: <?php echo $student_id; ?></h1>
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
                    <th class='tg-c3ow'>Enrollment ID</th>
                    <th class='tg-c3ow'>Course ID</th>
                    <th class='tg-c3ow'>Course Name</th>
                    <th class='tg-c3ow'>Enrollment Date</th>
                </tr>
            </thead>
            <tbody>
                <?php
                while ($row = mysqli_fetch_assoc($query_run)) {
                    echo "<tr>";
                    echo "<td class='tg-0pky'>" . $row['enrollment_id'] . "</td>";
                    echo "<td class='tg-0pky'>" . $row['course_id'] . "</td>";
                    echo "<td class='tg-0pky'>" . $row['course_name'] . "</td>";
                    echo "<td class='tg-0pky'>" . $row['enrollment_date'] . "</td>";
                    echo "</tr>";
                }
                ?>
            </tbody>
        </table>
        <?php
    } else {
        echo "No enrollment information found for the selected student.";
    }
} else {
    echo "Student ID not provided.";
}
?>

