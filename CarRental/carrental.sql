/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 8.0.40 : Database - carrental
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`carrental` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `carrental`;

/*Table structure for table `bookings` */

DROP TABLE IF EXISTS `bookings`;

CREATE TABLE `bookings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `car_id` int DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `car_id` (`car_id`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `bookings` */

insert  into `bookings`(`id`,`user_id`,`car_id`,`from_date`,`to_date`) values 
(2,1,1,'2025-04-27','2025-04-30'),
(3,1,2,'2025-04-30','2025-04-30'),
(4,1,3,'2025-04-27','2025-04-30'),
(5,1,4,'2025-04-28','2025-04-29'),
(6,1,5,'2025-04-22','2025-04-23'),
(7,1,2,'2025-04-28','2025-04-29'),
(8,1,5,'2025-04-29','2025-04-30'),
(9,1,1,'2025-04-23','2025-04-30'),
(10,1,1,'2025-04-29','2025-04-30'),
(11,1,2,'2025-04-30','2025-05-01'),
(12,2,3,'2025-04-29','2025-04-30');

/*Table structure for table `cars` */

DROP TABLE IF EXISTS `cars`;

CREATE TABLE `cars` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand` varbinary(20) DEFAULT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `price_per_day` decimal(10,2) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '1',
  `description` varchar(20) DEFAULT NULL,
  `image_url` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `cars` */

insert  into `cars`(`id`,`brand`,`model`,`price_per_day`,`available`,`description`,`image_url`) values 
(1,'TATA','Harrier',7000.00,1,'2025','https://img.autocarindia.com/model/uploads/modelimages/Tata-Harrier-181020231331.jpg?w=872&h=578&q=75&c=1'),
(2,'Mahindra','XUV 700',7000.00,1,'2024','https://img.autocarindia.com/model/uploads/modelimages/Mahindra-XUV700-231020211218.jpg?w=750&h=500&q=90&c=1'),
(3,'TOYOTA','Fortuner',10000.00,1,'2025','https://imagecdnsa.zigwheels.ae/large/gallery/exterior/40/424/toyota-fortuner-front-angle-low-view-609840.jpg'),
(4,'TATA','Safari',9000.00,1,'2025','https://imgd.aeplcdn.com/1056x594/n/1thnqbb_1693419.jpg?q=80'),
(5,'Hyundai','Verna',5000.00,1,'2025','https://stimg.cardekho.com/images/carexteriorimages/930x620/Hyundai/Verna/8703/1736412929424/front-left-side-47.jpg'),
(6,'VolksWagon','Virtus GT',7000.00,1,'2025','https://www.team-bhp.com/sites/default/files/styles/amp_high_res/public/TeamBHP.jpg');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`password`,`phone_number`) values 
(1,'Ankit','ankityadav@gmail.com','0770','9479418176'),
(2,NULL,'Anfas@gmail.com','12345',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
