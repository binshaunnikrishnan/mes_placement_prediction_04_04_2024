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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `applications` */

insert  into `applications`(`application_id`,`placement_details_id`,`student_id`,`resume`,`date`,`status`) values 
(1,4,3,'static/85c47459-7a92-47e0-9c84-c250409dfb0cWIN_20240304_12_44_07_Pro.jpg','2024-03-05','pending'),
(2,5,4,'static/1d1ec059-e503-482b-8a61-4484ff211b51Event Management.docx','2024-03-30','okkk');

/*Table structure for table `assign_subjects` */

DROP TABLE IF EXISTS `assign_subjects`;

CREATE TABLE `assign_subjects` (
  `assign_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`assign_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `assign_subjects` */

insert  into `assign_subjects`(`assign_id`,`staff_id`,`subject_id`) values 
(2,1,1),
(3,3,4),
(4,6,6),
(5,6,5);

/*Table structure for table `companies` */

DROP TABLE IF EXISTS `companies`;

CREATE TABLE `companies` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `cell_id` int(11) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `place` varchar(70) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `companies` */

insert  into `companies`(`company_id`,`cell_id`,`company_name`,`place`,`address`) values 
(1,3,'dsfsd','sdvdtg','gvbv bvbhvbh'),
(2,4,'companie testing','kollam','testing address testing'),
(3,4,'abc company','ekm','xyz house');

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `hod_id` int(11) DEFAULT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `course` */

insert  into `course`(`course_id`,`hod_id`,`course_name`) values 
(2,1,'Computer Science'),
(3,1,'Applied Mathematics'),
(4,2,'dsvzvbddvbsdzsd'),
(5,1,'Statistics and Probability'),
(6,4,'msc'),
(7,5,'Structural Engineering');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `doubts` */

insert  into `doubts`(`doubt_id`,`student_id`,`staff_id`,`doubt`,`reply`,`date_time`) values 
(1,2,1,'hello','hello','2023-01-06 10:54:26'),
(2,4,6,'hiiii ooo','pending','2024-03-30 12:04:47');

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
) ENGINE=MyISAM AUTO_INCREMENT=556 DEFAULT CHARSET=latin1;

/*Data for the table `emotions` */

