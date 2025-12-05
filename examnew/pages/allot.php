<?php
date_default_timezone_set('Asia/Kolkata');
$current_date = date('Y-m-d');
include('../connect.php');

$class_id=$_POST['class_id'];
$subject_id=$_POST['subject_id'];
$room_type_id=$_POST['room_type_id'];
$exam_id=$_POST['exam_id'];
$exam_date=$_POST['exam_date'];
   $sql = "INSERT INTO `allot` (`class_id`,`room_type_id`,`subject_id`,`exam_id`,`added_date`) VALUES ('$class_id','$room_type_id','$subject_id','$exam_id','$exam_date')";
 if ($conn->query($sql) === TRUE) {
 	
    	
}
      $_SESSION['success']=' Record Successfully Added';
     ?>
<script type="text/javascript">
window.location="../view_allotment.php";
</script>

