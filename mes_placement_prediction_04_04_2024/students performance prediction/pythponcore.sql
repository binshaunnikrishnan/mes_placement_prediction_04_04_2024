/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.28-MariaDB : Database - python_corestudents_performance_prediction
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`python_corestudents_performance_prediction` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `applications` */

insert  into `applications`(`application_id`,`placement_details_id`,`student_id`,`resume`,`date`,`status`) values 
(1,4,3,'static/85c47459-7a92-47e0-9c84-c250409dfb0cWIN_20240304_12_44_07_Pro.jpg','2024-03-05','pending');

/*Table structure for table `assign_subjects` */

DROP TABLE IF EXISTS `assign_subjects`;

CREATE TABLE `assign_subjects` (
  `assign_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`assign_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `assign_subjects` */

insert  into `assign_subjects`(`assign_id`,`staff_id`,`subject_id`) values 
(2,1,1),
(3,3,4);

/*Table structure for table `companies` */

DROP TABLE IF EXISTS `companies`;

CREATE TABLE `companies` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `cell_id` int(11) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `place` varchar(70) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `companies` */

insert  into `companies`(`company_id`,`cell_id`,`company_name`,`place`,`address`) values 
(1,3,'dsfsd','sdvdtg','gvbv bvbhvbh'),
(2,4,'companie testing','kollam','testing address testing');

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `hod_id` int(11) DEFAULT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `course` */

insert  into `course`(`course_id`,`hod_id`,`course_name`) values 
(2,1,'malayalam'),
(3,1,'edscv'),
(4,2,'dsvzvbddvbsdzsd'),
(5,1,'bca'),
(6,4,'msc');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `doubts` */

insert  into `doubts`(`doubt_id`,`student_id`,`staff_id`,`doubt`,`reply`,`date_time`) values 
(1,2,1,'hello','hello','2023-01-06 10:54:26');

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
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `emotions` */

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `hod` */

insert  into `hod`(`hod_id`,`login_id`,`department`,`name`,`email`,`phone`) values 
(1,2,'Consequatur lorem q','Nasim Swanson','degu@mailinator.com',38),
(2,3,'Nihil consequat Eos','Dai Clarke','kunasuse@mailinator.com',39),
(3,8,'dzxv ','asvcasdv','sam@gmail.com',1231313),
(4,11,'bca','saran','saran@gmail.com',7894561230);

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `usertype` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(14,'shemeem','abc','student');

/*Table structure for table `notes` */

DROP TABLE IF EXISTS `notes`;

CREATE TABLE `notes` (
  `notes_id` int(11) NOT NULL AUTO_INCREMENT,
  `assign_id` int(11) DEFAULT NULL,
  `notes` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`notes_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
(33,3,'static/7d333e0d-d6bb-4d5d-be9c-506700c5f3f1hai.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `performance_score` */

insert  into `performance_score`(`performance_score_id`,`staff_id`,`student_id`,`attendance`,`exam_mark`,`ce_mark`,`sports`,`arts`,`details`,`output`,`subject_id`) values 
(2,3,3,20.000,20.000,20.000,0.000,10.000,'pass','85.71',NULL),
(3,3,3,5.000,5.000,1.000,0.000,3.000,'fail','15.71',NULL),
(4,3,3,20.000,10.000,10.000,0.000,10.000,'pass','57.14',0);

/*Table structure for table `placement_cell` */

DROP TABLE IF EXISTS `placement_cell`;

CREATE TABLE `placement_cell` (
  `cell_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `cell_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` decimal(12,0) DEFAULT NULL,
  PRIMARY KEY (`cell_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `placement_cell` */

insert  into `placement_cell`(`cell_id`,`login_id`,`cell_name`,`email`,`phone`) values 
(1,4,'Quincy Gentry','peze@mailinator.com',69),
(2,5,'Tanisha Gillespie','hojy@mailinator.com',77),
(3,13,'syamr','fefef',44565),
(4,12,'testing cell','test@gmail.com',9874123653);

/*Table structure for table `placement_details` */

DROP TABLE IF EXISTS `placement_details`;

CREATE TABLE `placement_details` (
  `placement_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`placement_details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `placement_details` */

insert  into `placement_details`(`placement_details_id`,`company_id`,`description`,`status`) values 
(2,1,'jhbfhj','active'),
(3,1,'sdbfbfbbnfbn','expired'),
(4,2,'Quality Assurance Associate','active');

/*Table structure for table `predicted_work` */

DROP TABLE IF EXISTS `predicted_work`;

CREATE TABLE `predicted_work` (
  `predicted_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`predicted_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `predicted_work` */

insert  into `predicted_work`(`predicted_id`,`student_id`,`description`) values 
(1,2,'Mobile Applications Developer'),
(2,3,'Quality Assurance Associate');

/*Table structure for table `ratings` */

DROP TABLE IF EXISTS `ratings`;

CREATE TABLE `ratings` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `assign_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `ratings` varchar(25) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`rating_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ratings` */

insert  into `ratings`(`rating_id`,`assign_id`,`student_id`,`ratings`,`date`) values 
(1,2,1,'2.2321','2023-01-09'),
(2,2,2,'2.4286','2023-01-09');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `staff` */

insert  into `staff`(`staff_id`,`login_id`,`hod_id`,`staff_name`,`email`,`phone`) values 
(1,9,1,'syam','sam@gmail.com',99889999),
(2,12,2,'zdc','asca',1252651),
(3,13,4,'asha','asha@gmail.com',7894561230);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `student` */

insert  into `student`(`student_id`,`login_id`,`hod_id`,`student_name`,`email`,`phone`,`image`) values 
(1,3,1,'syamr','sam@gmail.com',646465,'static/c264e036-a07c-451a-a5e1-5716bba43fcaWIN_20230109_10_15_11_Pro.jpg'),
(2,4,1,'mebin','sam@gmail.com',45415456,'static/885e1237-f3b6-457e-86e0-c4c6654b8824WIN_20230109_14_26_29_Pro.jpg'),
(3,14,4,'shemeem','sh@gmail.com',7894561230,'static/c502d0d1-3447-465e-b7b4-1891769f873bWIN_20240304_12_44_07_Pro.jpg');

/*Table structure for table `subject` */

DROP TABLE IF EXISTS `subject`;

CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `subject_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `subject` */

insert  into `subject`(`subject_id`,`course_id`,`subject_name`) values 
(1,2,'Civil And Mechanical Workshop'),
(2,3,'BLOCKCHAIN'),
(3,4,'DISTRIBUTED COMPUTING'),
(4,6,'Basics Of Civil And Mechanical Engineering');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
