<html>
<head>
    <title>Edit Student Info</title>
    <link rel="stylesheet" href="style2.css">
</head>
<body>
<center>
    <h1>Edit Student Information</h1>
    <h2>Please search for a student by ID</h2>

    <form action="update.php" method="GET">
        <input type="text" name="inp_search_id" id="" value="<?php if(isset($_GET['inp_search_id'])) { echo $_GET['inp_search_id']; } ?>" />
        <br><br>
        <input type="submit" name="" id="sbm">
    </form>

    <?php
    $con = mysqli_connect("localhost:3306", "root", "", "registration");

    if(isset($_GET['inp_search_id']))
    {
        $input_id_var = $_GET['inp_search_id'];

        $query = "SELECT students.id, students.fname, students.lname, students.department, students.address, students.number, students.email, course.course_name, grades.grade 
                  FROM students 
                  LEFT JOIN course ON students.course_id = course.course_id
                  LEFT JOIN grades ON students.id = grades.student_id
                  WHERE students.id='$input_id_var' ";
        $query_run = mysqli_query($con, $query);

        if(mysqli_num_rows($query_run) > 0)
        {
            ?>
            <style type="text/css">
                .tg  {border-collapse:collapse;border-color:#93a1a1;border-spacing:0;}
                .tg td{background-color:#fdf6e3;border-color:#93a1a1;border-style:solid;border-width:1px;color:#002b36;
                font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;word-break:normal;}
                .tg th{background-color:#657b83;border-color:#93a1a1;border-style:solid;border-width:1px;color:#fdf6e3;
                font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
                .tg .tg-9wq8{border-color:inherit;text-align:center;vertical-align:middle}
                .tg .tg-baqh{text-align:center;vertical-align:top}
                .tg .tg-c3ow{border-color:inherit;text-align:center;vertical-align:top}
            </style>
            <table class="tg">
                <thead>
                <tr>
                    <th class="tg-c3ow">Student ID</th>
                    <th class="tg-c3ow">First Name</th>
                    <th class="tg-c3ow">Last Name</th>
                    <th class="tg-c3ow">Department</th>
                    <th class="tg-c3ow">Address</th>
                    <th class="tg-c3ow">Phone</th>
                    <th class="tg-c3ow">Email</th>
                    <th class="tg-c3ow">Course Name</th>
                    <th class="tg-c3ow">Grade</th>
                    <th class="tg-baqh" colspan="2">Operations</th>
                </tr>
                </thead>
                <tbody>
                <?php
                while($row = mysqli_fetch_assoc($query_run))
                {
                    echo "<tr>";
                    echo "<td class='tg-0pky'>" . $row['id'] . "</td>";
                    echo "<td class='tg-0pky'>" . $row['fname'] . "</td>";
                    echo "<td class='tg-0pky'>" . $row['lname'] . "</td>";
                    echo "<td class='tg-0pky'>" . $row['department'] . "</td>";
                    echo "<td class='tg-0pky'>" . $row['address'] . "</td>";
                    echo "<td class='tg-0pky'>" . $row['number'] . "</td>";
                    echo "<td class='tg-0pky'>" . $row['email'] . "</td>";
                    echo "<td class='tg-0pky'>" . $row['course_name'] . "</td>";
                    echo "<td class='tg-0pky'>" . $row['grade'] . "</td>";
                    echo "<td class='tg-0lax'><a href='update.php?id=" . $row['id'] . "&fname=" . $row['fname'] . "&lname=" . $row['lname'] . "&department=" . $row['department'] . "&address=" . $row['address'] . "&number=" . $row['number'] . "&email=" . $row['email'] . "'>Edit</a></td>";
                    echo "<td class='tg-0lax'><a href=''>Delete</td>";
                    echo "</tr>";
                }
                ?>
                </tbody>
            </table>
            <?php
        }
    }
    ?>
</center>
</body>
</html>
