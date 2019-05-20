-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: event
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `branch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `branch_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'2019-03-14 18:21:45','CSE'),(2,'2019-03-14 18:21:45','EC'),(3,'2019-03-14 18:21:45','EE'),(4,'2019-03-14 18:21:45','ME');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `course` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `course_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'2019-03-14 18:22:30','BTech'),(2,'2019-03-14 18:22:30','BCA'),(3,'2019-03-14 18:22:30','MCA');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domain`
--

DROP TABLE IF EXISTS `domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `domain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domain`
--

LOCK TABLES `domain` WRITE;
/*!40000 ALTER TABLE `domain` DISABLE KEYS */;
INSERT INTO `domain` VALUES (1,'2019-03-14 19:36:35','Common'),(2,'2019-03-14 19:36:35','Web Development'),(3,'2019-03-14 19:36:35','App Development'),(4,'2019-03-14 19:36:35','Blockchain'),(5,'2019-03-14 19:36:35','IoT'),(6,'2019-03-14 19:36:35','Augmented Reality'),(7,'2019-03-14 19:36:35','all'),(8,'2019-03-14 19:36:35','Databases'),(9,'2019-03-16 07:43:31','General');
/*!40000 ALTER TABLE `domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(10) unsigned NOT NULL,
  `m1` int(10) unsigned NOT NULL,
  `m2` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ques`
--

DROP TABLE IF EXISTS `ques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ques` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `statement` varchar(200) DEFAULT NULL,
  `optiona` varchar(100) DEFAULT NULL,
  `optionb` varchar(100) DEFAULT NULL,
  `optionc` varchar(100) DEFAULT NULL,
  `optiond` varchar(100) DEFAULT NULL,
  `optione` varchar(100) DEFAULT NULL,
  `answer` tinyint(4) DEFAULT NULL,
  `domain_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ques`
--

LOCK TABLES `ques` WRITE;
/*!40000 ALTER TABLE `ques` DISABLE KEYS */;
INSERT INTO `ques` VALUES (13,'2019-03-15 12:53:40','rgjrtyjsryjry','optiona','optionb','optionc','optiond','optione',8,1),(14,'2019-03-15 12:54:04','dfgnfgnn','optiona','optionb','optionc','optiond','optione',40,1),(15,'2019-03-15 12:54:08','dghrtjhnr','optiona','optionb','optionc','optiond','optione',10,1),(16,'2019-03-15 12:54:12','dsghnfgn','optiona','optionb','optionc','optiond','optione',8,1),(17,'2019-03-15 12:54:16','zdgng','optiona','optionb','optionc','optiond','optione',48,1),(18,'2019-03-15 12:54:21','zdghn','optiona','optionb','optionc','optiond','optione',28,1),(19,'2019-03-15 12:54:28','zdhether','optiona','optionb','optionc','optiond','optione',62,1),(20,'2019-03-15 12:54:32','gdszc','optiona','optionb','optionc','optiond','optione',2,1),(21,'2019-03-15 12:54:37','zgndgzn','optiona','optionb','optionc','optiond','optione',20,1),(22,'2019-03-15 12:54:47','rfgjnrfhmrtyktf','optiona','optionb','optionc','optiond','optione',26,1),(23,'2019-03-15 14:30:38','fghrthrstdh','optiona','optionb','optionc','optiond','optione',16,2),(24,'2019-03-15 14:30:53','drthtrjh','optiona','optionb','optionc','optiond','optione',2,2),(25,'2019-03-15 14:31:02','zrhgdrhdfh','optiona','optionb','optionc','optiond','optione',20,2),(26,'2019-03-15 14:31:08','zdfghdefhzd','optiona','optionb','optionc','optiond','optione',48,2),(27,'2019-03-15 14:31:14','dsfgbdxb','optiona','optionb','optionc','optiond','optione',24,2),(28,'2019-03-15 14:32:20','ryjhfyjmnf','optiona','optionb','optionc','optiond','optione',44,2),(29,'2019-03-15 14:32:28','erfge','optiona','optionb','optionc','optiond','optione',58,2),(30,'2019-03-15 14:32:39','dghedrrge','optiona','optionb','optionc','optiond','optione',10,2),(31,'2019-03-15 14:32:57','dfbdxfgbd','optiona','optionb','optionc','optiond','optione',12,2),(32,'2019-03-15 14:33:03','zdfhbdth','optiona','optionb','optionc','optiond','optione',6,2),(33,'2019-03-15 14:35:24','fghrthrstdh','optiona','optionb','optionc','optiond','optione',16,3),(34,'2019-03-15 14:35:24','drthtrjh','optiona','optionb','optionc','optiond','optione',2,3),(35,'2019-03-15 14:35:24','zrhgdrhdfh','optiona','optionb','optionc','optiond','optione',20,3),(36,'2019-03-15 14:35:24','zdfghdefhzd','optiona','optionb','optionc','optiond','optione',48,3),(37,'2019-03-15 14:35:24','dsfgbdxb','optiona','optionb','optionc','optiond','optione',24,3),(38,'2019-03-15 14:35:24','ryjhfyjmnf','optiona','optionb','optionc','optiond','optione',44,3),(39,'2019-03-15 14:35:24','erfge','optiona','optionb','optionc','optiond','optione',58,3),(40,'2019-03-15 14:35:24','dghedrrge','optiona','optionb','optionc','optiond','optione',10,3),(41,'2019-03-15 14:35:24','dfbdxfgbd','optiona','optionb','optionc','optiond','optione',12,3),(42,'2019-03-15 14:35:24','zdfhbdth','optiona','optionb','optionc','optiond','optione',6,3),(48,'2019-03-15 14:35:33','fghrthrstdh','optiona','optionb','optionc','optiond','optione',16,4),(49,'2019-03-15 14:35:33','drthtrjh','optiona','optionb','optionc','optiond','optione',2,4),(50,'2019-03-15 14:35:33','zrhgdrhdfh','optiona','optionb','optionc','optiond','optione',20,4),(51,'2019-03-15 14:35:33','zdfghdefhzd','optiona','optionb','optionc','optiond','optione',48,4),(52,'2019-03-15 14:35:33','dsfgbdxb','optiona','optionb','optionc','optiond','optione',24,4),(53,'2019-03-15 14:35:33','ryjhfyjmnf','optiona','optionb','optionc','optiond','optione',44,4),(54,'2019-03-15 14:35:33','erfge','optiona','optionb','optionc','optiond','optione',58,4),(55,'2019-03-15 14:35:33','dghedrrge','optiona','optionb','optionc','optiond','optione',10,4),(56,'2019-03-15 14:35:33','dfbdxfgbd','optiona','optionb','optionc','optiond','optione',12,4),(57,'2019-03-15 14:35:33','zdfhbdth','optiona','optionb','optionc','optiond','optione',6,4),(63,'2019-03-15 14:39:00','fghrthrstdh','optiona','optionb','optionc','optiond','optione',16,5),(64,'2019-03-15 14:39:00','drthtrjh','optiona','optionb','optionc','optiond','optione',2,5),(65,'2019-03-15 14:39:00','zrhgdrhdfh','optiona','optionb','optionc','optiond','optione',20,5),(66,'2019-03-15 14:39:00','zdfghdefhzd','optiona','optionb','optionc','optiond','optione',48,5),(67,'2019-03-15 14:39:00','dsfgbdxb','optiona','optionb','optionc','optiond','optione',24,5),(68,'2019-03-15 14:39:00','ryjhfyjmnf','optiona','optionb','optionc','optiond','optione',44,5),(69,'2019-03-15 14:39:00','erfge','optiona','optionb','optionc','optiond','optione',58,5),(70,'2019-03-15 14:39:00','dghedrrge','optiona','optionb','optionc','optiond','optione',10,5),(71,'2019-03-15 14:39:00','dfbdxfgbd','optiona','optionb','optionc','optiond','optione',12,5),(72,'2019-03-15 14:39:00','zdfhbdth','optiona','optionb','optionc','optiond','optione',6,5),(78,'2019-03-15 14:39:05','fghrthrstdh','optiona','optionb','optionc','optiond','optione',16,6),(79,'2019-03-15 14:39:05','drthtrjh','optiona','optionb','optionc','optiond','optione',2,6),(80,'2019-03-15 14:39:05','zrhgdrhdfh','optiona','optionb','optionc','optiond','optione',20,6),(81,'2019-03-15 14:39:05','zdfghdefhzd','optiona','optionb','optionc','optiond','optione',48,6),(82,'2019-03-15 14:39:05','dsfgbdxb','optiona','optionb','optionc','optiond','optione',24,6),(83,'2019-03-15 14:39:05','ryjhfyjmnf','optiona','optionb','optionc','optiond','optione',44,6),(84,'2019-03-15 14:39:05','erfge','optiona','optionb','optionc','optiond','optione',58,6),(85,'2019-03-15 14:39:05','dghedrrge','optiona','optionb','optionc','optiond','optione',10,6),(86,'2019-03-15 14:39:05','dfbdxfgbd','optiona','optionb','optionc','optiond','optione',12,6),(87,'2019-03-15 14:39:05','zdfhbdth','optiona','optionb','optionc','optiond','optione',6,6),(93,'2019-03-15 14:39:11','fghrthrstdh','optiona','optionb','optionc','optiond','optione',16,7),(94,'2019-03-15 14:39:11','drthtrjh','optiona','optionb','optionc','optiond','optione',2,7),(95,'2019-03-15 14:39:11','zrhgdrhdfh','optiona','optionb','optionc','optiond','optione',20,7),(96,'2019-03-15 14:39:11','zdfghdefhzd','optiona','optionb','optionc','optiond','optione',48,7),(97,'2019-03-15 14:39:11','dsfgbdxb','optiona','optionb','optionc','optiond','optione',24,7),(98,'2019-03-15 14:39:11','ryjhfyjmnf','optiona','optionb','optionc','optiond','optione',44,7),(99,'2019-03-15 14:39:11','erfge','optiona','optionb','optionc','optiond','optione',58,7),(100,'2019-03-15 14:39:11','dghedrrge','optiona','optionb','optionc','optiond','optione',10,7),(101,'2019-03-15 14:39:11','dfbdxfgbd','optiona','optionb','optionc','optiond','optione',12,7),(102,'2019-03-15 14:39:11','zdfhbdth','optiona','optionb','optionc','optiond','optione',6,7),(108,'2019-03-15 14:39:15','fghrthrstdh','optiona','optionb','optionc','optiond','optione',16,8),(109,'2019-03-15 14:39:15','drthtrjh','optiona','optionb','optionc','optiond','optione',2,8),(110,'2019-03-15 14:39:15','zrhgdrhdfh','optiona','optionb','optionc','optiond','optione',20,8),(111,'2019-03-15 14:39:15','zdfghdefhzd','optiona','optionb','optionc','optiond','optione',48,8),(112,'2019-03-15 14:39:15','dsfgbdxb','optiona','optionb','optionc','optiond','optione',24,8),(113,'2019-03-15 14:39:15','ryjhfyjmnf','optiona','optionb','optionc','optiond','optione',44,8),(114,'2019-03-15 14:39:15','erfge','optiona','optionb','optionc','optiond','optione',58,8),(115,'2019-03-15 14:39:15','dghedrrge','optiona','optionb','optionc','optiond','optione',10,8),(116,'2019-03-15 14:39:15','dfbdxfgbd','optiona','optionb','optionc','optiond','optione',12,8),(117,'2019-03-15 14:39:15','zdfhbdth','optiona','optionb','optionc','optiond','optione',6,8),(123,'2019-03-15 17:40:13','rgjrtyjsryjry','optiona','optionb','optionc','optiond','optione',8,1),(124,'2019-03-15 17:40:13','dfgnfgnn','optiona','optionb','optionc','optiond','optione',40,1),(125,'2019-03-15 17:40:13','dghrtjhnr','optiona','optionb','optionc','optiond','optione',10,1),(126,'2019-03-15 17:40:13','dsghnfgn','optiona','optionb','optionc','optiond','optione',8,1),(127,'2019-03-15 17:40:13','zdgng','optiona','optionb','optionc','optiond','optione',48,1),(128,'2019-03-15 17:40:13','zdghn','optiona','optionb','optionc','optiond','optione',28,1),(129,'2019-03-15 17:40:13','zdhether','optiona','optionb','optionc','optiond','optione',62,1),(130,'2019-03-15 17:40:13','gdszc','optiona','optionb','optionc','optiond','optione',2,1),(131,'2019-03-15 17:40:13','zgndgzn','optiona','optionb','optionc','optiond','optione',20,1),(132,'2019-03-15 17:40:13','rfgjnrfhmrtyktf','optiona','optionb','optionc','optiond','optione',26,1),(138,'2019-03-16 07:49:05','fghrthrstdh','optiona','optionb','optionc','optiond','optione',16,9),(139,'2019-03-16 07:49:05','drthtrjh','optiona','optionb','optionc','optiond','optione',2,9),(140,'2019-03-16 07:49:05','zrhgdrhdfh','optiona','optionb','optionc','optiond','optione',20,9),(141,'2019-03-16 07:49:05','zdfghdefhzd','optiona','optionb','optionc','optiond','optione',48,9),(142,'2019-03-16 07:49:05','dsfgbdxb','optiona','optionb','optionc','optiond','optione',24,9),(143,'2019-03-16 07:49:05','ryjhfyjmnf','optiona','optionb','optionc','optiond','optione',44,9),(144,'2019-03-16 07:49:05','erfge','optiona','optionb','optionc','optiond','optione',58,9),(145,'2019-03-16 07:49:05','dghedrrge','optiona','optionb','optionc','optiond','optione',10,9),(146,'2019-03-16 07:49:05','dfbdxfgbd','optiona','optionb','optionc','optiond','optione',12,9),(147,'2019-03-16 07:49:05','zdfhbdth','optiona','optionb','optionc','optiond','optione',6,9);
/*!40000 ALTER TABLE `ques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scoreboard`
--

DROP TABLE IF EXISTS `scoreboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `scoreboard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(10) unsigned DEFAULT NULL,
  `score` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scoreboard`
--

LOCK TABLES `scoreboard` WRITE;
/*!40000 ALTER TABLE `scoreboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `scoreboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission`
--

DROP TABLE IF EXISTS `submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `submission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(10) unsigned NOT NULL,
  `ques_id` int(10) unsigned NOT NULL,
  `answer` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3081;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission`
--

LOCK TABLES `submission` WRITE;
/*!40000 ALTER TABLE `submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `t` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'2019-03-16 09:37:23','2019-03-17 16:06:30');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(75) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `year` tinyint(4) NOT NULL,
  `branch_id` int(10) unsigned NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
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

-- Dump completed on 2019-03-17 22:09:17
