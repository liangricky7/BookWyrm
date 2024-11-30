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
-- Table structure for table `narrator`
--

DROP TABLE IF EXISTS `narrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `narrator` (
  `narrator_id` int NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `biography` text,
  `date_of_birth` date DEFAULT NULL,
  `country_of_origin` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`narrator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `narrator`
--

LOCK TABLES `narrator` WRITE;
/*!40000 ALTER TABLE `narrator` DISABLE KEYS */;
INSERT INTO `narrator` VALUES (1,'Jim','Dale','Award-winning narrator known for his work on Harry Potter audiobooks.','1948-08-15','United States'),(2,'Kate','Reading','Narrator of many fantasy and science fiction audiobooks.','1962-10-17','United States'),(3,'David','Tennant','Famous for narrating a variety of audiobooks, including mystery novels.','1971-04-18','United Kingdom'),(4,'Morgan','Freeman','Narrator with a distinct voice, known for his work in films and audiobooks.','1937-06-01','United States'),(5,'Tiffany','Doyon','Narrator specializing in romance and young adult fiction.','1985-09-21','United States'),(6,'Simon','Vance','Experienced audiobook narrator with a diverse range of genres.','1957-04-24','United Kingdom'),(7,'Barbara','Rosenblat','Known for narrating historical fiction and memoirs.','1946-03-01','United States'),(8,'George','Guidall','Veteran narrator known for his deep voice and work on mystery novels.','1949-03-15','United States'),(9,'Kate','Reading','Narrator of many fantasy audiobooks, known for her voice acting skills.','1962-10-17','United States'),(10,'David','Tennant','Known for narrating detective and mystery audiobooks with his signature voice.','1971-04-18','United Kingdom'),(11,'Michael','Beck','Narrator who has worked on a variety of genres, including thriller and drama.','1951-02-04','United States'),(12,'Sarah','Baker','Renowned for her performances in children\'s audiobooks and family-friendly content.','1980-11-09','United States'),(13,'Simon','Vance','Narrator with decades of experience in audiobooks, known for his work in historical fiction.','1957-04-24','United Kingdom'),(14,'Barbara','Rosenblat','Voice actress known for her work on memoirs and literary works.','1946-03-01','United States'),(15,'George','Guidall','Narrator with decades of experience in mystery and thriller books.','1949-03-15','United States'),(16,'Jim','Dale','Famous for narrating the Harry Potter series in audiobook form.','1948-08-15','United States'),(17,'Miri','Ben-Ari','Narrator known for narrating fantasy novels and works with strong female leads.','1991-06-07','United States'),(18,'Derek','Jacobi','Voice actor and narrator known for his distinguished British accent in historical fiction audiobooks.','1938-10-22','United Kingdom'),(19,'Tanya','Eby','Narrator known for her work in romance novels and contemporary fiction.','1973-04-13','United States'),(20,'Stephen','Fry','Narrator with a distinct voice, best known for reading the Harry Potter series in the UK.','1957-08-24','United Kingdom'),(21,'LeVar','Burton','Actor and narrator who is well-known for his role in \"Reading Rainbow\" and narrating sci-fi audiobooks.','1957-02-16','United States'),(22,'Rosalyn','Landor','A versatile narrator with a vast catalog, particularly known for literary and historical fiction.','1945-05-06','United States');
/*!40000 ALTER TABLE `narrator` ENABLE KEYS */;
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
