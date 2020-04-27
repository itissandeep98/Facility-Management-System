CREATE DATABASE  IF NOT EXISTS `dbms` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbms`;
-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: fms.cd3si0vwuilu.us-east-1.rds.amazonaws.com    Database: dbms
-- ------------------------------------------------------
-- Server version	8.0.17

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `allrecord`
--

DROP TABLE IF EXISTS `allrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Status` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `roomnum` int(11) DEFAULT NULL,
  `starttime` timestamp NULL DEFAULT NULL,
  `WorkerID` int(11) DEFAULT NULL,
  `RequestType` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `StudentID` int(11) NOT NULL,
  `closedtime` timestamp NULL DEFAULT NULL,
  `Hostel` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`Status`),
  UNIQUE KEY `ID_UNIQUE` (`id`),
  CONSTRAINT `allrecord_chk_1` CHECK ((`Status` in (_utf8mb3'Open',_utf8mb3'Close',_utf8mb3'Unassigned'))),
  CONSTRAINT `allrecord_chk_3` CHECK ((`Hostel` in (_utf8mb3'H2',_utf8mb3'H1',_utf8mb3'old boys',_utf8mb3'Girls'))),
  CONSTRAINT `allrecord_chk_4` CHECK ((`RequestType` in (_utf8mb4'Carpenter',_utf8mb4'Cleaner',_utf8mb4'Plumber',_utf8mb4'Electrician',_utf8mb4'Painter')))
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allrecord`
--

