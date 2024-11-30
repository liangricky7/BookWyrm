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
-- Table structure for table `publication_narrator`
--

DROP TABLE IF EXISTS `publication_narrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_narrator` (
  `edition` varchar(100) NOT NULL,
  `format` enum('Hardcover','Paperback','Ebook','Audiobook') NOT NULL,
  `language` varchar(50) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `narrator_id` int NOT NULL,
  PRIMARY KEY (`edition`,`format`,`language`,`publisher`,`narrator_id`),
  KEY `narrator_id` (`narrator_id`),
  CONSTRAINT `publication_narrator_ibfk_1` FOREIGN KEY (`edition`, `format`, `language`, `publisher`) REFERENCES `publication` (`edition`, `format`, `language`, `publisher`),
  CONSTRAINT `publication_narrator_ibfk_2` FOREIGN KEY (`narrator_id`) REFERENCES `narrator` (`narrator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_narrator`
--

LOCK TABLES `publication_narrator` WRITE;
/*!40000 ALTER TABLE `publication_narrator` DISABLE KEYS */;
INSERT INTO `publication_narrator` VALUES ('First Edition','Hardcover','English','Penguin Books',1),('Second Edition','Paperback','English','HarperCollins',2),('Audiobook','Audiobook','English','Audible',3),('First Edition','Hardcover','English','Greenleaf Press',4),('Second Edition','Paperback','English','Redstone Publishing',5),('Third Edition','Ebook','English','Seabreeze Publications',6),('Fourth Edition','Hardcover','English','Pine Hill Books',7),('Fifth Edition','Ebook','English','Skyline Publishers',8),('Sixth Edition','Paperback','English','Seaside Publications',9);
/*!40000 ALTER TABLE `publication_narrator` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-30  1:14:15
