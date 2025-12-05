<?php
date_default_timezone_set('Asia/Kolkata');
$current_date = date('Y-m-d');
include('../connect.php');
extract($_POST);

// $mix = ($mixbatch != null) ? true : false;

// echo '<pre>';
// // print_r("___asd___");
// print_r("___" + $mixbatch + "___");
// exit();

// $mix = ($mix == null) ? false : $mix;

// if (empty($mixbatch)) {
//       $mixbatch = false;
// }

$sql = "INSERT INTO `exam` (`class_id`,`subject_id`,`exam_date`,`start_time`,`end_time`,`name`,`added_date`, `is_mix_needed`)
VALUES ($class_id,$subject_id,'$exam_date','$start_time','$end_time', '$name', '$exam_date', $mixbatch)";

// echo '<pre>';
// print_r($sql);
// exit();

if ($conn->query($sql) === TRUE) {
      $_SESSION['success'] = ' Record Successfully Added';
      ?>
      <script type="text/javascript">
            window.location = "../view_exam.php";
      </script>
      <?php
}
else {

      echo '<pre>';
      print_r("Error while inserting --> " + $sql);
      exit();

      // $_SESSION['error'] = 'Something Went Wrong';
      // ?>
      //
      <script type="text/javascript">
                              //       window.location = "../view_exam.php";
                              // </script>

<?php } ?>