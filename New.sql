CREATE DATABASE  IF NOT EXISTS `adwinscom` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `adwinscom`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: adwinscom
-- ------------------------------------------------------
-- Server version	8.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batch` (
  `id` int NOT NULL AUTO_INCREMENT,
  `batch_id` int NOT NULL,
  `expired_date` date NOT NULL,
  `available_quanitiy` decimal(10,2) NOT NULL,
  `total_quantity` decimal(10,2) NOT NULL,
  `damaged_quantity` decimal(10,2) NOT NULL,
  `real_price` decimal(10,2) NOT NULL,
  `selling_price` decimal(10,2) NOT NULL,
  `batchstatus_id` int NOT NULL,
  `manufacture_date` date NOT NULL,
  `added_date` date NOT NULL,
  `updated_date` date DEFAULT NULL,
  `deleted_date` date DEFAULT NULL,
  `added_user` int NOT NULL,
  `updated_user` int DEFAULT NULL,
  `delete_user` int DEFAULT NULL,
  `product_id` int NOT NULL,
  `note` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_batch_batchstatus1_idx` (`batchstatus_id`),
  KEY `fk_batch_product1_idx` (`product_id`),
  CONSTRAINT `fk_batch_batchstatus1` FOREIGN KEY (`batchstatus_id`) REFERENCES `batchstatus` (`id`),
  CONSTRAINT `fk_batch_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch`
--

LOCK TABLES `batch` WRITE;
/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batchstatus`
--

DROP TABLE IF EXISTS `batchstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batchstatus` (
  `id` int NOT NULL,
  `batchstatus` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batchstatus`
--

