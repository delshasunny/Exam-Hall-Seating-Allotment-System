-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2023 at 06:01 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `exam_hall`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(500) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(500) NOT NULL,
  `gender` varchar(500) NOT NULL,
  `dob` text NOT NULL,
  `contact` text NOT NULL,
  `address` varchar(500) NOT NULL,
  `image` varchar(2000) NOT NULL,
  `created_on` date NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `fname`, `lname`, `gender`, `dob`, `contact`, `address`, `image`, `created_on`, `group_id`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin', 'admin', 'LF', 'Male', '1988-05-29', '9988776655', 'Guruvayur', 'custombrown.jpg', '2023-01-16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `allot`
--

CREATE TABLE `allot` (
  `id` int(60) NOT NULL,
  `class_id` varchar(50) NOT NULL,
  `room_type_id` varchar(60) NOT NULL,
  `subject_id` varchar(50) NOT NULL,
  `exam_id` varchar(50) NOT NULL,
  `added_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `allot`
--

INSERT INTO `allot` (`id`, `class_id`, `room_type_id`, `subject_id`, `exam_id`, `added_date`) VALUES
(47, 'BA english', 'rosahall', 'Eng1', 'Eng1', '2023-01-24'),
(48, 'BA Hindi', 'rosahall', 'Hindi1', 'Hindi1', '2023-01-24');

-- --------------------------------------------------------

--
-- Table structure for table `allot_student`
--

CREATE TABLE `allot_student` (
  `id` int(100) NOT NULL,
  `allot_id` int(60) NOT NULL,
  `exam_id` int(50) NOT NULL,
  `exam_date` date NOT NULL,
  `start_time` varchar(20) NOT NULL,
  `end_time` varchar(20) NOT NULL,
  `room_id` int(50) NOT NULL,
  `student_id` int(50) NOT NULL,
  `teacher_id` int(50) DEFAULT NULL,
  `stud_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `allot_student`
--

INSERT INTO `allot_student` (`id`, `allot_id`, `exam_id`, `exam_date`, `start_time`, `end_time`, `room_id`, `student_id`, `teacher_id`, `stud_id`) VALUES
(1, 5, 0, '0000-00-00', '', '', 4, 3, NULL, 'LFBCA1102');

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `id` int(60) NOT NULL,
  `class_id` varchar(50) NOT NULL,
  `subject_id` varchar(50) NOT NULL,
  `exam_date` date NOT NULL,
  `start_time` varchar(50) NOT NULL,
  `end_time` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `added_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`id`, `class_id`, `subject_id`, `exam_date`, `start_time`, `end_time`, `name`, `added_date`) VALUES
(30, 'BA english', 'Eng1', '2023-01-24', '10:00', '12:30', 'Eng1', '2023-01-24'),
(31, 'BA Hindi', 'Hindi1', '2023-01-24', '10:00', '12:30', 'Hindi1', '2023-01-24');

-- --------------------------------------------------------

--
-- Table structure for table `manage_website`
--

CREATE TABLE `manage_website` (
  `id` int(11) NOT NULL,
  `title` varchar(600) NOT NULL,
  `short_title` varchar(600) NOT NULL,
  `logo` text NOT NULL,
  `footer` text NOT NULL,
  `currency_code` varchar(600) NOT NULL,
  `currency_symbol` varchar(600) NOT NULL,
  `login_logo` text NOT NULL,
  `invoice_logo` text NOT NULL,
  `background_login_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `manage_website`
--

INSERT INTO `manage_website` (`id`, `title`, `short_title`, `logo`, `footer`, `currency_code`, `currency_symbol`, `login_logo`, `invoice_logo`, `background_login_image`) VALUES
(1, 'Exam Hall Management', 'EHM', 'images.jpg', 'Upturn India Technology', 'INR', 'â‚¹', 'images.jpg', '', 'background-form-login-1.png');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(30) NOT NULL,
  `type_id` int(60) NOT NULL,
  `name` varchar(30) NOT NULL,
  `strenght` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `type_id`, `name`, `strenght`) VALUES
(2, 6, 'MH001', '40'),
(3, 7, 'MAH001', '50'),
(4, 8, 'CS001', '30'),
(5, 8, 'CS002', '30'),
(6, 8, 'CS003', '30'),
(7, 9, 'civil', '55'),
(10, 10, 'A', '30');

-- --------------------------------------------------------

--
-- Table structure for table `room_type`
--

