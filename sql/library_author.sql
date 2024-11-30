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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `author_id` int NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `biography` text,
  `date_of_birth` date DEFAULT NULL,
  `country_of_origin` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'J.K.','Rowling','Author of the Harry Potter series and other fantasy works.','1965-07-31','United Kingdom'),(2,'Isaac','Asimov','Author known for his works in science fiction and popular science.','1920-01-02','United States'),(3,'Agatha','Christie','Known for her detective novels and short stories.','1890-09-15','United Kingdom'),(4,'Nicholas','Sparks','Author of romantic novels, many of which have been adapted into films.','1965-12-31','United States'),(5,'Malcolm','Gladwell','Journalist and author of books on sociology and psychology.','1963-09-03','United States'),(6,'Stephen','King','Master of horror fiction, with many books turned into movies.','1947-09-21','United States'),(7,'J.R.R.','Tolkien','Author of The Lord of the Rings and other fantasy works.','1892-01-03','United Kingdom'),(8,'Dan','Brown','Author known for his Robert Langdon novels like The Da Vinci Code.','1964-06-22','United States'),(9,'Mark','Twain','Famous author and humorist, best known for \"The Adventures of Tom Sawyer.\"','1835-11-30','United States'),(10,'Jane','Austen','Author of romantic novels, including \"Pride and Prejudice.\"','1775-12-16','United Kingdom'),(11,'George','Orwell','Known for his works on social injustice, including \"1984\" and \"Animal Farm.\"','1903-06-25','United Kingdom'),(12,'Emily','Dickinson','Reclusive poet known for her unique style of writing and her exploration of death and immortality.','1830-12-10','United States'),(13,'Charles','Dickens','Famous Victorian novelist and social critic, best known for \"A Tale of Two Cities\" and \"Oliver Twist.\".','1812-02-07','United Kingdom'),(14,'Leo','Tolstoy','Russian author, most famous for \"War and Peace\" and \"Anna Karenina.\"','1828-09-09','Russia'),(15,'Virginia','Woolf','Author and modernist, best known for \"Mrs Dalloway\" and \"To the Lighthouse.\"','1882-01-25','United Kingdom'),(16,'William','Shakespeare','The greatest playwright in English literature, author of \"Hamlet\" and \"Macbeth.\"','1564-04-23','United Kingdom'),(17,'Ernest','Hemingway','American novelist, journalist, and short story writer, known for \"The Old Man and the Sea.\"','1899-07-21','United States'),(18,'F. Scott','Fitzgerald','Author of \"The Great Gatsby,\" exploring themes of the American Dream.','1896-09-24','United States'),(19,'Harper','Lee','Author of the Pulitzer Prize-winning novel \"To Kill a Mockingbird.\"','1926-04-28','United States'),(20,'J.R.R.','Tolkien','Author of \"The Hobbit\" and \"The Lord of the Rings\" series.','1892-01-03','United Kingdom'),(21,'H.G.','Wells','Pioneering author in science fiction, best known for \"The War of the Worlds.\"','1866-09-21','United Kingdom'),(22,'Agatha','Christie','Best-selling mystery author, known for creating Hercule Poirot and Miss Marple.','1890-09-15','United Kingdom'),(23,'J.K.','Rowling','Author of the internationally famous Harry Potter series.','1965-07-31','United Kingdom'),(24,'Isaac','Asimov','Renowned for his works in science fiction, especially the Foundation series.','1920-01-02','United States'),(25,'George','R.R. Martin','Author of \"A Song of Ice and Fire,\" the inspiration for the \"Game of Thrones\" series.','1948-09-20','United States'),(26,'Stephen','King','The master of horror, with bestselling books like \"The Shining\" and \"It.\"','1947-09-21','United States'),(27,'Agatha','Christie','Best-selling author known for her detective novels and the creation of Hercule Poirot.','1890-09-15','United Kingdom'),(28,'J.R.R.','Tolkien','Author of \"The Hobbit\" and \"The Lord of the Rings,\" foundational works of fantasy.','1892-01-03','United Kingdom'),(29,'C.S.','Lewis','Author of \"The Chronicles of Narnia\" and other works blending fantasy and Christian themes.','1898-11-29','United Kingdom'),(30,'Haruki','Murakami','Author of surreal novels, including \"Norwegian Wood\" and \"Kafka on the Shore.\"','1949-01-12','Japan'),(31,'Dan','Brown','Author of the Robert Langdon series, including \"The Da Vinci Code.\" and \"Angels and Demons.\"','1964-06-22','United States'),(32,'Margaret','Atwood','Author of dystopian fiction, including \"The Handmaid\'s Tale\" and \"Oryx and Crake.\"','1939-11-18','Canada');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
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
