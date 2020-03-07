CREATE DATABASE  IF NOT EXISTS `dbms` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `dbms`;
-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: itissandeep.mysql.database.azure.com    Database: dbms
-- ------------------------------------------------------
-- Server version	5.6.42.0

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
  `ID` int(11) NOT NULL,
  `Status` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `RoomNum` int(11) DEFAULT NULL,
  `Timing` time DEFAULT NULL,
  `WorkerID` int(11) DEFAULT NULL,
  `RequestType` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allrecord`
--

LOCK TABLES `allrecord` WRITE;
/*!40000 ALTER TABLE `allrecord` DISABLE KEYS */;
INSERT INTO `allrecord` VALUES (11,'Close',2,'01:00:12',4,'Carpenter'),(12,'Close',3,'12:00:12',4,'Carpenter'),(13,'Close',4,'02:00:21',4,'Carpenter'),(14,'Close',5,'11:00:12',5,'Cleaner'),(15,'Close',1,'10:00:29',5,'Cleaner'),(16,'Open',5,'09:18:57',5,'Cleaner'),(17,'Open',6,'08:00:09',9,'Electrician'),(18,'Unassigned',7,'07:47:10',9,'Electrician'),(19,'Unassigned',8,'05:00:56',3,'Plumber');
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
  `isResidence` int(11) DEFAULT NULL,
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
-- Table structure for table `closedrecord`
--

DROP TABLE IF EXISTS `closedrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `closedrecord` (
  `ID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `WorkerID` int(11) DEFAULT NULL,
  `starttime` timestamp NULL DEFAULT NULL,
  `ClosedTime` timestamp NULL DEFAULT NULL,
  `RequestType` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `StudentID` (`StudentID`),
  KEY `WorkerID` (`WorkerID`),
  CONSTRAINT `ClosedRecord_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ClosedRecord_ibfk_2` FOREIGN KEY (`WorkerID`) REFERENCES `worker` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `closedrecord`
--

LOCK TABLES `closedrecord` WRITE;
/*!40000 ALTER TABLE `closedrecord` DISABLE KEYS */;
INSERT INTO `closedrecord` VALUES (6,4,1,'2020-02-29 14:45:00','2020-03-01 03:17:48','Cleaner'),(11,3,4,'2020-02-29 00:00:00','2020-02-29 11:40:00','Carpenter'),(12,7,2,'2020-02-29 00:00:00','2020-02-29 11:50:00','Electrician'),(14,2,1,'2020-02-29 00:00:00','2020-02-29 12:10:00','Cleaner'),(15,1,3,'2020-02-29 00:00:00','2020-02-29 12:25:00','Plumber'),(16,4,5,'2020-02-29 00:00:00','2020-02-29 02:49:55','Cleaner'),(17,6,8,'2020-02-29 00:00:00','2020-02-29 06:53:33','Carpenter'),(18,9,10,'2020-02-29 00:00:00','2020-02-29 02:00:00','Cleaner'),(19,7,6,'2020-02-29 00:00:00','2020-02-29 11:00:56','Plumber'),(20,1,1,'2020-02-29 12:00:00','2020-03-01 17:22:44','Cleaner');
/*!40000 ALTER TABLE `closedrecord` ENABLE KEYS */;
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
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `ID` int(11) NOT NULL,
  `Name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ScheduleID` int(11) DEFAULT NULL,
  `Contact` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `ID` int(11) NOT NULL,
  `NumOfRoom` int(11) DEFAULT NULL,
  `NumOfFloor` int(11) DEFAULT NULL,
  `SupervisorID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `SupervisorID` (`SupervisorID`),
  CONSTRAINT `Hostels_ibfk_1` FOREIGN KEY (`SupervisorID`) REFERENCES `supervisor` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
-- Table structure for table `openrecord`
--

DROP TABLE IF EXISTS `openrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `openrecord` (
  `ID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `WorkerID` int(11) DEFAULT NULL,
  `starttime` timestamp NULL DEFAULT NULL,
  `RequestType` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `WorkerID` (`WorkerID`),
  KEY `StudentID` (`StudentID`),
  CONSTRAINT `OpenRecord_ibfk_1` FOREIGN KEY (`WorkerID`) REFERENCES `worker` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `OpenRecord_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `students` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openrecord`
--

LOCK TABLES `openrecord` WRITE;
/*!40000 ALTER TABLE `openrecord` DISABLE KEYS */;
INSERT INTO `openrecord` VALUES (1,2,2,'2020-02-29 13:40:00','Electrician'),(7,1,5,'2020-02-29 12:00:00','Cleaner'),(8,7,3,'2020-02-29 04:45:00','Plumber'),(9,3,2,'2020-02-29 06:10:00','Electrician'),(10,5,5,'2020-02-29 06:30:00','Cleaner'),(21,6,4,'2020-02-29 06:45:00','Carpenter');
/*!40000 ALTER TABLE `openrecord` ENABLE KEYS */;
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
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ReviewerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `Reviews_ibfk_1` (`WorkerID`),
  CONSTRAINT `Reviews_ibfk_1` FOREIGN KEY (`WorkerID`) REFERENCES `worker` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `ID` int(11) NOT NULL,
  `HostelID` int(11) NOT NULL,
  `Student1ID` int(11) DEFAULT NULL,
  `Student2ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`,`HostelID`),
  UNIQUE KEY `RoomID_UNIQUE` (`ID`),
  KEY `Hostel ID_idx` (`HostelID`),
  CONSTRAINT `Hostel ID` FOREIGN KEY (`HostelID`) REFERENCES `students` (`HostelID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `ID` int(11) NOT NULL,
  `WorkerID` int(11) NOT NULL,
  `starttime` timestamp NULL DEFAULT NULL,
  `closetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`,`WorkerID`),
  KEY `WorkerID` (`WorkerID`),
  CONSTRAINT `Schedule_ibfk_1` FOREIGN KEY (`WorkerID`) REFERENCES `worker` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `ID` int(11) NOT NULL,
  `Event` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Date` date NOT NULL,
  `Venue` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Requirement` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `ID` int(11) NOT NULL,
  `Name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `RoomNo` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `HostelID` int(11) DEFAULT NULL,
  `ContactInfo` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `Hostel ID_idx` (`HostelID`),
  CONSTRAINT `Students_ibfk_1` FOREIGN KEY (`HostelID`) REFERENCES `hostels` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Students_ibfk_2` FOREIGN KEY (`HostelID`) REFERENCES `hostels` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `ID` int(11) NOT NULL,
  `Name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Contact` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
-- Table structure for table `unassignedrecord`
--

DROP TABLE IF EXISTS `unassignedrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unassignedrecord` (
  `ID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `opentime` timestamp NULL DEFAULT NULL,
  `RequestType` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `StudentID` (`StudentID`),
  CONSTRAINT `UnassignedRecord_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unassignedrecord`
--

LOCK TABLES `unassignedrecord` WRITE;
/*!40000 ALTER TABLE `unassignedrecord` DISABLE KEYS */;
INSERT INTO `unassignedrecord` VALUES (2,4,'2020-02-29 12:00:59','Carpenter'),(3,9,'2020-02-29 04:12:36','Electrician'),(4,5,'2020-02-29 05:35:56','Plumber'),(5,3,'2020-02-29 03:00:23','Cleaner');
/*!40000 ALTER TABLE `unassignedrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker` (
  `ID` int(11) NOT NULL,
  `Name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Speciality` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ContactInfo` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SupervisorID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `SupervisorID` (`SupervisorID`),
  CONSTRAINT `Worker_ibfk_1` FOREIGN KEY (`SupervisorID`) REFERENCES `supervisor` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES (1,'swastik','Cleaner','12345',1),(2,'Navya','Electrician','23456',2),(3,'Nitin','Plumber','34567',3),(4,'Arka','Carpenter','45678',4),(5,'Kinshuk','Cleaner','56789',5),(6,'Rishabh','Painter','98990',2),(7,'Dhruv','Plumber','88605',4),(8,'Pratham','Carpenter','93129',1),(9,'Yash','Electrician','93503',1),(10,'Naman','Cleaner','55500',3);
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

-- Dump completed on 2020-03-06  5:22:28
