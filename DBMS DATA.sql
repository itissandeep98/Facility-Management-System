CREATE DATABASE  IF NOT EXISTS `dbms` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbms`;
-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: localhost    Database: dbms
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `allrecord`
--

DROP TABLE IF EXISTS `allrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allrecord` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Status` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `roomnum` int DEFAULT NULL,
  `starttime` timestamp NULL DEFAULT NULL,
  `WorkerID` int DEFAULT NULL,
  `RequestType` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `StudentID` int NOT NULL,
  `closedtime` timestamp NULL DEFAULT NULL,
  `Hostel` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`Status`),
  UNIQUE KEY `ID_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allrecord`
--

LOCK TABLES `allrecord` WRITE;
/*!40000 ALTER TABLE `allrecord` DISABLE KEYS */;
INSERT INTO `allrecord` VALUES (11,'Open',102,'2020-03-10 19:30:12',1,'Carpenter',3,NULL,'h1',NULL),(12,'Unassigned',103,'2020-03-11 06:30:12',NULL,'Carpenter',2,NULL,'h2',NULL),(13,'Open',104,'2020-03-10 20:30:21',4,'Carpenter',6,NULL,'old boys',NULL),(14,'Open',105,'2020-03-11 05:30:12',5,'Cleaner',4,NULL,'girls',NULL),(15,'Close',201,'2020-03-11 04:30:29',1,'Cleaner',1,'2020-03-11 09:08:41','girls',NULL),(16,'Unassigned',205,'2020-03-11 03:48:57',NULL,'Cleaner',2,NULL,'old boys',NULL),(17,'Unassigned',206,'2020-03-11 02:30:09',NULL,'Electrician',5,NULL,'h1',NULL),(19,'Close',208,'2020-03-10 23:30:56',2,'Plumber',9,'2020-03-11 09:10:29','h2',NULL);
/*!40000 ALTER TABLE `allrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `Name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Location` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `isResidence` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES ('Seminar','Seminar Block',0,1),('Acad','Acad',0,2),('Faluty Res -2','Faculty Res',1,3),('H1 Hostel','H1 Hostel',1,4);
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eateries`
--

DROP TABLE IF EXISTS `eateries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eateries` (
  `Name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Location` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Building` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eateries`
--

LOCK TABLES `eateries` WRITE;
/*!40000 ALTER TABLE `eateries` DISABLE KEYS */;
INSERT INTO `eateries` VALUES ('Bikano','Seminar','Seminar',1),('BrewBakes','Acad','Acad',2),('Mess-1','Student Center','Student Center',3),('Mess-2','Student Center','Student Center',4);
/*!40000 ALTER TABLE `eateries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `Name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Department` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Building` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `RoomNum` int DEFAULT NULL,
  `Contact` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES ('Prasham','SSH','Faculty Residence-1',101,'999',1),('Neha','SSH','Faculty Residence-1',101,'998',2),('Pandey','MTH','Faculty Residence-1',102,'997',3),('Kaif','CSE','Faculty Residence-1',103,'996',4);
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fmshead`
--

DROP TABLE IF EXISTS `fmshead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fmshead` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ScheduleID` int DEFAULT NULL,
  `Contact` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fmshead`
--

LOCK TABLES `fmshead` WRITE;
/*!40000 ALTER TABLE `fmshead` DISABLE KEYS */;
INSERT INTO `fmshead` VALUES (1,'Sanskar',1,'100'),(2,'Sachdeva',2,'101'),(3,'Salman',3,'103');
/*!40000 ALTER TABLE `fmshead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostels`
--

DROP TABLE IF EXISTS `hostels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hostels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `NumOfRoom` int DEFAULT NULL,
  `NumOfFloor` int DEFAULT NULL,
  `SupervisorID` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostels`
--

LOCK TABLES `hostels` WRITE;
/*!40000 ALTER TABLE `hostels` DISABLE KEYS */;
INSERT INTO `hostels` VALUES (1,1000,10,1),(2,1000,10,3),(3,500,6,4);
/*!40000 ALTER TABLE `hostels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `Reviews` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `WorkerID` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `ReviewerID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES ('Nice',4,1,1),('Good',3,2,2),('Awesome',4,3,3),('Better than last time',1,4,2);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `HostelID` int NOT NULL,
  `Student1ID` int DEFAULT NULL,
  `Student2ID` int DEFAULT NULL,
  PRIMARY KEY (`id`,`HostelID`),
  UNIQUE KEY `RoomID_UNIQUE` (`id`),
  KEY `Hostel ID_idx` (`HostelID`),
  CONSTRAINT `Hostel ID` FOREIGN KEY (`HostelID`) REFERENCES `students` (`HostelID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (101,1,1,2),(102,1,3,4),(103,2,5,NULL),(104,2,6,11),(105,1,8,10),(106,3,7,9),(107,3,33,21),(108,1,14,13),(109,2,16,20),(110,3,NULL,NULL);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `WorkerID` int NOT NULL,
  `starttime` timestamp NULL DEFAULT NULL,
  `closetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`WorkerID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,1,'2020-02-29 08:00:00','2020-02-29 10:00:00'),(2,2,'2020-02-29 09:00:00','2020-02-29 11:00:00'),(3,3,'2020-02-29 10:00:00','2020-02-29 12:00:00'),(4,4,'2020-02-29 11:00:00','2020-02-29 13:00:00'),(5,5,'2020-02-29 12:00:00','2020-02-29 14:00:00'),(6,7,'2020-02-29 18:30:00','2020-02-29 21:00:00'),(7,10,'2020-02-29 13:00:00','2020-02-29 14:00:00'),(8,6,'2020-02-29 15:00:00','2020-02-29 15:30:00'),(9,8,'2020-02-29 17:00:00','2020-02-29 18:00:00'),(10,9,'2020-02-29 20:00:00','2020-02-29 21:00:00');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialrequest`
--

DROP TABLE IF EXISTS `specialrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialrequest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Event` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Date` date NOT NULL,
  `Venue` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Requirement` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialrequest`
--

LOCK TABLES `specialrequest` WRITE;
/*!40000 ALTER TABLE `specialrequest` DISABLE KEYS */;
INSERT INTO `specialrequest` VALUES (1,'CB_Seminar','2020-02-03','A301','Cleaner,Electrician'),(2,'Odyssey','2020-02-05','Seminar','Cleaner'),(3,'RepublicDay','2020-01-26','OAT','Cleaner, Electrician');
/*!40000 ALTER TABLE `specialrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `RoomNo` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `HostelID` int DEFAULT NULL,
  `ContactInfo` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID_UNIQUE` (`id`),
  KEY `Hostel ID_idx` (`HostelID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'San','101',1,'232'),(2,'Deep','101',1,'232'),(3,'Nit','102',1,'255'),(4,'Tin','102',1,'255'),(5,'Kin','103',2,'454'),(6,'Shuk','104',2,'455'),(7,'Arka','106',3,'456'),(8,'Nan','109',2,'886'),(9,'Desh','106',2,'989'),(10,'Tom','109',2,'211');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisor`
--

DROP TABLE IF EXISTS `supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supervisor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Contact` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisor`
--

LOCK TABLES `supervisor` WRITE;
/*!40000 ALTER TABLE `supervisor` DISABLE KEYS */;
INSERT INTO `supervisor` VALUES (1,'Sanskar','101'),(2,'Avi','102'),(3,'Sunny','103'),(4,'Happy','104'),(5,'Lucky','105');
/*!40000 ALTER TABLE `supervisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Speciality` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ContactInfo` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SupervisorID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES (1,'swastik','Cleaner','12345',1),(2,'Navy','Electrician','23456',2),(3,'Nitin','Plumber','34567',3),(4,'Arka','Carpenter','45678',4),(5,'Kinshuk','Cleaner','56789',5),(6,'Rishabh','Painter','98990',2),(7,'Dhruv','Plumber','88605',4),(8,'Pratham','Carpenter','93129',1),(9,'Yash','Electrician','93503',1),(10,'Naman','Cleaner','55500',3),(11,'anmol','plumber','23123',NULL),(13,'shubham','carpenter','1234444',NULL),(14,'gaurav','painter','191279',NULL);
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbms'
--

--
-- Dumping routines for database 'dbms'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-11 15:19:27