insert  into `emotions`(`emotions_id`,`assign_id`,`student_id`,`emotions`,`emotions_score`,`date`) values 
(71,2,4,'neutral',4,'2024-03-30'),
(72,2,4,'neutral',4,'2024-03-30'),
(73,2,4,'fear',1,'2024-03-30'),
(74,2,4,'neutral',4,'2024-03-30'),
(75,2,4,'neutral',4,'2024-03-30'),
(76,2,4,'neutral',4,'2024-03-30'),
(77,2,4,'neutral',4,'2024-03-30'),
(78,2,4,'neutral',4,'2024-03-30'),
(79,2,4,'neutral',4,'2024-03-30'),
(80,2,4,'happy',5,'2024-03-30'),
(81,2,4,'happy',5,'2024-03-30'),
(82,2,4,'happy',5,'2024-03-30'),
(83,2,4,'happy',5,'2024-03-30'),
(84,2,4,'neutral',4,'2024-03-30'),
(85,2,4,'neutral',4,'2024-03-30'),
(86,2,4,'neutral',4,'2024-03-30'),
(87,2,4,'neutral',4,'2024-03-30'),
(88,2,4,'neutral',4,'2024-03-30'),
(89,2,4,'neutral',4,'2024-03-30'),
(90,2,4,'neutral',4,'2024-03-30'),
(91,2,4,'neutral',4,'2024-03-30'),
(92,2,4,'neutral',4,'2024-03-30'),
(93,2,4,'neutral',4,'2024-03-30'),
(94,2,4,'neutral',4,'2024-03-30'),
(95,2,4,'neutral',4,'2024-03-30'),
(96,2,4,'neutral',4,'2024-03-30'),
(97,2,4,'neutral',4,'2024-03-30'),
(98,2,4,'neutral',4,'2024-03-30'),
(99,2,4,'neutral',4,'2024-03-30'),
(100,2,4,'neutral',4,'2024-03-30'),
(101,2,4,'neutral',4,'2024-03-30'),
(102,2,4,'neutral',4,'2024-03-30'),
(103,2,4,'neutral',4,'2024-03-30'),
(104,2,4,'neutral',4,'2024-03-30'),
(105,2,4,'neutral',4,'2024-03-30'),
(106,2,4,'neutral',4,'2024-03-30'),
(107,2,4,'neutral',4,'2024-03-30'),
(108,2,4,'neutral',4,'2024-03-30'),
(109,2,4,'neutral',4,'2024-03-30'),
(110,2,4,'neutral',4,'2024-03-30'),
(111,2,4,'neutral',4,'2024-03-30'),
(112,2,4,'neutral',4,'2024-03-30'),
(113,2,4,'neutral',4,'2024-03-30'),
(114,2,4,'neutral',4,'2024-03-30'),
(115,2,4,'neutral',4,'2024-03-30'),
(116,2,4,'neutral',4,'2024-03-30'),
(117,2,4,'neutral',4,'2024-03-30'),
(118,2,4,'neutral',4,'2024-03-30'),
(119,2,4,'neutral',4,'2024-03-30'),
(120,2,4,'neutral',4,'2024-03-30'),
(121,2,4,'neutral',4,'2024-03-30'),
(122,2,4,'neutral',4,'2024-03-30'),
(123,2,4,'neutral',4,'2024-03-30'),
(124,2,4,'neutral',4,'2024-03-30'),
(125,2,4,'neutral',4,'2024-03-30'),
(126,2,4,'neutral',4,'2024-03-30'),
(127,2,4,'neutral',4,'2024-03-30'),
(128,2,4,'neutral',4,'2024-03-30'),
(129,2,4,'neutral',4,'2024-03-30'),
(130,2,4,'neutral',4,'2024-03-30'),
(131,2,4,'neutral',4,'2024-03-30'),
(132,2,4,'neutral',4,'2024-03-30'),
(133,2,4,'neutral',4,'2024-03-30'),
(134,2,4,'neutral',4,'2024-03-30'),
(135,2,4,'neutral',4,'2024-03-30'),
(136,2,4,'neutral',4,'2024-03-30'),
(137,2,4,'neutral',4,'2024-03-30'),
(138,2,4,'neutral',4,'2024-03-30'),
(139,2,4,'neutral',4,'2024-03-30'),
(140,2,4,'neutral',4,'2024-03-30'),
(141,2,4,'neutral',4,'2024-03-30'),
(142,2,4,'neutral',4,'2024-03-30'),
(143,2,4,'neutral',4,'2024-03-30'),
(144,2,4,'neutral',4,'2024-03-30'),
(145,2,4,'neutral',4,'2024-03-30'),
(146,2,4,'neutral',4,'2024-03-30'),
(147,2,4,'neutral',4,'2024-03-30'),
(148,2,4,'neutral',4,'2024-03-30'),
(149,2,4,'neutral',4,'2024-03-30'),
(150,2,4,'neutral',4,'2024-03-30'),
(151,2,4,'neutral',4,'2024-03-30'),
(152,2,4,'neutral',4,'2024-03-30'),
(153,2,4,'neutral',4,'2024-03-30'),
(154,2,4,'neutral',4,'2024-03-30'),
(155,2,4,'neutral',4,'2024-03-30'),
(156,2,4,'neutral',4,'2024-03-30'),
(157,2,4,'neutral',4,'2024-03-30'),
(158,2,4,'neutral',4,'2024-03-30'),
(159,2,4,'neutral',4,'2024-03-30'),
(160,2,4,'neutral',4,'2024-03-30'),
(161,2,4,'neutral',4,'2024-03-30'),
(162,2,4,'neutral',4,'2024-03-30'),
(163,2,4,'neutral',4,'2024-03-30'),
(164,2,1,'neutral',4,'2024-03-30'),
(165,2,1,'neutral',4,'2024-03-30'),
(166,2,1,'neutral',4,'2024-03-30'),
(167,2,1,'neutral',4,'2024-03-30'),
(168,2,1,'sad',1,'2024-03-30'),
(169,2,1,'neutral',4,'2024-03-30'),
(170,2,1,'neutral',4,'2024-03-30'),
(171,2,1,'neutral',4,'2024-03-30'),
(172,2,1,'neutral',4,'2024-03-30'),
(173,2,1,'neutral',4,'2024-03-30'),
(174,2,1,'neutral',4,'2024-03-30'),
(175,2,1,'neutral',4,'2024-03-30'),
(176,2,1,'neutral',4,'2024-03-30'),
(177,2,1,'neutral',4,'2024-03-30'),
(178,2,1,'neutral',4,'2024-03-30'),
(179,2,1,'neutral',4,'2024-03-30'),
(180,2,1,'fear',1,'2024-03-30'),
(181,2,1,'neutral',4,'2024-03-30'),
(182,2,1,'neutral',4,'2024-03-30'),
(183,2,1,'neutral',4,'2024-03-30'),
(184,2,1,'sad',1,'2024-03-30'),
(185,2,1,'sad',1,'2024-03-30'),
(186,2,1,'sad',1,'2024-03-30'),
(187,2,1,'sad',1,'2024-03-30'),
(188,2,1,'neutral',4,'2024-03-30'),
(189,2,1,'neutral',4,'2024-03-30'),
(190,2,1,'happy',5,'2024-03-30'),
(191,2,1,'neutral',4,'2024-03-30'),
(192,2,1,'neutral',4,'2024-03-30'),
(193,2,1,'neutral',4,'2024-03-30'),
(194,2,1,'neutral',4,'2024-03-30'),
(195,2,1,'neutral',4,'2024-03-30'),
(196,2,1,'sad',1,'2024-03-30'),
(197,2,1,'neutral',4,'2024-03-30'),
(198,2,1,'neutral',4,'2024-03-30'),
(199,2,1,'neutral',4,'2024-03-30'),
(200,2,1,'neutral',4,'2024-03-30'),
(201,2,1,'neutral',4,'2024-03-30'),
(202,2,1,'neutral',4,'2024-03-30'),
(203,2,1,'neutral',4,'2024-03-30'),
(204,2,1,'neutral',4,'2024-03-30'),
(205,2,1,'neutral',4,'2024-03-30'),
(206,2,1,'neutral',4,'2024-03-30'),
(207,2,1,'neutral',4,'2024-03-30'),
(208,2,1,'neutral',4,'2024-03-30'),
(209,2,1,'neutral',4,'2024-03-30'),
(210,2,1,'neutral',4,'2024-03-30'),
(211,2,1,'neutral',4,'2024-03-30'),
(212,2,1,'neutral',4,'2024-03-30'),
(213,2,1,'neutral',4,'2024-03-30'),
(214,2,1,'neutral',4,'2024-03-30'),
(215,2,1,'neutral',4,'2024-03-30'),
(216,2,1,'neutral',4,'2024-03-30'),
(217,2,1,'neutral',4,'2024-03-30'),
(218,2,1,'neutral',4,'2024-03-30'),
(219,2,1,'neutral',4,'2024-03-30'),
(220,2,1,'neutral',4,'2024-03-30'),
(221,2,1,'neutral',4,'2024-03-30'),
(222,2,1,'neutral',4,'2024-03-30'),
(223,2,1,'neutral',4,'2024-03-30'),
(224,2,1,'neutral',4,'2024-03-30'),
(225,2,1,'neutral',4,'2024-03-30'),
(226,2,1,'neutral',4,'2024-03-30'),
(227,2,1,'neutral',4,'2024-03-30'),
(228,2,1,'neutral',4,'2024-03-30'),
(229,2,1,'neutral',4,'2024-03-30'),
(230,2,1,'neutral',4,'2024-03-30'),
(231,2,1,'neutral',4,'2024-03-30'),
(232,2,1,'sad',1,'2024-03-30'),
(233,2,1,'neutral',4,'2024-03-30'),
(234,2,1,'neutral',4,'2024-03-30'),
(235,2,1,'neutral',4,'2024-03-30'),
(236,2,1,'neutral',4,'2024-03-30'),
(237,2,1,'neutral',4,'2024-03-30'),
(238,2,1,'neutral',4,'2024-03-30'),
(239,2,1,'neutral',4,'2024-03-30'),
(240,2,1,'neutral',4,'2024-03-30'),
(241,2,1,'sad',1,'2024-03-30'),
(242,2,1,'neutral',4,'2024-03-30'),
(243,2,1,'neutral',4,'2024-03-30'),
(244,2,1,'neutral',4,'2024-03-30'),
(245,2,1,'angry',2,'2024-03-30'),
(246,2,1,'angry',2,'2024-03-30'),
(247,2,1,'angry',2,'2024-03-30'),
(248,2,1,'angry',2,'2024-03-30'),
(249,2,1,'neutral',4,'2024-03-30'),
(250,2,1,'sad',1,'2024-03-30'),
(251,2,1,'angry',2,'2024-03-30'),
(252,2,1,'angry',2,'2024-03-30'),
(253,2,1,'sad',1,'2024-03-30'),
(254,2,1,'angry',2,'2024-03-30'),
(255,2,1,'fear',1,'2024-03-30'),
(256,2,1,'sad',1,'2024-03-30'),
(257,2,1,'sad',1,'2024-03-30'),
(258,2,1,'angry',2,'2024-03-30'),
(259,2,1,'neutral',4,'2024-03-30'),
(260,2,1,'fear',1,'2024-03-30'),
(261,2,1,'neutral',4,'2024-03-30'),
(262,2,1,'neutral',4,'2024-03-30'),
(263,2,1,'neutral',4,'2024-03-30'),
(264,2,1,'neutral',4,'2024-03-30'),
(265,2,1,'neutral',4,'2024-03-30'),
(266,2,1,'neutral',4,'2024-03-30'),
(267,2,1,'neutral',4,'2024-03-30'),
(268,2,1,'neutral',4,'2024-03-30'),
(269,2,1,'neutral',4,'2024-03-30'),
(270,2,1,'neutral',4,'2024-03-30'),
(271,2,1,'neutral',4,'2024-03-30'),
(272,2,1,'neutral',4,'2024-03-30'),
(273,2,1,'neutral',4,'2024-03-30'),
(274,2,1,'neutral',4,'2024-03-30'),
(275,2,1,'neutral',4,'2024-03-30'),
(276,2,1,'neutral',4,'2024-03-30'),
(277,2,1,'neutral',4,'2024-03-30'),
(278,2,1,'neutral',4,'2024-03-30'),
(279,2,1,'neutral',4,'2024-03-30'),
(280,2,5,'sad',1,'2024-03-30'),
(281,2,1,'neutral',4,'2024-03-30'),
(282,2,1,'neutral',4,'2024-03-30'),
(283,2,1,'neutral',4,'2024-03-30'),
(284,2,1,'neutral',4,'2024-03-30'),
(285,2,1,'neutral',4,'2024-03-30'),
(286,2,1,'neutral',4,'2024-03-30'),
(287,2,1,'neutral',4,'2024-03-30'),
(288,2,1,'neutral',4,'2024-03-30'),
(289,2,1,'neutral',4,'2024-03-30'),
(290,2,1,'neutral',4,'2024-03-30'),
(291,2,1,'neutral',4,'2024-03-30'),
(292,2,1,'neutral',4,'2024-03-30'),
(293,2,1,'neutral',4,'2024-03-30'),
(294,2,1,'neutral',4,'2024-03-30'),
(295,2,1,'happy',5,'2024-03-30'),
(296,2,1,'neutral',4,'2024-03-30'),
(297,2,1,'angry',2,'2024-03-30'),
(298,2,1,'neutral',4,'2024-03-30'),
(299,2,1,'happy',5,'2024-03-30'),
(300,2,1,'happy',5,'2024-03-30'),
(301,2,1,'neutral',4,'2024-03-30'),
(302,2,1,'neutral',4,'2024-03-30'),
(303,2,1,'neutral',4,'2024-03-30'),
(304,2,1,'neutral',4,'2024-03-30'),
(305,2,1,'neutral',4,'2024-03-30'),
(306,2,1,'fear',1,'2024-03-30'),
(307,2,1,'neutral',4,'2024-03-30'),
(308,2,1,'neutral',4,'2024-03-30'),
(309,2,1,'neutral',4,'2024-03-30'),
(310,2,1,'neutral',4,'2024-03-30'),
(311,2,1,'neutral',4,'2024-03-30'),
(312,2,1,'angry',2,'2024-03-30'),
(313,2,1,'neutral',4,'2024-03-30'),
(314,2,1,'neutral',4,'2024-03-30'),
(315,2,1,'neutral',4,'2024-03-30'),
(316,2,1,'neutral',4,'2024-03-30'),
(317,2,1,'neutral',4,'2024-03-30'),
(318,2,1,'sad',1,'2024-03-30'),
(319,2,1,'neutral',4,'2024-03-30'),
(320,2,1,'sad',1,'2024-03-30'),
(321,2,1,'sad',1,'2024-03-30'),
(322,2,1,'neutral',4,'2024-03-30'),
(323,2,1,'neutral',4,'2024-03-30'),
(324,2,1,'neutral',4,'2024-03-30'),
(325,2,1,'neutral',4,'2024-03-30'),
(326,2,1,'neutral',4,'2024-03-30'),
(327,2,1,'neutral',4,'2024-03-30'),
(328,2,1,'neutral',4,'2024-03-30'),
(329,2,1,'neutral',4,'2024-03-30'),
(330,2,1,'neutral',4,'2024-03-30'),
(331,2,1,'neutral',4,'2024-03-30'),
(332,2,1,'neutral',4,'2024-03-30'),
(333,2,1,'neutral',4,'2024-03-30'),
(334,2,1,'neutral',4,'2024-03-30'),
(335,2,1,'neutral',4,'2024-03-30'),
(336,2,1,'neutral',4,'2024-03-30'),
(337,2,1,'neutral',4,'2024-03-30'),
(338,2,1,'sad',1,'2024-03-30'),
(339,2,1,'neutral',4,'2024-03-30'),
(340,2,1,'sad',1,'2024-03-30'),
(341,2,1,'neutral',4,'2024-03-30'),
(342,2,1,'neutral',4,'2024-03-30'),
(343,2,1,'neutral',4,'2024-03-30'),
(344,2,1,'neutral',4,'2024-03-30'),
(345,2,1,'neutral',4,'2024-03-30'),
(346,2,1,'neutral',4,'2024-03-30'),
(347,2,1,'neutral',4,'2024-03-30'),
(348,2,1,'neutral',4,'2024-03-30'),
(349,2,1,'neutral',4,'2024-03-30'),
(350,2,1,'neutral',4,'2024-03-30'),
(351,2,1,'neutral',4,'2024-03-30'),
(352,2,1,'sad',1,'2024-03-30'),
(353,2,1,'sad',1,'2024-03-30'),
(354,2,1,'neutral',4,'2024-03-30'),
(355,2,1,'neutral',4,'2024-03-30'),
(356,2,1,'neutral',4,'2024-03-30'),
(357,2,1,'neutral',4,'2024-03-30'),
(358,2,1,'happy',5,'2024-03-30'),
(359,2,1,'happy',5,'2024-03-30'),
(360,2,1,'fear',1,'2024-03-30'),
(361,2,1,'happy',5,'2024-03-30'),
(362,2,1,'neutral',4,'2024-03-30'),
(363,2,1,'neutral',4,'2024-03-30'),
(364,2,1,'neutral',4,'2024-03-30'),
(365,2,1,'neutral',4,'2024-03-30'),
(366,2,1,'neutral',4,'2024-03-30'),
(367,2,1,'neutral',4,'2024-03-30'),
(368,2,1,'neutral',4,'2024-03-30'),
(369,2,1,'happy',5,'2024-03-30'),
(370,2,1,'sad',1,'2024-03-30'),
(371,2,1,'neutral',4,'2024-03-30'),
(372,2,1,'happy',5,'2024-03-30'),
(373,2,1,'happy',5,'2024-03-30'),
(374,2,1,'neutral',4,'2024-03-30'),
(375,2,1,'neutral',4,'2024-03-30'),
(376,2,5,'neutral',4,'2024-03-30'),
(377,2,1,'neutral',4,'2024-03-30'),
(378,2,1,'neutral',4,'2024-03-30'),
(379,2,1,'neutral',4,'2024-03-30'),
(380,2,1,'neutral',4,'2024-03-30'),
(381,2,1,'neutral',4,'2024-03-30'),
(382,2,1,'sad',1,'2024-03-30'),
(383,2,1,'neutral',4,'2024-03-30'),
(384,2,1,'sad',1,'2024-03-30'),
(385,2,1,'neutral',4,'2024-03-30'),
(386,2,1,'neutral',4,'2024-03-30'),
(387,2,1,'neutral',4,'2024-03-30'),
(388,2,1,'neutral',4,'2024-03-30'),
(389,2,1,'fear',1,'2024-03-30'),
(390,2,1,'sad',1,'2024-03-30'),
(391,2,1,'neutral',4,'2024-03-30'),
(392,2,1,'neutral',4,'2024-03-30'),
(393,2,1,'neutral',4,'2024-03-30'),
(394,2,1,'sad',1,'2024-03-30'),
(395,2,1,'fear',1,'2024-03-30'),
(396,2,1,'happy',5,'2024-03-30'),
(397,2,1,'happy',5,'2024-03-30'),
(398,2,1,'fear',1,'2024-03-30'),
(399,2,1,'fear',1,'2024-03-30'),
(400,2,1,'neutral',4,'2024-03-30'),
(401,2,1,'neutral',4,'2024-03-30'),
(402,2,1,'fear',1,'2024-03-30'),
(403,2,1,'neutral',4,'2024-03-30'),
(404,2,1,'neutral',4,'2024-03-30'),
(405,2,1,'happy',5,'2024-03-30'),
(406,2,1,'happy',5,'2024-03-30'),
(407,2,1,'happy',5,'2024-03-30'),
(408,2,1,'happy',5,'2024-03-30'),
(409,2,1,'happy',5,'2024-03-30'),
(410,2,1,'fear',1,'2024-03-30'),
(411,2,1,'neutral',4,'2024-03-30'),
(412,2,1,'neutral',4,'2024-03-30'),
(413,2,1,'neutral',4,'2024-03-30'),
(414,2,1,'sad',1,'2024-03-30'),
(415,2,1,'neutral',4,'2024-03-30'),
(416,2,1,'neutral',4,'2024-03-30'),
(417,2,1,'neutral',4,'2024-03-30'),
(418,2,1,'neutral',4,'2024-03-30'),
(419,2,1,'neutral',4,'2024-03-30'),
(420,2,1,'neutral',4,'2024-03-30'),
(421,2,1,'happy',5,'2024-03-30'),
(422,2,1,'fear',1,'2024-03-30'),
(423,2,1,'angry',2,'2024-03-30'),
(424,5,1,'happy',5,'2024-03-30'),
(425,5,1,'happy',5,'2024-03-30'),
(426,5,1,'neutral',4,'2024-03-30'),
(427,5,1,'neutral',4,'2024-03-30'),
(428,5,1,'surprise',1,'2024-03-30'),
(429,5,1,'sad',1,'2024-03-30'),
(430,5,1,'sad',1,'2024-03-30'),
(431,5,1,'sad',1,'2024-03-30'),
(432,5,1,'happy',5,'2024-03-30'),
(433,5,4,'happy',5,'2024-03-30'),
(434,5,4,'happy',5,'2024-03-30'),
(435,5,1,'happy',5,'2024-03-30'),
(436,5,1,'neutral',4,'2024-03-30'),
(437,5,1,'neutral',4,'2024-03-30'),
(438,5,1,'neutral',4,'2024-03-30'),
(439,5,1,'neutral',4,'2024-03-30'),
(440,5,1,'neutral',4,'2024-03-30'),
(441,5,1,'neutral',4,'2024-03-30'),
(442,5,1,'neutral',4,'2024-03-30'),
(443,5,1,'neutral',4,'2024-03-30'),
(444,5,1,'neutral',4,'2024-03-30'),
(445,5,1,'neutral',4,'2024-03-30'),
(446,5,1,'neutral',4,'2024-03-30'),
(447,5,1,'neutral',4,'2024-03-30'),
(448,5,1,'neutral',4,'2024-03-30'),
(449,5,1,'neutral',4,'2024-03-30'),
(450,5,1,'neutral',4,'2024-03-30'),
(451,5,1,'neutral',4,'2024-03-30'),
(452,5,1,'neutral',4,'2024-03-30'),
(453,5,1,'neutral',4,'2024-03-30'),
(454,5,1,'neutral',4,'2024-03-30'),
(455,5,1,'happy',5,'2024-03-30'),
(456,5,1,'neutral',4,'2024-03-30'),
(457,5,1,'neutral',4,'2024-03-30'),
(458,5,1,'neutral',4,'2024-03-30'),
(459,5,1,'neutral',4,'2024-03-30'),
(460,5,1,'happy',5,'2024-03-30'),
(461,5,1,'happy',5,'2024-03-30'),
(462,5,1,'neutral',4,'2024-03-30'),
(463,5,1,'neutral',4,'2024-03-30'),
(464,5,1,'neutral',4,'2024-03-30'),
(465,5,1,'neutral',4,'2024-03-30'),
(466,5,1,'neutral',4,'2024-03-30'),
(467,5,1,'neutral',4,'2024-03-30'),
(468,5,1,'neutral',4,'2024-03-30'),
(469,5,1,'angry',2,'2024-03-30'),
(470,5,1,'neutral',4,'2024-03-30'),
(471,5,1,'neutral',4,'2024-03-30'),
(472,5,1,'neutral',4,'2024-03-30'),
(473,5,1,'neutral',4,'2024-03-30'),
(474,5,1,'neutral',4,'2024-03-30'),
(475,5,1,'neutral',4,'2024-03-30'),
(476,5,1,'neutral',4,'2024-03-30'),
(477,5,1,'neutral',4,'2024-03-30'),
(478,5,1,'neutral',4,'2024-03-30'),
(479,5,1,'neutral',4,'2024-03-30'),
(480,5,1,'neutral',4,'2024-03-30'),
(481,5,1,'neutral',4,'2024-03-30'),
(482,5,1,'neutral',4,'2024-03-30'),
(483,5,1,'neutral',4,'2024-03-30'),
(484,5,1,'neutral',4,'2024-03-30'),
(485,5,1,'neutral',4,'2024-03-30'),
(486,5,1,'neutral',4,'2024-03-30'),
(487,5,1,'neutral',4,'2024-03-30'),
(488,5,1,'neutral',4,'2024-03-30'),
(489,5,1,'neutral',4,'2024-03-30'),
(490,5,1,'neutral',4,'2024-03-30'),
(491,5,1,'neutral',4,'2024-03-30'),
(492,5,1,'neutral',4,'2024-03-30'),
(493,5,1,'neutral',4,'2024-03-30'),
(494,5,1,'neutral',4,'2024-03-30'),
(495,5,1,'neutral',4,'2024-03-30'),
(496,5,1,'neutral',4,'2024-03-30'),
(497,5,1,'neutral',4,'2024-03-30'),
(498,5,1,'neutral',4,'2024-03-30'),
(499,5,1,'neutral',4,'2024-03-30'),
(500,5,1,'neutral',4,'2024-03-30'),
(501,5,1,'neutral',4,'2024-03-30'),
(502,5,1,'neutral',4,'2024-03-30'),
(503,5,1,'neutral',4,'2024-03-30'),
(504,5,1,'neutral',4,'2024-03-30'),
(505,5,1,'neutral',4,'2024-03-30'),
(506,5,1,'neutral',4,'2024-03-30'),
(507,5,1,'neutral',4,'2024-03-30'),
(508,5,1,'neutral',4,'2024-03-30'),
(509,5,1,'neutral',4,'2024-03-30'),
(510,5,1,'neutral',4,'2024-03-30'),
(511,5,1,'neutral',4,'2024-03-30'),
(512,5,1,'neutral',4,'2024-03-30'),
(513,5,1,'neutral',4,'2024-03-30'),
(514,5,1,'neutral',4,'2024-03-30'),
(515,5,1,'neutral',4,'2024-03-30'),
(516,5,1,'neutral',4,'2024-03-30'),
(517,5,1,'neutral',4,'2024-03-30'),
(518,5,1,'neutral',4,'2024-03-30'),
(519,5,1,'neutral',4,'2024-03-30'),
(520,5,1,'sad',1,'2024-03-30'),
(521,5,1,'neutral',4,'2024-03-30'),
(522,5,1,'neutral',4,'2024-03-30'),
(523,5,1,'neutral',4,'2024-03-30'),
(524,5,1,'sad',1,'2024-03-30'),
(525,5,1,'fear',1,'2024-03-30'),
(526,5,1,'neutral',4,'2024-03-30'),
(527,5,1,'neutral',4,'2024-03-30'),
(528,5,1,'neutral',4,'2024-03-30'),
(529,5,1,'neutral',4,'2024-03-30'),
(530,5,1,'neutral',4,'2024-03-30'),
(531,5,1,'fear',1,'2024-03-30'),
(532,5,1,'fear',1,'2024-03-30'),
(533,5,1,'neutral',4,'2024-03-30'),
(534,5,1,'neutral',4,'2024-03-30'),
(535,5,1,'neutral',4,'2024-03-30'),
(536,5,1,'neutral',4,'2024-03-30'),
(537,5,2,'neutral',4,'2024-03-30'),
(538,5,2,'neutral',4,'2024-03-30'),
(539,5,2,'neutral',4,'2024-03-30'),
(540,5,2,'neutral',4,'2024-03-30'),
(541,5,2,'neutral',4,'2024-03-30'),
(542,5,2,'neutral',4,'2024-03-30'),
(543,5,2,'neutral',4,'2024-03-30'),
(544,5,2,'fear',1,'2024-03-30'),
(545,5,2,'fear',1,'2024-03-30'),
(546,5,2,'neutral',4,'2024-03-30'),
(547,5,2,'neutral',4,'2024-03-30'),
(548,5,2,'neutral',4,'2024-03-30'),
(549,5,2,'neutral',4,'2024-03-30'),
(550,5,2,'neutral',4,'2024-03-30'),
(551,5,2,'neutral',4,'2024-03-30'),
(552,5,2,'fear',1,'2024-03-30'),
(553,5,2,'fear',1,'2024-03-30'),
(554,5,2,'neutral',4,'2024-03-30'),
(555,5,2,'happy',5,'2024-03-30');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `hod` */

