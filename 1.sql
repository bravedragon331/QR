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
) ENGINE=InnoDB AUTO_INCREMENT=2942 DEFAULT CHARSET=utf8;

/*Data for the table `buyer` */

insert  into `buyer`(`id`,`Name`) values 
(1,'Catherines'),
(2,'Bella+Canvas'),
(3,'Li&Fung (Express)'),
(14,'Chico\'s FAS'),
(15,'Destination Maternity'),
(16,'Hybrid (Evy)'),
(17,'I-Mar'),
(18,'JCPenney'),
(19,'Jerry Leigh'),
(20,'Li&Fung (Kohl\'s)'),
(21,'Lane Bryant'),
(22,'Li&Fung (Lucky Brand)'),
(24,'TSF (Guess)'),
(25,'Walmart Mexico'),
(26,'OJG (William Rast)'),
(27,'Bella+Canvas (Ch98)'),
(28,'JCrew'),
(29,'Justice'),
(77,'Abercrombie&Fitch'),
(78,'Fanastics'),
(79,'Maurices'),
(88,'Bimini Bay Outfitters'),
(89,'Southern Shirts'),
(92,'Li&Fung (American Eagle)'),
(97,'Belk'),
(99,'B&Y Global (Delta)'),
(104,'Dress Barn'),
(105,'Li&Fung (Torrid)'),
(106,'Sleepwear'),
(109,'Li&Fung/GBG (Kenneth Cole)'),
(110,'Li&Fung (Under Amour)'),
(111,'Golden Touch Imports'),
(112,'Sanmar'),
(193,'Homage'),
(2910,'Li&Fung (GBG)'),
(2911,'Banana Republic'),
(2912,'Li&Fung (Aerie)'),
(2924,'Carter\'s'),
(2926,'Lucky Brand (Costco)'),
(2941,'Li&Fung (Lucky Brand Mens)');

/*Table structure for table `fabrictype` */

DROP TABLE IF EXISTS `fabrictype`;

CREATE TABLE `fabrictype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=904 DEFAULT CHARSET=utf8;

/*Data for the table `fabrictype` */

insert  into `fabrictype`(`id`,`Name`) values 
(117,'Single Jersey'),
(118,'Rib'),
(147,'Slub Single'),
(156,'Rib 1x1'),
(157,'Rib 2x2'),
(243,'French Terry'),
(244,'Pique'),
(265,'Thermal'),
(266,'Mini Zurry'),
(267,'Rib 2x1'),
(268,'Rib 4x2'),
(269,'Yoko'),
(270,'Interlock'),
(271,'Baby Pointel'),
(272,'Fleece'),
(275,'Rib 3x3'),
(276,'Burnout'),
(277,'Drop Needle'),
(615,'Waffle'),
(871,'Damboru'),
(873,'Sakariba'),
(901,'Retazo'),
(902,'Stripe Slub Single'),
(903,'Stripe Single Jersey');

/*Table structure for table `factoryidx` */

DROP TABLE IF EXISTS `factoryidx`;

CREATE TABLE `factoryidx` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `factoryidx` */

insert  into `factoryidx`(`Idx`,`Name`) values 
(1,'Head Office'),
(3,'JS International, S.A.'),
(4,'Development'),
(5,'Sewing Factory 1'),
(7,'People & Arts, S.A.'),
(8,'INT Bodega'),
(9,'Recepsa'),
(10,'Recepsa Bodega');

/*Table structure for table `outdetail` */

DROP TABLE IF EXISTS `outdetail`;

CREATE TABLE `outdetail` (
  `idx` int(10) NOT NULL AUTO_INCREMENT,
  `outPidx` int(11) DEFAULT NULL,
  `inIdx` int(11) DEFAULT NULL,
  `Qty1` int(11) DEFAULT NULL,
  `Qty2` int(11) DEFAULT NULL,
  `moveStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `outdetail` */

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
(7,'monitor@admin.com','$2a$08$Xy/.qTnjObx2f83PpvkXtOD4BINjchN4xeBu7/5b0uT.7h2NuccCK',1,'2018-06-15 16:43:20');

/*Table structure for table `whfabricd` */

DROP TABLE IF EXISTS `whfabricd`;

