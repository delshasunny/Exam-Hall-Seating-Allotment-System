<?php
session_start();

$logged=$_GET['studid'];


$date=$_GET['date'];
$examid=$_GET['examid'];

include 'connect.php';

 $query0="select * from seating where exam_date='$date' && exam_id='$examid' and stud_id='$logged'";
 $res0=mysqli_query($conn,$query0);
 $row=mysqli_fetch_assoc($res0);
 $room_id=$row['room_id'];
 $class_id=$row['class_id'];
 $seat_id=$row['seat_id'];
 $start_time=$row['start_time'];
 $end_time=$row['end_time'];
 $exam_date=$row['exam_date'];

 //echo $sub1;



$query1="select * from seating where exam_date='$date' && exam_id='$examid'";
 $res1=mysqli_query($conn,$query1);

 while($row1=mysqli_fetch_array($res1))
 {
       $sub=$row1['exam_id'];
 }
  
 //echo $sub;


  //s $n=$row['starttime'];
  // echo $n;
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Arrangement in Lecture Hall</title>
  <link rel="stylesheet" href="css/bootstrap.min.css"/>
  <link rel="stylesheet" href="css/bootstraap.css"/>
  <link rel="stylesheet" href="css/lecturehalldata.css"/>
</head>
<body>
  <a href="studenthome.php" class="btn  btn-sm"><span class="glyphicon glyphicon-chevron-left"></span>back</a>
<br>
<br>
<br>
  <table border="3" align="center" style="width: 500px;">

<tr>
  <td>Student ID</td><td><?php echo $logged;?></td>
</tr>
<tr>
  <td>Exam Date</td><td><?php echo $date;?></td>
</tr>
<tr>
  <td>Room</td><td><?php echo $room_id;?></td>
</tr>
<tr>
  <td>Class</td><td><?php echo $class_id;?></td>
</tr>

<tr>
  <td>Start At</td><td><?php echo $start_time;?></td>
</tr>

<tr>
  <td>End At</td><td><?php echo $end_time;?></td>
</tr>

</table>
<br>
<br>
  <table border="3"   style="width:50%;float: left;"><tr>
  <?php
include 'connect.php';

 $query0="select * from seating where exam_id='$examid' and exam_date='$date'";
 $res0=mysqli_query($conn,$query0);
 $i=0;
 //echo $query0;
 while($row0=mysqli_fetch_array($res0))
 {
    $class_id=$row0['class_id'];
if($i%3==0)
{
?>
</tr>
<tr>
  <td><img src="seat.png" height="50" width="50"><?php echo $row0['stud_id'];?></td>

<?php
}
else if($i%2==0)
{
    $query00="select * from seating where room_id='$room_id' and exam_date='$date' and class_id!='$class_id' ORDER BY rand() limit 1";
  // echo $query00;
 $res00=mysqli_query($conn,$query00);
 if($row00=mysqli_fetch_array($res00))
 {
    $regno=$row00['stud_id'];
 }
?>

  <td><img src="seat.png" height="50" width="50"><?php echo $regno;?></td>

<?php
}



else{


  ?>
  
    <td><img src="seat.png" height="50" width="50"><?php echo $row0['stud_id'];?></td>
  
  <?php


}
$i++;
 }




 ?>
</tr>
</table>


</table>
</div>


















</div>










</body>
</html>
