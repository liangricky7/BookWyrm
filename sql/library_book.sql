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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `book_id` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `summary` text,
  `reading_age` int DEFAULT NULL,
  `dewey_decimal` varchar(10) DEFAULT NULL,
  `series` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'The Last Wizard','A young wizard embarks on a quest to save his kingdom.',12,'823.92','The Wizard\'s Journey'),(2,'Space Adventures','A group of astronauts explores a distant planet.',14,'520.92','Galactic Voyages'),(3,'The Silent Witness','A detective investigates a crime with no apparent clues.',16,'364.15','The Detective Chronicles'),(4,'Love in the City','A love story set in the heart of New York City.',18,'813.54','City of Hearts'),(5,'The Real World','A collection of true stories from around the world.',18,'909.8','Stories of Our Time'),(6,'The Secret Diary','A young girl uncovers secrets hidden in her grandmother\'s diary.',12,'823.91','Family Mysteries'),(7,'The Haunted House','A group of friends spends the night in a haunted house.',16,'813.55','Nightmare Series'),(8,'The Lost Kingdom','An ancient kingdom is rediscovered after centuries of being lost.',14,'920.02','Legends of the Past'),(9,'The Dragon\'s Flame','A young knight must defeat a dragon to save his kingdom.',12,'823.92','The Knights\' Quest'),(10,'Moonlight Journey','A group of explorers venture to the moon in the 22nd century.',14,'629.45','Beyond Earth'),(11,'Murder in Paris','A detective investigates a high-profile murder in Paris.',18,'364.1','Mystery Abroad'),(12,'The Perfect Match','A couple struggles to make their relationship work while facing challenges.',18,'813.54','Heartstrings'),(13,'The Secret of the Lost City','An archaeologist uncovers an ancient city hidden in the jungle.',16,'932.02','Secrets of the Past'),(14,'The Time Traveler\'s Journal','A time traveler documents their adventures through history.',14,'909.3','Chronicles of Time'),(15,'Poems of the Soul','A collection of heartfelt and personal poetry by a renowned poet.',18,'811.54','Writings of a Dreamer'),(16,'How to Cook Like a Chef','Step-by-step guide to cooking delicious meals from scratch.',14,'641.5','Cooking Mastery'),(17,'The Artist\'s Vision','An exploration of different art techniques from classical to modern.',16,'701.1','The Art Series'),(18,'The Great Minds','A look at the lives of the greatest philosophers throughout history.',18,'180.9','Philosophical Thoughts'),(19,'A Night in the Theatre','A play set in a grand theatre, unraveling a tale of suspense.',18,'822.33','Theatrical Tales'),(20,'Life Behind Bars','A biography of an individual who served time in prison and rebuilt their life.',18,'920.02','True Stories of Transformation'),(21,'The Ocean\'s Secret','An adventure story about a mysterious island and hidden treasures.',14,'813.54','Adventures of the Sea'),(22,'The Spy Who Knew Too Much','A spy is forced to confront their past as they get deeper into a covert operation.',16,'355.02','Spies and Shadows'),(23,'Walking with Giants','The biography of an influential political leader in the 20th century.',18,'920.02','Historical Leaders'),(24,'The Snowy Mountain','A family embarks on a journey to find their missing father in the Himalayas.',12,'923.91','Family Adventures'),(25,'The Martian Chronicles','A journey to Mars where humans must adjust to life on an alien planet.',15,'813.54','Mars Expedition'),(26,'Wizards and Wands','A young wizard goes on a quest to stop an evil sorcerer from taking over the world.',14,'823.92','The Magic Wars'),(27,'The Forgotten Kingdom','A lost kingdom is rediscovered, and its secrets must be unlocked to save the world.',16,'933.02','The Lost Realms'),(28,'Love in Paris','A romantic journey through Paris, filled with twists and turns in a blossoming love story.',18,'843.91','Parisian Romance'),(29,'The Clockmaker\'s Secret','A clockmaker is caught up in an intricate mystery involving stolen timepieces and murder.',16,'364.15','Secrets of the Clockmaker'),(30,'The Haunting of Hawthorn Manor','A chilling tale of a haunted mansion and the dark past it hides.',18,'813.54','Spine-Chilling Tales'),(31,'The Escape Plan','A thrilling story about a group of prisoners plotting an escape from an inescapable prison.',16,'813.54','Escaping Darkness'),(32,'The Ghost Ship','A chilling tale of a haunted ship that appears only once every hundred years.',14,'823.92','Ghostly Legends'),(33,'The Case of the Missing Heiress','A detective investigates the disappearance of a young woman from a wealthy family.',16,'364.15','Mystery Chronicles'),(34,'Magic in the Air','A fantastical story of a young girl who discovers she has the ability to control the wind.',14,'823.92','The Elemental Magic Series'),(35,'The Robot Rebellion','In a futuristic world, robots rise against their human creators and the struggle for survival begins.',15,'629.8','Robot Wars'),(36,'The Shadow of the Dragon','A young hero faces his greatest challenge when an ancient dragon awakens from its slumber.',14,'823.92','Dragons of the North'),(37,'The Secret of Atlantis','A team of researchers discovers the location of Atlantis and uncovers secrets that could change history.',18,'938.04','Lost Civilizations'),(38,'The Silent Killer','A medical thriller where a deadly virus threatens to wipe out humanity.',18,'614.5','Virus Outbreak'),(39,'The Last Prophecy','A young girl must fulfill a prophecy that will determine the fate of the world.',16,'823.92','Prophecies of Destiny'),(40,'The City Beneath the Sea','An underwater city is discovered, and its inhabitants face an ancient curse.',14,'999.9','Mysteries of the Deep');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-30  1:14:18