CREATE TABLE `room_type` (
  `id` int(30) NOT NULL,
  `roomname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `room_type`
--

INSERT INTO `room_type` (`id`, `roomname`) VALUES
(6, 'Mini Hall'),
(7, 'Main Hall'),
(8, 'Class Room'),
(9, 'drawing hall'),
(10, 'rosahall');

-- --------------------------------------------------------

--
-- Table structure for table `seating`
--

CREATE TABLE `seating` (
  `id` int(5) NOT NULL,
  `stud_id` varchar(100) NOT NULL,
  `exam_id` varchar(100) NOT NULL,
  `exam_date` varchar(100) NOT NULL,
  `start_time` varchar(100) NOT NULL,
  `end_time` varchar(100) NOT NULL,
  `room_id` varchar(100) NOT NULL,
  `class_id` varchar(100) NOT NULL,
  `seat_id` varchar(50) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seating`
--

INSERT INTO `seating` (`id`, `stud_id`, `exam_id`, `exam_date`, `start_time`, `end_time`, `room_id`, `class_id`, `seat_id`) VALUES
(498, 'lfeng1001', 'Eng1', '2023-01-24', '10:00', '12:30', 'rosahall', 'BA english', '2'),
(499, 'lfeng1002', 'Eng1', '2023-01-24', '10:00', '12:30', 'rosahall', 'BA english', '24'),
(500, 'lfeng1003', 'Eng1', '2023-01-24', '10:00', '12:30', 'rosahall', 'BA english', '8'),
(501, 'lfeng1004', 'Eng1', '2023-01-24', '10:00', '12:30', 'rosahall', 'BA english', '1'),
(502, 'lfeng1005', 'Eng1', '2023-01-24', '10:00', '12:30', 'rosahall', 'BA english', '10'),
(503, 'lfeng1006', 'Eng1', '2023-01-24', '10:00', '12:30', 'rosahall', 'BA english', '27'),
(504, 'lfeng1007', 'Eng1', '2023-01-24', '10:00', '12:30', 'rosahall', 'BA english', '25'),
(505, 'lfeng1008', 'Eng1', '2023-01-24', '10:00', '12:30', 'rosahall', 'BA english', '2'),
(506, 'lfeng1009', 'Eng1', '2023-01-24', '10:00', '12:30', 'rosahall', 'BA english', '10'),
(507, 'lfeng1010', 'Eng1', '2023-01-24', '10:00', '12:30', 'rosahall', 'BA english', '7'),
(508, 'lfeng1011', 'Eng1', '2023-01-24', '10:00', '12:30', 'rosahall', 'BA english', '28'),
(509, 'lfeng1012', 'Eng1', '2023-01-24', '10:00', '12:30', 'rosahall', 'BA english', '5'),
(510, 'lteng1013', 'Eng1', '2023-01-24', '10:00', '12:30', 'rosahall', 'BA english', '19'),
(511, 'lfeng1014', 'Eng1', '2023-01-24', '10:00', '12:30', 'rosahall', 'BA english', '2'),
(512, 'lfhi1001', 'Hindi1', '2023-01-24', '10:00', '12:30', 'rosahall', 'BA Hindi', '22'),
(513, 'lfhi1002', 'Hindi1', '2023-01-24', '10:00', '12:30', 'rosahall', 'BA Hindi', '21'),
(514, 'lfhi1003', 'Hindi1', '2023-01-24', '10:00', '12:30', 'rosahall', 'BA Hindi', '28'),
(515, 'lfhi1004', 'Hindi1', '2023-01-24', '10:00', '12:30', 'rosahall', 'BA Hindi', '29'),
(516, 'lfhi1005', 'Hindi1', '2023-01-24', '10:00', '12:30', 'rosahall', 'BA Hindi', '29'),
(517, 'lfhi1006', 'Hindi1', '2023-01-24', '10:00', '12:30', 'rosahall', 'BA Hindi', '25'),
(518, 'lfhi1007', 'Hindi1', '2023-01-24', '10:00', '12:30', 'rosahall', 'BA Hindi', '30'),
(519, 'lfhi1008', 'Hindi1', '2023-01-24', '10:00', '12:30', 'rosahall', 'BA Hindi', '27'),
(520, 'lfhi1009', 'Hindi1', '2023-01-24', '10:00', '12:30', 'rosahall', 'BA Hindi', '30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_class`
--

CREATE TABLE `tbl_class` (
  `id` int(30) NOT NULL,
  `classname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_class`
--

INSERT INTO `tbl_class` (`id`, `classname`) VALUES
(4, 'BCA 2nd'),
(5, 'BSC 1st'),
(6, 'BCA 1st'),
(7, 'BA EN 1st'),
(8, 'BA EN 2ND'),
(9, 'bsc cs'),
(10, 'BSC'),
(11, 'chemistry'),
(12, 'bsc maths'),
(15, 'BA english'),
(16, 'BA Hindi');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_email_config`
--

CREATE TABLE `tbl_email_config` (
  `e_id` int(21) NOT NULL,
  `name` varchar(500) NOT NULL,
  `mail_driver_host` varchar(5000) NOT NULL,
  `mail_port` int(50) NOT NULL,
  `mail_username` varchar(50) NOT NULL,
  `mail_password` varchar(30) NOT NULL,
  `mail_encrypt` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_email_config`
--

INSERT INTO `tbl_email_config` (`e_id`, `name`, `mail_driver_host`, `mail_port`, `mail_username`, `mail_password`, `mail_encrypt`) VALUES
(1, '<student register> ', 'mail.gmail.com', 587, 'ndbhalerao91@gmail.com', 'abc@123', 'sdsad');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_group`
--

CREATE TABLE `tbl_group` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_group`
--

INSERT INTO `tbl_group` (`id`, `name`, `description`) VALUES
(1, 'admin', 'admin'),
(4, 'user1', 'user1'),
(5, 'user2', 'user2'),
(6, 'user3', 'class nd sub adding'),
(7, 'user4', 'user permissin'),
(8, 'liu', 'liu');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_permission`
--

CREATE TABLE `tbl_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `display_name` varchar(200) NOT NULL,
  `operation` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_permission`
--

INSERT INTO `tbl_permission` (`id`, `name`, `display_name`, `operation`) VALUES
(1, 'manage_student', 'Manage Student', 'manage_student'),
(2, 'add_student', 'Add Student', 'add_student'),
(3, 'edit_student', 'Edit Student', 'edit_student'),
(4, 'delete_student', 'Delete Student', 'delete_student'),
(5, 'manage_teacher', 'Manage Teacher', 'manage_teacher'),
(6, 'add_teacher', 'Add Teacher', 'add_teacher'),
(7, 'edit_teacher', 'Edit Teacher', 'edit_teacher'),
(8, 'delete_teacher', 'Delete Teacher', 'delete_teacher'),
(9, 'manage_subject', 'Manage Subject', 'manage_subject'),
(10, 'add_subject', 'Add Subject', 'add_subject'),
(11, 'edit_subject', 'Edit Subject', 'edit_subject'),
(12, 'delete_subject', 'Delete Subject', 'delete_subject'),
(13, 'manage_class', 'Manage Class', 'manage_class'),
(14, 'add_class', 'Add Class', 'add_class'),
(15, 'edit_class', 'Edit Class', 'edit_class'),
(16, 'delete_class', 'Delete Class', 'delete_class'),
(21, 'manage_user', 'Manage User', 'manage_user'),
(22, 'add_user', 'Add User', 'add_user'),
(23, 'edit_user', 'Edit User', 'edit_user'),
(24, 'delete_user', 'Delete User', 'delete_user'),
(25, 'manage_exam', 'Manage Exam', 'manage_exam');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_permission_role`
--

CREATE TABLE `tbl_permission_role` (
  `id` int(30) NOT NULL,
  `permission_id` int(30) NOT NULL,
  `role_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_permission_role`
--

INSERT INTO `tbl_permission_role` (`id`, `permission_id`, `role_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(13, 13, 1),
(14, 14, 1),
(15, 15, 1),
(16, 16, 1),
(17, 17, 1),
(18, 18, 1),
(19, 19, 1),
(20, 20, 1),
(21, 21, 1),
(22, 22, 1),
(23, 23, 1),
(24, 24, 1),
(27, 25, 1),
(28, 21, 7),
(29, 22, 7),
(30, 23, 7),
(31, 24, 7),
(32, 1, 5),
(33, 2, 5),
(34, 10, 5),
(35, 14, 5),
(36, 1, 4),
(37, 5, 4),
(38, 6, 4),
(39, 9, 4),
(40, 10, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sms_config`
--

CREATE TABLE `tbl_sms_config` (
  `smsid` int(20) NOT NULL,
  `senderid` int(20) NOT NULL,
  `sms_username` varchar(30) NOT NULL,
  `sms_password` varchar(20) NOT NULL,
  `auth_key` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_sms_config`
--

INSERT INTO `tbl_sms_config` (`smsid`, `senderid`, `sms_username`, `sms_password`, `auth_key`) VALUES
(1, 101, 'username', 'password', 'authkey');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student`
--

CREATE TABLE `tbl_student` (
  `id` int(11) NOT NULL,
  `stud_id` varchar(50) NOT NULL,
  `sfname` varchar(30) NOT NULL,
  `slname` varchar(30) NOT NULL,
  `classname` varchar(30) NOT NULL,
  `semail` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `sgender` varchar(30) NOT NULL,
  `sdob` date NOT NULL,
  `scontact` int(50) NOT NULL,
  `saddress` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_student`
--

INSERT INTO `tbl_student` (`id`, `stud_id`, `sfname`, `slname`, `classname`, `semail`, `password`, `sgender`, `sdob`, `scontact`, `saddress`) VALUES
(1, '101010', 'gopi', 'krishnan', '6', 'gopi@gmail.com', '0d00cfc65e770f5e492c2376e621f7f4f7957f8e8a72169fffc04bc6f922dc89', 'Male', '2023-01-20', 2147483647, 'thrissur'),
(2, 'LFBCA1101', 'sam', 'alex', '6', 'sam@gmail.com', '6b00bda998caa05e13708f70c482046da78eb3414b904c1281bdacf12f6649da', 'Male', '2023-01-01', 2147483647, 'thrissur'),
(3, 'LFBCA1102', 'anju', 'thomas', 'BSC 1st', 'admin@gmail.com', '68d6ecae0433a80b66cff53faf33aa54c97fd16bb3dc2f10232284ab853940d4', 'Female', '2023-01-21', 2147483647, 'thrissur'),
(4, 'LFBA1001', 'test', 'abcd', 'BA EN 1st', 'test@gmail.com', 'f3e499518a6a44c49d72fdaab0cd833dcfea6e4cbcf10416e33b84d2e49ad004', 'Female', '2023-01-21', 2147483647, 'thrissur'),
(5, 'LFBA1002', 'testa', 'abcd', 'BA EN 1st', 'test1@gmail.com', 'f3e499518a6a44c49d72fdaab0cd833dcfea6e4cbcf10416e33b84d2e49ad004', 'Female', '2023-01-21', 2147483647, 'thrissur'),
(6, 'LFBA1003', 'testaa', 'abcd', 'BA EN 1st', 'test1@gmail.com', '586d8dda96739ef2e65723ad0ad750f65bca41a0bb570c0fa0f56aceba52638b', 'Male', '2023-01-15', 2147483647, 'thrissur'),
(7, 'LFBA1004', 'anu', 'a', 'BA EN 1st', 'anu@gmail.com', '920c76c652aafb1a73350659f81bd1d808d0c0dc28c83e184f248ffb22b87858', 'Female', '0022-12-26', 2147483647, 'aaaa'),
(8, 'LFBA1005', 'aparna', 'pk', 'BA EN 1st', 'aparnapk886@gmail.com', '3126753dd4b794ec5f0a64aa2e187d94a44e4418d265c7e8936d2ce3a4197652', 'Female', '1996-04-03', 2147483647, 'thrissur'),
(9, 'LFBA1006', 'rose', 'a', 'BA EN 1st', 'rose@gmail.com', '0ee6ed1587195effab91302ecd85cc1b98075923004134c9ab5805a5acf5f09b', 'Female', '2000-01-01', 1234567891, 'asdf'),
(10, 'LFBA1007', 'haritha', 'k', 'BA EN 1st', 'hari@gmail.com', '0788f51e6668fbbfae578032fde4d2fcf79e7df18a0c433e7bf587422145f281', 'Female', '2000-01-01', 1234567884, 'asdf'),
(11, 'LFBA1007', 'asd', 'q', 'BA EN 1st', 'asd@gmail.com', '5ca65280302fd62cb25843c9ad7d9f2b1a984a1146a0b834211cf57c7163c913', 'Female', '2000-02-01', 987654321, 'qwe'),
(12, 'LFBA2001', 'gopi', 'gopi', 'BA EN 2ND', 'gopi@gmail.com', '0d00cfc65e770f5e492c2376e621f7f4f7957f8e8a72169fffc04bc6f922dc89', 'Male', '2000-04-03', 2147483647, 'thrissur1'),
(13, 'LFBA2002', 'wee', 'w', 'BA EN 2ND', 'w@gmail.com', 'aef4554f6cac25ae40e5e006c16889681d4a0e1920b3e0bd8544541448e33ff3', 'Female', '0003-02-01', 1237845321, 'red'),
(14, 'LFBA2002', 'QER', 'YT', 'BA EN 2ND', 'kjhkj@gmail.com', '8b54d881533afd7caec8ba7a3c70d36093418e07e0f1a496847019fd1f0db209', 'Female', '0045-05-03', 2147483647, 'nmbh'),
(15, 'LFBA2003', 'poi', 'p', 'BA EN 2ND', 'poi@gmail.com', '37c95771ef65df3a85a8e6d3e3d46cc9ab4068f2194ea09df4f6b3c59fa36883', 'Female', '0065-05-04', 987654321, 'hgf'),
(16, 'LFBA2004', 'jh', 'g', 'BA EN 2ND', 'g@gmail.com', '9a7f9d61456efd6b0fcbedcb74f4f9b7ab57b496f9a7a8f1f1950af59c62e068', 'Female', '0004-05-06', 2147483647, 'jknm,'),
(17, 'LFBA2005f', 'ffd', 'f', 'BA EN 2ND', 'f@gmail.com', '29ae8ba91a5cd5532d04d7918e274315deeddd4caa25096f9466ddf7c769d742', 'Female', '0006-06-04', 987651234, 'gbv '),
(18, 'LFBA2006', 'jjk', 'k', 'BA EN 2ND', 'k@gmail.com', 'df4751d23f3a022a9f38a1092843590cf5ce9244929cac73c4ce42e242d27c65', 'Female', '0004-03-04', 2147483647, 'wew3er'),
(19, 'LFBA2005', 'T', 'T', 'BA EN 2ND', 't@gmail.com', '556ca75ac952754ad64d96ff25498d1a7b86b66f599b22d3c91cc760804bf163', 'Female', '0008-07-06', 2147483647, 'fff'),
(21, 'LFCS1001', 'akhil', 'PS', 'BSC', 'akhil@gmail.com', 'f8b6f7d670e1575750cb063046af499bd10406cfc8816a63d77086b96871e0be', 'Male', '2002-02-02', 2147483647, 'jsgheyh'),
(22, 'LFCS1003', 'AKHILA', 'CA', 'BSC', 'akhila@gmail.com', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', 'Female', '2022-02-06', 2147483647, 'dfssfa'),
(24, 'LFCS1004', 'MEENA', 'FH', 'BSC', 'meena@gmail.com', '1511476083119948bd34613819d059087b6dcd2a82198b723ed5217d6c6dc31f', 'Female', '2002-05-04', 2147483647, 'fghf'),
(50, 'lfeng1001', 'anu', 'g', 'BA english', 'anu@gmail.com', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', 'Female', '2023-01-20', 1234567891, 'asdfghjk'),
(51, 'lfeng1002', 'akhil', 's', 'BA english', 'akil@gmail.com', '0aefaf76154859002c9db8542bbefe60caca45ccef0a6a79634bae0edafdfa27', 'Male', '2023-01-27', 2147483647, 'asdfghj'),
(52, 'lfeng1003', 'abi', 'd', 'BA english', 'abi@gmail.com', '2367a4654f70a4f756521b4d112945f6544c61a60abf84fb3bc4e9d185e563a6', 'Male', '2023-01-19', 2147483647, 'asdfty'),
(53, 'lfeng1004', 'babu', 'r', 'BA english', 'babu@gmail.com', '0aefaf76154859002c9db8542bbefe60caca45ccef0a6a79634bae0edafdfa27', 'Female', '2023-01-20', 2147483647, 'wdergthy'),
(54, 'lfeng1005', 'kiran', 's', 'BA english', 'kiran@gmail.com', '50304a7b51afe8f339630ea7cb43a3b1fbde8287169eaba9d69f8ed3a292751d', 'Female', '2023-01-15', 2147483647, 'asdfghj'),
(55, 'lfeng1006', 'lachu', 'w', 'BA english', 'lachu@gmail.com', 'cd36ef7b63327f2013cc95f1bdd69dfc90ec3dd437f4b5ab96ecb3972dc4f4b6', 'Female', '2023-01-27', 2147483647, 'asfdgfh'),
(56, 'lfeng1007', 'ammu', 'l', 'BA english', 'ammu@gmail.com', 'b7e9065cd30d21018dd60f6615eebb433bf1b35455c32823d3b4bb6e8dfe0af8', 'Female', '2023-01-28', 2147483647, 'asdfgh'),
(57, 'lfeng1008', 'kichu', 'l', 'BA english', 'kichu@gmail.com', '0aefaf76154859002c9db8542bbefe60caca45ccef0a6a79634bae0edafdfa27', 'Female', '2023-01-27', 1234567897, 'asdfghj'),
(58, 'lfeng1009', 'yadhu', 'h', 'BA english', 'yadhu@gmail.com', '0aefaf76154859002c9db8542bbefe60caca45ccef0a6a79634bae0edafdfa27', 'Male', '2023-01-28', 2147483647, 'asdfgh'),
(59, 'lfeng1010', 'appu', 'ar', 'BA english', 'appu@gmail.com', 'd8bc8f31ebb7c7bc50c033f8290bf427704563fe2a79fda4cb17c1d4acacba8a', 'Male', '2023-01-08', 2147483647, 'dsfghasdf'),
(60, 'lfhi1001', 'karan', 'a', 'BA Hindi', 'karan@gmail.com', '01aa7c223dea2b3716e60770e2cb70a6e7ae79665e933b5f7bb31eb50d8c4ef5', 'Male', '2023-01-14', 2147483647, 'asdfgh'),
(61, 'lfhi1002', 'pooja', 'a', 'BA Hindi', 'pooja@gmail.com', 'ade27de72c7d5ceb75e4de34626cdd3db1e8417597dd8939db4ebb67b3b17ba9', 'Female', '2023-01-14', 2147483647, 'asdfg'),
(62, 'lfhi1003', 'unni', 'a', 'BA Hindi', 'uni@gmail.com', '3800a3b539c1983b19df1848dae19b3518418c7aaabcef8ec1d5cc94262ecb38', 'Male', '2023-01-14', 2147483647, 'asdfgh'),
(63, 'lfhi1004', 'abi', 'rl', 'BA Hindi', 'abi@gmail.com', 'b7e9065cd30d21018dd60f6615eebb433bf1b35455c32823d3b4bb6e8dfe0af8', 'Male', '2006-04-07', 2147483647, 'asdgfh'),
(64, 'lfhi1005', 'appuni', 's', 'BA Hindi', 'appu@gmail.com', 'b3bed777d226ee6e8f4250a99ca33028e3ab07bb1eb241ed8f92968f7a121bb1', 'Male', '2023-01-08', 2147483647, 'dsfghasdf'),
(65, 'lfhi1006', 'kochu', 'e', 'BA Hindi', 'kochu@gmail.com', '766a252f1de5c3058ad4969c9787aaba1742df20a85e36628d925535e03923b2', 'Male', '2023-01-28', 2147483647, 'sfdf'),
(66, 'lfhi1007', 'laly', 'r', 'BA Hindi', 'laly@gmail.com', 'b3bed777d226ee6e8f4250a99ca33028e3ab07bb1eb241ed8f92968f7a121bb1', 'Female', '2023-01-21', 2147483647, 'asdfg'),
(68, 'lfhi1008', 'ramshi', 'l', 'BA Hindi', 'rams@gmail.com', 'cd36ef7b63327f2013cc95f1bdd69dfc90ec3dd437f4b5ab96ecb3972dc4f4b6', 'Female', '2023-01-08', 2147483647, 'sdsfgg'),
(69, 'lfhi1009', 'kichu', 'q', 'BA Hindi', 'kichu@gmail.com', '48576b9b297ca2624bbd6db908acf7f22b356d137480745cb3b483e06d9026b6', 'Male', '2023-01-15', 1234567897, 'asdfghj'),
(70, 'lfhi1010', 'kanaka', 'w', 'BA Hindi', 'kanak@gmail.com', '4ee22d99fbe8804d97261aa9233f65b83fe676dd55945fcdb4be3583d5dfe05a', 'Female', '2023-01-15', 2147483647, 'sdfg'),
(71, 'lfeng1011', 'manu', 'h', 'BA english', 'manu@gmail.com', 'c1bbd37dc82ccb8f4c2ada76e5f42dbf6b0c36a759f25c6c0e9163d7b37fb778', 'Male', '2023-01-19', 2147483647, 'jhgf'),
(72, 'lfeng1012', 'kanmani', 'p', 'BA english', 'kanak@gmail.com', '2367a4654f70a4f756521b4d112945f6544c61a60abf84fb3bc4e9d185e563a6', 'Female', '2023-01-26', 2147483647, 'ghfghj'),
(73, 'lteng1013', 'punya', 'j', 'BA english', 'punya@gmail.com', 'bb05e1b44e2ef6df73f5caa507635d6afac6ef7167793a89e360968f23d443ca', 'Female', '2023-01-19', 2147483647, 'SDGFHGJHKJ'),
(74, 'lfeng1014', 'nandhu', 'g', 'BA english', 'nan@gmail.com', '8b54d881533afd7caec8ba7a3c70d36093418e07e0f1a496847019fd1f0db209', 'Male', '2023-01-20', 2147483647, 'dfgh');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subject`
--

CREATE TABLE `tbl_subject` (
  `id` int(30) NOT NULL,
  `class_id` varchar(60) NOT NULL,
  `subjectname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_subject`
--

INSERT INTO `tbl_subject` (`id`, `class_id`, `subjectname`) VALUES
(32, 'BA english', 'Eng1'),
(33, 'BA Hindi', 'Hindi1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_teacher`
--

CREATE TABLE `tbl_teacher` (
  `id` int(50) NOT NULL,
  `tfname` varchar(50) NOT NULL,
  `tlname` varchar(50) NOT NULL,
  `classname` varchar(30) NOT NULL,
  `subjectname` varchar(50) NOT NULL,
  `temail` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `tgender` varchar(50) NOT NULL,
  `tdob` date NOT NULL,
  `tcontact` int(50) NOT NULL,
  `taddress` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_teacher`
--

INSERT INTO `tbl_teacher` (`id`, `tfname`, `tlname`, `classname`, `subjectname`, `temail`, `password`, `tgender`, `tdob`, `tcontact`, `taddress`) VALUES
(1, 'aparna', 'pk', '1', '1', 'aparnapk886@gmail.com', 'a3bdadea10cdc005c57c82b42d246b8036811c5aba73e782e63fbf3f53eb3a23', 'Female', '2023-01-01', 2147483647, 'thrissur'),
(2, 'anu', 'g', '15', 'Eng1', 'anu@gmail.com', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', 'Female', '2023-01-24', 1234567891, 'asdfghjk');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `allot`
--
ALTER TABLE `allot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `allot_student`
--
ALTER TABLE `allot_student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manage_website`
--
ALTER TABLE `manage_website`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_type`
--
ALTER TABLE `room_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seating`
--
ALTER TABLE `seating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_class`
--
ALTER TABLE `tbl_class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_email_config`
--
ALTER TABLE `tbl_email_config`
  ADD PRIMARY KEY (`e_id`);

--
-- Indexes for table `tbl_group`
--
ALTER TABLE `tbl_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_permission`
--
ALTER TABLE `tbl_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_permission_role`
--
ALTER TABLE `tbl_permission_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sms_config`
--
ALTER TABLE `tbl_sms_config`
  ADD PRIMARY KEY (`smsid`);

--
-- Indexes for table `tbl_student`
--
ALTER TABLE `tbl_student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_subject`
--
ALTER TABLE `tbl_subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_teacher`
--
ALTER TABLE `tbl_teacher`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `allot`
--
ALTER TABLE `allot`
  MODIFY `id` int(60) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `allot_student`
--
ALTER TABLE `allot_student`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `id` int(60) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `manage_website`
--
ALTER TABLE `manage_website`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `room_type`
--
ALTER TABLE `room_type`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `seating`
--
ALTER TABLE `seating`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=521;

--
-- AUTO_INCREMENT for table `tbl_class`
--
ALTER TABLE `tbl_class`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_email_config`
--
ALTER TABLE `tbl_email_config`
  MODIFY `e_id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_group`
--
ALTER TABLE `tbl_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_permission`
--
ALTER TABLE `tbl_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tbl_permission_role`
--
ALTER TABLE `tbl_permission_role`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tbl_sms_config`
--
ALTER TABLE `tbl_sms_config`
  MODIFY `smsid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_student`
--
ALTER TABLE `tbl_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `tbl_subject`
--
ALTER TABLE `tbl_subject`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tbl_teacher`
--
ALTER TABLE `tbl_teacher`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
