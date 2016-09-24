-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.39-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema shopnohut
--

CREATE DATABASE IF NOT EXISTS shopnohut;
USE shopnohut;

--
-- Definition of table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `id_account` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `new_balance` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_account`),
  KEY `transaction_accounts_fk` (`transaction_id`),
  CONSTRAINT `transaction_accounts_fk` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` (`id_account`,`transaction_id`,`new_balance`) VALUES 
 (1,1,300),
 (2,2,480),
 (3,3,7480),
 (4,4,7660),
 (5,5,7960),
 (6,6,8260),
 (7,7,8560),
 (8,8,8910),
 (9,9,9260),
 (10,10,9610),
 (11,11,9750),
 (12,12,9890),
 (13,13,10030);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;


--
-- Definition of table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `price` double NOT NULL,
  `total_price` double NOT NULL,
  `create_date` date NOT NULL,
  `update_date` date NOT NULL,
  `guest_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cart_id`) USING BTREE,
  KEY `customer_cart_fk` (`user_id`),
  KEY `product_info_cart_fk` (`code`) USING BTREE,
  KEY `guest_cart_fk` (`guest_id`) USING BTREE,
  CONSTRAINT `customer_cart_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `guest_cart_fk` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`guest_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `product_info_cart_fk` FOREIGN KEY (`code`) REFERENCES `product_info` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` (`cart_id`,`code`,`quantity`,`user_id`,`price`,`total_price`,`create_date`,`update_date`,`guest_id`) VALUES 
 (144,7,1,5,350,350,'2014-05-30','2014-05-30',NULL),
 (145,3,2,NULL,200,200,'2014-05-30','2014-05-30',268),
 (146,3,1,5,200,200,'2014-05-30','2014-05-30',NULL),
 (147,2,3,NULL,500,500,'2014-05-30','2014-05-30',269),
 (148,2,1,5,500,500,'2014-05-30','2014-05-30',NULL),
 (150,5,1,5,30000,30000,'2014-05-30','2014-05-30',NULL),
 (152,5,1,6,30000,30000,'2014-05-30','2014-05-30',NULL),
 (154,1,3,6,500,500,'2014-05-30','2014-05-30',NULL),
 (156,1,1,NULL,500,500,'2014-06-01','2014-06-01',296),
 (157,8,1,NULL,1000,1000,'2014-06-01','2014-06-01',296),
 (158,5,1,NULL,30000,30000,'2014-06-01','2014-06-01',296),
 (159,7,1,NULL,350,350,'2014-06-01','2014-06-01',296),
 (161,4,1,2,74000,74000,'2014-06-04','2014-06-04',NULL),
 (167,4,1,3,74000,74000,'2014-06-04','2014-06-04',NULL),
 (168,5,1,3,30000,30000,'2014-06-05','2014-06-05',NULL),
 (169,7,4,3,350,350,'2014-06-05','2014-06-05',NULL);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;


--
-- Definition of table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(250) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`category_id`,`category_name`) VALUES 
 (1,'Book'),
 (2,'Electronics'),
 (3,'Software'),
 (4,'Gift'),
 (5,'Clothes'),
 (6,'Dress');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


--
-- Definition of table `guest`
--

DROP TABLE IF EXISTS `guest`;
CREATE TABLE `guest` (
  `guest_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user_type` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`guest_id`),
  KEY `user_type_guest_fk` (`id_user_type`) USING BTREE,
  CONSTRAINT `user_type_guest_fk` FOREIGN KEY (`id_user_type`) REFERENCES `user_type` (`id_user_type`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guest`
--

