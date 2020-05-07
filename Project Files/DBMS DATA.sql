CREATE DATABASE  IF NOT EXISTS `dbms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbms`;
-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: dbms.czdw77kneec2.us-east-1.rds.amazonaws.com    Database: dbms
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allrecord`
--

LOCK TABLES `allrecord` WRITE;
/*!40000 ALTER TABLE `allrecord` DISABLE KEYS */;
INSERT INTO `allrecord` VALUES (11,'Close',103,'2020-03-10 19:30:12',1,'Carpenter',101,'2020-03-11 13:51:28','Girls',NULL),(12,'Close',103,'2020-03-11 06:30:12',20,'Carpenter',100,'2020-05-07 09:28:29','H2',''),(13,'Open',104,'2020-03-10 20:30:21',18,'Carpenter',106,NULL,'old boys',''),(14,'Close',105,'2020-03-11 05:30:12',2,'Cleaner',101,'2020-04-27 14:08:55','Girls','nice '),(15,'Open',201,'2020-03-11 04:30:29',22,'Painter',103,NULL,'Girls',''),(17,'Unassigned',206,'2020-03-11 02:30:09',NULL,'Electrician',102,NULL,'H1',''),(23,'Open',210,'2020-04-11 08:10:20',2,'Cleaner',109,NULL,'H2','clean'),(24,'Open',117,'2020-04-11 08:50:20',2,'Plumber',102,NULL,'H2','fast'),(25,'Open',400,'2020-04-11 10:10:20',2,'Cleaner',106,NULL,'old boys',NULL),(26,'Close',109,'2020-04-11 11:40:20',2,'Electrician',100,'2020-04-11 11:45:19','H2',NULL),(27,'Open',111,'2020-04-11 11:45:20',4,'Electrician',109,NULL,'H2',NULL),(28,'Open',232,'2020-04-11 15:30:02',13,'Carpenter',103,NULL,'H1','could be better'),(29,'Close',312,'2020-04-11 17:18:55',2,'Plumber',103,'2020-04-11 18:10:19','H1',NULL),(30,'Open',106,'2020-04-11 18:10:20',2,'Carpenter',105,NULL,'Girls','sandy was unprofessional'),(31,'Open',224,'2020-04-11 20:05:56',2,'Cleaner',102,NULL,'H2',NULL),(32,'Close',212,'2020-05-11 09:30:26',2,'Cleaner',104,'2020-05-11 12:12:15','H1','nice'),(33,'Close',345,'2020-05-11 12:12:16',2,'Painter',107,'2020-05-11 13:12:16','H1','good job'),(34,'Close',236,'2020-05-11 15:20:16',2,'Electrician',106,'2020-04-27 15:29:44','Girls',NULL),(35,'Unassigned',512,'2020-05-11 12:12:16',NULL,'Painter',102,NULL,'H1',NULL),(36,'Unassigned',478,'2020-04-11 18:10:20',NULL,'Cleaner',105,NULL,'H2',NULL),(37,'Unassigned',987,'2020-04-11 18:10:20',NULL,'Cleaner',104,NULL,'H1',NULL);
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
  `Name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Type` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Username` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Password` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `allusers_chk_1` CHECK ((`Type` in (_utf8mb4'user',_utf8mb4'fms',_utf8mb4'employee')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allusers`
--

