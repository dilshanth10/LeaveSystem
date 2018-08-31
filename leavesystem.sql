CREATE DATABASE  IF NOT EXISTS `leavesystem` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `leavesystem`;
-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: leavesystem
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `available_day`
--

DROP TABLE IF EXISTS `available_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `available_day` (
  `user_id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `available_days` float NOT NULL,
  PRIMARY KEY (`user_id`,`leave_type_id`),
  KEY `fk_leavetype_availableday_idx` (`leave_type_id`),
  CONSTRAINT `fk_leavetype_availableday` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_type` (`leave_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `available_day`
--

LOCK TABLES `available_day` WRITE;
/*!40000 ALTER TABLE `available_day` DISABLE KEYS */;
INSERT INTO `available_day` VALUES (2,1,4),(2,2,6),(2,3,13);
/*!40000 ALTER TABLE `available_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_detail`
--

DROP TABLE IF EXISTS `leave_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `leave_detail` (
  `leave_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `leave_days` float NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` longtext NOT NULL,
  `leave_status_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`leave_id`),
  KEY `fk_user_leave_idx` (`user_id`),
  KEY `fk_leavetype_leave_idx` (`leave_type_id`),
  KEY `fk_leavestatus_leave_idx` (`leave_status_id`),
  CONSTRAINT `fk_leavestatus_leave` FOREIGN KEY (`leave_status_id`) REFERENCES `leave_status` (`leave_status_id`),
  CONSTRAINT `fk_leavetype_leave` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_type` (`leave_type_id`),
  CONSTRAINT `fk_user_leave` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_detail`
--

LOCK TABLES `leave_detail` WRITE;
/*!40000 ALTER TABLE `leave_detail` DISABLE KEYS */;
INSERT INTO `leave_detail` VALUES (18,2,3,1,'2018-09-01','2018-09-01','Medical Checkup',2),(19,2,1,2,'2018-09-02','2018-09-03','Wedding',3),(20,2,2,5,'2018-09-12','2018-09-16','Trip with friends',1),(21,2,2,3,'2018-10-10','2018-10-12','Temple Festival',1),(22,2,1,1,'2018-10-31','2018-10-31','Go to the airport to pick up someone',1);
/*!40000 ALTER TABLE `leave_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_status`
--

DROP TABLE IF EXISTS `leave_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `leave_status` (
  `leave_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `leave_status` varchar(45) NOT NULL,
  PRIMARY KEY (`leave_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_status`
--

LOCK TABLES `leave_status` WRITE;
/*!40000 ALTER TABLE `leave_status` DISABLE KEYS */;
INSERT INTO `leave_status` VALUES (1,'Applied'),(2,'Approved'),(3,'Rejected');
/*!40000 ALTER TABLE `leave_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_type`
--

DROP TABLE IF EXISTS `leave_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `leave_type` (
  `leave_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `leave_type` varchar(45) NOT NULL,
  `allocation_period` float NOT NULL,
  PRIMARY KEY (`leave_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_type`
--

LOCK TABLES `leave_type` WRITE;
/*!40000 ALTER TABLE `leave_type` DISABLE KEYS */;
INSERT INTO `leave_type` VALUES (1,'Casual',7),(2,'Annual',14),(3,'Medical',14);
/*!40000 ALTER TABLE `leave_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Manager'),(2,'Employee');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name_UNIQUE` (`username`),
  KEY `fk_role_user_idx` (`role_id`),
  CONSTRAINT `fk_role_user` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin','admin@mail.com',1),(2,'dilshanth','12345','dilshanth@mail.com',2);
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

-- Dump completed on 2018-08-31 13:41:01
