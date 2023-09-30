<?php
   $fname = $_POST['fname'];
   $lname = $_POST['lname'];
   $email = $_POST['email'];
   $department = $_POST['department'];
   $address = $_POST['address'];
   $number = $_POST['number'];
   $course_id = $_POST['course_id'];

   //database connection
   $conn = new mysqli('localhost:3306','root','','registration');
    if($conn->connect_error){
    echo "$conn->connect_error";
    die("Connection Failed : " . $conn->connect_error);
    }
    else{
        $stmt = $conn->prepare("INSERT INTO students (fname, lname, email, department_id, address, number, course_id) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("ssssssi", $fname, $lname, $email, $department_id, $address, $number, $course_id);
        $stmt->execute();

        
        $enrollment_date = date('Y-m-d');
        $stmt = $conn->prepare("INSERT INTO enrollment (student_id, course_id, enrollment_date) VALUES (LAST_INSERT_ID(), ?, ?)");
        $stmt->bind_param("is", $course_id, $enrollment_date);
        $stmt->execute();

        echo "Registration successfull";
    }
?>