insert  into `hod`(`hod_id`,`login_id`,`department`,`name`,`email`,`phone`) values 
(1,2,'Consequatur lorem q','Nasim Swanson','degu@mailinator.com',38),
(2,3,'Nihil consequat Eos','Dai Clarke','kunasuse@mailinator.com',39),
(4,11,'bca','saran','saran@gmail.com',7894561230),
(5,15,'civil','radhakrishnan','abc@gmail.com',8265378902);

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `usertype` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`usertype`) values 
(2,'hh','hh','hod'),
(3,'syamr','1111','student'),
(4,'mebin','regh','student'),
(9,'syam','1234','staff'),
(10,'admin','admin','admin'),
(11,'hod','hod','hod'),
(12,'test@gmail.com','testing','placement_cell'),
(13,'asha','asha','staff'),
(15,'krish@gmail.com','krishnan','hod'),
(18,'krishna','kp','staff'),
(19,'uuu','krishnan','staff'),
(20,'jini','jini','staff'),
(23,'amm','amm','student'),
(24,'shine','shine','student');

/*Table structure for table `notes` */

DROP TABLE IF EXISTS `notes`;

CREATE TABLE `notes` (
  `notes_id` int(11) NOT NULL AUTO_INCREMENT,
  `assign_id` int(11) DEFAULT NULL,
  `notes` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`notes_id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

/*Data for the table `notes` */

insert  into `notes`(`notes_id`,`assign_id`,`notes`) values 
(5,2,'static/4474fc6e-d654-40c7-b115-e60e107f2914block.ccd'),
(6,2,'static/cdaac264-0f27-40ba-bbfc-b10212fc722dblock.jpg'),
(7,2,'static/8ed57eec-bb50-429e-899d-ebafacac037aadmin new.jpg'),
(8,2,'static/d590a71d-a247-4f9e-9807-1dac459ece67er diagram.jpg'),
(9,2,'static/75ca30b3-e4f9-4356-86c6-131d5c5f5629block.jpg'),
(10,2,'static/7ed1b4d8-0ce5-454f-9749-bcc04b353b47admin new.jpg'),
(11,2,'static/d71132a1-f541-46f1-b0ba-261b180b0bb6admin new.jpg'),
(12,2,'static/bd036315-7765-4a37-a70e-691814fad7f7er diagram.jpg'),
(13,2,'static/70b35e5a-0740-40ad-bbc8-9912e0e5973fer diagram.jpg'),
(14,2,'static/08481e35-9578-4475-b921-a67e3e4fd05cdocter new.jpg'),
(15,2,'static/08241eb2-9786-4cd7-aebc-38893a682654er diagram.jpg'),
(16,2,'static/5c2b7f74-a8c8-4672-a167-95905987c055er diagram.jpg'),
(17,2,'static/34f4f8f5-7240-4f8b-b98b-4978a36ab508block.jpg'),
(18,2,'static/9e808dfa-5a12-463c-a178-997afadc747eadmin new.jpg'),
(19,2,'static/e484b004-fab2-4523-89b5-6a277caf9843admin new.jpg'),
(20,2,'static/6d324447-8e47-4c5e-897b-04b8f3cb05f7admin new.jpg'),
(21,2,'static/47ac268f-4769-419e-befd-d1a81bc6a010admin new.jpg'),
(22,2,'static/fb42b388-ae3b-44c3-9a88-b0793262495dblock.jpg'),
(23,2,'static/593abd8b-15d0-4cbb-8f59-7201f9a89fa1admin new.jpg'),
(24,2,'static/8ac1d645-7899-48d7-b87f-00a10e5d87d0block.jpg'),
(25,2,'static/50a90ee0-e571-48b7-9049-6dce07d7f5cbblock.jpg'),
(26,2,'static/4f302feb-39ff-4bfa-a1fb-53c78f051720block.jpg'),
(27,2,'static/0b655125-38a1-43bc-8ca9-c93946f4658eblock.jpg'),
(28,2,'static/467f3452-922f-4cdb-9107-967919356cabblock.jpg'),
(30,2,'static/a69333f9-4ac7-4ac0-a108-bf6077e0ac73block.jpg'),
(33,3,'static/7d333e0d-d6bb-4d5d-be9c-506700c5f3f1hai.jpg'),
(35,5,'static/4e0ccbb8-d03f-451e-8dea-82411d831d20wide-angle-shot-schonbrunn-palace-vienna-austria-with-cloudy-blue-sky (1).jpg'),
(37,4,'static/4d2b05fd-4882-41b0-bfc1-4623d07cc60dSFG-2024-Level-2-Test-14-QP-Eng.pdf');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

/*Data for the table `performance_score` */

insert  into `performance_score`(`performance_score_id`,`staff_id`,`student_id`,`attendance`,`exam_mark`,`ce_mark`,`sports`,`arts`,`details`,`output`,`subject_id`) values 
(2,3,3,20.000,20.000,20.000,0.000,10.000,'pass','85.71',NULL),
(3,3,3,5.000,5.000,1.000,0.000,3.000,'fail','15.71',NULL),
(4,3,3,20.000,10.000,10.000,0.000,10.000,'pass','57.14',0),
(5,6,1,20.000,10.000,12.000,56.000,67.000,'pass','60.0',1),
(6,6,1,0.000,0.000,0.000,0.000,0.000,'fail','0.0',1),
(7,6,4,66.000,23.000,22.000,33.000,22.000,'pass','158.57',3),
(8,6,1,80.000,59.000,54.000,34.000,34.000,'pass','275.71',1),
(9,6,1,80.000,59.000,54.000,34.000,34.000,'pass','275.71',1),
(10,6,1,80.000,59.000,54.000,87.000,34.000,'pass','275.71',1),
(11,6,1,87.000,67.000,65.000,50.000,58.000,'pass','312.86',1),
(12,6,1,32.000,21.000,12.000,12.000,9.000,'pass','92.86',1),
(13,6,1,12.000,10.000,10.000,10.000,10.000,'pass','45.71',1),
(14,6,1,3.000,2.000,2.000,2.000,2.000,'fail','10.0',1),
(15,6,1,4.000,4.000,4.000,4.000,4.000,'fail','17.14',1),
(16,6,1,4.000,17.000,7.000,8.000,8.000,'fail','40.0',1),
(17,6,1,6.000,8.000,20.000,8.000,8.000,'pass','48.57',1),
(18,6,1,8.000,20.000,5.000,6.000,4.000,'pass','47.14',1);

/*Table structure for table `placement_cell` */

DROP TABLE IF EXISTS `placement_cell`;

CREATE TABLE `placement_cell` (
  `cell_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `cell_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` decimal(12,0) DEFAULT NULL,
  PRIMARY KEY (`cell_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `placement_cell` */

insert  into `placement_cell`(`cell_id`,`login_id`,`cell_name`,`email`,`phone`) values 
(1,4,'Quincy Gentry','peze@mailinator.com',69),
(2,5,'Tanisha Gillespie','hojy@mailinator.com',77),
(3,13,'syamr','fefef',44565),
(4,12,'testing cell','test@gkmail.com',9874123653);

/*Table structure for table `placement_details` */

DROP TABLE IF EXISTS `placement_details`;

CREATE TABLE `placement_details` (
  `placement_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`placement_details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `placement_details` */

insert  into `placement_details`(`placement_details_id`,`company_id`,`description`,`status`) values 
(2,1,'jhbfhj','active'),
(3,1,'sdbfbfbbnfbn','expired'),
(4,2,'Quality Assurance Associate','active'),
(5,2,'CRM Technical Developer','expired'),
(6,2,'Business Intelligence Analyst','active'),
(7,3,'Business Intelligence Analyst','active');

/*Table structure for table `predicted_work` */

DROP TABLE IF EXISTS `predicted_work`;

CREATE TABLE `predicted_work` (
  `predicted_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`predicted_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `predicted_work` */

insert  into `predicted_work`(`predicted_id`,`student_id`,`description`) values 
(1,2,'Mobile Applications Developer'),
(2,3,'Quality Assurance Associate'),
(3,3,'Quality Assurance Associate'),
(4,4,'CRM Technical Developer'),
(5,1,'Business Intelligence Analyst'),
(6,1,'Software Systems Engineer');

/*Table structure for table `ratings` */

DROP TABLE IF EXISTS `ratings`;

CREATE TABLE `ratings` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `assign_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `ratings` varchar(25) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`rating_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ratings` */

insert  into `ratings`(`rating_id`,`assign_id`,`student_id`,`ratings`,`date`) values 
(1,2,1,'2.2321','2023-01-09'),
(2,2,2,'2.4286','2023-01-09'),
(3,2,4,'4.0108','2024-03-30'),
(4,2,1,'3.5543','2024-03-30'),
(5,2,5,'2.5000','2024-03-30'),
(6,5,1,'3.8018','2024-03-30'),
(7,5,4,'5.0000','2024-03-30'),
(8,5,2,'3.4211','2024-03-30');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `staff` */

insert  into `staff`(`staff_id`,`login_id`,`hod_id`,`staff_name`,`email`,`phone`) values 
(1,9,1,'syam','sam@gmail.com',99889999),
(2,12,2,'zdc','asca',1252651),
(3,13,4,'asha','asha@gmail.com',7894561230),
(4,18,5,'krishnapriya','krish@gmail.com',9876543210),
(6,20,5,'jini','jini@f.j',89786543);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `student` */

insert  into `student`(`student_id`,`login_id`,`hod_id`,`student_name`,`email`,`phone`,`image`) values 
(1,23,5,'amm','ammu@gmail.com',234567654,'static/cb84c21a-bf75-4b44-9d83-6d8d681b195fWIN_20240330_13_23_02_Pro.jpg'),
(2,24,5,'shine','shine@gmail.com',876543,'static/c9960df0-0417-434e-a941-865c3357f671WIN_20240330_17_15_03_Pro.jpg');

/*Table structure for table `subject` */

DROP TABLE IF EXISTS `subject`;

CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `subject_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `subject` */

insert  into `subject`(`subject_id`,`course_id`,`subject_name`) values 
(1,2,'Civil And Mechanical Workshop'),
(2,3,'BLOCKCHAIN'),
(3,4,'DISTRIBUTED COMPUTING'),
(4,6,'Basics Of Civil And Mechanical Engineering'),
(5,7,'COMPUTER NETWORKS'),
(6,7,'PROGRAMMING IN PYTHON'),
(7,2,'WEB PROGRAMMING');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