LOCK TABLES `allrecord` WRITE;
/*!40000 ALTER TABLE `allrecord` DISABLE KEYS */;
INSERT INTO `allrecord` VALUES (11,'Close',103,'2020-03-10 19:30:12',1,'Carpenter',3,'2020-03-11 13:51:28','Girls',NULL),(12,'Open',103,'2020-03-11 06:30:12',2,'Carpenter',2,'2020-04-27 04:24:53','H2',NULL),(13,'Unassigned',104,'2020-03-10 20:30:21',NULL,'Carpenter',6,NULL,'old boys',NULL),(14,'Open',105,'2020-03-11 05:30:12',5,'Cleaner',4,NULL,'Girls',NULL),(15,'Close',201,'2020-03-11 04:30:29',5,'Painter',1,'2020-03-11 09:08:41','Girls',NULL),(16,'Open',205,'2020-03-11 03:48:57',NULL,'Cleaner',2,NULL,'old boys',NULL),(17,'Unassigned',206,'2020-03-11 02:30:09',NULL,'Electrician',5,NULL,'H1',NULL),(19,'Open',208,'2020-03-10 23:30:56',2,'Plumber',9,'2020-03-11 09:10:29','H2',NULL),(22,'Unassigned',404,'2020-03-11 20:08:22',NULL,'Cleaner',3,NULL,'H1','');
/*!40000 ALTER TABLE `allrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allusers`
--

DROP TABLE IF EXISTS `allusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allusers` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Type` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Username` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Password` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `allusers_chk_1` CHECK ((`Type` in (_utf8mb4'user',_utf8mb4'fms',_utf8mb4'employee')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allusers`
--

LOCK TABLES `allusers` WRITE;
/*!40000 ALTER TABLE `allusers` DISABLE KEYS */;
INSERT INTO `allusers` VALUES (1,'sandeep','user','u2','aabcd'),(2,'sarthak','employee','u1','gabci'),(3,'Nandesh','fms','u3','eabcp');
/*!40000 ALTER TABLE `allusers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `addfms` AFTER INSERT ON `allusers` FOR EACH ROW BEGIN
	IF NEW.TYPE='fms' THEN
		INSERT INTO fmshead (id,Name) VALUES(NEW.ID,NEW.Name);
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `addstudent` AFTER INSERT ON `allusers` FOR EACH ROW BEGIN
	IF NEW.TYPE='user' THEN
		INSERT INTO students (id,Name) VALUES(NEW.ID,NEW.Name);
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `addemp` AFTER INSERT ON `allusers` FOR EACH ROW BEGIN
	IF NEW.TYPE='employee' THEN
		INSERT INTO worker (id,Name) VALUES(NEW.ID,NEW.Name);
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `deluser` AFTER DELETE ON `allusers` FOR EACH ROW BEGIN
	IF OLD.TYPE='user' THEN
		DELETE FROM studentsallrecord WHERE id=OLD.id;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `delemp` AFTER DELETE ON `allusers` FOR EACH ROW BEGIN
	IF OLD.TYPE='employee' THEN
		DELETE FROM worker WHERE id=OLD.id;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `delfms` AFTER DELETE ON `allusers` FOR EACH ROW BEGIN
	IF OLD.TYPE='fms' THEN
		DELETE FROM fmshead WHERE id=OLD.id;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `Name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Location` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `isResidence` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `RoomNum` int(11) DEFAULT NULL,
  `Contact` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ScheduleID` int(11) DEFAULT NULL,
  `Contact` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fmshead`
--

LOCK TABLES `fmshead` WRITE;
/*!40000 ALTER TABLE `fmshead` DISABLE KEYS */;
INSERT INTO `fmshead` VALUES (1,'Sanskar',1,'100'),(2,'Sachdeva',2,'101'),(3,'Nandesh',NULL,NULL),(4,'Salman',4,'103');
/*!40000 ALTER TABLE `fmshead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostels`
--

DROP TABLE IF EXISTS `hostels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hostels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NumOfRoom` int(11) DEFAULT NULL,
  `NumOfFloor` int(11) DEFAULT NULL,
  `SupervisorID` int(11) NOT NULL,
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
  `WorkerID` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ReviewerID` int(11) DEFAULT NULL,
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `HostelID` int(11) NOT NULL,
  `Student1ID` int(11) DEFAULT NULL,
  `Student2ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`HostelID`),
  UNIQUE KEY `RoomID_UNIQUE` (`id`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkerID` int(11) NOT NULL,
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `RoomNo` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '-1',
  `HostelID` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'H1',
  `ContactInfo` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '+918448145804',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID_UNIQUE` (`id`),
  CONSTRAINT `students_chk_1` CHECK ((`Hostelid` in (_utf8mb4'H2',_utf8mb4'H1',_utf8mb4'old boys',_utf8mb4'Girls')))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'sandeep','-1',NULL,NULL),(2,'Deep','101','H1','+916284414874'),(3,'Nit','102','H2','+916284414874'),(4,'Tin','102','H1','+916284414874'),(5,'Kin','103','old boys','+918448145804'),(6,'Shuk','104','Girls','+918448145804'),(7,'Arka','106','H1','+918448145804'),(8,'Nan','109','H2','+918448145804'),(9,'Desh','106','H2','+918448145804'),(10,'Tom','109','H2','+918448145804');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisor`
--

DROP TABLE IF EXISTS `supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supervisor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Speciality` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'Cleaner',
  `ContactInfo` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `SupervisorID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID_UNIQUE` (`id`),
  CONSTRAINT `worker_chk_1` CHECK ((`Speciality` in (_utf8mb3'Carpenter',_utf8mb3'Cleaner',_utf8mb3'Plumber',_utf8mb3'Electrician',_utf8mb3'Painter')))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES (1,'Navya','Electrician','+916284414874',2),(2,'sarthak','Cleaner','',NULL),(3,'Nitin','Cleaner','+916284414874',3),(4,'Arka','Carpenter','+916284414874',4),(5,'Kinshuk','Cleaner','+918448145804',5),(6,'Rishabh','Painter','+918448145804',2),(7,'swasti','Carpenter','+918448145804',1),(10,'Naman','Cleaner','+918448145804',3),(11,'anmol','Plumber','+916284414874',NULL),(13,'shubham','Carpenter','+916284414874',NULL),(14,'gaurav','Painter','+916284414874',NULL);
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbms'
--

--
-- Dumping routines for database 'dbms'
--
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-27  6:52:35
