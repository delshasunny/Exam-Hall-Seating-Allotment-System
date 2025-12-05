<?php
date_default_timezone_set('Asia/Kolkata');
$current_date = date('Y-m-d');
include('../connect.php');
$passw = hash('sha256', $_POST['password']);
function createSalt()
{
  return '2123293dsj2hu2nikhiljdsd';
}
$salt = createSalt();
$pass = hash('sha256', $salt . $passw);
extract($_POST);
print($stud_id);


$sql = "INSERT INTO `tbl_student`(`stud_id`,`sfname`, 
 `password`, `sdob`, `course_id`)
    VALUES ('$stud_id','$sfname',  '$pass',  '$sdob', '$course_id')";

if ($conn->query($sql) === TRUE) {
  $_SESSION['success'] = ' Record Successfully Added';
?>
  <script type="text/javascript">
    window.location = "../view_student.php";
  </script>
<?php
} else {
  print('EROR');
  $_SESSION['error'] = 'Something Went Wrong';
?>
  <!-- <script type="text/javascript">
    window.location = "../view_student.php";
  </script> -->
<?php } ?>