LOCK TABLES `allusers` WRITE;
/*!40000 ALTER TABLE `allusers` DISABLE KEYS */;
INSERT INTO `allusers` VALUES (1,'sandeep','user','u2','julvkugfxdabcjulvkugfxd'),(2,'sarthak','employee','u1','cibuhgdkzgabccibuhgdkzg'),(3,'Nandesh','fms','u3','ckdiobjaeuabcckdiobjaeu'),(101,'Guest','user','u4','qrxsnkylkwabcqrxsnkylkw');
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
/*!50003 CREATE*/ /*!50017 DEFINER=`fms`@`%`*/ /*!50003 TRIGGER `addfms` AFTER INSERT ON `allusers` FOR EACH ROW BEGIN
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
/*!50003 CREATE*/ /*!50017 DEFINER=`fms`@`%`*/ /*!50003 TRIGGER `addstudent` AFTER INSERT ON `allusers` FOR EACH ROW BEGIN
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
/*!50003 CREATE*/ /*!50017 DEFINER=`fms`@`%`*/ /*!50003 TRIGGER `addemp` AFTER INSERT ON `allusers` FOR EACH ROW BEGIN
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
/*!50003 CREATE*/ /*!50017 DEFINER=`fms`@`%`*/ /*!50003 TRIGGER `delfms` AFTER DELETE ON `allusers` FOR EACH ROW BEGIN
	IF OLD.TYPE='fms' THEN
		DELETE FROM fmshead WHERE id=OLD.id;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`fms`@`%`*/ /*!50003 TRIGGER `delemp` AFTER DELETE ON `allusers` FOR EACH ROW BEGIN
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
/*!50003 CREATE*/ /*!50017 DEFINER=`fms`@`%`*/ /*!50003 TRIGGER `deluser` AFTER DELETE ON `allusers` FOR EACH ROW BEGIN
	IF OLD.TYPE='user' THEN
		DELETE FROM studentsallrecord WHERE id=OLD.id;
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eateries`
--

LOCK TABLES `eateries` WRITE;
/*!40000 ALTER TABLE `eateries` DISABLE KEYS */;
INSERT INTO `eateries` VALUES ('Bikano','Seminar Block','Seminar Building',31),('ChaiPani','near R&D Block','Open Auditorium',32),('SunShine Mess','near  Seminar Block','Mess Building',33),('Café Coffee Day','Old Acadamics','Old Acadamic',34),('Punjabi Dhaba','near  Seminar Block','Mess Building',35);
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
) ENGINE=InnoDB AUTO_INCREMENT=1236 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fmshead`
--

LOCK TABLES `fmshead` WRITE;
/*!40000 ALTER TABLE `fmshead` DISABLE KEYS */;
INSERT INTO `fmshead` VALUES (1221,'Subhash',2018101,'1234567890'),(1222,'Sandeep',2018102,'6982392892'),(1223,'Nandesh',2018103,'4689654368'),(1224,'Ramesh',2018104,'6982432892'),(1225,'Suresh',2018105,'6982577592'),(1226,'Nancy',2018106,'6945692892'),(1227,'Rohan',2018107,'6982392556'),(1228,'Himanshu',2018108,'6982392812'),(1229,'Sarthak',2018109,'6982392908'),(1230,'Archit',2018110,'6982392654'),(1231,'Akshat',2018111,'6982392236'),(1232,'Komaal',2018112,'6982392578'),(1233,'Anubha',2018113,'6982392247'),(1234,'Kamal',2018114,'6982308655'),(1235,'Bhumi',2018115,'4344567688');
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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES ('good',1,81,91),('good',2,82,92),('satisfactory',3,83,93),('okay',4,84,94),('nice',5,85,95),('okay',6,86,96),('nice',7,87,97),('not satisfactory',8,88,98),('good',9,89,99),('satisfactory',10,90,100);
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
) ENGINE=InnoDB AUTO_INCREMENT=707 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (701,101,2018001,2016270),(702,102,2016242,2016232),(703,103,2016276,2016278),(704,104,2016240,2017286),(705,105,2014066,2017190),(706,106,2016235,2018380);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (11,1,'2020-02-29 08:00:00','2020-02-29 10:00:00'),(12,2,'2020-02-29 09:00:00','2020-02-29 11:00:00'),(13,3,'2020-02-29 10:00:00','2020-02-29 12:00:00'),(14,4,'2020-02-29 11:00:00','2020-02-29 13:00:00'),(15,5,'2020-02-29 12:00:00','2020-02-29 14:00:00'),(16,6,'2020-02-29 18:30:00','2020-02-29 21:00:00'),(17,7,'2020-02-29 13:00:00','2020-02-29 14:00:00'),(18,8,'2020-02-29 15:00:00','2020-02-29 15:30:00'),(19,9,'2020-02-29 17:00:00','2020-02-29 18:00:00'),(20,10,'2020-02-29 20:00:00','2020-02-29 21:00:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (100,'Tom','109','H2','+918448145804'),(101,'Guest','-1','H1','+918448145804'),(102,'Sanchit','110','H1','+916284414876'),(103,'Geetanjali','111','Girls','+916284414774'),(104,'Prachi','112','Girls','+916284444874'),(105,'Riya','113','Girls','+916284489874'),(106,'ria','114','Girls','+916284414123'),(107,'Abhishek','115','H2','+916284569874'),(108,'Chandu','116','Old Boys','+916282798874'),(109,'Deepanshu','117','H1','+916284357574'),(110,'Rohit','118','H1','+916282134874'),(111,'Chhaya','119','Girls','+916284243253'),(112,'Aditya','120','H2','+916285456874'),(113,'Keshav','121','H2','+915766414874'),(114,'Sudesh','122','H1','+919678414874'),(115,'Mukesh','123','Old Boys','+912484414874'),(116,'Chandan','124','H1','+916283584374'),(117,'Vrinda','125','Girls','+916284447874'),(118,'Rupal','126','Girls','+916268978567'),(119,'Ravi','127','H2','+916786567544'),(120,'Angad','128','H1','+916287883793'),(121,'Sameer','129','H1','+918448145804'),(123,'Ruma','130','Girls','+919678414876'),(124,'Vishal','131','H1','+919678467566'),(125,'Sana','132','Girls','+919678443874'),(126,'Samiksha','133','Girls','+917576414874'),(127,'Basil','134','Old Boys','+919678467674'),(128,'Sanya','135','Girls','+919678564874'),(129,'Anirudh','136','H1','+919656533874'),(130,'Vishu','137','H2','+919677578874'),(131,'Sazal','138','Old Boys','+919678417567'),(132,'Sejal','139','Girls','+919678545777'),(133,'Sezal','140','Girls','+919678407867'),(134,'Priyanshu','141','H2','+919678407886'),(136,'Priyanshi','143','Girls','+919654546678'),(137,'Rahul','144','H2','+919678465674'),(138,'Rohan','145','H1','+919677575874'),(139,'Kapil','146','H1','+919678413434'),(140,'Swati','147','Girls','+919678535466'),(141,'Priya','142','Girls','+919678354678'),(143,'Karan','148','H1','+918448145804'),(144,'Sam','149','H1','+918448145804'),(145,'Radha','150','H2','+918448145804'),(146,'Asha','151','Girls','+919846637344'),(147,'Raja','152','H2','+918448134242'),(148,'Ram','153','Old Boys','+918442422344'),(149,'Kavi','154','H2','+918445445663'),(150,'Ben','155','Old Boys','+918444426666'),(151,'Lakshita','156','H2','+919043444445'),(152,'Dhvani','157','Girls','+919543453422'),(153,'Diksha','158','H2','+913423424344'),(154,'Anjali','159','Girls','+918332424224'),(155,'Arundhaati','160','Girls','+918443234344'),(156,'Giriraj','161','Old Boys','+918444225663'),(157,'Sunil','162','H2','+918442443111'),(158,'Nikhil','163','H1','+918448445666'),(159,'Udbhav','164','Old Boys','+918448113143'),(160,'Arjun','165','Old Boys','+918448344204'),(161,'Gaurav','166','H2','+918448142333');
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
) ENGINE=InnoDB AUTO_INCREMENT=1045 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisor`
--

