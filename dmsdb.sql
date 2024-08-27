-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: dms
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `branch_master`
--

DROP TABLE IF EXISTS `branch_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch_master` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Address` varchar(1023) CHARACTER SET cp1250 COLLATE cp1250_general_ci NOT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_master`
--

LOCK TABLES `branch_master` WRITE;
/*!40000 ALTER TABLE `branch_master` DISABLE KEYS */;
INSERT INTO `branch_master` VALUES (1,'Noida office','Singapore ','2023-07-01 00:00:00','2024-07-16 10:04:25'),(4,'Banglore office','Sector 30 ,Banglore','2024-07-15 10:48:02','2024-07-16 06:17:26'),(5,'gurgoan office','Sector 29 ,Gurgoan','2024-07-15 11:13:46','2024-07-15 11:13:46'),(6,'Noida office','Sector 22 ,Noida','2024-07-15 11:21:56','2024-07-16 06:18:24'),(7,'America office','block-c 29 ,London','2024-07-16 11:09:02','2024-07-16 11:09:02');
/*!40000 ALTER TABLE `branch_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_master`
--

DROP TABLE IF EXISTS `category_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_master`
--

LOCK TABLES `category_master` WRITE;
/*!40000 ALTER TABLE `category_master` DISABLE KEYS */;
INSERT INTO `category_master` VALUES (1,'Mobile','2024-07-16 13:19:43','2024-07-16 13:19:43'),(2,'Led Tv','2024-07-16 13:43:50','2024-07-16 13:43:50'),(3,'Washing Machine','2024-07-16 13:44:14','2024-07-16 15:52:59'),(8,'Speaker','2024-07-16 16:39:25','2024-07-16 16:39:25');
/*!40000 ALTER TABLE `category_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department_master`
--

DROP TABLE IF EXISTS `department_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department_master` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `branch_Master_Id` int NOT NULL,
  `created_On` datetime DEFAULT NULL,
  `updated_On` datetime DEFAULT NULL,
  `is_Active` int DEFAULT NULL,
  PRIMARY KEY (`Id`,`branch_Master_Id`),
  KEY `fk_department_master_branch_Master_idx` (`branch_Master_Id`),
  CONSTRAINT `fk_department_master_branch_Master` FOREIGN KEY (`branch_Master_Id`) REFERENCES `branch_master` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_master`
--

LOCK TABLES `department_master` WRITE;
/*!40000 ALTER TABLE `department_master` DISABLE KEYS */;
INSERT INTO `department_master` VALUES (1,'Sales',4,'2024-07-18 14:59:37','2024-07-23 12:40:35',1),(6,'IT Department',5,'2024-07-23 12:32:00','2024-07-23 12:32:00',1),(7,'IT Department',7,'2024-07-24 21:06:06','2024-07-24 21:06:06',1),(8,'HR Department',6,'2024-07-24 21:06:06','2024-07-24 21:06:06',1);
/*!40000 ALTER TABLE `department_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_details`
--

DROP TABLE IF EXISTS `document_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `path` varchar(1024) NOT NULL,
  `created_On` datetime DEFAULT NULL,
  `updated_On` datetime DEFAULT NULL,
  `document_header_id` int NOT NULL,
  `document_header_category_master_id` int NOT NULL,
  `document_header_year_master_id` int NOT NULL,
  `document_header_type_master_id` int NOT NULL,
  `document_header_Employee_id` int NOT NULL,
  `document_header_Employee_department_master_Id` int NOT NULL,
  `document_header_Employee_department_master_branch_Master_Id` int NOT NULL,
  PRIMARY KEY (`id`,`document_header_id`,`document_header_category_master_id`,`document_header_year_master_id`,`document_header_type_master_id`,`document_header_Employee_id`,`document_header_Employee_department_master_Id`,`document_header_Employee_department_master_branch_Master_Id`),
  KEY `fk_document_details_document_header1_idx` (`document_header_id`,`document_header_category_master_id`,`document_header_year_master_id`,`document_header_type_master_id`,`document_header_Employee_id`,`document_header_Employee_department_master_Id`,`document_header_Employee_department_master_branch_Master_Id`),
  CONSTRAINT `fk_document_details_document_header1` FOREIGN KEY (`document_header_id`, `document_header_category_master_id`, `document_header_year_master_id`, `document_header_type_master_id`, `document_header_Employee_id`, `document_header_Employee_department_master_Id`, `document_header_Employee_department_master_branch_Master_Id`) REFERENCES `document_header` (`id`, `category_master_id`, `year_master_id`, `type_master_id`, `Employee_id`, `Employee_department_master_Id`, `Employee_department_master_branch_Master_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_details`
--

LOCK TABLES `document_details` WRITE;
/*!40000 ALTER TABLE `document_details` DISABLE KEYS */;
INSERT INTO `document_details` VALUES (1,'images/\\7eb4228c-d4d4-4e4b-a6ba-16328ca5881d.png','2024-07-29 16:58:30','2024-07-29 16:58:30',10,1,1,2,6,1,4),(2,'images/\\6f533549-24c1-4c39-b146-25546b41d62b.png','2024-07-29 16:59:36','2024-07-29 16:59:36',11,1,1,2,6,1,4),(3,'images/\\8189c6ef-8309-4771-9b1b-20ea56474f9b.png','2024-07-29 17:00:11','2024-07-29 17:00:11',12,1,1,2,6,1,4),(4,'images/\\46c5439e-2639-4163-9e2b-4c0eb511bb0d.png','2024-07-29 17:00:27','2024-07-29 17:00:27',13,1,1,2,6,1,4);
/*!40000 ALTER TABLE `document_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_header`
--

DROP TABLE IF EXISTS `document_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_header` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `File_no` varchar(45) DEFAULT NULL,
  `subject` varchar(45) DEFAULT NULL,
  `version` varchar(45) DEFAULT NULL,
  `created_On` datetime DEFAULT NULL,
  `updated_On` datetime DEFAULT NULL,
  `category_master_id` int NOT NULL,
  `year_master_id` int NOT NULL,
  `type_master_id` int NOT NULL,
  `Employee_id` int NOT NULL,
  `Employee_department_master_Id` int NOT NULL,
  `Employee_department_master_branch_Master_Id` int NOT NULL,
  `is_approved` int DEFAULT NULL,
  PRIMARY KEY (`id`,`category_master_id`,`year_master_id`,`type_master_id`,`Employee_id`,`Employee_department_master_Id`,`Employee_department_master_branch_Master_Id`),
  KEY `fk_document_header_category_master1_idx` (`category_master_id`),
  KEY `fk_document_header_year_master1_idx` (`year_master_id`),
  KEY `fk_document_header_Employee1_idx` (`Employee_id`,`Employee_department_master_Id`,`Employee_department_master_branch_Master_Id`),
  CONSTRAINT `fk_document_header_category_master1` FOREIGN KEY (`category_master_id`) REFERENCES `category_master` (`id`),
  CONSTRAINT `fk_document_header_Employee1` FOREIGN KEY (`Employee_id`, `Employee_department_master_Id`, `Employee_department_master_branch_Master_Id`) REFERENCES `employee` (`id`, `department_master_Id`, `department_master_branch_Master_Id`),
  CONSTRAINT `fk_document_header_year_master1` FOREIGN KEY (`year_master_id`) REFERENCES `year_master` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_header`
--

LOCK TABLES `document_header` WRITE;
/*!40000 ALTER TABLE `document_header` DISABLE KEYS */;
INSERT INTO `document_header` VALUES (3,'Document Title','12345','Document Subject','1.0','2024-07-25 15:30:00','2024-08-05 15:11:01',1,2,2,6,1,4,1),(6,'Document Title2','4574',' Subject','2.0','2024-07-25 15:30:00','2024-07-25 15:30:00',1,5,2,6,1,4,1),(7,'Document Title2','4574',' Subject','2.0','2024-07-25 15:30:00','2024-07-25 15:30:00',1,5,2,6,1,4,0),(8,'Sample Document','12345','Test Subject','1.0','2024-07-29 16:44:20','2024-07-29 16:44:20',1,1,2,6,1,4,1),(9,'Sample Document','12345','Test Subject','1.0','2024-07-29 16:55:58','2024-07-29 16:55:58',1,1,2,6,1,4,1),(10,'Sample Document','12345','Test Subject','1.0','2024-07-29 16:58:30','2024-07-29 16:58:30',1,1,2,6,1,4,1),(11,'Sample Document','12345','Test Subject','1.0','2024-07-29 16:59:36','2024-07-29 16:59:36',1,1,2,6,1,4,1),(12,'Sample Document','12345','Test Subject','1.0','2024-07-29 17:00:11','2024-07-29 17:00:11',1,1,2,6,1,4,1),(13,'Sample Document','12345','Test Subject','1.0','2024-07-29 17:00:27','2024-07-29 17:00:27',1,1,2,6,1,4,1);
/*!40000 ALTER TABLE `document_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `Employee_Id` varchar(45) DEFAULT NULL,
  `password` varchar(64) NOT NULL,
  `mobile` varchar(14) NOT NULL,
  `email` varchar(100) NOT NULL,
  `department_master_Id` int NOT NULL,
  `department_master_branch_Master_Id` int NOT NULL,
  `is_Active` int NOT NULL,
  `otp` int DEFAULT NULL,
  `created_On` datetime DEFAULT NULL,
  `updated_On` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`department_master_Id`,`department_master_branch_Master_Id`),
  KEY `fk_Employee_department_master1_idx` (`department_master_Id`,`department_master_branch_Master_Id`),
  CONSTRAINT `fk_Employee_department_master1` FOREIGN KEY (`department_master_Id`, `department_master_branch_Master_Id`) REFERENCES `department_master` (`Id`, `branch_Master_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (6,'Alex Johnson','E003','8d23cf6c86e834a7aa6eded54c26ce2bb2e74903538c61bdd5d2197997ab2f72','1234567890','employee3@example.com',1,4,1,1234,'2024-07-23 14:31:25','2024-07-23 14:31:25'),(7,'Alex Johnson','E003','8d23cf6c86e834a7aa6eded54c26ce2bb2e74903538c61bdd5d2197997ab2f72','1234567890','employee3@example.com',1,4,1,1234,'2024-07-24 21:35:08','2024-07-24 21:35:08'),(8,'Alex Johnson','E003','8d23cf6c86e834a7aa6eded54c26ce2bb2e74903538c61bdd5d2197997ab2f72','1234567890','employee3@example.com',1,4,1,1234,'2024-07-25 12:04:54','2024-07-25 12:04:54'),(9,'kishor kumar','E001','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','9267947961','kishork644@gmail.com',7,7,1,1234,'2024-07-25 12:04:54','2024-07-25 12:04:54'),(16,'Kishor','E001','$2a$10$mIDvv5q3F2j.a23JCcTdWeb.qGfNCaYS9iQ65OsPUkPgo2t6vVmsW','1234567890','kishor@gmail.com',6,5,1,1234,'2024-08-02 20:56:07','2024-08-02 20:56:07'),(17,'naveeen upadhyay','E003','$2a$10$YzWIk2V3bgdBDaDJJ4GPPu38hZOtvlkbzX8ATnFC3WhGLfLDNf7AK','1234567890','naveen@gmail.com',6,5,1,1234,'2024-08-02 22:14:01','2024-08-02 22:14:01'),(18,'naveeen upadhyay','E003','$2a$10$Rc.Xq8FNeYE8DVSuFIX90er6TuQiJHzCIVdzWBc0sKEYjvIPW9rCi','1234567890','naveen@gmail.com',6,5,1,1234,'2024-08-02 22:14:47','2024-08-02 22:14:47'),(19,'naveeen upadhyay','E003','$2a$10$2xEU7W5xdioVwTqKUDZXbeGAcewCWSouPpoMQdrqWQnDREIaveoVm','1234567890','naveen@gmail.com',6,5,1,1234,'2024-08-02 22:17:26','2024-08-02 22:17:26'),(20,'naveeen upadhyay','E003','$2a$10$HJcmwSX/Hs2s3hhm.Wq62epo3ZTn3mI1QlOffGBXp6VeDfJJPEM7m','1234567890','naveen@gmail.com',6,5,1,1234,'2024-08-02 22:19:44','2024-08-02 22:19:44'),(21,'naveeen upadhyay','E003','$2a$10$zW.EwJ/TPUqst8JAbH.1..2nFM1k9sP/Xkav5iEtlF8zcfbO5O47q','1234567890','naveen@gmail.com',6,5,1,1234,'2024-08-02 22:19:45','2024-08-02 22:19:45'),(22,'naveeen upadhyay','E003','$2a$10$Q9wAJxUevvlbpRLguzaRUeS6qxpxWBRwH4O1nrvowkoB/O9dUgZDG','1234567890','naveen@gmail.com',6,5,1,1234,'2024-08-02 22:22:40','2024-08-02 22:22:40'),(23,'naveeen upadhyay','E003','$2a$10$nPpfO/ktAcuiobY/O0RwGe.OUzTn6TYMpYfB3PgiuveYAlJ6dTyt6','1234567890','naveen@gmail.com',6,5,1,1234,'2024-08-02 22:23:30','2024-08-02 22:23:30'),(24,'naveeen upadhyay','E003','$2a$10$V5RFxMxhdIDcrq4suheI3.yAt2qL6aCIrYe/Iijam8XrmeAC9OKuC','1234567890','naveen@gmail.com',6,5,1,1234,'2024-08-02 22:26:11','2024-08-02 22:26:11'),(32,'manish tomar','E004','$2a$10$g5TfMycnp4FTxth.MrkYbeCTBY4WAZg/hvG9ACst66cSmhcmnqGlq','7210210035','manish@gmail.com',6,5,1,1234,'2024-08-05 16:01:28','2024-08-05 16:01:28'),(33,'manish tomar','E004','$2a$10$3c3ptYXLAQnb0UvQS//AAOhaeDgoAyCCkeE5x6P.vMRXrkgm3sbw6','1234567890','manish@gmail.com',6,5,1,1234,'2024-08-05 16:28:49','2024-08-05 16:28:49'),(34,'manish tomar','E004','$2a$10$jMK3Jm/7nS.EKOrXxhwleu.oxOv4nuFA6rFqMuSu1Yyv2ln8jW5C6','1234567890','manish@gmail.com',6,5,1,1234,'2024-08-05 16:29:21','2024-08-05 16:29:21'),(35,'manish tomar','E004','$2a$10$sSg4G0FOWCmPCI4d6ftry.snaq6SyUOpcBIWmk2agvgH05GVoa6GW','1234567890','manish@gmail.com',6,5,1,1234,'2024-08-05 16:30:35','2024-08-05 16:30:35'),(36,'manish tomar','E004','$2a$10$IgKX0.TffSpLhi9wb.t5SuP3g.F0SI7k02Jt2SjQEW2VI09rxSVx.','1234567890','manish@gmail.com',6,5,1,1234,'2024-08-05 17:21:38','2024-08-05 17:21:38'),(38,'manish tomar','E004','$2a$10$MtWsJlExp.YL5Nh9n7cDbe3AXQGgr8T8U2fG.owIcIdnmqpqa9pCu','1234567890','manish@gmail.com',6,5,1,1234,'2024-08-05 17:27:59','2024-08-05 17:27:59'),(39,'manish tomar','E004','$2a$10$BJ9G0TXvfHnljGpjIfaxze5whro.tPkd.VpRPKbUYM1KYy8fYGN7m','1234567890','manish@gmail.com',6,5,1,1234,'2024-08-05 17:29:58','2024-08-05 17:29:58'),(40,'manish tomar','E004','$2a$10$I3FmZtWVR/kZcQwbLGb7q.R/bNURKLNK4oZ8f7fehsbkEnlNSOt0K','1234567890','manish@gmail.com',6,5,1,1234,'2024-08-05 17:32:27','2024-08-05 17:32:27'),(41,'manish tomar','E004','$2a$10$qyLwCnnFdPJl0q89czMoR.WUoyeMMlnXbN1NtSWZD33WyS1qgUzea','1234567890','manish@gmail.com',6,5,1,1234,'2024-08-05 17:34:38','2024-08-05 17:34:38'),(42,'manish tomar','E004','$2a$10$32CHxeqv2tIkZT0wLDMHN.Tqqa7arpE6OUx1XToHvlaid0Zcn38H2','1234567890','manish@gmail.com',6,5,1,1234,'2024-08-06 08:19:19','2024-08-06 08:19:19'),(43,'manish tomar','E004','$2a$10$UKv90.kuquh.hgWtVi10s.Y7yJq.egLgGjKQmecGCGS4SixNdSmgi','1234567890','manish@gmail.com',6,5,1,1234,'2024-08-06 08:28:15','2024-08-06 08:28:15'),(44,'manish tomar','E004','$2a$10$6XzKqQOEmE4ABzJzm.h9/.W9C4Tax7pXkoRZKRRaC7/8rUpOkuCmC','1234567890','manish@gmail.com',6,5,1,1234,'2024-08-06 08:31:24','2024-08-06 08:31:24'),(45,'manish tomar','E004','$2a$10$/IOtFZ5bvs7ezs1rfxHl2.ZTgTL4SuewaFcqMAQ0P95IC5qbWQ5q.','1234567890','manish@gmail.com',6,5,1,1234,'2024-08-06 09:01:05','2024-08-06 09:01:05'),(46,'manish tomar','E004','$2a$10$MQaeSrUhGxvAhsSLLOf.NO56CdYxF67.ESE56aU01FxmQmPVB7TGK','1234567890','manish@gmail.com',6,5,1,1234,'2024-08-06 09:11:33','2024-08-06 09:11:33'),(47,'manish tomar','E004','$2a$10$koR7l2LVc6oSHN.c3HZlDexrtFRr9XyNB4TBgcosz9u.54nMbktN6','1234567890','manish@gmail.com',6,5,1,1234,'2024-08-06 09:12:52','2024-08-06 09:12:52'),(48,'manish tomar','E004','$2a$10$UDeUr3RGF0Xza/7tdnK.4uEGSN3N/FBMl2PsCRhNHB2xrkyOitXQ6','1234567890','manish@gmail.com',6,5,1,1234,'2024-08-06 09:37:01','2024-08-06 09:37:01');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_has_role_master`
--

DROP TABLE IF EXISTS `employee_has_role_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_has_role_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `Employee_department_master_Id` int NOT NULL,
  `Employee_department_master_branch_Master_Id` int NOT NULL,
  `role_master_id` int NOT NULL,
  PRIMARY KEY (`id`,`employee_id`,`Employee_department_master_Id`,`Employee_department_master_branch_Master_Id`,`role_master_id`),
  KEY `fk_Employee_has_role_master_role_master1_idx` (`role_master_id`),
  KEY `fk_Employee_has_role_master_Employee1_idx` (`employee_id`,`Employee_department_master_Id`,`Employee_department_master_branch_Master_Id`),
  CONSTRAINT `fk_Employee_has_role_master_Employee1` FOREIGN KEY (`employee_id`, `Employee_department_master_Id`, `Employee_department_master_branch_Master_Id`) REFERENCES `employee` (`id`, `department_master_Id`, `department_master_branch_Master_Id`),
  CONSTRAINT `fk_Employee_has_role_master_role_master1` FOREIGN KEY (`role_master_id`) REFERENCES `role_master` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_has_role_master`
--

LOCK TABLES `employee_has_role_master` WRITE;
/*!40000 ALTER TABLE `employee_has_role_master` DISABLE KEYS */;
INSERT INTO `employee_has_role_master` VALUES (2,46,6,5,4),(3,47,6,5,4),(4,48,6,5,4),(1,9,7,7,5);
/*!40000 ALTER TABLE `employee_has_role_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_roles`
--

DROP TABLE IF EXISTS `employee_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_roles` (
  `employee_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`employee_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `employee_roles_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `employee_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_roles`
--

LOCK TABLES `employee_roles` WRITE;
/*!40000 ALTER TABLE `employee_roles` DISABLE KEYS */;
INSERT INTO `employee_roles` VALUES (16,4),(17,4),(18,4),(19,4),(20,4),(21,4),(22,4),(23,4),(24,4),(32,4),(33,4),(34,4),(35,4),(36,4),(38,4),(39,4),(40,4),(41,4),(42,4),(43,4),(44,4),(45,4),(46,4),(47,4),(48,4);
/*!40000 ALTER TABLE `employee_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_master`
--

DROP TABLE IF EXISTS `role_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL,
  `is_Active` int NOT NULL,
  `created_On` datetime DEFAULT NULL,
  `updated_On` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_master`
--

LOCK TABLES `role_master` WRITE;
/*!40000 ALTER TABLE `role_master` DISABLE KEYS */;
INSERT INTO `role_master` VALUES (4,'User',0,'2024-08-06 09:37:01','2024-08-06 09:37:01'),(5,'System Admin',1,'2024-07-18 14:14:45','2024-07-31 13:26:45'),(6,'Hr',1,'2024-07-18 14:14:45','2024-07-31 13:26:45');
/*!40000 ALTER TABLE `role_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_master`
--

DROP TABLE IF EXISTS `type_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `updated_On` datetime DEFAULT NULL,
  `created_On` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_master`
--

LOCK TABLES `type_master` WRITE;
/*!40000 ALTER TABLE `type_master` DISABLE KEYS */;
INSERT INTO `type_master` VALUES (2,'msword','2024-07-16 17:17:20','2024-07-16 17:17:20');
/*!40000 ALTER TABLE `type_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `year_master`
--

DROP TABLE IF EXISTS `year_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `year_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `created_On` datetime DEFAULT NULL,
  `updated_On` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `year_master`
--

LOCK TABLES `year_master` WRITE;
/*!40000 ALTER TABLE `year_master` DISABLE KEYS */;
INSERT INTO `year_master` VALUES (1,'2019-2020','2024-07-16 15:28:39','2024-07-16 15:28:39'),(2,'2020-2021','2024-07-16 15:23:49','2024-07-16 15:23:49'),(3,'2021-2022','2024-07-16 15:33:14','2024-07-16 15:45:47'),(5,'2023-2024','2024-07-16 16:39:53','2024-07-16 16:39:53');
/*!40000 ALTER TABLE `year_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dms'
--

--
-- Dumping routines for database 'dms'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-07  7:19:27
