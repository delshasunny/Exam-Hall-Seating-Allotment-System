<?php include('head.php');?>
<?php include('header2.php');?>

<?php include('teacher_sidebar.php');?>   
<?php
$subjectname=$_SESSION['subjectname'];
 date_default_timezone_set('Asia/Kolkata');
 $current_date = date('Y-m-d');

 $sql_currency = "select * from manage_website"; 
             $result_currency = $conn->query($sql_currency);
             $row_currency = mysqli_fetch_array($result_currency);
?>    
      
        <div class="page-wrapper">
            
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-primary">Dashboard</h3> </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item active">Dashboard</li>
                    </ol>
                </div>
            </div>
            
            <div class="container-fluid">                    
               <div class="card">
                            <div class="card-body">
                                <div class="table-responsive m-t-40">
                                <table id="myTable" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                         
                                                <th>Date</th> 
                                                <th>Start At</th>
												<th>End At</th>
												<th>Room</th>
											
                                            </tr>
                                        </thead>
                                        <tbody>
                                    <?php 
                                    include 'connect.php';
                             
                                    $sql1    = "SELECT * , a.name as ExamName FROM `exam` a inner join exam_summary b on a.id=b.exam_id 
              inner join exam_details c on a.id = c.exam_id 
              inner JOIN tbl_teacher d on b.exam_teacher_id = d.id 
              INNER JOIN tbl_student e on c.student_id = e.id 
              inner join room f on b.exam_room_id = f.id 
              inner JOIN tbl_class g on a.class_id = g.id 
              inner join tbl_subject h on a.subject_id = h.id
              where d.temail= '". $_SESSION['temail'] ."'";
                               
                               $result1 = $conn->query($sql1);
								   
                                  if($row = $result1->fetch_assoc()) {
                                   $id=$row['exam_id'];
                                   $date=$row['exam_date'];
                                   $studid=$row['stud_id'];
                                      ?>
                                            <tr>
                                                     <td><?php echo $row['exam_date']; ?></td>
                                                      <td><?php echo $row['start_time'];?></td>
                                                <td><?php echo $row['end_time']; ?></td>
                                             
                                         
                                                      <td><?php echo $row['name']; ?></td>
            
												  
											
                                                <!-- <td><a href="listroom1.php?studid=<?php echo $studid;?>&&examid=<?php echo $id;?>&&date=<?php echo $date;?>">View</a></td> -->
                                            </tr>
                                          <?php } ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div> 
        </div>
            
            <?php include('footer.php');?>