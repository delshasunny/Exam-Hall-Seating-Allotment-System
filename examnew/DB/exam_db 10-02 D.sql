-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2023 at 01:50 PM
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
-- Database: `exam_db`
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
(1, 'admin', 'admin@gmail.com', 'admin', 'admin', 'LF', 'Male', '1988-05-29', '1234567889', 'Guruvayur', 'custombrown.jpg', '2023-01-16', 1);

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
  `added_date` date NOT NULL,
  `is_mix_needed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`id`, `class_id`, `subject_id`, `exam_date`, `start_time`, `end_time`, `name`, `added_date`, `is_mix_needed`) VALUES
(44, '41', '53', '2023-02-11', '10:00', '12:30', 'FIRST SEMESTER EXAMINATION FEB 2023', '2023-02-11', 1),
(45, '47', '42', '2023-02-11', '10:00', '12:30', 'FIRST SEMESTER EXAMINATION FEB 2023', '2023-02-11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam_details`
--

CREATE TABLE `exam_details` (
  `exam_details_id` int(11) NOT NULL,
  `exam_summary_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `exam_date` date NOT NULL,
  `exam_start` time NOT NULL,
  `exam_end` time NOT NULL,
  `room_id` int(11) NOT NULL DEFAULT 0,
  `seat_no` int(11) NOT NULL DEFAULT 0,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exam_details`
--

INSERT INTO `exam_details` (`exam_details_id`, `exam_summary_id`, `exam_id`, `exam_date`, `exam_start`, `exam_end`, `room_id`, `seat_no`, `student_id`) VALUES
(260, 44, 42, '2023-02-11', '10:00:00', '11:30:00', 11, 51, 53),
(261, 44, 42, '2023-02-11', '10:00:00', '11:30:00', 11, 53, 54),
(262, 44, 42, '2023-02-11', '10:00:00', '11:30:00', 11, 55, 55),
(263, 44, 42, '2023-02-11', '10:00:00', '11:30:00', 11, 57, 56),
(264, 44, 42, '2023-02-11', '10:00:00', '11:30:00', 11, 59, 57),
(265, 44, 42, '2023-02-11', '10:00:00', '11:30:00', 11, 61, 58),
(266, 44, 42, '2023-02-11', '10:00:00', '11:30:00', 11, 63, 59),
(267, 44, 42, '2023-02-11', '10:00:00', '11:30:00', 11, 65, 60),
(268, 44, 42, '2023-02-11', '10:00:00', '11:30:00', 11, 67, 61),
(269, 44, 42, '2023-02-11', '10:00:00', '11:30:00', 11, 69, 62),
(270, 44, 42, '2023-02-11', '10:00:00', '11:30:00', 11, 71, 63),
(271, 44, 42, '2023-02-11', '10:00:00', '11:30:00', 11, 73, 64),
(272, 44, 42, '2023-02-11', '10:00:00', '11:30:00', 11, 75, 65),
(273, 44, 42, '2023-02-11', '10:00:00', '11:30:00', 11, 77, 66),
(274, 44, 42, '2023-02-11', '10:00:00', '11:30:00', 11, 79, 68),
(275, 44, 42, '2023-02-11', '10:00:00', '11:30:00', 11, 81, 69),
(276, 44, 42, '2023-02-11', '10:00:00', '11:30:00', 11, 83, 70),
(277, 44, 42, '2023-02-11', '10:00:00', '11:30:00', 11, 85, 71),
(278, 44, 42, '2023-02-11', '10:00:00', '11:30:00', 11, 87, 72),
(279, 44, 42, '2023-02-11', '10:00:00', '11:30:00', 11, 89, 73),
(280, 44, 42, '2023-02-11', '10:00:00', '11:30:00', 11, 91, 74);

-- --------------------------------------------------------

--
-- Table structure for table `exam_summary`
--

CREATE TABLE `exam_summary` (
  `exam_summary_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `exam_date` date NOT NULL,
  `exam_room_id` int(11) NOT NULL,
  `exam_teacher_id` int(11) NOT NULL,
  `exam_start` time NOT NULL,
  `exam_end` time NOT NULL,
  `is_mix_needed` tinyint(1) NOT NULL DEFAULT 0,
  `strength_status` int(11) NOT NULL,
  `start_seat_number` int(11) NOT NULL,
  `end_seat_number` int(11) NOT NULL,
  `used_count` int(11) NOT NULL,
  `balance_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `name` varchar(100) NOT NULL,
  `strength1` int(10) NOT NULL DEFAULT 0,
  `strength2` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `name`, `strength1`, `strength2`) VALUES
(14, '101', 11, 20);

-- --------------------------------------------------------

--
-- Table structure for table `room_type`
--

CREATE TABLE `room_type` (
  `id` int(30) NOT NULL,
  `roomname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `tbl_class`
--

CREATE TABLE `tbl_class` (
  `id` int(30) NOT NULL,
  `classname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_class`
--

INSERT INTO `tbl_class` (`id`, `classname`) VALUES
(1, 'BA ENGLISH SEMESTER I'),
(2, 'BA ENGLISH SEMESTER II'),
(24, 'BA ENGLISH SEMESTER III'),
(25, 'BA ENGLISH SEMESTER IV'),
(26, 'BA ENGLISH SEMESTER V'),
(27, 'BA ENGLISH SEMESTER VI'),
(28, 'BA HINDI SEMESTER I'),
(29, 'BA HINDI SEMESTER II'),
(30, 'BA HINDI SEMESTER III'),
(31, 'BA HINDI SEMESTER IV'),
(32, 'BA HINDI SEMESTER V'),
(33, 'BA HINDI SEMESTER VI'),
(34, 'BA MALAYALAM SEMESTER I'),
(35, 'BA MALAYALAM SEMESTER II'),
(37, 'BA MALAYALAM SEMESTER III'),
(38, 'BA MALAYALAM SEMESTER IV'),
(39, 'BA MALAYALAM SEMESTER V'),
(40, 'BA MALAYALAM SEMESTER VI'),
(41, 'BSC MATHEMATICS SEMESTER I'),
(42, 'BSC MATHEMATICS SEMESTER II'),
(43, 'BSC MATHEMATICS SEMESTER III'),
(44, 'BSC MATHEMATICS SEMESTER VI'),
(45, 'BSC MATHEMATICS SEMESTER IV'),
(46, 'BSC MATHEMATICS SEMESTER V'),
(47, 'BSC COMPUTER SCIENCE SEMESTER I'),
(48, 'BSC COMPUTER SCIENCE SEMESTER II'),
(49, 'BSC COMPUTER SCIENCE SEMESTER III'),
(50, 'BSC COMPUTER SCIENCE SEMESTER IV'),
(51, 'BSC COMPUTER SCIENCE SEMESTER V'),
(52, 'BSC COMPUTER SCIENCE SEMESTER VI');

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
  `sfname` varchar(100) NOT NULL,
  `password` varchar(500) NOT NULL,
  `sdob` date NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_student`
--

INSERT INTO `tbl_student` (`id`, `stud_id`, `sfname`, `password`, `sdob`, `course_id`) VALUES
(78, 'LFCS101', 'abi', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-01', 47),
(79, 'LFCS102', 'kichu', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-01', 47),
(80, 'LFCS103', 'ramshi', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-13', 47),
(81, 'LFCS104', 'meen', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-01', 47),
(82, 'LFCS105', 'anu', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-09', 47),
(83, 'LFCS106', 'akhil', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-13', 47),
(84, 'LFCS107', 'babu', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-01', 47),
(85, 'LFCS108', 'kiran', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-08', 47),
(86, 'LFCS109', 'lachu', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-05', 47),
(87, 'LFCS110', 'ammu', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-05', 47),
(88, 'LFCS111', 'yadhu', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-06', 47),
(89, 'LFCS112', 'appu', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-05', 47),
(90, 'LFCS113', 'karan', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-12', 47),
(91, 'LFCS114', 'pooja', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-06', 47),
(92, 'LFCS115', 'unni', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-06', 47),
(93, 'LFCS116', 'appuni', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-20', 47),
(94, 'LFCS117', 'kochu', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-16', 47),
(95, 'LFCS119', 'manu', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-04', 47),
(96, 'LFCS118', 'kanaka', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-07', 47),
(97, 'LFCS120', 'punya', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-09', 47),
(98, 'LFMATH101', 'nandhu', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-11', 41),
(99, 'LFMATH102', 'punya', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-12', 41),
(100, 'LFMATH103', 'kanmani', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-18', 41),
(101, 'LFMATH104', 'nandhu', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-01', 41),
(102, 'LFMATH105', 'laly', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-11', 41),
(103, 'LFMATH106', 'punya', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-01', 41),
(104, 'LFMATH107', 'kanaka', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-13', 41),
(105, 'LFMATH108', 'neethi', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-13', 41),
(106, 'LFMATH109', 'neethu', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-01', 41),
(107, 'LFMATH110', 'kukki', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-13', 41),
(108, 'LFMATH111', 'cichu', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-01', 41);

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
(38, '47', 'ENGLISH 1'),
(39, '47', 'HINDI'),
(40, '47', 'MALAYALAM'),
(41, '47', 'ENGLISH 2'),
(42, '47', 'COMPUTER FUNDAMENTALS & HTML'),
(43, '47', 'COMPLEMENTARY MATHEMATICS I'),
(44, '47', 'COMPLEMENTARY PHYSICS I'),
(46, '41', 'ENGLISH 1'),
(47, '41', 'ENGLISH 2'),
(48, '41', 'HINDI'),
(49, '41', 'MALAYALAM'),
(51, '41', 'COMPLEMENTARY PHYSICS I'),
(52, '41', 'COMPLEMENTARY CHEMISTRY I'),
(53, '41', 'BASIC LOGIC AND NUMBER THEORY');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_teacher`
--

CREATE TABLE `tbl_teacher` (
  `id` int(50) NOT NULL,
  `tfname` varchar(50) NOT NULL,
  `temail` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `tdob` date NOT NULL,
  `tcontact` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_teacher`
--

INSERT INTO `tbl_teacher` (`id`, `tfname`, `temail`, `password`, `tdob`, `tcontact`) VALUES
(4, 'anu', 'anu@gmail.com', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-17', 2147483647),
(5, 'sunitha', 'sunitha@gmail.com', '0390024610415f44c9d5ca4a01dd96bb09fc95e6450bfd740a9a4cf4abcc8130', '2023-02-20', 2147483647);

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
-- Indexes for table `exam_details`
--
ALTER TABLE `exam_details`
  ADD PRIMARY KEY (`exam_details_id`);

--
-- Indexes for table `exam_summary`
--
ALTER TABLE `exam_summary`
  ADD PRIMARY KEY (`exam_summary_id`);

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
  MODIFY `id` int(60) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `allot_student`
--
ALTER TABLE `allot_student`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `id` int(60) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `exam_details`
--
ALTER TABLE `exam_details`
  MODIFY `exam_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281;

--
-- AUTO_INCREMENT for table `exam_summary`
--
ALTER TABLE `exam_summary`
  MODIFY `exam_summary_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `manage_website`
--
ALTER TABLE `manage_website`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `room_type`
--
ALTER TABLE `room_type`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `seating`
--
ALTER TABLE `seating`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=589;

--
-- AUTO_INCREMENT for table `tbl_class`
--
ALTER TABLE `tbl_class`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `tbl_subject`
--
ALTER TABLE `tbl_subject`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `tbl_teacher`
--
ALTER TABLE `tbl_teacher`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
