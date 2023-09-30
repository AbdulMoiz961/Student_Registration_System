<?php

    $con = mysqli_connect("localhost:3306","root","","registration");

    if(isset($_GET['inp_search_id']))
    {
    $input_id_var = $_GET['inp_search_id'];

    $query = "SELECT * FROM students WHERE id='$input_id_var' ";
    $query_run = mysqli_query($con, $query);

    if(mysqli_num_rows($query_run) > 0)
    {
    foreach($query_run as $row)
    {
    ?>

   <?php
}
}
}
?>

<html>
<head>
    <title>Edit Student Info</title>
</head>
<body>
<center>
    <form action="updating.php" method="post">
        <h1>Edit Student Information Here : </h1>
        <h3>ID</h3>
        <input type="text" name="id" value="<?= $row['id']; ?>" readonly>
        <h3>first name</h3>
        <input type="text" name="fn" value="<?= $row['fname']; ?>">
        <h3>last name</h3>
        <input type="text" name="ln" value="<?= $row['lname']; ?>">
        <h3>email</h3>
        <input type="text" name="em" value="<?= $row['email']; ?>">
        <h3>department</h3>
        <input type="text" name="dp" value="<?= $row['department_id']; ?>" >
        <h3>address</h3>
        <input type="text" name="ad" value="<?= $row['address']; ?>">
        <h3>number</h3>
        <input type="text" name="no" value="<?= $row['number']; ?>">
        <br><br>
        <input type="submit" name="update" >
    </form>

 
</center>
</body>
</html>