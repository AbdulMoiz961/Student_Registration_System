<?php
if(isset($_POST['update'])) {
    $conn = mysqli_connect('localhost:3306', 'root', '', 'registration');

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    if (isset($_POST['update_student'])) {
        $student_id = $_POST['student_id'];
        $new_department_id = $_POST['new_department_id'];
    
        $update_query = "UPDATE students SET department_id = '$new_department_id' WHERE id = $student_id";
    
        if (mysqli_query($con, $update_query)) {
            echo "Student department updated successfully.";
        } else {
            echo "Error updating student department: " . mysqli_error($con);
        }
    }

    $id = $_POST['id'];
    $fname = $_POST['fn'];
    $lname = $_POST['ln'];
    $email = $_POST['em'];
    $department_id = $_POST['dp'];
    $address = $_POST['ad'];
    $number = $_POST['no'];

    $sql = "UPDATE students SET fname = '$fname', lname = '$lname', email = '$email', department_id = '$department_id', address = '$address', number = '$number' WHERE id = $id";

    if ($conn->query($sql) === TRUE) {
        echo "Record updated successfully";
    } else {
        echo "Error updating record: " . $conn->error;
    }
}
?>

