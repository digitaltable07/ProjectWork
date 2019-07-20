-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: dts
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customerdetails`
--

DROP TABLE IF EXISTS `customerdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customerdetails` (
  `mobile_no` bigint(10) NOT NULL,
  `customer_firstname` varchar(30) DEFAULT NULL,
  `customer_lastname` varchar(30) DEFAULT NULL,
  `email_id` varchar(25) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `mobile_no_UNIQUE` (`mobile_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerdetails`
--

LOCK TABLES `customerdetails` WRITE;
/*!40000 ALTER TABLE `customerdetails` DISABLE KEYS */;
INSERT INTO `customerdetails` VALUES (8149889385,'mayuri','mali','abc@gmail.com',1);
/*!40000 ALTER TABLE `customerdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `feedback` (
  `feedback_no` int(11) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `rating` varchar(10) DEFAULT NULL,
  `feedback_date` date DEFAULT NULL,
  `mobile_no` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`feedback_no`),
  KEY `menu_refere` (`menu_id`),
  CONSTRAINT `menu_refere` FOREIGN KEY (`menu_id`) REFERENCES `menudetails` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menudetails`
--

DROP TABLE IF EXISTS `menudetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `menudetails` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(45) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `quantity_half` varchar(5) DEFAULT NULL,
  `price_half` float DEFAULT NULL,
  `quantity_full` varchar(5) DEFAULT NULL,
  `price_full` float DEFAULT NULL,
  `time_for_preparation` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `menu_name_UNIQUE` (`menu_name`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `menumaster` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menudetails`
--

LOCK TABLES `menudetails` WRITE;
/*!40000 ALTER TABLE `menudetails` DISABLE KEYS */;
INSERT INTO `menudetails` VALUES (11,'Veg Biryani',1,'half',60,'full',120,'20');
/*!40000 ALTER TABLE `menudetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menumaster`
--

DROP TABLE IF EXISTS `menumaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `menumaster` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menumaster`
--

LOCK TABLES `menumaster` WRITE;
/*!40000 ALTER TABLE `menumaster` DISABLE KEYS */;
INSERT INTO `menumaster` VALUES (1,'Veg');
/*!40000 ALTER TABLE `menumaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orderdetails` (
  `sr_no` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`sr_no`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `ordermaster` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (1,1,11,150);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordermaster`
--

DROP TABLE IF EXISTS `ordermaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ordermaster` (
  `order_id` int(11) NOT NULL,
  `table_id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `order_time` time DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `table_id` (`table_id`),
  CONSTRAINT `customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customerdetails` (`customer_id`),
  CONSTRAINT `table_id` FOREIGN KEY (`table_id`) REFERENCES `tablemaster` (`table_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordermaster`
--

LOCK TABLES `ordermaster` WRITE;
/*!40000 ALTER TABLE `ordermaster` DISABLE KEYS */;
INSERT INTO `ordermaster` VALUES (1,1,'2019-07-19','00:00:04',1);
/*!40000 ALTER TABLE `ordermaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
  CONSTRAINT `order_no` FOREIGN KEY (`order_no`) REFERENCES `orderdetails` (`order_id`),
  CONSTRAINT `payment_mode` FOREIGN KEY (`payment_mode`) REFERENCES `paymentmode` (`mode_id`),
  CONSTRAINT `table_no` FOREIGN KEY (`table_no`) REFERENCES `tablemaster` (`table_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmode`
--

DROP TABLE IF EXISTS `paymentmode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `paymentmode` (
  `mode_id` int(11) NOT NULL,
  `mode_name` varchar(410) DEFAULT NULL,
  PRIMARY KEY (`mode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmode`
--

LOCK TABLES `paymentmode` WRITE;
/*!40000 ALTER TABLE `paymentmode` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymentmode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablemaster`
--

DROP TABLE IF EXISTS `tablemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tablemaster` (
  `table_no` int(11) NOT NULL,
  `table_desc` varchar(45) DEFAULT NULL,
  `tab_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`table_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablemaster`
--

LOCK TABLES `tablemaster` WRITE;
/*!40000 ALTER TABLE `tablemaster` DISABLE KEYS */;
INSERT INTO `tablemaster` VALUES (1,'4-seats',121);
/*!40000 ALTER TABLE `tablemaster` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-20 11:41:34
