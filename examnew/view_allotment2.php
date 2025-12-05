<?php include('head.php'); ?>

<?php include('header.php'); ?>
<?php include('sidebar.php'); ?>

<?php
include('connect.php');
date_default_timezone_set('Asia/Kolkata');
$current_date     = date('Y-m-d');
$date             = $_POST['date'];
$_SESSION['date'] = $date;

// $date = date('Y-m-d');

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

    <div class="card">
      <div class="card-body">


        <?php
        include 'connect.php';
        $sql = "SELECT  *, a.name as ExamName, f.name as ExamRoom  FROM `exam` a inner join exam_summary b on a.id=b.exam_id 
              inner join exam_details c on a.id = c.exam_id 
              inner JOIN tbl_teacher d on b.exam_teacher_id = d.id 
              INNER JOIN tbl_student e on c.student_id = e.id 
              inner join room f on b.exam_room_id = f.id 
              inner JOIN tbl_class g on a.class_id = g.id 
              inner join tbl_subject h on a.subject_id = h.id
              where a.exam_date = '" . $date . "'";

        $result = $conn->query($sql);

        $current_exam_id  = 0;
        $previous_exam_id = 0;
        $row_index        = 0;

        while ($row = $result->fetch_assoc()) {

          $current_exam_id = $row['exam_summary_id'];

          if ($current_exam_id != $previous_exam_id) {


            ?>

            <div>
              <table class="table table-bordered">
                <tbody>
                  <tr>
                    <th scope="row">Exam Name</th>
                    <td>
                      <?php echo $row['ExamName']; ?>
                    </td>
                    <td>Couse</td>
                    <td>
                      <?php echo $row['classname']; ?>
                    </td>
                    <td scope="row">Subject</td>
                    <td colspan="4">
                      <?php echo $row['subjectname']; ?>
                    </td>
                  </tr>
                  <tr>

                    <td scope="row">Date</td>
                    <td>
                      <?php echo $row['exam_date']; ?>
                    </td>
                    <td>Time</td>
                    <td>
                      <?php echo $row['exam_start']; ?> -
                      <?php echo $row['exam_end']; ?>
                    </td>
                    <th scope="row">Room </th>
                    <td>
                      <?php echo $row['ExamRoom']; ?>
                    </td>
                    <td>Teacher</td>
                    <td>
                      <?php echo $row['tfname']; ?>
                    </td>
                  </tr>
                  <!-- <tr>
                                                                                                                                                                                      <th scope="row">Room </th>
                                                                                                                                                                                      <td>Seminar Hall</td>
                                                                                                                                                                                      <td>Teacher</td>
                                                                                                                                                                                      <td>
                                                                                                                                                                                        <?php echo $row['tfname']; ?>
                                                                                                                                                                                      </td>
                                                                                                                                                                                    </tr> -->
                </tbody>
              </table>

              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th scope="col">Seat No.</th>
                    <th scope="col">Reg No.</th>
                    <th scope="col">Name</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
          }


          ?>

                <!-- <tr>
                                                            <td>
                                                              <?php echo $row['exam_date']; ?>
                                                            </td>
                                                            <td>
                                                              <?php echo $row['name']; ?>
                                                            </td>
                                                            <td>
                                                              <?php echo $row['classname']; ?>
                                                            </td>
                                                            <td>
                                                              <?php echo $row['subjectname']; ?>
                                                            </td>
                                                            <td>
                                                              <?php echo $row['stud_id']; ?>
                                                            </td>
                                                            <td>
                                                              <?php echo $row['sfname']; ?>
                                                            </td>
                                                            <td>
                                                              <?php echo $row['seat_no']; ?>
                                                            </td>
                                                          </tr> -->


                <tr>
                  <td>
                    <?php echo $row['seat_no']; ?>
                  </td>
                  <td>
                    <?php echo $row['stud_id']; ?>
                  </td>
                  <td>
                    <?php echo $row['sfname']; ?>
                  </td>
                </tr>

                <?php

                $previous_exam_id = $current_exam_id;
                $row_index++;
        } ?>

            </tbody>
          </table>
        </div>

      </div>
    </div>
  </div>


  <?php include('footer.php'); ?>