/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` (`guest_id`,`id_user_type`) VALUES 
 (268,2),
 (269,2),
 (273,2),
 (275,2),
 (276,2),
 (277,2),
 (279,2),
 (286,2),
 (287,2),
 (288,2),
 (289,2),
 (291,2),
 (292,2),
 (293,2),
 (295,2),
 (296,2),
 (297,2),
 (298,2),
 (299,2),
 (300,2),
 (301,2),
 (303,2),
 (304,2),
 (305,2),
 (307,2),
 (308,2),
 (309,2),
 (310,2),
 (312,2),
 (313,2),
 (314,2),
 (315,2);
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;


--
-- Definition of table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `message` varchar(1000) NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` (`message_id`,`email`,`date`,`name`,`message`) VALUES 
 (1,'a@b.com','2014-05-18','abc','fghtykyn fgjkmyujm'),
 (2,'oushneek@gmail.com','2014-05-18','oushneek','fgerthr6  jyukynryuk7uk6uj yjukjtj yj6uku   j56 yjjj j6tujukj7ku hrujtuk yjttjtukk'),
 (3,'oushneek@gmail.com','2014-05-18','oushneek','fgerthr6  jyukynryuk7uk6uj yjukjtj yj6uku   j56 yjjj j6tujukj7ku hrujtuk yjttjtukk'),
 (4,'oushneek@gmail.com','2014-05-18','oushneek','fgerthr6  jyukynryuk7uk6uj yjukjtj yj6uku   j56 yjjj j6tujukj7ku hrujtuk yjttjtukk'),
 (5,'uuuu@j','2014-06-01','iiiiiiiiiiiii','hhhhhh');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;


--
-- Definition of table `order_list`
--