CREATE TABLE `whfabricd` (
  `Idx` int(11) NOT NULL,
  `Pidx` int(11) DEFAULT NULL,
  `FabricType` int(11) DEFAULT NULL,
  `FabricIdx` varchar(120) DEFAULT NULL,
  `Buyer` int(11) DEFAULT '0',
  `Color` varchar(30) DEFAULT NULL,
  `Lote` varchar(15) DEFAULT NULL,
  `Rack` varchar(5) DEFAULT NULL,
  `QtyYds` decimal(12,3) DEFAULT NULL,
  `QtyRoll` decimal(12,3) DEFAULT NULL,
  `Width` varchar(20) DEFAULT NULL,
  `Weight` varchar(20) DEFAULT NULL,
  `Fileno` varchar(50) DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL,
  `MoveStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `whfabricd` */

insert  into `whfabricd`(`Idx`,`Pidx`,`FabricType`,`FabricIdx`,`Buyer`,`Color`,`Lote`,`Rack`,`QtyYds`,`QtyRoll`,`Width`,`Weight`,`Fileno`,`Remarks`,`MoveStatus`) values 
(1,1,2,'1',2,'1','1','2',2.000,1.000,'1','1','1','1',0);

/*Table structure for table `whfinishd` */

DROP TABLE IF EXISTS `whfinishd`;

CREATE TABLE `whfinishd` (
  `Idx` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `whfinishd` */

insert  into `whfinishd`(`Idx`,`Pidx`,`Buyer`,`Fileno`,`Styleno`,`Pono`,`Color`,`Size`,`Qty`,`Status`,`MoveStatus`) values 
(1,1,1,'1','1','1','1','1',2,'1',0),
(2,19,3,'','2303376','','CASUAL NEW OLIVE','XL',8,'1',1),
(3,19,3,'','2303376','','CASUAL NEW OLIVE','2XL',6,'1',1),
(4,19,3,'','2303376','','MED. HTHR GREY','XS',1,'1',1),
(5,19,3,'','2303376','','MED. HTHR GREY','L',5,'1',1),
(6,19,3,'','2303376','','MED. HTHR GREY','XL',3,'1',1),
(7,19,3,'','2303376','','MED. HTHR GREY','2XL',8,'1',1),
(8,20,3,'','28800051','','PITCH BLACK','XS',16,'1',1),
(9,20,3,'','28800051','','PITCH BLACK','S',16,'1',1),
(10,20,3,'','28800051','','PITCH BLACK','M',7,'1',1),
(11,20,3,'','28800051','','PITCH BLACK','L',21,'1',1),
(12,20,3,'','28800051','','PITCH BLACK','XL',10,'1',1),
(13,20,3,'','8800225A','','PITCH BLACK','XS',16,'1',1),
(14,20,3,'','8800225A','','PITCH BLACK','S',16,'1',1),
(15,20,3,'','8800225A','','PITCH BLACK','M',8,'1',1),
(16,20,3,'','8800225A','','PITCH BLACK','L',21,'1',1),
(17,20,3,'','8800225A','','PITCH BLACK','XL',10,'1',1),
(18,20,3,'','8800225A','','TRUE WHITE','S',8,'1',1),
(19,20,3,'','8800225A','','TRUE WHITE','M',1,'1',1),
(20,21,3,'','86H3460','','PALE SNOW HTHR','XS',18,'1',1),
(21,21,3,'','86H3460','','PALE SNOW HTHR','S',8,'1',1),
(22,21,3,'','86H3460','','PALE SNOW HTHR','M',12,'1',1),
(23,21,3,'','86H3460','','PALE SNOW HTHR','L',18,'1',1),
(24,21,3,'','28800034','','GREEN','XS',2,'1',1),
(25,21,3,'','28800034','','GREEN','M',3,'1',1),
(26,21,3,'','8800102D','','CLOUD','XS',2,'1',1),
(27,21,3,'','8800102D','','CLOUD','S',1,'1',1),
(28,21,3,'','8800102D','','CLOUD','M',1,'1',1),
(29,21,3,'','8800102D','','CLOUD','L',2,'1',1),
(30,22,3,'','70T3969','','BLACK CURRANT','XS',10,'1',1),
(31,22,3,'','70T3969','','BLACK CURRANT','S',5,'1',1),
(32,22,3,'','70T3969','','BLACK CURRANT','M',11,'1',1),
(33,22,3,'','70T3969','','BLACK CURRANT','L',9,'1',1),
(34,22,3,'','70T3969','','BLACK CURRANT','XL',6,'1',1),
(35,23,3,'','8604509','','NEW VINTAGE PINK','XXS',4,'1',1),
(36,23,3,'','8604509','','NEW VINTAGE PINK','XS',1,'1',1),
(37,23,3,'','8604509','','NEW VINTAGE PINK','M',7,'1',1),
(38,23,3,'','8604509','','NEW VINTAGE PINK','L',14,'1',1),
(39,23,3,'','8604509','','NEW VINTAGE PINK','XL',6,'1',1),
(40,23,3,'','8604509','','PURPLE VEIL','XXS',4,'1',1),
(41,23,3,'','8604509','','PURPLE VEIL','XS',14,'1',1),
(42,23,3,'','8604509','','PURPLE VEIL','S',7,'1',1),
(43,23,3,'','8604509','','PURPLE VEIL','L',10,'1',1),
(44,23,3,'','8800201','','NEW VINTAGE PINK/TRUE WHITE','XXS',3,'1',1),
(45,23,3,'','8800201','','NEW VINTAGE PINK/TRUE WHITE','XS',1,'1',1),
(46,23,3,'','8800201','','NEW VINTAGE PINK/TRUE WHITE','S',2,'1',1),
(47,23,3,'','8800201','','NEW VINTAGE PINK/TRUE WHITE','M',1,'1',1),
(48,23,3,'','8800201','','NEW VINTAGE PINK/TRUE WHITE','L',4,'1',1),
(49,23,3,'','8800201','','NEW VINTAGE PINK/TRUE WHITE','XL',5,'1',1),
(50,24,3,'','8604786A','','CAMO GREEN','XXS',4,'1',1),
(51,24,3,'','8604786A','','CAMO GREEN','XS',2,'1',1),
(52,24,3,'','8604786A','','CAMO GREEN','S',15,'1',1),
(53,24,3,'','8604786A','','CAMO GREEN','M',10,'1',1),
(54,24,3,'','8604786A','','CAMO GREEN','L',6,'1',1),
(55,24,3,'','22300125','','SHARK GREY','XS',5,'1',1),
(56,24,3,'','22300125','','SHARK GREY','S',5,'1',1),
(57,24,3,'','2303309','','PITCH BLACK','XS',1,'1',1),
(58,24,3,'','2303309','','PITCH BLACK','L',1,'1',1),
(59,24,3,'','2303309','','PATRIOT','S',1,'1',1);

/*Table structure for table `whotherd` */

DROP TABLE IF EXISTS `whotherd`;

CREATE TABLE `whotherd` (
  `Idx` int(11) NOT NULL,
  `Pidx` int(11) DEFAULT NULL,
  `ItemType` varchar(30) DEFAULT NULL,
  `Description` varchar(80) DEFAULT NULL,
  `Qty` decimal(12,3) DEFAULT NULL,
  `Status` char(1) DEFAULT NULL,
  `MoveStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `whotherd` */

insert  into `whotherd`(`Idx`,`Pidx`,`ItemType`,`Description`,`Qty`,`Status`,`MoveStatus`) values 
(1,1,'1','1',1.000,'1',5);

/*Table structure for table `whwarehouse` */

DROP TABLE IF EXISTS `whwarehouse`;

CREATE TABLE `whwarehouse` (
  `Idx` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `whwarehouse` */

insert  into `whwarehouse`(`Idx`,`FactoryIdx`,`WorkOrderIdx`,`OutPlace`,`Delivered`,`ReceivePlace`,`OutDate`,`RcvdDate`,`Remarks`,`OutType`,`Location`,`RefNo`) values 
(1,1,'2',1,'1',1,'2018-06-14 00:00:00','2018-06-12 00:00:00','1','T','1','1'),
(2,1,'1',2,'1',1,'2018-06-10 00:00:00','2018-06-10 00:00:00','1','F','1','1'),
(3,1,'1',1,'1',1,'2018-06-16 23:02:51','2018-06-16 23:02:53','1','O','1','1'),
(19,5,'WBS-18529001',5,'',8,'2018-05-29 00:00:00','2000-01-01 00:00:00','','F','','1'),
(20,5,'WBS-18529002',5,'',8,'2018-05-29 00:00:00','2000-01-01 00:00:00','','F','','2'),
(21,5,'WBS-18529003',5,'',8,'2018-05-29 00:00:00','2000-01-01 00:00:00','','F','','3'),
(22,5,'WBS-18529004',5,'',8,'2018-05-29 00:00:00','2000-01-01 00:00:00','','F','','4'),
(23,5,'WBS-18529005',5,'',8,'2018-05-29 00:00:00','2000-01-01 00:00:00','','F','','5'),
(24,5,'WBS-18529006',5,'',8,'2018-05-29 00:00:00','2000-01-01 00:00:00','','F','','6');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
