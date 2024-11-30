-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `card_number` int NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `status` enum('Suspended','Overdue','Active','Expired') DEFAULT NULL,
  `registration_date` date DEFAULT NULL,
  `street_number` int DEFAULT NULL,
  `street_name` varchar(100) DEFAULT NULL,
  `apt_number` int DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zip` int DEFAULT NULL,
  PRIMARY KEY (`card_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1001,'Alice','Brown','alicebrown@example.com','555-1001','Active','2022-01-10',100,'Park Ave',5,'Los Angeles','CA',90005),(1002,'Bob','White','bobwhite@example.com','555-1002','Suspended','2023-03-12',200,'Maple St',10,'San Francisco','CA',94110),(1003,'Charlie','Davis','charliedavis@example.com','555-1003','Overdue','2021-08-01',300,'Oak St',7,'Miami','FL',33101),(1004,'Emily','Clark','emilyclark@example.com','555-2003','Active','2023-03-30',101,'Maple St',NULL,'Portland','OR',97205),(1005,'Daniel','Green','danielgreen@example.com','555-3049','Suspended','2023-08-22',212,'Birch Rd',NULL,'Los Angeles','CA',90001),(1006,'Sophia','Lopez','sophialopez@example.com','555-9786','Active','2024-01-15',333,'Pine Ave',NULL,'Dallas','TX',75201),(1007,'Rachel','White','rachelwhite@example.com','555-6542','Expired','2022-04-14',987,'Cedar Ln',NULL,'Boston','MA',2115),(1008,'James','Brown','jamesbrown@example.com','555-7890','Overdue','2023-10-01',234,'Elm St',NULL,'San Francisco','CA',94102),(1009,'Brian','Morris','brianmorris@example.com','555-2222','Suspended','2023-09-10',1001,'River St',NULL,'Chicago','IL',60614),(1010,'Charlotte','Baker','charlottebaker@example.com','555-3022','Active','2024-01-25',202,'Maple Ave',NULL,'Dallas','TX',75202),(1011,'Michael','Adams','michaeladams@example.com','555-5003','Active','2023-12-15',322,'Redwood Rd',NULL,'Miami','FL',33101);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-30  1:14:16