DROP TABLE IF EXISTS `order_list`;
CREATE TABLE `order_list` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_status` int(11) NOT NULL DEFAULT '0',
  `create_date` date NOT NULL,
  `update_date` date DEFAULT NULL,
  `new_address` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `product_order_list_fk` (`product_id`),
  KEY `user_order_list_fk` (`user_id`),
  CONSTRAINT `product_order_list_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_order_list_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_list`
--

/*!40000 ALTER TABLE `order_list` DISABLE KEYS */;
INSERT INTO `order_list` (`order_id`,`product_id`,`user_id`,`order_status`,`create_date`,`update_date`,`new_address`) VALUES 
 (53,1,3,1,'2014-05-15','2014-05-15',NULL),
 (54,5,3,1,'2014-05-15','2014-05-15','dhaka'),
 (55,12,3,1,'2014-05-15','2014-05-15',NULL),
 (56,6,3,1,'2014-05-15','2014-05-15',NULL),
 (57,2,3,0,'2014-05-15','2014-05-15',NULL),
 (58,3,3,0,'2014-05-15','2014-05-15',NULL),
 (59,4,3,0,'2014-05-15','2014-05-15',NULL),
 (60,32,3,0,'2014-05-15','2014-05-15',NULL),
 (61,33,3,0,'2014-05-15','2014-05-15',NULL),
 (62,34,3,0,'2014-05-15','2014-05-15',NULL),
 (63,7,3,0,'2014-05-15','2014-05-15',NULL),
 (64,8,3,0,'2014-05-15','2014-05-15',NULL),
 (65,9,3,0,'2014-05-15','2014-05-15',NULL);
/*!40000 ALTER TABLE `order_list` ENABLE KEYS */;


--
-- Definition of table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `is_sold` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`),
  KEY `purchase_history_product_fk` (`purchase_id`),
  KEY `product_info_product_fk` (`code`),
  CONSTRAINT `product_info_product_fk` FOREIGN KEY (`code`) REFERENCES `product_info` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `purchase_history_product_fk` FOREIGN KEY (`purchase_id`) REFERENCES `purchase_history` (`purchase_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`product_id`,`code`,`purchase_id`,`is_sold`) VALUES 
 (1,1,1,1),
 (2,1,1,1),
 (3,1,1,1),
 (4,1,1,1),
 (5,2,2,1),
 (6,2,2,1),
 (7,3,3,1),
 (8,3,3,1),
 (9,3,3,1),
 (10,4,4,0),
 (11,4,4,0),
 (12,5,5,1),
 (13,5,5,0),
 (14,6,6,0),
 (15,6,6,0),
 (16,6,6,0),
 (17,7,7,0),
 (18,7,7,0),
 (19,7,7,0),
 (32,1,8,1),
 (33,1,8,1),
 (34,1,8,1),
 (35,1,8,0),
 (36,1,8,0),
 (37,1,8,0),
 (38,1,8,0),
 (39,1,8,0),
 (40,1,8,0),
 (41,1,8,0),
 (42,1,8,0),
 (43,1,8,0),
 (58,7,10,0),
 (59,7,10,0),
 (60,7,10,0),
 (61,7,10,0),
 (62,2,11,0),
 (63,2,11,0),
 (64,2,11,0),
 (65,2,11,0),
 (66,2,11,0),
 (67,2,11,0),
 (68,2,11,0),
 (69,2,11,0),
 (70,2,11,0),
 (71,2,11,0),
 (72,2,11,0),
 (73,2,11,0),
 (74,2,11,0),
 (75,2,11,0),
 (76,2,11,0),
 (77,2,11,0),
 (78,7,12,0),
 (79,7,12,0),
 (80,7,12,0),
 (81,7,12,0),
 (82,7,12,0),
 (83,3,13,0),
 (84,3,13,0),
 (85,3,13,0),
 (86,3,13,0),
 (87,3,13,0),
 (88,8,14,0),
 (89,8,14,0),
 (90,8,14,0),
 (91,8,14,0),
 (92,8,14,0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


--
-- Definition of table `product_info`
--

DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `subcategory_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `price_sell` double NOT NULL,
  `description` varchar(250) NOT NULL,
  `total_quantity` int(11) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `image_url` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `subcategory_product_info_fk` (`subcategory_id`),
  CONSTRAINT `subcategory_product_info_fk` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory` (`subcategory_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_info`
--

/*!40000 ALTER TABLE `product_info` DISABLE KEYS */;
INSERT INTO `product_info` (`code`,`subcategory_id`,`name`,`price_sell`,`description`,`total_quantity`,`discount`,`image_url`) VALUES 
 (1,1,'Adventure of Tintin',500,'This is a book.',9,0,'Adventure of Tintin.jpg'),
 (2,1,'New Jules Verne Adventure',500,'This is a book of jules verne.',16,0,'New Jules Verne Adventure.jpg'),
 (3,2,'Comedy',200,'This is a comedy book.',5,0,'Comedy.jpg'),
 (4,3,'Laptop asd',74000,'This is a laptop asd.',2,2000,'Laptop asd.jpg'),
 (5,4,'Camera gfh',30000,'This is a camera gfh.',1,0,'Camera gfh.jpg'),
 (6,5,'Birthday card1',250,'This is a ghnghjgy.',3,20,'Birthday card1.jpg'),
 (7,6,'Chess Board',350,'This is a ghnghjgy.',12,0,'Chess Board.jpg'),
 (8,9,'Kids1',1000,'This is a dress. dhfthm j ehtdy ksfhftk  dgjftujkg jgfj',5,50,'Kids1.jpg');
/*!40000 ALTER TABLE `product_info` ENABLE KEYS */;


--
-- Definition of table `purchase_history`
--

DROP TABLE IF EXISTS `purchase_history`;
CREATE TABLE `purchase_history` (
  `purchase_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_cost` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_cost` double NOT NULL,
  `create_date` date NOT NULL,
  PRIMARY KEY (`purchase_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_history`
--

/*!40000 ALTER TABLE `purchase_history` DISABLE KEYS */;
INSERT INTO `purchase_history` (`purchase_id`,`unit_cost`,`quantity`,`total_cost`,`create_date`) VALUES 
 (1,200,4,800,'2014-05-08'),
 (2,320,2,640,'2014-05-08'),
 (3,80,3,240,'2014-05-08'),
 (4,53000,2,156000,'2014-05-08'),
 (5,23000,2,46000,'2014-05-08'),
 (6,50,3,150,'2014-05-08'),
 (7,400,3,1200,'2014-05-08'),
 (8,150,12,1800,'2014-05-11'),
 (10,200,4,800,'2014-05-11'),
 (11,200,16,3200,'2014-05-16'),
 (12,300,5,1500,'2014-05-16'),
 (13,100,5,500,'2014-05-16'),
 (14,700,5,3500,'2014-05-31');
/*!40000 ALTER TABLE `purchase_history` ENABLE KEYS */;


--
-- Definition of table `relational_table`
--

DROP TABLE IF EXISTS `relational_table`;
CREATE TABLE `relational_table` (
  `purchase_id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  KEY `purchase_history_new_table_fk` (`purchase_id`),
  KEY `product_info_new_table_fk` (`code`),
  CONSTRAINT `product_info_new_table_fk` FOREIGN KEY (`code`) REFERENCES `product_info` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `purchase_history_new_table_fk` FOREIGN KEY (`purchase_id`) REFERENCES `purchase_history` (`purchase_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `relational_table`
--

/*!40000 ALTER TABLE `relational_table` DISABLE KEYS */;
INSERT INTO `relational_table` (`purchase_id`,`code`) VALUES 
 (2,2),
 (3,3),
 (4,4),
 (5,5),
 (6,6),
 (7,7),
 (1,1),
 (8,1),
 (10,7),
 (11,2),
 (12,7),
 (13,3),
 (14,8);
/*!40000 ALTER TABLE `relational_table` ENABLE KEYS */;


--
-- Definition of table `site_info`
--

DROP TABLE IF EXISTS `site_info`;
CREATE TABLE `site_info` (
  `site_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `info_type` varchar(250) NOT NULL,
  `info` varchar(250) NOT NULL,
  PRIMARY KEY (`site_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site_info`
--

/*!40000 ALTER TABLE `site_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_info` ENABLE KEYS */;


--
-- Definition of table `special_product`
--

DROP TABLE IF EXISTS `special_product`;
CREATE TABLE `special_product` (
  `code` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  KEY `product_info_special_product_fk` (`code`) USING BTREE,
  CONSTRAINT `code` FOREIGN KEY (`code`) REFERENCES `product_info` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `special_product`
--

/*!40000 ALTER TABLE `special_product` DISABLE KEYS */;
INSERT INTO `special_product` (`code`,`type`) VALUES 
 (1,'featured'),
 (1,'popular'),
 (4,'popular'),
 (3,'popular'),
 (3,'popular'),
 (6,'popular'),
 (7,'popular');
/*!40000 ALTER TABLE `special_product` ENABLE KEYS */;


--
-- Definition of table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
CREATE TABLE `subcategory` (
  `subcategory_id` int(11) NOT NULL AUTO_INCREMENT,
  `subcategory_name` varchar(250) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`subcategory_id`),
  KEY `cateogry_subcategory_fk` (`category_id`),
  CONSTRAINT `cateogry_subcategory_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` (`subcategory_id`,`subcategory_name`,`category_id`) VALUES 
 (1,'Adventure',1),
 (2,'Comedy',1),
 (3,'Laptop',2),
 (4,'Camera',2),
 (5,'Gift cards',4),
 (6,'Chess Board',4),
 (7,'TV',2),
 (8,'Games',3),
 (9,'Kids',5);
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;


--
-- Definition of table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `price_buy` double NOT NULL,
  `price_sell` double NOT NULL,
  `create_date` date NOT NULL,
  `update_date` date DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `product_transaction_fk` (`product_id`),
  CONSTRAINT `product_transaction_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` (`transaction_id`,`product_id`,`price_buy`,`price_sell`,`create_date`,`update_date`) VALUES 
 (1,1,200,500,'2014-05-15','2014-05-15'),
 (2,5,320,500,'2014-05-15','2014-05-15'),
 (3,12,23000,30000,'2014-05-15','2014-05-15'),
 (4,6,320,500,'2014-05-15','2014-05-15'),
 (5,2,200,500,'2014-05-15','2014-05-15'),
 (6,3,200,500,'2014-05-15','2014-05-15'),
 (7,4,200,500,'2014-05-15','2014-05-15'),
 (8,32,150,500,'2014-05-15','2014-05-15'),
 (9,33,150,500,'2014-05-15','2014-05-15'),
 (10,34,150,500,'2014-05-15','2014-05-15'),
 (11,7,80,220,'2014-05-15','2014-05-15'),
 (12,8,80,220,'2014-05-15','2014-05-15'),
 (13,9,80,220,'2014-05-15','2014-05-15');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `id_user_type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(250) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `address` varchar(250) NOT NULL,
  `create_date` date NOT NULL,
  `update_date` date DEFAULT NULL,
  `first_name` varchar(250) DEFAULT NULL,
  `last_name` varchar(250) DEFAULT NULL,
  `company_name` varchar(250) DEFAULT NULL,
  `company_service` varchar(250) DEFAULT NULL,
  `company_web` varchar(250) DEFAULT NULL,
  `designation` varchar(250) DEFAULT NULL,
  `alternate_email` varchar(45) DEFAULT NULL,
  `office_phone` varchar(45) DEFAULT NULL,
  `country_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_idx` (`email`),
  KEY `user_type_customer_fk` (`id_user_type`),
  CONSTRAINT `user_type_customer_fk` FOREIGN KEY (`id_user_type`) REFERENCES `user_type` (`id_user_type`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`,`email`,`password`,`id_user_type`,`name`,`mobile`,`address`,`create_date`,`update_date`,`first_name`,`last_name`,`company_name`,`company_service`,`company_web`,`designation`,`alternate_email`,`office_phone`,`country_code`) VALUES 
 (1,'a@b.com','1',0,'aaa','00','sylhet','2014-05-06','2014-05-06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (2,'admin@sust.edu','2',1,'Admin','00','sylhet','2014-05-06','2014-05-06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (3,'oushneek@gmail.com','h',0,'Tazbeea Tazakka Oushneek','01926740528','SUST','2014-05-06','2014-05-17','Tazbeea','Tazakka','null','null','null','null','oushneek@yahoo.com','null',0),
 (4,'hridoy@gmail.com','2',0,'Hridoy','00','sylhet','2014-05-06','2014-05-06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (5,'test@test.com','1',0,'test','+88000','dhaka bangladesh','2014-05-13','2014-05-13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (6,'test2@test.com','3',0,'test2','+8807221','fdhgfhmvgvbxfdgn','2014-05-13','2014-05-13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (7,'test3@test.com','1',0,'test3','11111','rfgrtyjkiu8kfggjgsfdbgwrthrthtyjrtbxfj','2014-05-13','2014-05-13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (8,'abc@abc.com','1',0,'abc','11','sssssss','2014-05-13','2014-05-13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Definition of table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
CREATE TABLE `user_type` (
  `id_user_type` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) NOT NULL,
  `comment` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_user_type`),
  UNIQUE KEY `unique_user_type` (`type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_type`
--

/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` (`id_user_type`,`type_name`,`comment`) VALUES 
 (0,'Customer','Customer'),
 (1,'Admin','Admin'),
 (2,'Guest','Guest user');
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;


--
-- Definition of table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE `wishlist` (
  `wishlist_id` int(11) NOT NULL,
  `wishlist_name` varchar(250) NOT NULL DEFAULT 'Wishlist',
  `user_id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `create_date` date NOT NULL,
  `update_date` date DEFAULT NULL,
  PRIMARY KEY (`wishlist_id`,`code`) USING BTREE,
  KEY `customer_wishlist_fk` (`user_id`),
  KEY `product_info_wishlist_fk` (`code`) USING BTREE,
  CONSTRAINT `customer_wishlist_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `product_info_wishlist_fk` FOREIGN KEY (`code`) REFERENCES `product_info` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` (`wishlist_id`,`wishlist_name`,`user_id`,`code`,`create_date`,`update_date`) VALUES 
 (1,'Wishlist',1,1,'2014-05-13','2014-05-13'),
 (1,'Wishlist',1,5,'2014-05-12','2014-05-12'),
 (1,'Wishlist',1,7,'2014-05-13','2014-05-13'),
 (3,'Wishlist',3,1,'2014-05-17','2014-05-17'),
 (3,'Wishlist',3,2,'2014-05-17','2014-05-17'),
 (4,'Wishlist',4,1,'2014-05-14','2014-05-14');
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
