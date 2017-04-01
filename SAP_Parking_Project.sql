-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: parkingdb
-- ------------------------------------------------------
-- Server version	5.7.15-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `parkme`
--

DROP TABLE IF EXISTS `parkme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parkme` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `parkingNumber` int(5) DEFAULT NULL,
  `carNumber` int(5) DEFAULT NULL,
  `TypeId` int(11) NOT NULL,
  `inTime` datetime DEFAULT NULL,
  `outTime` datetime DEFAULT NULL,
  `Price` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `parkingtype_idx` (`TypeId`),
  CONSTRAINT `parkingtype` FOREIGN KEY (`TypeId`) REFERENCES `slottype` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parkme`
--

LOCK TABLES `parkme` WRITE;
/*!40000 ALTER TABLE `parkme` DISABLE KEYS */;
INSERT INTO `parkme` VALUES (10,23082,12345,10,'2017-03-23 00:00:00','2017-03-23 08:44:04','160'),(14,16227,12343,12,'2017-03-23 10:02:51',NULL,NULL),(15,25084,34542,10,'2017-03-23 10:25:32',NULL,NULL),(16,20238,34534,10,'2017-03-23 10:26:19',NULL,NULL),(17,16593,45345,10,'2017-03-23 10:27:17',NULL,NULL),(18,27584,34544,10,'2017-03-23 10:27:55',NULL,NULL),(19,22249,34334,10,'2017-03-23 10:28:38',NULL,NULL),(23,18770,22222,11,'2017-03-23 11:37:34',NULL,NULL);
/*!40000 ALTER TABLE `parkme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parkmehistory`
--

DROP TABLE IF EXISTS `parkmehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parkmehistory` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `parkingNumber` int(5) DEFAULT NULL,
  `carNumber` int(5) DEFAULT NULL,
  `TypeId` int(11) NOT NULL,
  `inTime` datetime DEFAULT NULL,
  `outTime` datetime DEFAULT NULL,
  `Price` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `parkingtype_idx` (`TypeId`),
  CONSTRAINT `parkinghtype` FOREIGN KEY (`TypeId`) REFERENCES `slottype` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parkmehistory`
--

LOCK TABLES `parkmehistory` WRITE;
/*!40000 ALTER TABLE `parkmehistory` DISABLE KEYS */;
INSERT INTO `parkmehistory` VALUES (11,12899,12343,10,'2017-03-23 09:49:08','2017-03-23 10:00:51','0'),(12,26240,12356,11,'2017-03-23 07:16:27','2017-03-23 10:01:34','60'),(14,27401,12333,11,'2017-03-23 07:45:47','2017-03-23 12:06:11','120');
/*!40000 ALTER TABLE `parkmehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slottype`
--

DROP TABLE IF EXISTS `slottype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slottype` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) DEFAULT NULL,
  `SpceCapacity` varchar(45) DEFAULT NULL,
  `PricePerHr` int(5) DEFAULT NULL,
  `stamp_created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `stamp_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slottype`
--

LOCK TABLES `slottype` WRITE;
/*!40000 ALTER TABLE `slottype` DISABLE KEYS */;
INSERT INTO `slottype` VALUES (10,'Small','8',20,'2017-03-23 10:53:21','2017-03-23 14:56:42'),(11,'Medium','10',30,'2017-03-23 10:53:21','2017-03-23 11:44:35'),(12,'Large','2',40,'2017-03-23 10:53:21','2017-03-23 10:54:44');
/*!40000 ALTER TABLE `slottype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-23 12:12:22
