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
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `status` enum('Active','Inactive','Retired','Terminated') DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `leave_date` date DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `street_number` int DEFAULT NULL,
  `street_name` varchar(100) DEFAULT NULL,
  `apt_number` int DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zip` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'John','Doe','johndoe@library.com','555-1234','Active','Librarian','2020-05-10',NULL,'1985-03-12',101,'Main St',0,'Los Angeles','CA',90001),(2,'Jane','Smith','janesmith@library.com','555-5678','Active','Assistant Librarian','2021-06-15',NULL,'1990-07-20',202,'Broadway',1,'New York','NY',10001),(3,'Michael','Johnson','michaelj@library.com','555-9876','Retired','Library Manager','2015-03-25','2023-03-15','1970-01-30',303,'First Ave',2,'Chicago','IL',60601),(4,'Emily','Jones','emilyjones@library.com','555-4321','Inactive','Senior Librarian','2018-08-01','2024-02-25','1980-05-10',404,'Sunset Blvd',3,'Seattle','WA',98101),(5,'Andrew','Lee','andrewlee@library.com','555-8765','Active','Library Assistant','2022-09-25',NULL,'1995-04-15',505,'Oakwood St',8,'Chicago','IL',60611),(6,'Sarah','Martinez','sarahmartinez@library.com','555-2345','Retired','Librarian','2010-07-20','2023-12-15','1972-11-11',606,'River Rd',12,'Miami','FL',33103),(7,'Rebecca','Taylor','rebeccataylor@library.com','555-3456','Active','Assistant Librarian','2022-05-10',NULL,'1994-08-22',657,'Pine St',4,'Portland','OR',97201),(8,'John','Mitchell','johnmitchell@library.com','555-8765','Active','Library Technician','2023-01-15',NULL,'1986-02-10',809,'Cedar Ln',7,'Austin','TX',73301),(9,'Katherine','Harris','katherineharris@library.com','555-5432','Inactive','Senior Librarian','2015-11-02','2024-02-10','1980-06-09',156,'Sunset Blvd',15,'San Diego','CA',92101);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-30  1:14:17
