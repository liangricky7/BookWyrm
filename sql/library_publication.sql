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
-- Table structure for table `publication`
--

DROP TABLE IF EXISTS `publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication` (
  `edition` varchar(100) NOT NULL,
  `format` enum('Hardcover','Paperback','Ebook','Audiobook') NOT NULL,
  `language` varchar(50) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `copy_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `isbn` varchar(13) DEFAULT NULL,
  `publication_date` date DEFAULT NULL,
  `page_count` int DEFAULT NULL,
  PRIMARY KEY (`edition`,`format`,`language`,`publisher`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `publication_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication`
--

LOCK TABLES `publication` WRITE;
/*!40000 ALTER TABLE `publication` DISABLE KEYS */;
INSERT INTO `publication` VALUES ('Audiobook','Audiobook','English','Audible',3,3,'9781491582739','2023-05-10',600),('Fifth Edition','Ebook','English','Skyline Publishers',19,21,'9780193489235','2024-08-10',330),('First Edition','Hardcover','English','Greenleaf Press',12,15,'9780143327741','2024-05-15',350),('First Edition','Hardcover','English','Penguin Books',1,1,'9780143127741','2023-06-01',350),('Fourth Edition','Hardcover','English','Pine Hill Books',18,20,'9781918765432','2024-07-08',420),('Second Edition','Paperback','English','HarperCollins',2,2,'9780061995753','2022-03-15',420),('Second Edition','Paperback','English','Redstone Publishing',13,16,'9743143127741','2023-11-05',280),('Sixth Edition','Paperback','English','Seaside Publications',20,22,'9780153428963','2024-09-01',290),('Third Edition','Ebook','English','Seabreeze Publications',14,17,NULL,'2024-02-10',180);
/*!40000 ALTER TABLE `publication` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-30  1:14:14
