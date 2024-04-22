/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.9 : Database - python_corestudents_performance_prediction
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`python_corestudents_performance_prediction` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `python_corestudents_performance_prediction`;

/*Table structure for table `applications` */

DROP TABLE IF EXISTS `applications`;

CREATE TABLE `applications` (
  `application_id` int(11) NOT NULL AUTO_INCREMENT,
  `placement_details_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `resume` varchar(500) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `applications` */

insert  into `applications`(`application_id`,`placement_details_id`,`student_id`,`resume`,`date`,`status`) values 
(1,1,1,'static/198b7322-f2d3-4943-97e1-d4a6716ef963SFG-2024-Level-2-Test-14-QP-Eng.pdf','2024-04-04','pending');

/*Table structure for table `assign_subjects` */

DROP TABLE IF EXISTS `assign_subjects`;

CREATE TABLE `assign_subjects` (
  `assign_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`assign_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `assign_subjects` */

insert  into `assign_subjects`(`assign_id`,`staff_id`,`subject_id`) values 
(1,1,1),
(2,2,4);

/*Table structure for table `companies` */

DROP TABLE IF EXISTS `companies`;

CREATE TABLE `companies` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `cell_id` int(11) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `place` varchar(70) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `companies` */

insert  into `companies`(`company_id`,`cell_id`,`company_name`,`place`,`address`) values 
(1,1,'Digital Dynamics Pvt. Ltd.','thrissur','123, Park Streetlknshutgyv'),
(2,1,'infoTech','Ernakulam','cochin');

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `hod_id` int(11) DEFAULT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `course` */

insert  into `course`(`course_id`,`hod_id`,`course_name`) values 
(1,1,'Computer Science'),
(2,1,'system softwares');

/*Table structure for table `doubts` */

DROP TABLE IF EXISTS `doubts`;

CREATE TABLE `doubts` (
  `doubt_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `doubt` varchar(500) DEFAULT NULL,
  `reply` varchar(500) DEFAULT NULL,
  `date_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`doubt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `doubts` */

insert  into `doubts`(`doubt_id`,`student_id`,`staff_id`,`doubt`,`reply`,`date_time`) values 
(1,1,1,'hloo','pending','2024-04-04 11:12:30');

/*Table structure for table `emotions` */

DROP TABLE IF EXISTS `emotions`;

CREATE TABLE `emotions` (
  `emotions_id` int(11) NOT NULL AUTO_INCREMENT,
  `assign_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `emotions` varchar(100) DEFAULT NULL,
  `emotions_score` int(11) DEFAULT NULL,
  `date` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`emotions_id`)
) ENGINE=MyISAM AUTO_INCREMENT=638 DEFAULT CHARSET=latin1;

/*Data for the table `emotions` */

insert  into `emotions`(`emotions_id`,`assign_id`,`student_id`,`emotions`,`emotions_score`,`date`) values 
(1,1,1,'angry',2,'2024-04-04'),
(2,1,1,'neutral',4,'2024-04-04'),
(3,1,1,'neutral',4,'2024-04-04'),
(4,1,1,'neutral',4,'2024-04-04'),
(5,1,1,'neutral',4,'2024-04-04'),
(6,1,1,'neutral',4,'2024-04-04'),
(7,1,1,'neutral',4,'2024-04-04'),
(8,1,1,'neutral',4,'2024-04-04'),
(9,1,1,'neutral',4,'2024-04-04'),
(10,1,1,'neutral',4,'2024-04-04'),
(11,1,1,'neutral',4,'2024-04-04'),
(12,1,1,'neutral',4,'2024-04-04'),
(13,1,1,'neutral',4,'2024-04-04'),
(14,1,1,'sad',1,'2024-04-04'),
(15,1,1,'sad',1,'2024-04-04'),
(16,1,1,'sad',1,'2024-04-04'),
(17,1,1,'neutral',4,'2024-04-04'),
(18,1,1,'neutral',4,'2024-04-04'),
(19,1,1,'neutral',4,'2024-04-04'),
(20,1,1,'fear',1,'2024-04-04'),
(21,1,1,'sad',1,'2024-04-04'),
(22,1,1,'fear',1,'2024-04-04'),
(23,1,1,'fear',1,'2024-04-04'),
(24,1,1,'neutral',4,'2024-04-04'),
(25,1,1,'sad',1,'2024-04-04'),
(26,1,1,'sad',1,'2024-04-04'),
(27,1,1,'sad',1,'2024-04-04'),
(28,1,1,'neutral',4,'2024-04-04'),
(29,1,1,'sad',1,'2024-04-04'),
(30,1,1,'sad',1,'2024-04-04'),
(31,1,1,'sad',1,'2024-04-04'),
(32,1,1,'sad',1,'2024-04-04'),
(33,1,1,'sad',1,'2024-04-04'),
(34,1,1,'neutral',4,'2024-04-04'),
(35,1,1,'sad',1,'2024-04-04'),
(36,1,1,'sad',1,'2024-04-04'),
(37,1,1,'sad',1,'2024-04-04'),
(38,1,1,'sad',1,'2024-04-04'),
(39,1,1,'sad',1,'2024-04-04'),
(40,1,1,'neutral',4,'2024-04-04'),
(41,1,1,'sad',1,'2024-04-04'),
(42,1,1,'sad',1,'2024-04-04'),
(43,1,1,'sad',1,'2024-04-04'),
(44,1,1,'sad',1,'2024-04-04'),
(45,1,1,'sad',1,'2024-04-04'),
(46,1,1,'sad',1,'2024-04-04'),
(47,1,1,'sad',1,'2024-04-04'),
(48,1,1,'neutral',4,'2024-04-04'),
(49,1,1,'sad',1,'2024-04-04'),
(50,1,1,'neutral',4,'2024-04-04'),
(51,1,1,'sad',1,'2024-04-04'),
(52,1,1,'sad',1,'2024-04-04'),
(53,1,1,'sad',1,'2024-04-04'),
(54,1,1,'neutral',4,'2024-04-04'),
(55,1,1,'neutral',4,'2024-04-04'),
(56,1,1,'sad',1,'2024-04-04'),
(57,1,1,'sad',1,'2024-04-04'),
(58,1,1,'neutral',4,'2024-04-04'),
(59,1,1,'neutral',4,'2024-04-04'),
(60,1,1,'sad',1,'2024-04-04'),
(61,1,1,'sad',1,'2024-04-04'),
(62,1,1,'sad',1,'2024-04-04'),
(63,1,1,'sad',1,'2024-04-04'),
(64,1,1,'sad',1,'2024-04-04'),
(65,1,1,'neutral',4,'2024-04-04'),
(66,1,1,'sad',1,'2024-04-04'),
(67,1,1,'sad',1,'2024-04-04'),
(68,1,1,'fear',1,'2024-04-04'),
(69,1,1,'sad',1,'2024-04-04'),
(70,1,1,'neutral',4,'2024-04-04'),
(71,1,1,'neutral',4,'2024-04-04'),
(72,1,1,'neutral',4,'2024-04-04'),
(73,1,1,'neutral',4,'2024-04-04'),
(74,1,1,'sad',1,'2024-04-04'),
(75,1,1,'sad',1,'2024-04-04'),
(76,1,1,'neutral',4,'2024-04-04'),
(77,1,1,'neutral',4,'2024-04-04'),
(78,1,1,'neutral',4,'2024-04-04'),
(79,1,1,'neutral',4,'2024-04-04'),
(80,1,1,'neutral',4,'2024-04-04'),
(81,1,1,'neutral',4,'2024-04-04'),
(82,1,1,'neutral',4,'2024-04-04'),
(83,1,1,'neutral',4,'2024-04-04'),
(84,1,1,'neutral',4,'2024-04-04'),
(85,1,1,'neutral',4,'2024-04-04'),
(86,1,1,'neutral',4,'2024-04-04'),
(87,1,1,'neutral',4,'2024-04-04'),
(88,1,1,'neutral',4,'2024-04-04'),
(89,1,1,'neutral',4,'2024-04-04'),
(90,1,1,'sad',1,'2024-04-04'),
(91,1,1,'neutral',4,'2024-04-04'),
(92,1,1,'neutral',4,'2024-04-04'),
(93,1,1,'neutral',4,'2024-04-04'),
(94,1,1,'neutral',4,'2024-04-04'),
(95,1,1,'neutral',4,'2024-04-04'),
(96,1,1,'neutral',4,'2024-04-04'),
(97,1,1,'neutral',4,'2024-04-04'),
(98,1,1,'neutral',4,'2024-04-04'),
(99,1,1,'neutral',4,'2024-04-04'),
(100,1,1,'neutral',4,'2024-04-04'),
(101,1,1,'neutral',4,'2024-04-04'),
(102,1,1,'neutral',4,'2024-04-04'),
(103,1,1,'neutral',4,'2024-04-04'),
(104,1,1,'neutral',4,'2024-04-04'),
(105,1,1,'neutral',4,'2024-04-04'),
(106,1,1,'neutral',4,'2024-04-04'),
(107,1,1,'neutral',4,'2024-04-04'),
(108,1,1,'neutral',4,'2024-04-04'),
(109,1,1,'neutral',4,'2024-04-04'),
(110,1,1,'neutral',4,'2024-04-04'),
(111,1,1,'neutral',4,'2024-04-04'),
(112,1,1,'neutral',4,'2024-04-04'),
(113,1,1,'neutral',4,'2024-04-04'),
(114,1,1,'neutral',4,'2024-04-04'),
(115,1,1,'neutral',4,'2024-04-04'),
(116,1,1,'neutral',4,'2024-04-04'),
(117,1,1,'neutral',4,'2024-04-04'),
(118,1,1,'neutral',4,'2024-04-04'),
(119,1,1,'neutral',4,'2024-04-04'),
(120,1,1,'neutral',4,'2024-04-04'),
(121,1,1,'neutral',4,'2024-04-04'),
(122,1,1,'neutral',4,'2024-04-04'),
(123,1,1,'neutral',4,'2024-04-04'),
(124,1,1,'neutral',4,'2024-04-04'),
(125,1,1,'neutral',4,'2024-04-04'),
(126,1,1,'neutral',4,'2024-04-04'),
(127,1,1,'neutral',4,'2024-04-04'),
(128,1,1,'neutral',4,'2024-04-04'),
(129,1,1,'neutral',4,'2024-04-04'),
(130,1,1,'neutral',4,'2024-04-04'),
(131,1,1,'neutral',4,'2024-04-04'),
(132,1,1,'neutral',4,'2024-04-04'),
(133,1,1,'neutral',4,'2024-04-04'),
(134,1,1,'neutral',4,'2024-04-04'),
(135,1,1,'neutral',4,'2024-04-04'),
(136,1,1,'neutral',4,'2024-04-04'),
(137,1,1,'fear',1,'2024-04-04'),
(138,1,1,'neutral',4,'2024-04-04'),
(139,1,1,'neutral',4,'2024-04-04'),
(140,1,1,'neutral',4,'2024-04-04'),
(141,1,1,'fear',1,'2024-04-04'),
(142,1,1,'neutral',4,'2024-04-04'),
(143,1,1,'neutral',4,'2024-04-04'),
(144,1,1,'sad',1,'2024-04-04'),
(145,1,1,'neutral',4,'2024-04-04'),
(146,1,1,'neutral',4,'2024-04-04'),
(147,1,1,'neutral',4,'2024-04-04'),
(148,1,1,'neutral',4,'2024-04-04'),
(149,1,1,'neutral',4,'2024-04-04'),
(150,1,1,'neutral',4,'2024-04-04'),
(151,1,1,'neutral',4,'2024-04-04'),
(152,1,1,'neutral',4,'2024-04-04'),
(153,1,1,'neutral',4,'2024-04-04'),
(154,1,1,'neutral',4,'2024-04-04'),
(155,1,1,'neutral',4,'2024-04-04'),
(156,1,1,'neutral',4,'2024-04-04'),
(157,1,1,'neutral',4,'2024-04-04'),
(158,1,1,'neutral',4,'2024-04-04'),
(159,1,1,'neutral',4,'2024-04-04'),
(160,1,1,'neutral',4,'2024-04-04'),
(161,1,1,'neutral',4,'2024-04-04'),
(162,1,1,'neutral',4,'2024-04-04'),
(163,1,1,'neutral',4,'2024-04-04'),
(164,1,1,'neutral',4,'2024-04-04'),
(165,1,1,'neutral',4,'2024-04-04'),
(166,1,1,'neutral',4,'2024-04-04'),
(167,1,1,'neutral',4,'2024-04-04'),
(168,1,1,'neutral',4,'2024-04-04'),
(169,1,1,'neutral',4,'2024-04-04'),
(170,1,1,'neutral',4,'2024-04-04'),
(171,1,1,'neutral',4,'2024-04-04'),
(172,1,1,'neutral',4,'2024-04-04'),
(173,1,1,'neutral',4,'2024-04-04'),
(174,1,1,'neutral',4,'2024-04-04'),
(175,1,1,'neutral',4,'2024-04-04'),
(176,1,1,'neutral',4,'2024-04-04'),
(177,1,1,'neutral',4,'2024-04-04'),
(178,1,1,'neutral',4,'2024-04-04'),
(179,1,1,'neutral',4,'2024-04-04'),
(180,1,1,'neutral',4,'2024-04-04'),
(181,1,1,'neutral',4,'2024-04-04'),
(182,1,1,'sad',1,'2024-04-04'),
(183,1,1,'neutral',4,'2024-04-04'),
(184,1,1,'neutral',4,'2024-04-04'),
(185,1,1,'neutral',4,'2024-04-04'),
(186,1,1,'neutral',4,'2024-04-04'),
(187,1,1,'neutral',4,'2024-04-04'),
(188,1,1,'neutral',4,'2024-04-04'),
(189,1,1,'neutral',4,'2024-04-04'),
(190,1,1,'neutral',4,'2024-04-04'),
(191,1,1,'neutral',4,'2024-04-04'),
(192,1,1,'neutral',4,'2024-04-04'),
(193,1,1,'neutral',4,'2024-04-04'),
(194,1,1,'neutral',4,'2024-04-04'),
(195,1,1,'neutral',4,'2024-04-04'),
(196,1,1,'neutral',4,'2024-04-04'),
(197,1,1,'neutral',4,'2024-04-04'),
(198,1,1,'neutral',4,'2024-04-04'),
(199,1,1,'neutral',4,'2024-04-04'),
(200,1,1,'neutral',4,'2024-04-04'),
(201,1,1,'fear',1,'2024-04-04'),
(202,1,1,'neutral',4,'2024-04-04'),
(203,1,1,'neutral',4,'2024-04-04'),
(204,1,1,'neutral',4,'2024-04-04'),
(205,1,1,'neutral',4,'2024-04-04'),
(206,1,1,'neutral',4,'2024-04-04'),
(207,1,1,'neutral',4,'2024-04-04'),
(208,1,1,'neutral',4,'2024-04-04'),
(209,1,1,'neutral',4,'2024-04-04'),
(210,1,1,'neutral',4,'2024-04-04'),
(211,1,1,'neutral',4,'2024-04-04'),
(212,1,1,'neutral',4,'2024-04-04'),
(213,1,1,'sad',1,'2024-04-04'),
(214,1,1,'neutral',4,'2024-04-04'),
(215,1,1,'neutral',4,'2024-04-04'),
(216,1,1,'neutral',4,'2024-04-04'),
(217,1,1,'neutral',4,'2024-04-04'),
(218,1,1,'neutral',4,'2024-04-04'),
(219,1,1,'neutral',4,'2024-04-04'),
(220,1,1,'neutral',4,'2024-04-04'),
(221,1,1,'neutral',4,'2024-04-04'),
(222,1,1,'neutral',4,'2024-04-04'),
(223,1,1,'neutral',4,'2024-04-04'),
(224,1,1,'neutral',4,'2024-04-04'),
(225,1,1,'neutral',4,'2024-04-04'),
(226,1,1,'neutral',4,'2024-04-04'),
(227,1,1,'neutral',4,'2024-04-04'),
(228,1,1,'neutral',4,'2024-04-04'),
(229,1,1,'neutral',4,'2024-04-04'),
(230,1,1,'neutral',4,'2024-04-04'),
(231,1,1,'neutral',4,'2024-04-04'),
(232,1,1,'neutral',4,'2024-04-04'),
(233,1,1,'neutral',4,'2024-04-04'),
(234,1,1,'neutral',4,'2024-04-04'),
(235,1,1,'neutral',4,'2024-04-04'),
(236,1,1,'neutral',4,'2024-04-04'),
(237,1,1,'neutral',4,'2024-04-04'),
(238,1,1,'neutral',4,'2024-04-04'),
(239,1,1,'neutral',4,'2024-04-04'),
(240,1,1,'neutral',4,'2024-04-04'),
(241,1,1,'neutral',4,'2024-04-04'),
(242,1,1,'neutral',4,'2024-04-04'),
(243,1,1,'neutral',4,'2024-04-04'),
(244,1,1,'neutral',4,'2024-04-04'),
(245,1,1,'neutral',4,'2024-04-04'),
(246,1,1,'neutral',4,'2024-04-04'),
(247,1,1,'neutral',4,'2024-04-04'),
(248,1,1,'neutral',4,'2024-04-04'),
(249,1,1,'neutral',4,'2024-04-04'),
(250,1,1,'sad',1,'2024-04-04'),
(251,1,1,'neutral',4,'2024-04-04'),
(252,1,1,'neutral',4,'2024-04-04'),
(253,1,1,'neutral',4,'2024-04-04'),
(254,1,1,'neutral',4,'2024-04-04'),
(255,1,1,'neutral',4,'2024-04-04'),
(256,1,1,'neutral',4,'2024-04-04'),
(257,1,1,'neutral',4,'2024-04-04'),
(258,1,1,'neutral',4,'2024-04-04'),
(259,1,1,'neutral',4,'2024-04-04'),
(260,1,1,'neutral',4,'2024-04-04'),
(261,1,1,'neutral',4,'2024-04-04'),
(262,1,1,'neutral',4,'2024-04-04'),
(263,1,1,'neutral',4,'2024-04-04'),
(264,1,1,'neutral',4,'2024-04-04'),
(265,1,1,'neutral',4,'2024-04-04'),
(266,1,1,'neutral',4,'2024-04-04'),
(267,1,1,'sad',1,'2024-04-04'),
(268,1,1,'sad',1,'2024-04-04'),
(269,1,1,'angry',2,'2024-04-04'),
(270,1,1,'angry',2,'2024-04-04'),
(271,1,1,'neutral',4,'2024-04-04'),
(272,1,1,'neutral',4,'2024-04-04'),
(273,1,1,'neutral',4,'2024-04-04'),
(274,1,1,'neutral',4,'2024-04-04'),
(275,1,1,'angry',2,'2024-04-04'),
(276,1,1,'neutral',4,'2024-04-04'),
(277,1,1,'neutral',4,'2024-04-04'),
(278,1,1,'neutral',4,'2024-04-04'),
(279,1,1,'neutral',4,'2024-04-04'),
(280,1,1,'neutral',4,'2024-04-04'),
(281,1,1,'neutral',4,'2024-04-04'),
(282,1,1,'fear',1,'2024-04-04'),
(283,1,1,'neutral',4,'2024-04-04'),
(284,1,1,'sad',1,'2024-04-04'),
(285,1,1,'neutral',4,'2024-04-04'),
(286,1,1,'neutral',4,'2024-04-04'),
(287,1,1,'angry',2,'2024-04-04'),
(288,1,1,'neutral',4,'2024-04-04'),
(289,1,1,'neutral',4,'2024-04-04'),
(290,1,1,'angry',2,'2024-04-04'),
(291,1,1,'angry',2,'2024-04-04'),
(292,1,1,'angry',2,'2024-04-04'),
(293,1,1,'neutral',4,'2024-04-04'),
(294,1,1,'sad',1,'2024-04-04'),
(295,1,1,'neutral',4,'2024-04-04'),
(296,1,1,'angry',2,'2024-04-04'),
(297,1,1,'angry',2,'2024-04-04'),
(298,1,1,'fear',1,'2024-04-04'),
(299,1,1,'sad',1,'2024-04-04'),
(300,1,1,'neutral',4,'2024-04-04'),
(301,1,1,'neutral',4,'2024-04-04'),
(302,1,1,'neutral',4,'2024-04-04'),
(303,1,1,'sad',1,'2024-04-04'),
(304,1,1,'sad',1,'2024-04-04'),
(305,1,1,'neutral',4,'2024-04-04'),
(306,1,1,'neutral',4,'2024-04-04'),
(307,1,1,'neutral',4,'2024-04-04'),
(308,1,1,'neutral',4,'2024-04-04'),
(309,1,1,'neutral',4,'2024-04-04'),
(310,1,1,'neutral',4,'2024-04-04'),
(311,1,1,'neutral',4,'2024-04-04'),
(312,1,1,'angry',2,'2024-04-04'),
(313,1,1,'angry',2,'2024-04-04'),
(314,1,1,'sad',1,'2024-04-04'),
(315,1,1,'sad',1,'2024-04-04'),
(316,1,1,'angry',2,'2024-04-04'),
(317,1,1,'neutral',4,'2024-04-04'),
(318,1,1,'angry',2,'2024-04-04'),
(319,1,1,'angry',2,'2024-04-04'),
(320,1,1,'sad',1,'2024-04-04'),
(321,1,1,'neutral',4,'2024-04-04'),
(322,1,1,'angry',2,'2024-04-04'),
(323,1,1,'angry',2,'2024-04-04'),
(324,1,1,'fear',1,'2024-04-04'),
(325,1,1,'fear',1,'2024-04-04'),
(326,1,1,'sad',1,'2024-04-04'),
(327,1,1,'neutral',4,'2024-04-04'),
(328,1,1,'neutral',4,'2024-04-04'),
(329,1,1,'neutral',4,'2024-04-04'),
(330,1,1,'neutral',4,'2024-04-04'),
(331,1,1,'fear',1,'2024-04-04'),
(332,1,1,'fear',1,'2024-04-04'),
(333,1,1,'neutral',4,'2024-04-04'),
(334,1,1,'neutral',4,'2024-04-04'),
(335,1,1,'neutral',4,'2024-04-04'),
(336,1,1,'neutral',4,'2024-04-04'),
(337,1,1,'neutral',4,'2024-04-04'),
(338,1,1,'neutral',4,'2024-04-04'),
(339,1,1,'angry',2,'2024-04-04'),
(340,1,1,'neutral',4,'2024-04-04'),
(341,1,1,'neutral',4,'2024-04-04'),
(342,1,1,'neutral',4,'2024-04-04'),
(343,1,1,'sad',1,'2024-04-04'),
(344,1,1,'neutral',4,'2024-04-04'),
(345,1,1,'neutral',4,'2024-04-04'),
(346,1,1,'neutral',4,'2024-04-04'),
(347,1,1,'neutral',4,'2024-04-04'),
(348,1,1,'neutral',4,'2024-04-04'),
(349,1,1,'neutral',4,'2024-04-04'),
(350,1,1,'neutral',4,'2024-04-04'),
(351,1,1,'sad',1,'2024-04-04'),
(352,1,1,'neutral',4,'2024-04-04'),
(353,1,1,'neutral',4,'2024-04-04'),
(354,1,1,'angry',2,'2024-04-04'),
(355,1,1,'sad',1,'2024-04-04'),
(356,1,1,'neutral',4,'2024-04-04'),
(357,1,1,'neutral',4,'2024-04-04'),
(358,1,1,'neutral',4,'2024-04-04'),
(359,1,1,'neutral',4,'2024-04-04'),
(360,1,1,'neutral',4,'2024-04-04'),
(361,1,1,'neutral',4,'2024-04-04'),
(362,1,1,'neutral',4,'2024-04-04'),
(363,1,1,'neutral',4,'2024-04-04'),
(364,1,1,'angry',2,'2024-04-04'),
(365,1,1,'neutral',4,'2024-04-04'),
(366,1,1,'neutral',4,'2024-04-04'),
(367,1,1,'angry',2,'2024-04-04'),
(368,1,1,'neutral',4,'2024-04-04'),
(369,1,1,'neutral',4,'2024-04-04'),
(370,1,1,'neutral',4,'2024-04-04'),
(371,1,1,'neutral',4,'2024-04-04'),
(372,1,1,'neutral',4,'2024-04-04'),
(373,1,1,'neutral',4,'2024-04-04'),
(374,1,1,'neutral',4,'2024-04-04'),
(375,1,1,'neutral',4,'2024-04-04'),
(376,1,1,'neutral',4,'2024-04-04'),
(377,1,1,'neutral',4,'2024-04-04'),
(378,1,1,'neutral',4,'2024-04-04'),
(379,1,1,'neutral',4,'2024-04-04'),
(380,1,1,'neutral',4,'2024-04-04'),
(381,1,1,'neutral',4,'2024-04-04'),
(382,1,1,'neutral',4,'2024-04-04'),
(383,1,1,'neutral',4,'2024-04-04'),
(384,1,1,'fear',1,'2024-04-04'),
(385,1,1,'neutral',4,'2024-04-04'),
(386,1,1,'neutral',4,'2024-04-04'),
(387,1,1,'neutral',4,'2024-04-04'),
(388,1,1,'fear',1,'2024-04-04'),
(389,1,1,'neutral',4,'2024-04-04'),
(390,1,1,'fear',1,'2024-04-04'),
(391,1,1,'fear',1,'2024-04-04'),
(392,1,1,'fear',1,'2024-04-04'),
(393,1,1,'neutral',4,'2024-04-04'),
(394,1,1,'neutral',4,'2024-04-04'),
(395,1,1,'neutral',4,'2024-04-04'),
(396,1,1,'neutral',4,'2024-04-04'),
(397,1,1,'fear',1,'2024-04-04'),
(398,1,1,'neutral',4,'2024-04-04'),
(399,1,1,'neutral',4,'2024-04-04'),
(400,1,1,'neutral',4,'2024-04-04'),
(401,1,1,'neutral',4,'2024-04-04'),
(402,1,1,'fear',1,'2024-04-04'),
(403,1,1,'fear',1,'2024-04-04'),
(404,1,1,'fear',1,'2024-04-04'),
(405,1,1,'fear',1,'2024-04-04'),
(406,1,1,'fear',1,'2024-04-04'),
(407,1,1,'fear',1,'2024-04-04'),
(408,1,1,'neutral',4,'2024-04-04'),
(409,1,1,'neutral',4,'2024-04-04'),
(410,1,1,'neutral',4,'2024-04-04'),
(411,1,1,'neutral',4,'2024-04-04'),
(412,1,1,'neutral',4,'2024-04-04'),
(413,1,1,'neutral',4,'2024-04-04'),
(414,1,1,'neutral',4,'2024-04-04'),
(415,1,1,'neutral',4,'2024-04-04'),
(416,1,1,'neutral',4,'2024-04-04'),
(417,1,1,'neutral',4,'2024-04-04'),
(418,1,1,'neutral',4,'2024-04-04'),
(419,1,1,'neutral',4,'2024-04-04'),
(420,1,1,'neutral',4,'2024-04-04'),
(421,1,1,'neutral',4,'2024-04-04'),
(422,1,1,'neutral',4,'2024-04-04'),
(423,1,1,'neutral',4,'2024-04-04'),
(424,1,1,'neutral',4,'2024-04-04'),
(425,1,1,'neutral',4,'2024-04-04'),
(426,1,1,'sad',1,'2024-04-04'),
(427,1,1,'sad',1,'2024-04-04'),
(428,1,1,'sad',1,'2024-04-04'),
(429,1,1,'sad',1,'2024-04-04'),
(430,1,1,'sad',1,'2024-04-04'),
(431,1,1,'sad',1,'2024-04-04'),
(432,1,1,'sad',1,'2024-04-04'),
(433,1,1,'sad',1,'2024-04-04'),
(434,1,1,'sad',1,'2024-04-04'),
(435,1,1,'sad',1,'2024-04-04'),
(436,1,1,'sad',1,'2024-04-04'),
(437,1,1,'sad',1,'2024-04-04'),
(438,1,1,'sad',1,'2024-04-04'),
(439,1,1,'neutral',4,'2024-04-04'),
(440,1,1,'sad',1,'2024-04-04'),
(441,1,1,'neutral',4,'2024-04-04'),
(442,1,1,'sad',1,'2024-04-04'),
(443,1,1,'sad',1,'2024-04-04'),
(444,1,1,'sad',1,'2024-04-04'),
(445,1,1,'neutral',4,'2024-04-04'),
(446,1,1,'sad',1,'2024-04-04'),
(447,1,1,'sad',1,'2024-04-04'),
(448,1,1,'sad',1,'2024-04-04'),
(449,1,1,'sad',1,'2024-04-04'),
(450,1,1,'sad',1,'2024-04-04'),
(451,1,1,'sad',1,'2024-04-04'),
(452,1,1,'sad',1,'2024-04-04'),
(453,1,1,'sad',1,'2024-04-04'),
(454,1,1,'sad',1,'2024-04-04'),
(455,1,1,'sad',1,'2024-04-04'),
(456,1,1,'sad',1,'2024-04-04'),
(457,1,1,'sad',1,'2024-04-04'),
(458,1,1,'sad',1,'2024-04-04'),
(459,1,1,'sad',1,'2024-04-04'),
(460,1,1,'sad',1,'2024-04-04'),
(461,1,1,'sad',1,'2024-04-04'),
(462,1,1,'sad',1,'2024-04-04'),
(463,1,1,'neutral',4,'2024-04-04'),
(464,1,1,'sad',1,'2024-04-04'),
(465,1,1,'sad',1,'2024-04-04'),
(466,1,1,'sad',1,'2024-04-04'),
(467,1,1,'sad',1,'2024-04-04'),
(468,1,1,'sad',1,'2024-04-04'),
(469,1,1,'sad',1,'2024-04-04'),
(470,1,1,'sad',1,'2024-04-04'),
(471,1,1,'sad',1,'2024-04-04'),
(472,1,1,'sad',1,'2024-04-04'),
(473,1,1,'sad',1,'2024-04-04'),
(474,1,1,'neutral',4,'2024-04-04'),
(475,1,1,'neutral',4,'2024-04-04'),
(476,1,1,'neutral',4,'2024-04-04'),
(477,1,1,'neutral',4,'2024-04-04'),
(478,1,1,'neutral',4,'2024-04-04'),
(479,1,1,'neutral',4,'2024-04-04'),
(480,1,1,'neutral',4,'2024-04-04'),
(481,1,1,'neutral',4,'2024-04-04'),
(482,1,1,'neutral',4,'2024-04-04'),
(483,1,1,'neutral',4,'2024-04-04'),
(484,1,1,'neutral',4,'2024-04-04'),
(485,1,1,'sad',1,'2024-04-04'),
(486,1,1,'sad',1,'2024-04-04'),
(487,1,1,'neutral',4,'2024-04-04'),
(488,1,1,'neutral',4,'2024-04-04'),
(489,1,1,'neutral',4,'2024-04-04'),
(490,1,1,'neutral',4,'2024-04-04'),
(491,1,1,'sad',1,'2024-04-04'),
(492,1,1,'neutral',4,'2024-04-04'),
(493,1,1,'neutral',4,'2024-04-04'),
(494,1,1,'neutral',4,'2024-04-04'),
(495,1,1,'neutral',4,'2024-04-04'),
(496,1,1,'neutral',4,'2024-04-04'),
(497,1,1,'neutral',4,'2024-04-04'),
(498,1,1,'neutral',4,'2024-04-04'),
(499,1,1,'sad',1,'2024-04-04'),
(500,1,1,'neutral',4,'2024-04-04'),
(501,1,1,'angry',2,'2024-04-04'),
(502,1,1,'neutral',4,'2024-04-04'),
(503,1,1,'neutral',4,'2024-04-04'),
(504,1,1,'neutral',4,'2024-04-04'),
(505,1,1,'angry',2,'2024-04-04'),
(506,1,1,'neutral',4,'2024-04-04'),
(507,1,1,'neutral',4,'2024-04-04'),
(508,1,1,'neutral',4,'2024-04-04'),
(509,1,1,'angry',2,'2024-04-04'),
(510,1,1,'neutral',4,'2024-04-04'),
(511,1,1,'neutral',4,'2024-04-04'),
(512,1,1,'neutral',4,'2024-04-04'),
(513,1,1,'sad',1,'2024-04-04'),
(514,1,1,'sad',1,'2024-04-04'),
(515,1,1,'sad',1,'2024-04-04'),
(516,1,1,'sad',1,'2024-04-04'),
(517,1,1,'neutral',4,'2024-04-04'),
(518,1,1,'sad',1,'2024-04-04'),
(519,1,1,'sad',1,'2024-04-04'),
(520,1,1,'sad',1,'2024-04-04'),
(521,1,1,'sad',1,'2024-04-04'),
(522,1,1,'sad',1,'2024-04-04'),
(523,1,1,'sad',1,'2024-04-04'),
(524,1,1,'sad',1,'2024-04-04'),
(525,1,1,'sad',1,'2024-04-04'),
(526,1,1,'sad',1,'2024-04-04'),
(527,1,1,'sad',1,'2024-04-04'),
(528,1,1,'sad',1,'2024-04-04'),
(529,1,1,'neutral',4,'2024-04-04'),
(530,1,1,'sad',1,'2024-04-04'),
(531,1,1,'sad',1,'2024-04-04'),
(532,1,1,'sad',1,'2024-04-04'),
(533,1,1,'sad',1,'2024-04-04'),
(534,1,1,'sad',1,'2024-04-04'),
(535,1,1,'sad',1,'2024-04-04'),
(536,1,1,'sad',1,'2024-04-04'),
(537,1,1,'neutral',4,'2024-04-04'),
(538,1,1,'sad',1,'2024-04-04'),
(539,1,1,'sad',1,'2024-04-04'),
(540,1,1,'sad',1,'2024-04-04'),
(541,1,1,'neutral',4,'2024-04-04'),
(542,1,1,'sad',1,'2024-04-04'),
(543,1,1,'sad',1,'2024-04-04'),
(544,1,1,'sad',1,'2024-04-04'),
(545,1,1,'sad',1,'2024-04-04'),
(546,1,1,'sad',1,'2024-04-04'),
(547,1,1,'sad',1,'2024-04-04'),
(548,1,1,'sad',1,'2024-04-04'),
(549,1,1,'neutral',4,'2024-04-04'),
(550,1,1,'sad',1,'2024-04-04'),
(551,1,1,'neutral',4,'2024-04-04'),
(552,1,1,'neutral',4,'2024-04-04'),
(553,1,1,'neutral',4,'2024-04-04'),
(554,1,1,'neutral',4,'2024-04-04'),
(555,1,1,'neutral',4,'2024-04-04'),
(556,1,1,'sad',1,'2024-04-04'),
(557,1,1,'neutral',4,'2024-04-04'),
(558,1,1,'neutral',4,'2024-04-04'),
(559,1,1,'neutral',4,'2024-04-04'),
(560,1,1,'sad',1,'2024-04-04'),
(561,1,1,'sad',1,'2024-04-04'),
(562,1,1,'neutral',4,'2024-04-04'),
(563,1,1,'neutral',4,'2024-04-04'),
(564,1,1,'neutral',4,'2024-04-04'),
(565,1,1,'neutral',4,'2024-04-04'),
(566,1,1,'sad',1,'2024-04-04'),
(567,1,1,'neutral',4,'2024-04-04'),
(568,1,1,'neutral',4,'2024-04-04'),
(569,1,1,'neutral',4,'2024-04-04'),
(570,1,1,'neutral',4,'2024-04-04'),
(571,1,1,'neutral',4,'2024-04-04'),
(572,1,1,'neutral',4,'2024-04-04'),
(573,1,1,'neutral',4,'2024-04-04'),
(574,1,1,'neutral',4,'2024-04-04'),
(575,1,1,'neutral',4,'2024-04-04'),
(576,1,1,'neutral',4,'2024-04-04'),
(577,1,1,'neutral',4,'2024-04-04'),
(578,1,1,'neutral',4,'2024-04-04'),
(579,1,1,'neutral',4,'2024-04-04'),
(580,1,1,'neutral',4,'2024-04-04'),
(581,1,1,'neutral',4,'2024-04-04'),
(582,1,1,'neutral',4,'2024-04-04'),
(583,1,1,'neutral',4,'2024-04-04'),
(584,1,1,'neutral',4,'2024-04-04'),
(585,1,1,'neutral',4,'2024-04-04'),
(586,1,1,'neutral',4,'2024-04-04'),
(587,1,1,'neutral',4,'2024-04-04'),
(588,1,1,'neutral',4,'2024-04-04'),
(589,1,1,'neutral',4,'2024-04-04'),
(590,1,1,'happy',5,'2024-04-04'),
(591,1,1,'happy',5,'2024-04-04'),
(592,1,1,'happy',5,'2024-04-04'),
(593,1,1,'neutral',4,'2024-04-04'),
(594,1,1,'neutral',4,'2024-04-04'),
(595,1,1,'neutral',4,'2024-04-04'),
(596,1,1,'neutral',4,'2024-04-04'),
(597,1,1,'neutral',4,'2024-04-04'),
(598,1,1,'neutral',4,'2024-04-04'),
(599,1,1,'neutral',4,'2024-04-04'),
(600,1,1,'neutral',4,'2024-04-04'),
(601,1,1,'neutral',4,'2024-04-04'),
(602,1,1,'neutral',4,'2024-04-04'),
(603,1,1,'neutral',4,'2024-04-04'),
(604,1,1,'neutral',4,'2024-04-04'),
(605,1,1,'neutral',4,'2024-04-04'),
(606,1,1,'neutral',4,'2024-04-04'),
(607,1,1,'neutral',4,'2024-04-04'),
(608,1,1,'neutral',4,'2024-04-04'),
(609,1,1,'neutral',4,'2024-04-04'),
(610,1,1,'angry',2,'2024-04-04'),
(611,1,1,'neutral',4,'2024-04-04'),
(612,1,1,'neutral',4,'2024-04-04'),
(613,1,1,'neutral',4,'2024-04-04'),
(614,1,1,'neutral',4,'2024-04-04'),
(615,1,1,'sad',1,'2024-04-04'),
(616,1,1,'sad',1,'2024-04-04'),
(617,1,1,'neutral',4,'2024-04-04'),
(618,1,1,'neutral',4,'2024-04-04'),
(619,1,1,'neutral',4,'2024-04-04'),
(620,1,1,'neutral',4,'2024-04-04'),
(621,1,1,'fear',1,'2024-04-04'),
(622,1,1,'fear',1,'2024-04-04'),
(623,1,1,'neutral',4,'2024-04-04'),
(624,1,1,'sad',1,'2024-04-04'),
(625,1,1,'neutral',4,'2024-04-04'),
(626,1,1,'neutral',4,'2024-04-04'),
(627,1,1,'neutral',4,'2024-04-04'),
(628,1,1,'neutral',4,'2024-04-04'),
(629,1,1,'neutral',4,'2024-04-04'),
(630,1,1,'neutral',4,'2024-04-04'),
(631,1,1,'neutral',4,'2024-04-04'),
(632,1,1,'neutral',4,'2024-04-04'),
(633,1,1,'neutral',4,'2024-04-04'),
(634,1,1,'neutral',4,'2024-04-04'),
(635,1,1,'neutral',4,'2024-04-04'),
(636,1,1,'neutral',4,'2024-04-04'),
(637,1,1,'neutral',4,'2024-04-04');

/*Table structure for table `hod` */

DROP TABLE IF EXISTS `hod`;

CREATE TABLE `hod` (
  `hod_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` decimal(12,0) DEFAULT NULL,
  PRIMARY KEY (`hod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `hod` */

insert  into `hod`(`hod_id`,`login_id`,`department`,`name`,`email`,`phone`) values 
(1,2,'Computer Science','Karthik','karthik1995@gmail.com',9856349218),
(2,5,'Structure Engineering','Vyshnav','vyshnav@gmail.com',6299753456);

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `usertype` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`usertype`) values 
(1,'admin','admin','admin'),
(2,'karthik1995@gmail.com','karthik','hod'),
(3,'Talentteam@gmail.com','talent','placement_cell'),
(4,'Corezone@gmail.com','corezone','placement_cell'),
(5,'vyshnav@gmail.com','vyshnav','hod'),
(6,'Jyothika','jyothika','staff'),
(7,'Amal','amal','staff'),
(8,'jini','jini','student');

/*Table structure for table `notes` */

DROP TABLE IF EXISTS `notes`;

CREATE TABLE `notes` (
  `notes_id` int(11) NOT NULL AUTO_INCREMENT,
  `assign_id` int(11) DEFAULT NULL,
  `notes` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`notes_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `notes` */

insert  into `notes`(`notes_id`,`assign_id`,`notes`) values 
(1,1,'static/ce22fe81-39c9-4329-bb78-88088488ea81SFG-2024-Level-2-Test-14-QP-Eng.pdf');

/*Table structure for table `performance_score` */

DROP TABLE IF EXISTS `performance_score`;

CREATE TABLE `performance_score` (
  `performance_score_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `attendance` decimal(10,3) DEFAULT NULL,
  `exam_mark` decimal(10,3) DEFAULT NULL,
  `ce_mark` decimal(10,3) DEFAULT NULL,
  `sports` decimal(10,3) DEFAULT NULL,
  `arts` decimal(10,3) DEFAULT NULL,
  `details` varchar(100) DEFAULT NULL,
  `output` varchar(100) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`performance_score_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `performance_score` */

insert  into `performance_score`(`performance_score_id`,`staff_id`,`student_id`,`attendance`,`exam_mark`,`ce_mark`,`sports`,`arts`,`details`,`output`,`subject_id`) values 
(1,1,1,6.000,30.000,5.000,5.000,5.000,'pass','58.57',1);

/*Table structure for table `placement_cell` */

DROP TABLE IF EXISTS `placement_cell`;

CREATE TABLE `placement_cell` (
  `cell_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `cell_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` decimal(12,0) DEFAULT NULL,
  PRIMARY KEY (`cell_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `placement_cell` */

insert  into `placement_cell`(`cell_id`,`login_id`,`cell_name`,`email`,`phone`) values 
(1,3,'Talent','Talentteam@gmail.com',9567392897),
(2,4,'CoreZone','Corezone@gmail.com',6754389299);

/*Table structure for table `placement_details` */

DROP TABLE IF EXISTS `placement_details`;

CREATE TABLE `placement_details` (
  `placement_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`placement_details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `placement_details` */

insert  into `placement_details`(`placement_details_id`,`company_id`,`description`,`status`) values 
(1,1,'Software Systems Engineer','active'),
(2,1,'Quality Assurance Associate','active'),
(3,2,'CRM Business Analyst','active'),
(4,2,'Software Systems Engineer','active');

/*Table structure for table `predicted_work` */

DROP TABLE IF EXISTS `predicted_work`;

CREATE TABLE `predicted_work` (
  `predicted_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`predicted_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `predicted_work` */

insert  into `predicted_work`(`predicted_id`,`student_id`,`description`) values 
(1,1,'Software Systems Engineer');

/*Table structure for table `ratings` */

DROP TABLE IF EXISTS `ratings`;

CREATE TABLE `ratings` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `assign_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `ratings` varchar(25) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`rating_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ratings` */

insert  into `ratings`(`rating_id`,`assign_id`,`student_id`,`ratings`,`date`) values 
(1,1,1,'3.1068','2024-04-04');

/*Table structure for table `staff` */

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `hod_id` int(11) DEFAULT NULL,
  `staff_name` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` decimal(12,0) DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `staff` */

insert  into `staff`(`staff_id`,`login_id`,`hod_id`,`staff_name`,`email`,`phone`) values 
(1,6,1,'Jyothika','jyothika@gmail.com',7343256901),
(2,7,1,'Amal','amal@gmail.com',6238349537);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `hod_id` int(11) DEFAULT NULL,
  `student_name` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` decimal(12,0) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `student` */

insert  into `student`(`student_id`,`login_id`,`hod_id`,`student_name`,`email`,`phone`,`image`) values 
(1,8,1,'jini','jinikmohan@gmail.com',6754983287,'static/5a6c8e44-2b3f-4bd4-ae07-0df6e600ac80WIN_20240323_10_22_00_Pro.jpg');

/*Table structure for table `subject` */

DROP TABLE IF EXISTS `subject`;

CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `subject_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `subject` */

insert  into `subject`(`subject_id`,`course_id`,`subject_name`) values 
(1,1,'COMPUTER NETWORKS'),
(2,1,'SYSTEM SOFTWARE'),
(3,2,'ALGORITHM ANALYSIS AND DESIGN'),
(4,1,'WEB PROGRAMMING'),
(5,2,'DISTRIBUTED COMPUTING');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
