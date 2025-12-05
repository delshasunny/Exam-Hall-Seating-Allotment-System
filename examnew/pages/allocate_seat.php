<?php
date_default_timezone_set('Asia/Kolkata');
$current_date = date('Y-m-d');
include('../connect.php');

$exam_list = $conn->query("SELECT * FROM `exam` where id not in  (select exam_id from exam_summary)");


while ($exam_row = $exam_list->fetch_assoc()) {

  //student list taking
  $student_list      = $conn->query("SELECT * from tbl_student 
        where course_id = $exam_row[class_id]");
  $total_student     = $student_list->num_rows;
  $balance_student   = $total_student;
  $processed_student = 0;


  if ($total_student > 0) {

    do {

      //from room 
      $availableRoom = getAvailableRooms(
        $exam_row['is_mix_needed'],
        $exam_row['exam_date'],
        $exam_row['start_time'],
        $exam_row['end_time'],
      );

      $available_count = 0;



      if ($exam_row['is_mix_needed'] == true) {

        //mix version 1 or 2
        $balance_strength = 0;

        $vaccantRoomUsageDetails = getRoomUsageDetails(
          $exam_row['exam_date'],
          $exam_row['start_time'], $exam_row['end_time'], $availableRoom['id']
        );

        //check any mix is used

        if ($vaccantRoomUsageDetails->num_rows > 0) {
          // mix is used
          if ($vaccantRoomUsageDetails->num_rows > 1) {
            //all mix is used
          }
          else {
            //save to opposit mix
          }
        }
        else {
          //save to first mix

          if ($availableRoom['strength1'] >= $availableRoom['strength2']) {
            //insert into mix 1

            if ($availableRoom['strength1'] > $balance_student) {


              $FreeTeacher        = getFreeTeacher($exam_row['exam_date']);
              $balanceCountInRoom = $availableRoom['strength1'] - $balance_student;

              $examSummaryID = saveExamSummary(
                $exam_row['id'],
                $exam_row['exam_date'],
                $availableRoom['id'],
                $FreeTeacher['id'],
                $exam_row['start_time'],
                $exam_row['end_time'],
                true,
                1,
                1,
                $balance_student,
                $balance_student,
                $balanceCountInRoom
              );

              $seatNumber     = 0;
              $student_number = 0;
              while ($student_row = $student_list->fetch_assoc()) {
                $student_number++;
                if ($student_number > $processed_student) {
                  $seatNumber++;
                  saveExamDetails(
                    $exam_row['id'],
                    $exam_row['exam_date'],
                    $availableRoom['id'],
                    $examSummaryID,
                    $exam_row['start_time'],
                    $exam_row['end_time'],
                    $student_row['id'],
                    $seatNumber
                  );
                  $processed_student++;
                  $balance_student--;
                  $seatNumber++;
                }
              }
            }
            else {
              //todo if student balance count is greater than room

              do {

                $availableRoom = getAvailableRooms(
                  $exam_row['is_mix_needed'],
                  $exam_row['exam_date'],
                  $exam_row['start_time'],
                  $exam_row['end_time'],
                );

                $vaccantRoomUsageDetails = getRoomUsageDetails(
                  $exam_row['exam_date'],
                  $exam_row['start_time'], $exam_row['end_time'], $availableRoom['id']
                );

                $FreeTeacher        = getFreeTeacher($exam_row['exam_date']);
                $balanceCountInRoom = $availableRoom['strength1'];

                $examSummaryID = saveExamSummary(
                  $exam_row['id'],
                  $exam_row['exam_date'],
                  $availableRoom['id'],
                  $FreeTeacher['id'],
                  $exam_row['start_time'],
                  $exam_row['end_time'],
                  true,
                  1,
                  1,
                  $balanceCountInRoom,
                  $balance_student,
                  0
                );

                $seatNumber     = 0;
                $student_number = 0;
                while ($student_row = $student_list->fetch_assoc()) {
                  $student_number++;
                  if ($student_number > $processed_student) {
                    $seatNumber++;
                    saveExamDetails(
                      $exam_row['id'],
                      $exam_row['exam_date'],
                      $availableRoom['id'],
                      $examSummaryID,
                      $exam_row['start_time'],
                      $exam_row['end_time'],
                      $student_row['id'],
                      $seatNumber
                    );
                    $processed_student++;
                    $seatNumber++;
                    $balance_student--;
                  }
                }

              } while ($balance_student > 0);
            }
          }
          else {
            //insert into mix 2

            if ($availableRoom['strength2'] > $balance_student) {


              $FreeTeacher        = getFreeTeacher($exam_row['exam_date']);
              $balanceCountInRoom = $availableRoom['strength2'] - $balance_student;

              $examSummaryID = saveExamSummary(
                $exam_row['id'],
                $exam_row['exam_date'],
                $availableRoom['id'],
                $FreeTeacher['id'],
                $exam_row['start_time'],
                $exam_row['end_time'],
                true,
                1,
                1,
                $balance_student,
                $balance_student,
                $balanceCountInRoom
              );

              $seatNumber     = 0;
              $student_number = 0;
              while ($student_row = $student_list->fetch_assoc()) {
                $student_number++;
                if ($student_number > $processed_student) {
                  $seatNumber++;
                  saveExamDetails(
                    $exam_row['id'],
                    $exam_row['exam_date'],
                    $availableRoom['id'],
                    $examSummaryID,
                    $exam_row['start_time'],
                    $exam_row['end_time'],
                    $student_row['id'],
                    $seatNumber
                  );
                  $processed_student++;
                  $balance_student--;
                  $seatNumber++;
                }
              }
            }
            else {
              //todo if student balance count is greater than room

              do {

                $availableRoom = getAvailableRooms(
                  $exam_row['is_mix_needed'],
                  $exam_row['exam_date'],
                  $exam_row['start_time'],
                  $exam_row['end_time'],
                );

                $vaccantRoomUsageDetails = getRoomUsageDetails(
                  $exam_row['exam_date'],
                  $exam_row['start_time'], $exam_row['end_time'], $availableRoom['id']
                );

                $FreeTeacher        = getFreeTeacher($exam_row['exam_date']);
                $balanceCountInRoom = $availableRoom['strength2'];

                $examSummaryID = saveExamSummary(
                  $exam_row['id'],
                  $exam_row['exam_date'],
                  $availableRoom['id'],
                  $FreeTeacher['id'],
                  $exam_row['start_time'],
                  $exam_row['end_time'],
                  true,
                  1,
                  1,
                  $balanceCountInRoom,
                  $balance_student,
                  0
                );

                $seatNumber     = 0;
                $student_number = 0;
                while ($student_row = $student_list->fetch_assoc()) {
                  $student_number++;
                  if ($student_number > $processed_student) {
                    $seatNumber++;
                    saveExamDetails(
                      $exam_row['id'],
                      $exam_row['exam_date'],
                      $availableRoom['id'],
                      $examSummaryID,
                      $exam_row['start_time'],
                      $exam_row['end_time'],
                      $student_row['id'],
                      $seatNumber
                    );
                    $processed_student++;
                    $seatNumber++;
                    $balance_student--;
                  }
                }

              } while ($balance_student > 0);
            }

          }

        }

      }
      else {

        //if not mixing

        $seat_balance            = $availableRoom['strength1'] + $availableRoom['strength2'];
        $FreeTeacher             = getFreeTeacher($exam_row['exam_date']);
        $alloting_students_count = 0;

        if ($seat_balance > $balance_student) {
          $balanceCountInRoom      = $seat_balance - $balance_student;
          $alloting_students_count = $balance_student;
        }
        else {
          $balanceCountInRoom      = 0;
          $alloting_students_count = $seat_balance;
        }

        $examSummaryID = saveExamSummary(
          $exam_row['id'],
          $exam_row['exam_date'],
          $availableRoom['id'],
          $FreeTeacher['id'],
          $exam_row['start_time'],
          $exam_row['end_time'],
          false,
          1,
          1,
          $alloting_students_count,
          $balance_student,
          $balanceCountInRoom
        );

        $seatNumber = 0;
        while ($student_row = $student_list->fetch_assoc()) {

          $seatNumber++;

          saveExamDetails(
            $exam_row['id'],
            $exam_row['exam_date'],
            $availableRoom['id'],
            $examSummaryID,
            $exam_row['start_time'],
            $exam_row['end_time'],
            $student_row['id'],
            $seatNumber
          );
        }

      }

      $balance_student = 0;

    } while ($balance_student > 0);

  }
  else {
    echo '<pre>';
    print_r("No students found in this course");
    exit();
  }

}

function getFreeTeacher($date)
{
  global $conn;
  $teacher_list = $conn->query("SELECT * from tbl_teacher 
  where id not in (select exam_teacher_id from exam_summary where exam_date = '$date') limit 1");

  while ($teacher_row = $teacher_list->fetch_assoc()) {
    return $teacher_row;
  }
}

function getAvailableRooms($is_mix_needed, $exam_date, $start_time, $end_time)
{
  global $conn;

  if ($is_mix_needed == true) {

    $queryRoomList = "SELECT
    *
from
    room
where
    id not in (
        select
            exam_room_id
        from
            exam_summary
        where
            (
                (
                    (
                        is_mix_needed = true
                        and balance_count < 5
                    )
                )
                and (exam_date = '$exam_date')
                and (
                    (
                        TIME(exam_start) >= TIME('$start_time')
                        and TIME(exam_start) <= TIME('$end_time')
                    )
                )
                and(
                    (
                        TIME(exam_end) >= TIME('$start_time')
                        and TIME(exam_end) <= TIME('$end_time')
                    )
                )
            )
    )
order by
    name";



    $room_list = $conn->query($queryRoomList);
  }
  else {
    $room_list = $conn->query("SELECT
    *
from
    room
where
    id not in (
        select
            exam_room_id
        from
            exam_summary
        where
            (
                is_mix_needed = false
                and exam_date = '$exam_date'
                and (
                    (
                        TIME(exam_start) >= TIME('$start_time')
                        and TIME(exam_start) <= TIME('$end_time')
                    )
                ) || (
                    (
                        TIME(exam_end) >= TIME('$start_time')
                        and TIME(exam_end) <= TIME('$end_time')
                    )
                )
            )
    )
order by
    name");
  }


  while ($room_row = $room_list->fetch_assoc()) {
    return $room_row;
  }
}

function getRoomUsageDetails($date, $start_time, $end_time, $room_id)
{
  global $conn;
  $query = "SELECT
    exam_room_id, balance_count, strength_status
FROM
    exam_summary
WHERE
    (
        (
            (
                is_mix_needed = TRUE
            )
        ) AND(exam_date = '$date') AND(
            (
                TIME(exam_start) >= TIME('$start_time') AND TIME(exam_start) <= TIME('$end_time')
            )
        ) AND(
            (
                TIME(exam_end) >= TIME('$start_time') AND TIME(exam_end) <= TIME('$end_time')
            )
        ) AND
        exam_room_id = $room_id
    )";

  $roomUsage = $conn->query($query);
  return $roomUsage;
}


function saveExamSummary(
  $exam_id,
  $exam_date,
  $room_id,
  $teacher_id,
  $start_time,
  $end_time,
  $isMixing,
  $selectedStrength,
  $startingSeat,
  $end_seat,
  $usedCount,
  $balanceCountInRoom
)
{
  global $conn;
  $sql = "INSERT INTO `exam_summary` 
                (`exam_summary_id`,
                `exam_id`,
                `exam_date`,
                `exam_room_id`,
                `exam_teacher_id`,
                `exam_start`,
                `exam_end`,
                `is_mix_needed`,
                `strength_status`,
                `start_seat_number`,
                `end_seat_number`,
                `used_count`,
                `balance_count`) 
                VALUES (NULL, 
                $exam_id,
                '$exam_date',
                $room_id,
                 $teacher_id,
                '$start_time',
                '$end_time',
                $isMixing,
                $selectedStrength,
                $startingSeat,
                $end_seat,
                $usedCount,
                $balanceCountInRoom );";



  mysqli_query($conn, $sql);
  $lastid = mysqli_insert_id($conn);
  return $lastid;
}

function saveExamDetails(
  $exam_id,
  $exam_date,
  $room_id,
  $exam_summary_id,
  $start_time,
  $end_time,
  $student_id,
  $seat_number
)
{
  global $conn;
  $sql = "INSERT INTO 
          `exam_details` 
          (
          `exam_details_id`,
          `exam_summary_id`, 
          `exam_id`, 
          `exam_date`, 
          `exam_start`, 
          `exam_end`,
          `room_id`,
          `seat_no`,
          `student_id`)
          VALUES 
          (NULL, 
          $exam_summary_id,
          $exam_id,
          '$exam_date',
          '$start_time',
          '$end_time',
          $room_id,
          $seat_number,
          $student_id
          )";

  mysqli_query($conn, $sql);
  $lastid = mysqli_insert_id($conn);
  return $lastid;
}


$_SESSION['success'] = ' Record Successfully Added';
?>

<script type="text/javascript">
  window.location = "../view_allotment.php";
</script>