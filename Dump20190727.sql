-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: localhost    Database: dts
-- ------------------------------------------------------
-- Server version	5.7.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` varchar(255) NOT NULL,
  `admin_pass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customerdetails`
--

DROP TABLE IF EXISTS `customerdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerdetails` (
  `mobile_no` bigint(10) NOT NULL,
  `customer_firstname` varchar(30) DEFAULT NULL,
  `customer_lastname` varchar(30) DEFAULT NULL,
  `email_id` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`mobile_no`),
  UNIQUE KEY `customer_firstname_UNIQUE` (`customer_firstname`),
  UNIQUE KEY `customer_lastname_UNIQUE` (`customer_lastname`),
  UNIQUE KEY `email_id_UNIQUE` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `feedback_no` int(11) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `rating` varchar(10) DEFAULT NULL,
  `feedback_date` date DEFAULT NULL,
  `mobile_no` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`feedback_no`),
  UNIQUE KEY `menu_id_UNIQUE` (`menu_id`),
  KEY `menu_refere` (`menu_id`),
  KEY `FK_mobileno` (`mobile_no`),
  CONSTRAINT `FK_mobileno` FOREIGN KEY (`mobile_no`) REFERENCES `customerdetails` (`mobile_no`),
  CONSTRAINT `menu_refere` FOREIGN KEY (`menu_id`) REFERENCES `menudetails` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menudetails`
--

DROP TABLE IF EXISTS `menudetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menudetails` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(45) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `price_half` float DEFAULT NULL,
  `price_full` float DEFAULT NULL,
  `time_for_preparation` time(6) DEFAULT NULL,
  `add_on_time` time(6) DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `menu_name_UNIQUE` (`menu_name`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `menumaster` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menumaster`
--

DROP TABLE IF EXISTS `menumaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menumaster` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name_UNIQUE` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetails` (
  `sr_no` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`sr_no`),
  KEY `order_id` (`order_id`),
  KEY `FK_menuid` (`menu_id`),
  CONSTRAINT `FK_menuid` FOREIGN KEY (`menu_id`) REFERENCES `menudetails` (`menu_id`),
  CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `ordermaster` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ordermaster`
--

DROP TABLE IF EXISTS `ordermaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordermaster` (
  `order_id` int(11) NOT NULL,
  `table_id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `order_time` time DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `table_id` (`table_id`),
  CONSTRAINT `table_id` FOREIGN KEY (`table_id`) REFERENCES `tablemaster` (`table_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `table_no` int(11) DEFAULT NULL,
  `mobile_no` bigint(10) DEFAULT NULL,
  `order_no` int(11) DEFAULT NULL,
  `payment_amount` double DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_mode` int(11) DEFAULT NULL,
  `receipt_no` int(11) DEFAULT NULL,
  `transaction_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `table_no` (`table_no`),
  KEY `order_no` (`order_no`),
  KEY `payment_mode` (`payment_mode`),
  KEY `FK_mobileNo1` (`mobile_no`),
  CONSTRAINT `FK_mobileNo1` FOREIGN KEY (`mobile_no`) REFERENCES `customerdetails` (`mobile_no`),
  CONSTRAINT `order_no` FOREIGN KEY (`order_no`) REFERENCES `orderdetails` (`order_id`),
  CONSTRAINT `payment_mode` FOREIGN KEY (`payment_mode`) REFERENCES `paymentmode` (`mode_id`),
  CONSTRAINT `table_no` FOREIGN KEY (`table_no`) REFERENCES `tablemaster` (`table_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paymentmode`
--

DROP TABLE IF EXISTS `paymentmode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentmode` (
  `mode_id` int(11) NOT NULL,
  `mode_name` varchar(410) DEFAULT NULL,
  PRIMARY KEY (`mode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tablemaster`
--

DROP TABLE IF EXISTS `tablemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tablemaster` (
  `table_no` int(11) NOT NULL DEFAULT '0',
  `no_of_seats` int(11) DEFAULT NULL,
  `table_desc` varchar(30) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`table_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-27 15:10:30