LOCK TABLES `supervisor` WRITE;
/*!40000 ALTER TABLE `supervisor` DISABLE KEYS */;
INSERT INTO `supervisor` VALUES (10,'Mukesh','7290001359'),(1011,'Sourabh','7290001364'),(1033,'Meraj Alam','9810918603'),(1044,'Ganesh','9899949873');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES (1,'Navya','Electrician','+916284414874',9101),(2,'sarthak','Cleaner','+918860597094',9102),(3,'Nitin','Cleaner','+916284414874',9103),(4,'Arka','Carpenter','+916284414874',9104),(5,'Kinshuk','Cleaner','+918448145804',9105),(6,'Rishabh','Painter','+918448145804',9106),(7,'swasti','Carpenter','+918448145804',9107),(8,'Naman','Cleaner','+918448145804',9108),(9,'anmol','Plumber','+916284414874',9109),(10,'shubham','Carpenter','+916284414874',9110),(11,'gaurav','Painter','+916284414874',9111),(12,'Navya','Cleaner','+739729473947',9112),(13,'Nandesh','Carpenter','+918860597094',9113),(17,'Anjali','Plumber','+919700006597',NULL),(18,'Akansha','Plumber','+917678307757',NULL),(20,'sandytest','Carpenter','+918448145804',NULL),(21,'sarttest','Electrician','+919872213292',NULL),(22,'Mukesh','Carpenter','+919868970001',NULL);
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

-- Dump completed on 2020-05-07 21:27:35
