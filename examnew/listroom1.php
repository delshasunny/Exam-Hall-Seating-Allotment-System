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
<br>
<br>
<br>
  <table border="3" align="center" style="width: 500px;">


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
<h2><center>Student Allotments</center></h2>
  <table border="3"  align="center"><tr>
  <?php
include 'connect.php';

 $query0="select distinct(stud_id) from seating where exam_id='$examid' and exam_date='$date'";
 $res0=mysqli_query($conn,$query0);
 $i=0;
 //echo $query0;
 while($row0=mysqli_fetch_array($res0))
 {
   
if($i%2==0)
{
?>
</tr>
<tr>
  <td><?php echo $row0[0];?></td>

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
