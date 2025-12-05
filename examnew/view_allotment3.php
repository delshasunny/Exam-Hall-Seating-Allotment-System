<?php include('head.php'); ?>

<?php include('header.php'); ?>
<?php include('sidebar.php'); ?>

<?php
include('connect.php');

date_default_timezone_set('Asia/Kolkata');
$current_date = date('Y-m-d');
$class1 = $_POST['class1'];
$class2 = $_POST['class2'];
$date = $_SESSION['date'];
echo "date" . $date;
$c1 = "SELECT * FROM `allot` where class_id='$class1' and added_date='$date'";
$result = $conn->query($c1);
if ($row = mysqli_fetch_array($result)) {

    $subid1 = $row['subject_id'];
    $examid1 = $row['exam_id'];
    $roomtype1 = $row['room_type_id'];
    $date1 = $row['added_date'];
    if ($roomtype1 == "Mini Hall") {
        $count = 30;
    }
    if ($roomtype1 == "Main Hall") {
        $count = 30;
    }
    if ($roomtype1 == "Class Room") {
        $count = 30;
    }
    $c2 = "SELECT * FROM `exam` where class_id='$class1' and subject_id='$subid1' and added_date='$date1' ";
    //echo $c2;
    $result1 = $conn->query($c2);
    if ($row1 = mysqli_fetch_array($result1)) {

        $start1 = $row1['start_time'];
        $end1 = $row1['end_time'];
    }
}
$room1 = "2";
$s3 = "SELECT * FROM `tbl_student` WHERE classname='" . $class1 . "'";
$sr3 = $conn->query($s3);
$i = 0;
while ($student = mysqli_fetch_array($sr3)) {
    $i++;
    $regno1 = $student['stud_id'];
    if ($i == 20) {
        break;
    } else {
        $seatno = rand(1, 30);
        $room1 = rand(1, 10);
        $sql = "INSERT INTO `seating`(`stud_id`,`exam_id`, `exam_date`, `start_time`, `end_time`, `room_id`, `class_id`,`seat_id`) VALUES('$regno1','$examid1','$date1','$start1','$end1','$roomtype1','$class1','$seatno')";
        $conn->query($sql);
    }
}






$c2 = "SELECT * FROM `allot` where class_id='$class2' and added_date='$date'";
//echo $c2;
$result = $conn->query($c2);
if ($row = mysqli_fetch_array($result)) {

    $subid2 = $row['subject_id'];
    $examid2 = $row['exam_id'];
    $roomtype2 = $row['room_type_id'];

    if ($roomtype1 == "Mini Hall") {
        $count = 30;
    }
    if ($roomtype1 == "Main Hall") {
        $count = 30;
    }
    if ($roomtype1 == "Class Room") {
        $count = 30;
    }
    $c2 = "SELECT * FROM `exam` where class_id='$class2' and subject_id='$subid2' and added_date='$date1' ";
    $result1 = $conn->query($c2);
    if ($row1 = mysqli_fetch_array($result1)) {

        $start1 = $row1['start_time'];
        $end1 = $row1['end_time'];
    }
}
$s3 = "SELECT * FROM `tbl_student` WHERE classname='" . $class2 . "'";
$sr3 = $conn->query($s3);
$i = 0;
while ($student = mysqli_fetch_array($sr3)) {
    $i++;
    $regno1 = $student['stud_id'];
    if ($i == 10) {
        break;
    } else {
        $seatno = rand(21, 30);

        $sql = "INSERT INTO `seating`(`stud_id`,`exam_id`, `exam_date`, `start_time`, `end_time`, `room_id`, `class_id`,`seat_id`) VALUES('$regno1','$subid2','$date1','$start1','$end1','$roomtype1','$class2','$seatno')";
        $conn->query($sql);
        //echo $sql;
    }
?>


<?php
}











?>

<div class="page-wrapper">

    <div class="row page-titles">
        <div class="col-md-5 align-self-center">
            <h3 class="text-primary">Allotment Management</h3>
        </div>
        <div class="col-md-7 align-self-center">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                <li class="breadcrumb-item active">Allotment Management</li>
            </ol>
        </div>
    </div>

    <div class="container-fluid">

        <div class="row">
            <div class="col-lg-8" style="margin-left: 10%;">
                <div class="card">
                    <div class="card-body">
                        <div class="input-states">
                            <form class="form-horizontal" method="POST" action="view_allotment3.php" name="userform" enctype="multipart/form-data">





                                <div class="form-group">
                                    <div class="row">
                                        <label class="col-sm-3 control-label">Class1</label>
                                        <div class="col-sm-9">
                                            <select type="text" name="class1" class="form-control" placeholder="Class" required="">
                                                <option value="">--Select Class--</option>
                                                <?php
                                                $c1 = "SELECT distinct(class_id) FROM `allot` where added_date='$date'";
                                                $result = $conn->query($c1);

                                                if ($result->num_rows > 0) {
                                                    while ($row = mysqli_fetch_array($result)) { ?>
                                                        <option value="<?php echo $row[0]; ?>">
                                                            <?php echo $row[0]; ?>
                                                        </option>
                                                <?php
                                                    }
                                                } else {
                                                    echo "0 results";
                                                }
                                                ?>
                                            </select>
                                        </div>
                                    </div>
                                </div>




                                <div class="form-group">
                                    <div class="row">
                                        <label class="col-sm-3 control-label">Class2</label>
                                        <div class="col-sm-9">
                                            <select type="text" name="class2" class="form-control" placeholder="Class" required="">
                                                <option value="">--Select Class--</option>
                                                <?php
                                                $c1 = "SELECT distinct(class_id) FROM `allot`";
                                                $result = $conn->query($c1);

                                                if ($result->num_rows > 0) {
                                                    while ($row = mysqli_fetch_array($result)) { ?>
                                                        <option value="<?php echo $row[0]; ?>">
                                                            <?php echo $row[0]; ?>
                                                        </option>
                                                <?php
                                                    }
                                                } else {
                                                    echo "0 results";
                                                }
                                                ?>
                                            </select>
                                        </div>
                                    </div>
                                </div>


                                <button type="submit" name="btn_save" id="btn_save" class="btn btn-primary btn-flat m-b-30 m-t-30">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <?php include('footer.php'); ?>

        <script type="text/javascript">
            $('#class_id').change(function() {
                var class_capacity = $('#class_id').find(':selected').attr('data-capacity');
                $('#class_capacity').val(class_capacity);
                $("#subject_id").val('');
                $("#subject_id").children('option').hide();
                var class_id = $(this).val();
                $("#subject_id").children("option[data-id=" + class_id + "]").show();

            });
        </script>
        <script type="text/javascript">
            $('#subject_id').change(function() {
                $("#exam_id").val('');
                $("#exam_id").children('option').hide();
                var subject_id = $(this).val();
                $("#exam_id").children("option[data-id=" + subject_id + "]").show();

                $("#teacher_id").val('');
                $("#teacher_id").children('option').hide();
                $("#teacher_id").children("option[data-id=" + subject_id + "]").show();

            });
            $('#room_type_id').change(function() {
                var room_capacity = $('#room_type_id').find(':selected').attr('data-capacity');
                $('#room_capacity').val(room_capacity);

            });
            $('#btn_save').click(function() {
                var room_capacity = $('#room_capacity').val();
                var class_capacity = $('#class_capacity').val();
                if (parseInt(class_capacity) > parseInt(room_capacity)) {
                    alert('Students quantity are greater than available room');
                    return false;
                } else {
                    return true;
                }


            });
        </script>