LOCK TABLES `batchstatus` WRITE;
/*!40000 ALTER TABLE `batchstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `batchstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Ice Cream'),(2,'Ice Packet'),(3,'Lolly Choc'),(4,'Ice Choc '),(5,'Ice Cones');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `regno` int NOT NULL,
  `fname` varchar(45) NOT NULL,
  `sname` varchar(45) NOT NULL,
  `nic` char(10) NOT NULL,
  `mobile` int NOT NULL,
  `email` varchar(45) NOT NULL,
  `landno` int DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `added_date` datetime NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `added_user` int NOT NULL,
  `deleted_user` int DEFAULT NULL,
  `updated_user` int DEFAULT NULL,
  `cus_type` varchar(45) NOT NULL,
  `company_name` varchar(45) DEFAULT NULL,
  `brn` varchar(45) DEFAULT NULL,
  `point` decimal(10,2) DEFAULT NULL,
  `status_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `regno_UNIQUE` (`regno`),
  UNIQUE KEY `nic_UNIQUE` (`nic`),
  UNIQUE KEY `mobile_UNIQUE` (`mobile`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_customer_status1_idx` (`status_id`),
  CONSTRAINT `fk_customer_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerorder`
--

DROP TABLE IF EXISTS `customerorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerorder` (
  `id` int NOT NULL,
  `orderno` varchar(45) NOT NULL,
  `added_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `customerorderstatus_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `added_user` int NOT NULL,
  `deleted_user` int DEFAULT NULL,
  `updated_user` int DEFAULT NULL,
  `required_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `orderno_UNIQUE` (`orderno`),
  KEY `fk_customerorder_customerorderstatus1_idx` (`customerorderstatus_id`),
  KEY `fk_customerorder_customer1_idx` (`customer_id`),
  CONSTRAINT `fk_customerorder_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_customerorder_customerorderstatus1` FOREIGN KEY (`customerorderstatus_id`) REFERENCES `customerorderstatus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerorder`
--

LOCK TABLES `customerorder` WRITE;
/*!40000 ALTER TABLE `customerorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `customerorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerorder_has_product`
--

DROP TABLE IF EXISTS `customerorder_has_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerorder_has_product` (
  `customerorder_id` int NOT NULL,
  `product_id` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `product_price` decimal(10,2) NOT NULL,
  `quanitity` decimal(10,2) NOT NULL,
  `product_line_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customerorder_has_product_product1_idx` (`product_id`),
  KEY `fk_customerorder_has_product_customerorder1_idx` (`customerorder_id`),
  CONSTRAINT `fk_customerorder_has_product_customerorder1` FOREIGN KEY (`customerorder_id`) REFERENCES `customerorder` (`id`),
  CONSTRAINT `fk_customerorder_has_product_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerorder_has_product`
--

LOCK TABLES `customerorder_has_product` WRITE;
/*!40000 ALTER TABLE `customerorder_has_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `customerorder_has_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerorderstatus`
--

DROP TABLE IF EXISTS `customerorderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerorderstatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerorderstatus`
--

LOCK TABLES `customerorderstatus` WRITE;
/*!40000 ALTER TABLE `customerorderstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `customerorderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designation`
--

DROP TABLE IF EXISTS `designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `designation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designation`
--

LOCK TABLES `designation` WRITE;
/*!40000 ALTER TABLE `designation` DISABLE KEYS */;
INSERT INTO `designation` VALUES (1,'Manager'),(2,'As-Manager'),(3,'Cashier');
/*!40000 ALTER TABLE `designation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `empnumber` char(10) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `nic` char(12) NOT NULL,
  `callingname` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `mobile` char(10) NOT NULL,
  `landno` char(10) DEFAULT NULL,
  `note` text,
  `dob` date NOT NULL,
  `civilstatus` varchar(10) NOT NULL,
  `address` text NOT NULL,
  `added_datetime` datetime DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `employeestatus_id` int NOT NULL,
  `designation_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `empnumber_UNIQUE` (`empnumber`),
  UNIQUE KEY `nic_UNIQUE` (`nic`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_employee_employeestatus_idx` (`employeestatus_id`),
  KEY `fk_employee_designation1_idx` (`designation_id`),
  CONSTRAINT `fk_employee_designation1` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`id`),
  CONSTRAINT `fk_employee_employeestatus` FOREIGN KEY (`employeestatus_id`) REFERENCES `employeestatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'0000000034','Udara Deshan Udawatte','200025143411','Udara','udarauffdawatte@gmail.com','0711667662','0112915047','jjhkjhkj','2005-11-23','single','216/9rerer','2023-12-03 08:44:46','Male',2,2),(2,'0000000023','Udara Deshan Udawatte','200025402814','Udara','udarauffdedwatte@gmail.com','0711612662','0112915047','bahaba','2000-09-10','Single','216/09','2023-12-02 19:12:57','Male',3,1),(3,'0000000025','Deshan UDara Udawatte','200053902814','Deshan','udarauffdeffdwatte@gmail.com','0711623232','0112914547',NULL,'2000-02-10','Married','216/09','2023-12-03 19:12:57','Male',1,1),(4,'0000000045','Sampath Priyadarshana Udawatte','184504545696','Sampath','sampath@gmail.com','0718178456',NULL,NULL,'2005-12-29','married','ff','2024-02-04 11:16:46','male',3,2),(11,'0000000008','Manjula Priyanthi Perera','454654545442','Perera','mbbvbvanjula@gmail.com','0711676662',NULL,NULL,'2006-01-03','married','216/9\nHospital Road','2024-02-04 13:23:34','female',1,1),(16,'0000000012','Rishin Udawatte','454234545442','Rishin','mbbvbvdsjula@gmail.com','0711346662',NULL,NULL,'2006-01-05','single','216/11','2024-02-05 13:23:34','female',2,2);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeestatus`
--

DROP TABLE IF EXISTS `employeestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeestatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeestatus`
--

LOCK TABLES `employeestatus` WRITE;
/*!40000 ALTER TABLE `employeestatus` DISABLE KEYS */;
INSERT INTO `employeestatus` VALUES (1,'Working'),(2,'Resign'),(3,'Deleted');
/*!40000 ALTER TABLE `employeestatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flavours`
--

DROP TABLE IF EXISTS `flavours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flavours` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flavours`
--

LOCK TABLES `flavours` WRITE;
/*!40000 ALTER TABLE `flavours` DISABLE KEYS */;
INSERT INTO `flavours` VALUES (1,'Vanila'),(2,'Chocolate'),(3,'Fruit and Nut'),(4,'Milk'),(5,'Strawberry'),(6,'Banana'),(7,'Wood Apple'),(8,'Orange '),(9,'Mango');
/*!40000 ALTER TABLE `flavours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grn`
--

DROP TABLE IF EXISTS `grn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `grncode` char(10) NOT NULL,
  `grnbillnumber` char(10) NOT NULL,
  `grnrecivedate` date NOT NULL,
  `discontrate` decimal(5,2) NOT NULL,
  `total amount` decimal(10,2) NOT NULL,
  `netamount` decimal(10,2) NOT NULL,
  `addeddatetime` datetime NOT NULL,
  `addeduser` int NOT NULL,
  `updateuser` int DEFAULT NULL,
  `updatedatetime` datetime DEFAULT NULL,
  `deleteuser` int DEFAULT NULL,
  `deletedatetime` datetime DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  `paidamount` decimal(10,2) DEFAULT NULL,
  `grnstatus_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grn_grnstatus1_idx` (`grnstatus_id`),
  CONSTRAINT `fk_grn_grnstatus1` FOREIGN KEY (`grnstatus_id`) REFERENCES `grnstatus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grn`
--

LOCK TABLES `grn` WRITE;
/*!40000 ALTER TABLE `grn` DISABLE KEYS */;
/*!40000 ALTER TABLE `grn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grn_has_ingredeint`
--

DROP TABLE IF EXISTS `grn_has_ingredeint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grn_has_ingredeint` (
  `grn_id` int NOT NULL,
  `ingredeint_id` int NOT NULL,
  `id` varchar(45) NOT NULL,
  `purchaseprice` decimal(10,2) NOT NULL,
  `qty` varchar(45) NOT NULL,
  `lineprice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grn_has_ingredeint_ingredeint1_idx` (`ingredeint_id`),
  KEY `fk_grn_has_ingredeint_grn1_idx` (`grn_id`),
  CONSTRAINT `fk_grn_has_ingredeint_grn1` FOREIGN KEY (`grn_id`) REFERENCES `grn` (`id`),
  CONSTRAINT `fk_grn_has_ingredeint_ingredeint1` FOREIGN KEY (`ingredeint_id`) REFERENCES `ingredeint` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grn_has_ingredeint`
--

LOCK TABLES `grn_has_ingredeint` WRITE;
/*!40000 ALTER TABLE `grn_has_ingredeint` DISABLE KEYS */;
/*!40000 ALTER TABLE `grn_has_ingredeint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grnstatus`
--

DROP TABLE IF EXISTS `grnstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grnstatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grnstatus`
--

LOCK TABLES `grnstatus` WRITE;
/*!40000 ALTER TABLE `grnstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `grnstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredeint`
--

DROP TABLE IF EXISTS `ingredeint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredeint` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ingredeint_code` char(1) NOT NULL,
  `name` varchar(45) NOT NULL,
  `added_user` varchar(45) NOT NULL,
  `deleteed_user` varchar(45) DEFAULT NULL,
  `updated_user` varchar(45) DEFAULT NULL,
  `added_date` datetime NOT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `note` text,
  `ingredeintstatus_id` int NOT NULL,
  `ingredeint_category_id` int NOT NULL,
  `rop` int NOT NULL,
  `unit_size` varchar(45) NOT NULL,
  `reorder_quantity` decimal(10,2) DEFAULT NULL,
  `purchaseprice` decimal(10,2) NOT NULL,
  `purchaseunittype_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_ingredeint_ingredeintstatus1_idx` (`ingredeintstatus_id`),
  KEY `fk_ingredeint_ingredeint_category1_idx` (`ingredeint_category_id`),
  KEY `fk_ingredeint_purchaseunittype1_idx` (`purchaseunittype_id`),
  CONSTRAINT `fk_ingredeint_ingredeint_category1` FOREIGN KEY (`ingredeint_category_id`) REFERENCES `ingredeint_category` (`id`),
  CONSTRAINT `fk_ingredeint_ingredeintstatus1` FOREIGN KEY (`ingredeintstatus_id`) REFERENCES `ingredeintstatus` (`id`),
  CONSTRAINT `fk_ingredeint_purchaseunittype1` FOREIGN KEY (`purchaseunittype_id`) REFERENCES `purchaseunittype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredeint`
--

LOCK TABLES `ingredeint` WRITE;
/*!40000 ALTER TABLE `ingredeint` DISABLE KEYS */;
INSERT INTO `ingredeint` VALUES (2,'1','Sugar','Admin','Admin','Admin','2023-11-03 08:44:46','2023-11-03 08:44:46','2023-11-03 08:44:46',NULL,1,1,15,'20',10.00,580.00,0);
/*!40000 ALTER TABLE `ingredeint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredeint_category`
--

DROP TABLE IF EXISTS `ingredeint_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredeint_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredeint_category`
--

LOCK TABLES `ingredeint_category` WRITE;
/*!40000 ALTER TABLE `ingredeint_category` DISABLE KEYS */;
INSERT INTO `ingredeint_category` VALUES (1,'Sugar');
/*!40000 ALTER TABLE `ingredeint_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredeintstatus`
--

DROP TABLE IF EXISTS `ingredeintstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredeintstatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredeintstatus`
--

LOCK TABLES `ingredeintstatus` WRITE;
/*!40000 ALTER TABLE `ingredeintstatus` DISABLE KEYS */;
INSERT INTO `ingredeintstatus` VALUES (1,'Active');
/*!40000 ALTER TABLE `ingredeintstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(155) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES (1,'EMPLOYEE'),(2,'USER'),(3,'PRIVILEGE'),(4,'ITEM'),(5,'SUPPLIER');
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoicenum` varchar(7) NOT NULL,
  `itemname` varchar(45) NOT NULL,
  `sales_price` int NOT NULL,
  `orderplaceddate` datetime NOT NULL,
  `total` int NOT NULL,
  `grandtotal` int NOT NULL,
  `ordercol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoicenum_UNIQUE` (`invoicenum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packagetype`
--

DROP TABLE IF EXISTS `packagetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packagetype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packagetype`
--

LOCK TABLES `packagetype` WRITE;
/*!40000 ALTER TABLE `packagetype` DISABLE KEYS */;
INSERT INTO `packagetype` VALUES (1,'Container'),(2,'Bag'),(4,'Box');
/*!40000 ALTER TABLE `packagetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderid` varchar(45) NOT NULL,
  `paymentdate` datetime NOT NULL,
  `paymentmethod` varchar(45) NOT NULL,
  `Total` int NOT NULL,
  `paymentstatus` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `orderid_UNIQUE` (`orderid`),
  UNIQUE KEY `paymentdate_UNIQUE` (`paymentdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmethod`
--

DROP TABLE IF EXISTS `paymentmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentmethod` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmethod`
--

LOCK TABLES `paymentmethod` WRITE;
/*!40000 ALTER TABLE `paymentmethod` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymentmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `privilege` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sel` tinyint NOT NULL,
  `ins` tinyint NOT NULL,
  `upd` tinyint NOT NULL,
  `del` tinyint NOT NULL,
  `role_id` int NOT NULL,
  `module_id` int NOT NULL,
  PRIMARY KEY (`id`,`role_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_privilege_role1_idx` (`role_id`),
  KEY `fk_privilege_module1_idx` (`module_id`),
  CONSTRAINT `fk_privilege_module1` FOREIGN KEY (`module_id`) REFERENCES `module` (`id`),
  CONSTRAINT `fk_privilege_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilege`
--

LOCK TABLES `privilege` WRITE;
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
INSERT INTO `privilege` VALUES (1,1,1,1,1,2,1),(2,1,1,1,0,2,2),(3,1,1,1,0,3,1),(4,1,0,0,1,3,2);
/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productcode` char(10) NOT NULL,
  `productname` varchar(150) NOT NULL,
  `reorderpoint` decimal(10,2) NOT NULL,
  `reorderquantity` decimal(10,2) NOT NULL,
  `note` text,
  `addeddatetime` datetime NOT NULL,
  `lastmodifydatetime` datetime DEFAULT NULL,
  `deletedatetime` datetime DEFAULT NULL,
  `salesprice` decimal(10,2) NOT NULL,
  `unittype_id` int NOT NULL,
  `packagetype_id` int NOT NULL,
  `added_user` int NOT NULL,
  `delete_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `productstatus_id` int NOT NULL,
  `flavours_id` int NOT NULL,
  `category_id` int NOT NULL,
  `unit_size` int NOT NULL,
  `photopath` mediumblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `productcode_UNIQUE` (`productcode`),
  UNIQUE KEY `productname_UNIQUE` (`productname`),
  KEY `fk_product_unittype1_idx` (`unittype_id`),
  KEY `fk_product_packagetype1_idx` (`packagetype_id`),
  KEY `fk_product_productstatus1_idx` (`productstatus_id`),
  KEY `fk_product_flavours1_idx` (`flavours_id`),
  KEY `fk_product_category1_idx` (`category_id`),
  CONSTRAINT `fk_product_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_product_flavours1` FOREIGN KEY (`flavours_id`) REFERENCES `flavours` (`id`),
  CONSTRAINT `fk_product_packagetype1` FOREIGN KEY (`packagetype_id`) REFERENCES `packagetype` (`id`),
  CONSTRAINT `fk_product_productstatus1` FOREIGN KEY (`productstatus_id`) REFERENCES `productstatus` (`id`),
  CONSTRAINT `fk_product_unittype1` FOREIGN KEY (`unittype_id`) REFERENCES `unittype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'1000000001','Vanila Ice Cream 1L',14.00,45.00,NULL,'2023-12-03 08:44:46','2023-11-03 08:44:46','2023-12-01 08:44:46',780.00,1,1,1,1,NULL,1,1,1,45,_binary 'fffdfdf');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productstatus`
--

DROP TABLE IF EXISTS `productstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productstatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productstatus`
--

LOCK TABLES `productstatus` WRITE;
/*!40000 ALTER TABLE `productstatus` DISABLE KEYS */;
INSERT INTO `productstatus` VALUES (1,'Available'),(2,'Not-Available'),(3,'In-Production'),(4,'Deleted');
/*!40000 ALTER TABLE `productstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseorder`
--

DROP TABLE IF EXISTS `purchaseorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchaseorder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `requredate` date NOT NULL,
  `totalamount` varchar(255) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `addeduser` int NOT NULL,
  `addeddate` datetime NOT NULL,
  `updateuser` int DEFAULT NULL,
  `updatedatetime` datetime DEFAULT NULL,
  `deleteuser` int DEFAULT NULL,
  `deletedatetime` datetime DEFAULT NULL,
  `purchaseorderstatus_id` int NOT NULL,
  `quotation_id` int NOT NULL,
  `supplier_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_purchaseorder_purchaseorderstatus1_idx` (`purchaseorderstatus_id`),
  KEY `fk_purchaseorder_quotation1_idx` (`quotation_id`),
  KEY `fk_purchaseorder_supplier1_idx` (`supplier_id`),
  CONSTRAINT `fk_purchaseorder_purchaseorderstatus1` FOREIGN KEY (`purchaseorderstatus_id`) REFERENCES `purchaseorderstatus` (`id`),
  CONSTRAINT `fk_purchaseorder_quotation1` FOREIGN KEY (`quotation_id`) REFERENCES `quotation` (`id`),
  CONSTRAINT `fk_purchaseorder_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseorder`
--

LOCK TABLES `purchaseorder` WRITE;
/*!40000 ALTER TABLE `purchaseorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchaseorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseorder_has_ingredeint`
--

DROP TABLE IF EXISTS `purchaseorder_has_ingredeint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchaseorder_has_ingredeint` (
  `id` varchar(45) NOT NULL,
  `purchaseorder_id` int NOT NULL,
  `ingredeint_id` int NOT NULL,
  `purchaseprice` decimal(10,2) NOT NULL,
  `qty` varchar(45) NOT NULL,
  `lineprice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_purchaseorder_has_ingredeint_ingredeint1_idx` (`ingredeint_id`),
  KEY `fk_purchaseorder_has_ingredeint_purchaseorder1_idx` (`purchaseorder_id`),
  CONSTRAINT `fk_purchaseorder_has_ingredeint_ingredeint1` FOREIGN KEY (`ingredeint_id`) REFERENCES `ingredeint` (`id`),
  CONSTRAINT `fk_purchaseorder_has_ingredeint_purchaseorder1` FOREIGN KEY (`purchaseorder_id`) REFERENCES `purchaseorder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseorder_has_ingredeint`
--

LOCK TABLES `purchaseorder_has_ingredeint` WRITE;
/*!40000 ALTER TABLE `purchaseorder_has_ingredeint` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchaseorder_has_ingredeint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseorderstatus`
--

DROP TABLE IF EXISTS `purchaseorderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchaseorderstatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseorderstatus`
--

LOCK TABLES `purchaseorderstatus` WRITE;
/*!40000 ALTER TABLE `purchaseorderstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchaseorderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseunittype`
--

DROP TABLE IF EXISTS `purchaseunittype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchaseunittype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseunittype`
--

LOCK TABLES `purchaseunittype` WRITE;
/*!40000 ALTER TABLE `purchaseunittype` DISABLE KEYS */;
INSERT INTO `purchaseunittype` VALUES (1,'Kg');
/*!40000 ALTER TABLE `purchaseunittype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrstatus`
--

DROP TABLE IF EXISTS `qrstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrstatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrstatus`
--

LOCK TABLES `qrstatus` WRITE;
/*!40000 ALTER TABLE `qrstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotation`
--

DROP TABLE IF EXISTS `quotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quotation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quotationdate` date NOT NULL,
  `addeduser` int NOT NULL,
  `addeddatetime` datetime NOT NULL,
  `updateuser` int DEFAULT NULL,
  `updatedatetime` datetime DEFAULT NULL,
  `deleteuser` int DEFAULT NULL,
  `deletedatetime` datetime DEFAULT NULL,
  `receivedate` datetime DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `quotationstatus_id` int NOT NULL,
  `quotationrequest_id` int NOT NULL,
  `supplier_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_quotation_quotationstatus1_idx` (`quotationstatus_id`),
  KEY `fk_quotation_quotationrequest1_idx` (`quotationrequest_id`),
  KEY `fk_quotation_supplier1_idx` (`supplier_id`),
  CONSTRAINT `fk_quotation_quotationrequest1` FOREIGN KEY (`quotationrequest_id`) REFERENCES `quotationrequest` (`id`),
  CONSTRAINT `fk_quotation_quotationstatus1` FOREIGN KEY (`quotationstatus_id`) REFERENCES `quotationstatus` (`id`),
  CONSTRAINT `fk_quotation_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotation`
--

LOCK TABLES `quotation` WRITE;
/*!40000 ALTER TABLE `quotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotation_has_ingredeint`
--

DROP TABLE IF EXISTS `quotation_has_ingredeint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quotation_has_ingredeint` (
  `quotation_id` int NOT NULL,
  `ingredeint_id` int NOT NULL,
  `purchaseprice` decimal(10,2) NOT NULL,
  `id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_quotation_has_ingredeint_ingredeint1_idx` (`ingredeint_id`),
  KEY `fk_quotation_has_ingredeint_quotation1_idx` (`quotation_id`),
  CONSTRAINT `fk_quotation_has_ingredeint_ingredeint1` FOREIGN KEY (`ingredeint_id`) REFERENCES `ingredeint` (`id`),
  CONSTRAINT `fk_quotation_has_ingredeint_quotation1` FOREIGN KEY (`quotation_id`) REFERENCES `quotation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotation_has_ingredeint`
--

LOCK TABLES `quotation_has_ingredeint` WRITE;
/*!40000 ALTER TABLE `quotation_has_ingredeint` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotation_has_ingredeint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotationrequest`
--

DROP TABLE IF EXISTS `quotationrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quotationrequest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quotationrequestdate` date NOT NULL,
  `qrno` char(10) NOT NULL,
  `addeduser` int NOT NULL,
  `addeddatetime` datetime NOT NULL,
  `updateuser` int DEFAULT NULL,
  `updatedatetime` datetime DEFAULT NULL,
  `deleteuser` int DEFAULT NULL,
  `deletedatetime` datetime DEFAULT NULL,
  `qrstatus_id` int NOT NULL,
  `supplier_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_quotationrequest_qrstatus1_idx` (`qrstatus_id`),
  KEY `fk_quotationrequest_supplier1_idx` (`supplier_id`),
  CONSTRAINT `fk_quotationrequest_qrstatus1` FOREIGN KEY (`qrstatus_id`) REFERENCES `qrstatus` (`id`),
  CONSTRAINT `fk_quotationrequest_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotationrequest`
--

LOCK TABLES `quotationrequest` WRITE;
/*!40000 ALTER TABLE `quotationrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotationrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotationrequest_has_ingredeint`
--

DROP TABLE IF EXISTS `quotationrequest_has_ingredeint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quotationrequest_has_ingredeint` (
  `quotationrequest_id` int NOT NULL,
  `ingredeint_id` int NOT NULL,
  `purchaseprice` decimal(10,2) NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_quotationrequest_has_ingredeint_ingredeint1_idx` (`ingredeint_id`),
  KEY `fk_quotationrequest_has_ingredeint_quotationrequest1_idx` (`quotationrequest_id`),
  CONSTRAINT `fk_quotationrequest_has_ingredeint_ingredeint1` FOREIGN KEY (`ingredeint_id`) REFERENCES `ingredeint` (`id`),
  CONSTRAINT `fk_quotationrequest_has_ingredeint_quotationrequest1` FOREIGN KEY (`quotationrequest_id`) REFERENCES `quotationrequest` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotationrequest_has_ingredeint`
--

LOCK TABLES `quotationrequest_has_ingredeint` WRITE;
/*!40000 ALTER TABLE `quotationrequest_has_ingredeint` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotationrequest_has_ingredeint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotationstatus`
--

DROP TABLE IF EXISTS `quotationstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quotationstatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotationstatus`
--

LOCK TABLES `quotationstatus` WRITE;
/*!40000 ALTER TABLE `quotationstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotationstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(2,'Manager'),(3,'Cashier'),(4,'Store-Manager');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_user`
--

DROP TABLE IF EXISTS `role_has_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_user` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_user_has_role_role1_idx` (`role_id`),
  KEY `fk_user_has_role_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_has_role_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `fk_user_has_role_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_user`
--

LOCK TABLES `role_has_user` WRITE;
/*!40000 ALTER TABLE `role_has_user` DISABLE KEYS */;
INSERT INTO `role_has_user` VALUES (1,1),(7,1),(11,1),(8,2),(10,2),(12,2),(7,3),(8,3),(9,3),(10,3),(11,3);
/*!40000 ALTER TABLE `role_has_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppayment`
--

DROP TABLE IF EXISTS `suppayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppayment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `billno` char(10) NOT NULL,
  `totalamount` decimal(10,2) NOT NULL,
  `totalpaymentamount` decimal(10,2) NOT NULL,
  `totalbalanceamount` decimal(10,2) NOT NULL,
  `addeduser` int NOT NULL,
  `addeddate` datetime DEFAULT NULL,
  `updateuser` int DEFAULT NULL,
  `deletedate` datetime DEFAULT NULL,
  `deleteuser` int DEFAULT NULL,
  `paymentmethod_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_suppayment_paymentmethod1_idx` (`paymentmethod_id`),
  CONSTRAINT `fk_suppayment_paymentmethod1` FOREIGN KEY (`paymentmethod_id`) REFERENCES `paymentmethod` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppayment`
--

LOCK TABLES `suppayment` WRITE;
/*!40000 ALTER TABLE `suppayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppayment_has_grn`
--

DROP TABLE IF EXISTS `suppayment_has_grn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppayment_has_grn` (
  `suppayment_id` int NOT NULL,
  `grn_id` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `grnamount` decimal(10,2) NOT NULL,
  `payedamount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_suppayment_has_grn_grn1_idx` (`grn_id`),
  KEY `fk_suppayment_has_grn_suppayment1_idx` (`suppayment_id`),
  CONSTRAINT `fk_suppayment_has_grn_grn1` FOREIGN KEY (`grn_id`) REFERENCES `grn` (`id`),
  CONSTRAINT `fk_suppayment_has_grn_suppayment1` FOREIGN KEY (`suppayment_id`) REFERENCES `suppayment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppayment_has_grn`
--

LOCK TABLES `suppayment_has_grn` WRITE;
/*!40000 ALTER TABLE `suppayment_has_grn` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppayment_has_grn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `regno` char(10) DEFAULT NULL,
  `suppliername` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contactpersonname` varchar(45) NOT NULL,
  `contactno` varchar(45) NOT NULL,
  `supplierstatus_id` int NOT NULL,
  `address` text,
  `brn` char(8) DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_supplier_supplierstatus1_idx` (`supplierstatus_id`),
  CONSTRAINT `fk_supplier_supplierstatus1` FOREIGN KEY (`supplierstatus_id`) REFERENCES `supplierstatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'1000000001','Sampath priyadarshana','sampathpriyadarshana@gmail.com','Sampath','0718178094',1,'216/9 Hospital Road','1','This is note'),(2,'1000000002','Udara Deshan ','udaraudawatte@gmail.com','Udara','0711668662',1,'216/11 Hospital Road','1','This is note'),(3,'1000000003','Manjula Priyanthi','manjula@gmail.com','Manjula','0112154014',1,'216/09 Hospital Road','1','This is note'),(4,'1000000004','Lakindu Udawatte','lakindu@gmail.com','Laki','0712478021',1,'216/09 Hospital Road','1','This is note');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_bankdetail`
--

DROP TABLE IF EXISTS `supplier_bankdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_bankdetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bankname` varchar(45) DEFAULT NULL,
  `branchname` varchar(45) DEFAULT NULL,
  `accno` varchar(45) DEFAULT NULL,
  `accholdername` varchar(45) DEFAULT NULL,
  `supplier_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_supplier_bankdetail_supplier1_idx` (`supplier_id`),
  CONSTRAINT `fk_supplier_bankdetail_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_bankdetail`
--

LOCK TABLES `supplier_bankdetail` WRITE;
/*!40000 ALTER TABLE `supplier_bankdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier_bankdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_has_ingredient`
--

DROP TABLE IF EXISTS `supplier_has_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_has_ingredient` (
  `supplier_id` int NOT NULL,
  `ingredeint_id` int NOT NULL,
  PRIMARY KEY (`supplier_id`,`ingredeint_id`),
  KEY `fk_supplier_has_ingredeint_ingredeint1_idx` (`ingredeint_id`),
  KEY `fk_supplier_has_ingredeint_supplier1_idx` (`supplier_id`),
  CONSTRAINT `fk_supplier_has_ingredeint_ingredeint1` FOREIGN KEY (`ingredeint_id`) REFERENCES `ingredeint` (`id`),
  CONSTRAINT `fk_supplier_has_ingredeint_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_has_ingredient`
--

LOCK TABLES `supplier_has_ingredient` WRITE;
/*!40000 ALTER TABLE `supplier_has_ingredient` DISABLE KEYS */;
INSERT INTO `supplier_has_ingredient` VALUES (1,2);
/*!40000 ALTER TABLE `supplier_has_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplierstatus`
--

DROP TABLE IF EXISTS `supplierstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplierstatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplierstatus`
--

LOCK TABLES `supplierstatus` WRITE;
/*!40000 ALTER TABLE `supplierstatus` DISABLE KEYS */;
INSERT INTO `supplierstatus` VALUES (1,'Active'),(2,'In-Active');
/*!40000 ALTER TABLE `supplierstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unittype`
--

DROP TABLE IF EXISTS `unittype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unittype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unittype`
--

LOCK TABLES `unittype` WRITE;
/*!40000 ALTER TABLE `unittype` DISABLE KEYS */;
INSERT INTO `unittype` VALUES (1,'L'),(2,'mL'),(3,'Units');
/*!40000 ALTER TABLE `unittype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `photopath` varchar(150) DEFAULT NULL,
  `status` tinyint NOT NULL,
  `added_datetime` datetime NOT NULL,
  `note` text,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `photopath_UNIQUE` (`photopath`),
  KEY `fk_user_employee1_idx` (`employee_id`),
  CONSTRAINT `fk_user_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Admin','$2a$10$/ZxCABzvUZZHBjh7Tvx8CO6SbNW/aprswHyGsBBwgxWVQB/61yyfO','admin@gmail.com',NULL,1,'2024-02-04 20:36:08',NULL,1),(7,'Udara','$2a$10$OPmRg/Y.t8yXzkva2JT8RutSgqdHfM4W3itjZrg3cKB2nh90ZdeKq','udeeearaudawatte@gmail.com',NULL,0,'2024-03-18 22:40:36',NULL,2),(9,'Manjula','$2a$10$fxaMDt7zEQGv6QmapBksqOF1F3s8xaG1IIb/dJQdtdZL2yXP.51S6','udaraudafewatte@gmail.com',NULL,0,'2024-03-19 00:15:30',NULL,11),(10,'Sampath','$2a$10$XTD0iC3MqZ2KstOlMJWIIO5Jf1XDCJlsnpVrbXQpJCGKEAE7Zbu2G','sampath@gmail.com',NULL,0,'2024-03-19 00:18:09',NULL,4),(11,'Rishi','$2a$10$s1I4UaW63fA3J6GKHlYfG.N0HvfHiGf9n82aY1VzoshumDU.2fynS','udaraudawadtte@gmail.com',NULL,1,'2024-03-19 00:24:57',NULL,16),(12,'Fee','$2a$10$7fKi0x8jZnyWEnR.bFMVpe3EfpPijBx0FavL8hppKn6lnuYJ.A37a','udaraffeudawatte@gmail.com',NULL,1,'2024-03-19 00:37:00',NULL,3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-05 20:35:06
