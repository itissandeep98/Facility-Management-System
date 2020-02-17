CREATE DATABASE  IF NOT EXISTS `DBMS` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `DBMS`;
-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: dbms-proj.cndnhuvgnze7.ap-south-1.rds.amazonaws.com    Database: DBMS
-- ------------------------------------------------------
-- Server version	8.0.16

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
-- Table structure for table `AllRecord`
--

DROP TABLE IF EXISTS `AllRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AllRecord` (
  `ID` int(11) NOT NULL,
  `Status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RoomNum` int(11) DEFAULT NULL,
  `Timing` time DEFAULT NULL,
  `WorkerID` int(11) DEFAULT NULL,
  `RequestType` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  CONSTRAINT `AllRecord_chk_1` CHECK ((`RequestType` in (_utf8mb3'Cleaner',_utf8mb3'Plumber',_utf8mb3'Electrician',_utf8mb3'Carpenter',_utf8mb3'Painter'))),
  CONSTRAINT `AllRecord_chk_2` CHECK ((`Status` in (_utf8mb3'Open',_utf8mb3'Close',_utf8mb3'Unassigned')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AllRecord`
--

LOCK TABLES `AllRecord` WRITE;
/*!40000 ALTER TABLE `AllRecord` DISABLE KEYS */;
INSERT INTO `AllRecord` VALUES (11,'Close',2,'01:00:12',4,'Carpenter'),(12,'Close',3,'12:00:12',4,'Carpenter'),(13,'Close',4,'02:00:21',4,'Carpenter'),(14,'Close',5,'11:00:12',5,'Cleaner'),(15,'Close',1,'10:00:29',5,'Cleaner'),(16,'Open',5,'09:18:57',5,'Cleaner'),(17,'Open',6,'08:00:09',9,'Electrician'),(18,'Unassigned',7,'07:47:10',9,'Electrician'),(19,'Unassigned',8,'05:00:56',3,'Plumber');
/*!40000 ALTER TABLE `AllRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Building`
--

DROP TABLE IF EXISTS `Building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Building` (
  `Name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Location` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `isResidence` int(11) DEFAULT NULL,
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  CONSTRAINT `Building_chk_1` CHECK ((`isResidence` in (0,1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Building`
--

LOCK TABLES `Building` WRITE;
/*!40000 ALTER TABLE `Building` DISABLE KEYS */;
INSERT INTO `Building` VALUES ('Seminar','Seminar Block',0,1),('Acad','Acad',0,2),('Faluty Res -2','Faculty Res',1,3),('H1 Hostel','H1 Hostel',1,4);
/*!40000 ALTER TABLE `Building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClosedRecord`
--

DROP TABLE IF EXISTS `ClosedRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ClosedRecord` (
  `ID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `WorkerID` int(11) DEFAULT NULL,
  `OpenTime` time NOT NULL,
  `ClosedTime` time NOT NULL,
  `RequestType` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `StudentID` (`StudentID`),
  KEY `WorkerID` (`WorkerID`),
  CONSTRAINT `ClosedRecord_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Students` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ClosedRecord_ibfk_2` FOREIGN KEY (`WorkerID`) REFERENCES `Worker` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ClosedRecord_chk_1` CHECK ((`RequestType` in (_utf8mb4'Cleaner',_utf8mb4'Plumber',_utf8mb4'Electrician',_utf8mb4'Carpenter',_utf8mb4'Painter')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClosedRecord`
--

LOCK TABLES `ClosedRecord` WRITE;
/*!40000 ALTER TABLE `ClosedRecord` DISABLE KEYS */;
INSERT INTO `ClosedRecord` VALUES (11,3,4,'11:25:00','11:40:00','Carpenter'),(13,7,2,'11:20:00','11:50:00','Electrician'),(14,2,1,'12:00:00','12:10:00','Cleaner'),(15,1,3,'12:10:00','12:25:00','Plumber'),(16,4,5,'01:01:34','02:49:55','Cleaner'),(17,6,8,'12:57:22','06:53:33','Carpenter'),(18,9,10,'11:00:56','02:00:00','Cleaner'),(19,7,6,'11:00:56','11:00:56','Plumber');
/*!40000 ALTER TABLE `ClosedRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Eateries`
--

DROP TABLE IF EXISTS `Eateries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Eateries` (
  `Name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Location` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Building` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Eateries`
--

LOCK TABLES `Eateries` WRITE;
/*!40000 ALTER TABLE `Eateries` DISABLE KEYS */;
INSERT INTO `Eateries` VALUES ('Bikano','Seminar','Seminar',1),('BrewBakes','Acad','Acad',2),('Mess-1','Student Center','Student Center',3),('Mess-2','Student Center','Student Center',4);
/*!40000 ALTER TABLE `Eateries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FMSHead`
--

DROP TABLE IF EXISTS `FMSHead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FMSHead` (
  `ID` int(11) NOT NULL,
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ScheduleID` int(11) DEFAULT NULL,
  `Contact` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FMSHead`
--

LOCK TABLES `FMSHead` WRITE;
/*!40000 ALTER TABLE `FMSHead` DISABLE KEYS */;
INSERT INTO `FMSHead` VALUES (1,'Sanskar',1,'100'),(2,'Sachdeva',2,'101'),(3,'Salman',3,'103');
/*!40000 ALTER TABLE `FMSHead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faculty`
--

DROP TABLE IF EXISTS `Faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Faculty` (
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Department` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Building` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `RoomNum` int(11) DEFAULT NULL,
  `Contact` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  CONSTRAINT `Faculty_chk_1` CHECK ((`Department` in (_utf8mb4'SSH',_utf8mb4'CSE',_utf8mb4'MTH',_utf8mb4'ECE')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Faculty`
--

LOCK TABLES `Faculty` WRITE;
/*!40000 ALTER TABLE `Faculty` DISABLE KEYS */;
INSERT INTO `Faculty` VALUES ('Prasham','SSH','Faculty Residence-1',101,'999',1),('Neha','SSH','Faculty Residence-1',101,'998',2),('Pandey','MTH','Faculty Residence-1',102,'997',3),('Kaif','CSE','Faculty Residence-1',103,'996',4);
/*!40000 ALTER TABLE `Faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hostels`
--

DROP TABLE IF EXISTS `Hostels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hostels` (
  `ID` int(11) NOT NULL,
  `NumOfRoom` int(11) DEFAULT NULL,
  `NumOfFloor` int(11) DEFAULT NULL,
  `SupervisorID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `SupervisorID` (`SupervisorID`),
  CONSTRAINT `Hostels_ibfk_1` FOREIGN KEY (`SupervisorID`) REFERENCES `Supervisor` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hostels`
--

LOCK TABLES `Hostels` WRITE;
/*!40000 ALTER TABLE `Hostels` DISABLE KEYS */;
INSERT INTO `Hostels` VALUES (1,1000,10,1),(2,1000,10,3),(3,500,6,4);
/*!40000 ALTER TABLE `Hostels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OpenRecord`
--

DROP TABLE IF EXISTS `OpenRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OpenRecord` (
  `ID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `WorkerID` int(11) DEFAULT NULL,
  `StartTime` time NOT NULL,
  `RequestType` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `WorkerID` (`WorkerID`),
  KEY `StudentID` (`StudentID`),
  CONSTRAINT `OpenRecord_ibfk_1` FOREIGN KEY (`WorkerID`) REFERENCES `Worker` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `OpenRecord_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `Students` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `OpenRecord_chk_1` CHECK (((`RequestType` in (_utf8mb4'Cleaner',_utf8mb4'Plumber',_utf8mb4'Electrician',_utf8mb4'Carpenter',_utf8mb4'Painter')) and (`WorkerID` > 0) and (`StudentID` > 0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OpenRecord`
--

LOCK TABLES `OpenRecord` WRITE;
/*!40000 ALTER TABLE `OpenRecord` DISABLE KEYS */;
INSERT INTO `OpenRecord` VALUES (1,2,2,'13:40:00','Electrician'),(9,4,1,'09:15:00','Cleaner'),(10,1,5,'12:00:00','Cleaner'),(11,7,3,'04:45:00','Plumber'),(12,3,2,'06:10:00','Electrician'),(13,5,5,'06:30:00','Cleaner'),(14,1,1,'06:30:00','Cleaner'),(15,6,4,'06:45:00','Carpenter');
/*!40000 ALTER TABLE `OpenRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reviews`
--

DROP TABLE IF EXISTS `Reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reviews` (
  `Reviews` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WorkerID` int(11) NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ReviewerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `Reviews_ibfk_1` (`WorkerID`),
  CONSTRAINT `Reviews_ibfk_1` FOREIGN KEY (`WorkerID`) REFERENCES `Worker` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reviews`
--

LOCK TABLES `Reviews` WRITE;
/*!40000 ALTER TABLE `Reviews` DISABLE KEYS */;
INSERT INTO `Reviews` VALUES ('Nice',4,1,1),('Good',3,2,2),('Awesome',4,3,3),('Better than last time',1,4,2);
/*!40000 ALTER TABLE `Reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room`
--

DROP TABLE IF EXISTS `Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Room` (
  `ID` int(11) NOT NULL,
  `HostelID` int(11) NOT NULL,
  `Student1ID` int(11) DEFAULT NULL,
  `Student2ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`,`HostelID`),
  UNIQUE KEY `RoomID_UNIQUE` (`ID`),
  KEY `Hostel ID_idx` (`HostelID`),
  CONSTRAINT `Hostel ID` FOREIGN KEY (`HostelID`) REFERENCES `Students` (`HostelID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Room_chk_1` CHECK (((`HostelID` in (1,2,3)) and (`Student1ID` > 0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room`
--

LOCK TABLES `Room` WRITE;
/*!40000 ALTER TABLE `Room` DISABLE KEYS */;
INSERT INTO `Room` VALUES (101,1,1,2),(102,1,3,4),(103,2,5,NULL),(104,2,6,11),(105,1,8,10),(106,3,7,9),(107,3,33,21),(108,1,14,13),(109,2,16,20),(110,3,NULL,NULL);
/*!40000 ALTER TABLE `Room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Schedule`
--

DROP TABLE IF EXISTS `Schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Schedule` (
  `ID` int(11) NOT NULL,
  `WorkerID` int(11) NOT NULL,
  `StartTime` time DEFAULT NULL,
  `CloseTime` time DEFAULT NULL,
  PRIMARY KEY (`ID`,`WorkerID`),
  KEY `WorkerID` (`WorkerID`),
  CONSTRAINT `Schedule_ibfk_1` FOREIGN KEY (`WorkerID`) REFERENCES `Worker` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Schedule_chk_1` CHECK (((`ID` > 0) and (`WorkerID` > 0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Schedule`
--

LOCK TABLES `Schedule` WRITE;
/*!40000 ALTER TABLE `Schedule` DISABLE KEYS */;
INSERT INTO `Schedule` VALUES (1,1,'08:00:00','10:00:00'),(2,2,'09:00:00','11:00:00'),(3,3,'10:00:00','12:00:00'),(4,4,'11:00:00','13:00:00'),(5,5,'12:00:00','14:00:00'),(6,7,'18:30:00','21:00:00'),(7,10,'13:00:00','14:00:00'),(8,6,'15:00:00','15:30:00'),(9,8,'17:00:00','18:00:00'),(10,9,'20:00:00','21:00:00');
/*!40000 ALTER TABLE `Schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SpecialRequest`
--

DROP TABLE IF EXISTS `SpecialRequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SpecialRequest` (
  `ID` int(11) NOT NULL,
  `Event` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Date` date NOT NULL,
  `Venue` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Requirement` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpecialRequest`
--

LOCK TABLES `SpecialRequest` WRITE;
/*!40000 ALTER TABLE `SpecialRequest` DISABLE KEYS */;
INSERT INTO `SpecialRequest` VALUES (1,'CB_Seminar','2020-02-03','A301','Cleaner,Electrician'),(2,'Odyssey','2020-02-05','Seminar','Cleaner'),(3,'RepublicDay','2020-01-26','OAT','Cleaner, Electrician');
/*!40000 ALTER TABLE `SpecialRequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Students` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RoomNo` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `HostelID` int(11) DEFAULT NULL,
  `ContactInfo` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `Hostel ID_idx` (`HostelID`),
  CONSTRAINT `Students_ibfk_1` FOREIGN KEY (`HostelID`) REFERENCES `Hostels` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Students_ibfk_2` FOREIGN KEY (`HostelID`) REFERENCES `Hostels` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Students_chk_1` CHECK ((`ID` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES (1,'San','101',1,'232'),(2,'Deep','101',1,'232'),(3,'Nit','102',1,'255'),(4,'Tin','102',1,'255'),(5,'Kin','103',2,'454'),(6,'Shuk','104',2,'455'),(7,'Arka','106',3,'456'),(8,'Nan','109',2,'886'),(9,'Desh','106',2,'989'),(10,'Tom','109',2,'211');
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supervisor`
--

DROP TABLE IF EXISTS `Supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Supervisor` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Contact` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  CONSTRAINT `Supervisor_chk_1` CHECK ((`ID` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supervisor`
--

LOCK TABLES `Supervisor` WRITE;
/*!40000 ALTER TABLE `Supervisor` DISABLE KEYS */;
INSERT INTO `Supervisor` VALUES (1,'Sanskar','101'),(2,'Avi','102'),(3,'Sunny','103'),(4,'Happy','104'),(5,'Lucky','105');
/*!40000 ALTER TABLE `Supervisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UnassignedRecord`
--

DROP TABLE IF EXISTS `UnassignedRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UnassignedRecord` (
  `ID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `OpenTime` time NOT NULL,
  `RequestType` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `StudentID` (`StudentID`),
  CONSTRAINT `UnassignedRecord_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Students` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `UnassignedRecord_chk_1` CHECK (((`RequestType` in (_utf8mb4'Cleaner',_utf8mb4'Carpenter',_utf8mb4'Electrician',_utf8mb4'Plumber')) and (`ID` > 0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UnassignedRecord`
--

LOCK TABLES `UnassignedRecord` WRITE;
/*!40000 ALTER TABLE `UnassignedRecord` DISABLE KEYS */;
INSERT INTO `UnassignedRecord` VALUES (1,3,'03:00:23','Cleaner'),(2,4,'12:00:59','Carpenter'),(3,9,'04:12:36','Electrician'),(4,5,'05:35:56','Plumber');
/*!40000 ALTER TABLE `UnassignedRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Worker`
--

DROP TABLE IF EXISTS `Worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Worker` (
  `ID` int(11) NOT NULL,
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Speciality` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `ContactInfo` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `SupervisorID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `SupervisorID` (`SupervisorID`),
  CONSTRAINT `Worker_ibfk_1` FOREIGN KEY (`SupervisorID`) REFERENCES `Supervisor` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Worker_chk_1` CHECK ((`Speciality` in (_utf8mb3'Cleaner',_utf8mb3'Electrician',_utf8mb3'Plumber',_utf8mb3'Carpenter',_utf8mb3'Painter'))),
  CONSTRAINT `Worker_chk_2` CHECK (((`Speciality` in (_utf8mb4'Cleaner',_utf8mb4'Electrician',_utf8mb4'Plumber',_utf8mb4'Carpenter',_utf8mb4'Painter')) and (`ID` > 0) and (`SupervisorID` > 0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Worker`
--

LOCK TABLES `Worker` WRITE;
/*!40000 ALTER TABLE `Worker` DISABLE KEYS */;
INSERT INTO `Worker` VALUES (1,'Swastik','Cleaner','12345',1),(2,'Navya','Electrician','23456',2),(3,'Nitin','Plumber','34567',3),(4,'Arka','Carpenter','45678',4),(5,'Kinshuk','Cleaner','56789',5),(6,'Rishabh','Painter','98990',2),(7,'Dhruv','Plumber','88605',4),(8,'Pratham','Carpenter','93129',1),(9,'Yash','Electrician','93503',1),(10,'Naman','Cleaner','55500',3);
/*!40000 ALTER TABLE `Worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'DBMS'
--

--
-- Dumping routines for database 'DBMS'
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

-- Dump completed on 2020-02-17  0:18:17
