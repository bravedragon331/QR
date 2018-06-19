/*
SQLyog Community v12.3.2 (64 bit)
MySQL - 5.6.26 : Database - qr
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`qr` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `qr`;

/*Table structure for table `buyer` */

DROP TABLE IF EXISTS `buyer`;

CREATE TABLE `buyer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `buyer` */

insert  into `buyer`(`id`,`Name`) values 
(1,'Buyer1'),
(2,'Buyer2');

/*Table structure for table `fabrictype` */

DROP TABLE IF EXISTS `fabrictype`;

CREATE TABLE `fabrictype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `fabrictype` */

insert  into `fabrictype`(`id`,`Name`) values 
(1,'Type1'),
(2,'Type2');

/*Table structure for table `factoryidx` */

DROP TABLE IF EXISTS `factoryidx`;

CREATE TABLE `factoryidx` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `factoryidx` */

insert  into `factoryidx`(`Idx`,`Name`) values 
(1,'First'),
(2,'Second');

/*Table structure for table `outhouse` */

DROP TABLE IF EXISTS `outhouse`;

CREATE TABLE `outhouse` (
  `Idx` int(10) NOT NULL AUTO_INCREMENT,
  `OutDate` datetime DEFAULT NULL,
  `OutPlace` int(11) DEFAULT NULL,
  `Delivered` varchar(30) DEFAULT NULL,
  `ReceivePlace` int(11) DEFAULT NULL,
  `RcvdDate` datetime DEFAULT NULL,
  `Remark` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `outhouse` */

insert  into `outhouse`(`Idx`,`OutDate`,`OutPlace`,`Delivered`,`ReceivePlace`,`RcvdDate`,`Remark`) values 
(1,'2018-06-13 00:00:00',2,'2',2,'2018-06-13 00:00:00','123'),
(2,'2018-06-18 00:00:00',1,'123',1,'2018-06-18 00:00:00','123'),
(3,'2018-06-19 00:00:00',2,'123',2,'2018-06-19 00:00:00','123');

/*Table structure for table `outplace` */

DROP TABLE IF EXISTS `outplace`;

CREATE TABLE `outplace` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `outplace` */

insert  into `outplace`(`Idx`,`Name`) values 
(1,'OutPlace1'),
(2,'OutPlace2');

/*Table structure for table `receiveplace` */

DROP TABLE IF EXISTS `receiveplace`;

CREATE TABLE `receiveplace` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Idx`,`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `receiveplace` */

insert  into `receiveplace`(`Idx`,`Name`) values 
(1,'ReceivePlace1'),
(2,'ReceivePlace2');

/*Table structure for table `resettoken` */

DROP TABLE IF EXISTS `resettoken`;

CREATE TABLE `resettoken` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` varchar(300) DEFAULT NULL,
  `token` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `resettoken` */

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` varchar(300) DEFAULT NULL,
  `token` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`token`) values 
(1,'7','$2a$08$0mVcrpvgHHXL3Xex9FnrtuM5czw3uepy5DnLe5IQRn9At3Ns3lbnS');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`email`,`password`,`status`,`created_at`) values 
(7,'monitor@admin.com','$2a$08$Xy/.qTnjObx2f83PpvkXtOD4BINjchN4xeBu7/5b0uT.7h2NuccCK',1,'2018-06-15 13:43:20');

/*Table structure for table `whfabricd` */

DROP TABLE IF EXISTS `whfabricd`;

CREATE TABLE `whfabricd` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `Pidx` int(11) DEFAULT NULL,
  `FabricType` int(11) DEFAULT NULL,
  `FabricIdx` varchar(120) DEFAULT NULL,
  `Buyer` int(11) DEFAULT '0',
  `Color` varchar(30) DEFAULT NULL,
  `Lote` varchar(15) DEFAULT NULL,
  `Rack` varchar(5) DEFAULT NULL,
  `QtyYds` decimal(10,0) DEFAULT NULL,
  `QtyRoll` decimal(10,0) DEFAULT NULL,
  `Width` varchar(20) DEFAULT NULL,
  `Weight` varchar(20) DEFAULT NULL,
  `Fileno` varchar(50) DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL,
  `MoveStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `whfabricd` */

insert  into `whfabricd`(`Idx`,`Pidx`,`FabricType`,`FabricIdx`,`Buyer`,`Color`,`Lote`,`Rack`,`QtyYds`,`QtyRoll`,`Width`,`Weight`,`Fileno`,`Remarks`,`MoveStatus`) values 
(1,1,2,'1',2,'1','1','2',2,1,'1','1','1','1',0);

/*Table structure for table `whfinishd` */

DROP TABLE IF EXISTS `whfinishd`;

CREATE TABLE `whfinishd` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `Pidx` int(11) DEFAULT '0',
  `Buyer` int(11) DEFAULT NULL,
  `Fileno` varchar(11) DEFAULT NULL,
  `Styleno` varchar(100) DEFAULT NULL,
  `Pono` varchar(50) DEFAULT NULL,
  `Color` varchar(80) DEFAULT NULL,
  `Size` varchar(15) DEFAULT NULL,
  `Qty` int(11) DEFAULT '0',
  `Status` varchar(5) DEFAULT NULL,
  `MoveStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `whfinishd` */

insert  into `whfinishd`(`Idx`,`Pidx`,`Buyer`,`Fileno`,`Styleno`,`Pono`,`Color`,`Size`,`Qty`,`Status`,`MoveStatus`) values 
(1,1,1,'1','1','1','1','1',2,'1',0);

/*Table structure for table `whotherd` */

DROP TABLE IF EXISTS `whotherd`;

CREATE TABLE `whotherd` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `Pidx` int(11) DEFAULT NULL,
  `ItemType` varchar(30) DEFAULT NULL,
  `Description` varchar(80) DEFAULT NULL,
  `Qty` decimal(10,0) DEFAULT NULL,
  `Status` char(1) DEFAULT NULL,
  `MoveStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `whotherd` */

insert  into `whotherd`(`Idx`,`Pidx`,`ItemType`,`Description`,`Qty`,`Status`,`MoveStatus`) values 
(1,1,'1','1',1,'1',5);

/*Table structure for table `whwarehouse` */

DROP TABLE IF EXISTS `whwarehouse`;

CREATE TABLE `whwarehouse` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `FactoryIdx` int(11) DEFAULT NULL,
  `WorkOrderIdx` varchar(13) DEFAULT NULL,
  `OutPlace` int(11) DEFAULT '0',
  `Delivered` varchar(30) DEFAULT NULL,
  `ReceivePlace` int(11) DEFAULT '0',
  `OutDate` datetime DEFAULT NULL,
  `RcvdDate` datetime DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL,
  `OutType` char(1) DEFAULT NULL,
  `Location` char(3) DEFAULT NULL,
  `RefNo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `whwarehouse` */

insert  into `whwarehouse`(`Idx`,`FactoryIdx`,`WorkOrderIdx`,`OutPlace`,`Delivered`,`ReceivePlace`,`OutDate`,`RcvdDate`,`Remarks`,`OutType`,`Location`,`RefNo`) values 
(1,1,'2',1,'1',1,'2018-06-14 00:00:00','2018-06-12 00:00:00','1','T','1','1'),
(2,1,'1',2,'1',1,'2018-06-10 00:00:00','2018-06-10 00:00:00','1','F','1','1'),
(3,1,'1',1,'1',1,'2018-06-16 23:02:51','2018-06-16 23:02:53','1','O','1','1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
