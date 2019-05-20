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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domain`
--

LOCK TABLES `domain` WRITE;
/*!40000 ALTER TABLE `domain` DISABLE KEYS */;
INSERT INTO `domain` VALUES (1,'2019-03-14 19:36:35','Common'),(2,'2019-03-14 19:36:35','Web Development'),(3,'2019-03-14 19:36:35','App Development'),(4,'2019-03-14 19:36:35','Blockchain'),(5,'2019-03-14 19:36:35','IoT'),(6,'2019-03-14 19:36:35','Augmented Reality'),(7,'2019-03-14 19:36:35','all'),(8,'2019-03-14 19:36:35','Databases');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES (7,'2019-03-15 12:36:02',1,2,8),(8,'2019-03-15 20:44:15',2,5,4),(9,'2019-03-15 20:48:47',3,2,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ques`
--

LOCK TABLES `ques` WRITE;
/*!40000 ALTER TABLE `ques` DISABLE KEYS */;
INSERT INTO `ques` VALUES (13,'2019-03-15 12:53:40','rgjrtyjsryjry','optiona','optionb','optionc','optiond','optione',8,1),(14,'2019-03-15 12:54:04','dfgnfgnn','optiona','optionb','optionc','optiond','optione',40,1),(15,'2019-03-15 12:54:08','dghrtjhnr','optiona','optionb','optionc','optiond','optione',10,1),(16,'2019-03-15 12:54:12','dsghnfgn','optiona','optionb','optionc','optiond','optione',8,1),(17,'2019-03-15 12:54:16','zdgng','optiona','optionb','optionc','optiond','optione',48,1),(18,'2019-03-15 12:54:21','zdghn','optiona','optionb','optionc','optiond','optione',28,1),(19,'2019-03-15 12:54:28','zdhether','optiona','optionb','optionc','optiond','optione',62,1),(20,'2019-03-15 12:54:32','gdszc','optiona','optionb','optionc','optiond','optione',2,1),(21,'2019-03-15 12:54:37','zgndgzn','optiona','optionb','optionc','optiond','optione',20,1),(22,'2019-03-15 12:54:47','rfgjnrfhmrtyktf','optiona','optionb','optionc','optiond','optione',26,1),(23,'2019-03-15 14:30:38','fghrthrstdh','optiona','optionb','optionc','optiond','optione',16,2),(24,'2019-03-15 14:30:53','drthtrjh','optiona','optionb','optionc','optiond','optione',2,2),(25,'2019-03-15 14:31:02','zrhgdrhdfh','optiona','optionb','optionc','optiond','optione',20,2),(26,'2019-03-15 14:31:08','zdfghdefhzd','optiona','optionb','optionc','optiond','optione',48,2),(27,'2019-03-15 14:31:14','dsfgbdxb','optiona','optionb','optionc','optiond','optione',24,2),(28,'2019-03-15 14:32:20','ryjhfyjmnf','optiona','optionb','optionc','optiond','optione',44,2),(29,'2019-03-15 14:32:28','erfge','optiona','optionb','optionc','optiond','optione',58,2),(30,'2019-03-15 14:32:39','dghedrrge','optiona','optionb','optionc','optiond','optione',10,2),(31,'2019-03-15 14:32:57','dfbdxfgbd','optiona','optionb','optionc','optiond','optione',12,2),(32,'2019-03-15 14:33:03','zdfhbdth','optiona','optionb','optionc','optiond','optione',6,2),(33,'2019-03-15 14:35:24','fghrthrstdh','optiona','optionb','optionc','optiond','optione',16,3),(34,'2019-03-15 14:35:24','drthtrjh','optiona','optionb','optionc','optiond','optione',2,3),(35,'2019-03-15 14:35:24','zrhgdrhdfh','optiona','optionb','optionc','optiond','optione',20,3),(36,'2019-03-15 14:35:24','zdfghdefhzd','optiona','optionb','optionc','optiond','optione',48,3),(37,'2019-03-15 14:35:24','dsfgbdxb','optiona','optionb','optionc','optiond','optione',24,3),(38,'2019-03-15 14:35:24','ryjhfyjmnf','optiona','optionb','optionc','optiond','optione',44,3),(39,'2019-03-15 14:35:24','erfge','optiona','optionb','optionc','optiond','optione',58,3),(40,'2019-03-15 14:35:24','dghedrrge','optiona','optionb','optionc','optiond','optione',10,3),(41,'2019-03-15 14:35:24','dfbdxfgbd','optiona','optionb','optionc','optiond','optione',12,3),(42,'2019-03-15 14:35:24','zdfhbdth','optiona','optionb','optionc','optiond','optione',6,3),(48,'2019-03-15 14:35:33','fghrthrstdh','optiona','optionb','optionc','optiond','optione',16,4),(49,'2019-03-15 14:35:33','drthtrjh','optiona','optionb','optionc','optiond','optione',2,4),(50,'2019-03-15 14:35:33','zrhgdrhdfh','optiona','optionb','optionc','optiond','optione',20,4),(51,'2019-03-15 14:35:33','zdfghdefhzd','optiona','optionb','optionc','optiond','optione',48,4),(52,'2019-03-15 14:35:33','dsfgbdxb','optiona','optionb','optionc','optiond','optione',24,4),(53,'2019-03-15 14:35:33','ryjhfyjmnf','optiona','optionb','optionc','optiond','optione',44,4),(54,'2019-03-15 14:35:33','erfge','optiona','optionb','optionc','optiond','optione',58,4),(55,'2019-03-15 14:35:33','dghedrrge','optiona','optionb','optionc','optiond','optione',10,4),(56,'2019-03-15 14:35:33','dfbdxfgbd','optiona','optionb','optionc','optiond','optione',12,4),(57,'2019-03-15 14:35:33','zdfhbdth','optiona','optionb','optionc','optiond','optione',6,4),(63,'2019-03-15 14:39:00','fghrthrstdh','optiona','optionb','optionc','optiond','optione',16,5),(64,'2019-03-15 14:39:00','drthtrjh','optiona','optionb','optionc','optiond','optione',2,5),(65,'2019-03-15 14:39:00','zrhgdrhdfh','optiona','optionb','optionc','optiond','optione',20,5),(66,'2019-03-15 14:39:00','zdfghdefhzd','optiona','optionb','optionc','optiond','optione',48,5),(67,'2019-03-15 14:39:00','dsfgbdxb','optiona','optionb','optionc','optiond','optione',24,5),(68,'2019-03-15 14:39:00','ryjhfyjmnf','optiona','optionb','optionc','optiond','optione',44,5),(69,'2019-03-15 14:39:00','erfge','optiona','optionb','optionc','optiond','optione',58,5),(70,'2019-03-15 14:39:00','dghedrrge','optiona','optionb','optionc','optiond','optione',10,5),(71,'2019-03-15 14:39:00','dfbdxfgbd','optiona','optionb','optionc','optiond','optione',12,5),(72,'2019-03-15 14:39:00','zdfhbdth','optiona','optionb','optionc','optiond','optione',6,5),(78,'2019-03-15 14:39:05','fghrthrstdh','optiona','optionb','optionc','optiond','optione',16,6),(79,'2019-03-15 14:39:05','drthtrjh','optiona','optionb','optionc','optiond','optione',2,6),(80,'2019-03-15 14:39:05','zrhgdrhdfh','optiona','optionb','optionc','optiond','optione',20,6),(81,'2019-03-15 14:39:05','zdfghdefhzd','optiona','optionb','optionc','optiond','optione',48,6),(82,'2019-03-15 14:39:05','dsfgbdxb','optiona','optionb','optionc','optiond','optione',24,6),(83,'2019-03-15 14:39:05','ryjhfyjmnf','optiona','optionb','optionc','optiond','optione',44,6),(84,'2019-03-15 14:39:05','erfge','optiona','optionb','optionc','optiond','optione',58,6),(85,'2019-03-15 14:39:05','dghedrrge','optiona','optionb','optionc','optiond','optione',10,6),(86,'2019-03-15 14:39:05','dfbdxfgbd','optiona','optionb','optionc','optiond','optione',12,6),(87,'2019-03-15 14:39:05','zdfhbdth','optiona','optionb','optionc','optiond','optione',6,6),(93,'2019-03-15 14:39:11','fghrthrstdh','optiona','optionb','optionc','optiond','optione',16,7),(94,'2019-03-15 14:39:11','drthtrjh','optiona','optionb','optionc','optiond','optione',2,7),(95,'2019-03-15 14:39:11','zrhgdrhdfh','optiona','optionb','optionc','optiond','optione',20,7),(96,'2019-03-15 14:39:11','zdfghdefhzd','optiona','optionb','optionc','optiond','optione',48,7),(97,'2019-03-15 14:39:11','dsfgbdxb','optiona','optionb','optionc','optiond','optione',24,7),(98,'2019-03-15 14:39:11','ryjhfyjmnf','optiona','optionb','optionc','optiond','optione',44,7),(99,'2019-03-15 14:39:11','erfge','optiona','optionb','optionc','optiond','optione',58,7),(100,'2019-03-15 14:39:11','dghedrrge','optiona','optionb','optionc','optiond','optione',10,7),(101,'2019-03-15 14:39:11','dfbdxfgbd','optiona','optionb','optionc','optiond','optione',12,7),(102,'2019-03-15 14:39:11','zdfhbdth','optiona','optionb','optionc','optiond','optione',6,7),(108,'2019-03-15 14:39:15','fghrthrstdh','optiona','optionb','optionc','optiond','optione',16,8),(109,'2019-03-15 14:39:15','drthtrjh','optiona','optionb','optionc','optiond','optione',2,8),(110,'2019-03-15 14:39:15','zrhgdrhdfh','optiona','optionb','optionc','optiond','optione',20,8),(111,'2019-03-15 14:39:15','zdfghdefhzd','optiona','optionb','optionc','optiond','optione',48,8),(112,'2019-03-15 14:39:15','dsfgbdxb','optiona','optionb','optionc','optiond','optione',24,8),(113,'2019-03-15 14:39:15','ryjhfyjmnf','optiona','optionb','optionc','optiond','optione',44,8),(114,'2019-03-15 14:39:15','erfge','optiona','optionb','optionc','optiond','optione',58,8),(115,'2019-03-15 14:39:15','dghedrrge','optiona','optionb','optionc','optiond','optione',10,8),(116,'2019-03-15 14:39:15','dfbdxfgbd','optiona','optionb','optionc','optiond','optione',12,8),(117,'2019-03-15 14:39:15','zdfhbdth','optiona','optionb','optionc','optiond','optione',6,8),(123,'2019-03-15 17:40:13','rgjrtyjsryjry','optiona','optionb','optionc','optiond','optione',8,1),(124,'2019-03-15 17:40:13','dfgnfgnn','optiona','optionb','optionc','optiond','optione',40,1),(125,'2019-03-15 17:40:13','dghrtjhnr','optiona','optionb','optionc','optiond','optione',10,1),(126,'2019-03-15 17:40:13','dsghnfgn','optiona','optionb','optionc','optiond','optione',8,1),(127,'2019-03-15 17:40:13','zdgng','optiona','optionb','optionc','optiond','optione',48,1),(128,'2019-03-15 17:40:13','zdghn','optiona','optionb','optionc','optiond','optione',28,1),(129,'2019-03-15 17:40:13','zdhether','optiona','optionb','optionc','optiond','optione',62,1),(130,'2019-03-15 17:40:13','gdszc','optiona','optionb','optionc','optiond','optione',2,1),(131,'2019-03-15 17:40:13','zgndgzn','optiona','optionb','optionc','optiond','optione',20,1),(132,'2019-03-15 17:40:13','rfgjnrfhmrtyktf','optiona','optionb','optionc','optiond','optione',26,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scoreboard`
--

LOCK TABLES `scoreboard` WRITE;
/*!40000 ALTER TABLE `scoreboard` DISABLE KEYS */;
INSERT INTO `scoreboard` VALUES (1,'2019-03-15 20:23:05',1,1),(2,'2019-03-15 20:45:18',2,0),(3,'2019-03-15 20:50:01',3,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission`
--

LOCK TABLES `submission` WRITE;
/*!40000 ALTER TABLE `submission` DISABLE KEYS */;
INSERT INTO `submission` VALUES (81,'2019-03-15 20:23:01',1,19,0),(82,'2019-03-15 20:23:01',1,123,0),(83,'2019-03-15 20:23:01',1,124,0),(84,'2019-03-15 20:23:02',1,18,0),(85,'2019-03-15 20:23:02',1,128,0),(86,'2019-03-15 20:23:02',1,130,0),(87,'2019-03-15 20:23:02',1,14,0),(88,'2019-03-15 20:23:02',1,132,0),(89,'2019-03-15 20:23:02',1,21,0),(90,'2019-03-15 20:23:02',1,131,0),(91,'2019-03-15 20:23:02',1,129,0),(92,'2019-03-15 20:23:02',1,22,0),(93,'2019-03-15 20:23:02',1,16,0),(94,'2019-03-15 20:23:02',1,125,0),(95,'2019-03-15 20:23:02',1,127,0),(96,'2019-03-15 20:23:03',1,15,0),(97,'2019-03-15 20:23:03',1,126,0),(98,'2019-03-15 20:23:03',1,20,0),(99,'2019-03-15 20:23:03',1,17,0),(100,'2019-03-15 20:23:03',1,13,0),(101,'2019-03-15 20:23:03',1,27,0),(102,'2019-03-15 20:23:03',1,28,0),(103,'2019-03-15 20:23:03',1,25,0),(104,'2019-03-15 20:23:04',1,29,0),(105,'2019-03-15 20:23:04',1,32,0),(106,'2019-03-15 20:23:04',1,31,0),(107,'2019-03-15 20:23:04',1,26,0),(108,'2019-03-15 20:23:04',1,24,0),(109,'2019-03-15 20:23:04',1,23,0),(110,'2019-03-15 20:23:04',1,30,0),(111,'2019-03-15 20:23:04',1,113,0),(112,'2019-03-15 20:23:04',1,109,0),(113,'2019-03-15 20:23:04',1,115,0),(114,'2019-03-15 20:23:04',1,116,0),(115,'2019-03-15 20:23:04',1,110,0),(116,'2019-03-15 20:23:04',1,111,0),(117,'2019-03-15 20:23:05',1,112,0),(118,'2019-03-15 20:23:05',1,114,0),(119,'2019-03-15 20:23:05',1,108,0),(120,'2019-03-15 20:23:05',1,117,6),(121,'2019-03-15 20:45:14',2,22,34),(122,'2019-03-15 20:45:14',2,124,0),(123,'2019-03-15 20:45:15',2,17,0),(124,'2019-03-15 20:45:15',2,132,0),(125,'2019-03-15 20:45:15',2,14,0),(126,'2019-03-15 20:45:15',2,129,10),(127,'2019-03-15 20:45:15',2,16,0),(128,'2019-03-15 20:45:15',2,130,0),(129,'2019-03-15 20:45:15',2,15,0),(130,'2019-03-15 20:45:16',2,21,62),(131,'2019-03-15 20:45:16',2,19,0),(132,'2019-03-15 20:45:16',2,131,0),(133,'2019-03-15 20:45:16',2,128,10),(134,'2019-03-15 20:45:16',2,13,10),(135,'2019-03-15 20:45:16',2,127,10),(136,'2019-03-15 20:45:16',2,20,0),(137,'2019-03-15 20:45:16',2,18,0),(138,'2019-03-15 20:45:16',2,126,0),(139,'2019-03-15 20:45:16',2,123,18),(140,'2019-03-15 20:45:16',2,125,18),(141,'2019-03-15 20:45:16',2,65,0),(142,'2019-03-15 20:45:16',2,69,0),(143,'2019-03-15 20:45:17',2,63,0),(144,'2019-03-15 20:45:17',2,67,0),(145,'2019-03-15 20:45:17',2,72,36),(146,'2019-03-15 20:45:17',2,64,0),(147,'2019-03-15 20:45:17',2,66,0),(148,'2019-03-15 20:45:17',2,70,40),(149,'2019-03-15 20:45:17',2,71,0),(150,'2019-03-15 20:45:17',2,68,10),(151,'2019-03-15 20:45:17',2,53,18),(152,'2019-03-15 20:45:17',2,48,0),(153,'2019-03-15 20:45:17',2,54,0),(154,'2019-03-15 20:45:17',2,56,20),(155,'2019-03-15 20:45:17',2,49,0),(156,'2019-03-15 20:45:17',2,55,0),(157,'2019-03-15 20:45:17',2,51,10),(158,'2019-03-15 20:45:18',2,50,0),(159,'2019-03-15 20:45:18',2,52,0),(160,'2019-03-15 20:45:18',2,57,0),(161,'2019-03-15 20:49:57',3,130,2),(162,'2019-03-15 20:49:57',3,126,8),(163,'2019-03-15 20:49:57',3,127,0),(164,'2019-03-15 20:49:57',3,132,0),(165,'2019-03-15 20:49:57',3,22,0),(166,'2019-03-15 20:49:57',3,13,0),(167,'2019-03-15 20:49:57',3,17,0),(168,'2019-03-15 20:49:57',3,125,0),(169,'2019-03-15 20:49:58',3,129,0),(170,'2019-03-15 20:49:58',3,123,0),(171,'2019-03-15 20:49:58',3,18,0),(172,'2019-03-15 20:49:58',3,124,0),(173,'2019-03-15 20:49:58',3,131,0),(174,'2019-03-15 20:49:58',3,14,0),(175,'2019-03-15 20:49:58',3,19,0),(176,'2019-03-15 20:49:58',3,128,0),(177,'2019-03-15 20:49:58',3,16,0),(178,'2019-03-15 20:49:58',3,20,0),(179,'2019-03-15 20:49:59',3,15,0),(180,'2019-03-15 20:49:59',3,21,0),(181,'2019-03-15 20:49:59',3,29,0),(182,'2019-03-15 20:49:59',3,24,0),(183,'2019-03-15 20:49:59',3,32,0),(184,'2019-03-15 20:49:59',3,25,0),(185,'2019-03-15 20:49:59',3,26,0),(186,'2019-03-15 20:49:59',3,31,0),(187,'2019-03-15 20:49:59',3,28,0),(188,'2019-03-15 20:50:00',3,30,0),(189,'2019-03-15 20:50:00',3,27,0),(190,'2019-03-15 20:50:00',3,23,0),(191,'2019-03-15 20:50:00',3,37,0),(192,'2019-03-15 20:50:00',3,39,0),(193,'2019-03-15 20:50:00',3,42,0),(194,'2019-03-15 20:50:01',3,40,0),(195,'2019-03-15 20:50:01',3,41,0),(196,'2019-03-15 20:50:01',3,33,0),(197,'2019-03-15 20:50:01',3,35,0),(198,'2019-03-15 20:50:01',3,38,0),(199,'2019-03-15 20:50:01',3,34,0),(200,'2019-03-15 20:50:01',3,36,0);
/*!40000 ALTER TABLE `submission` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'2019-03-14 19:03:33','Ankit Agrawal','ankit@gmail.com','9012747590',1,3,1,'ankit@123'),(2,'2019-03-15 20:43:55','Gaurang Sharma','gaurang@gmail.com','9837321149',2,2,2,'gaurang@123'),(3,'2019-03-15 20:48:26','Ekta Arora','ekta@gmail.com','46465465',3,4,2,'ekta@123');
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

-- Dump completed on 2019-03-16  2:22:36
