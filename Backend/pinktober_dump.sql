-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: 57.153.208.247    Database: pinktober
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.24.04.2

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `adminID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(18) DEFAULT NULL,
  `personID` int DEFAULT NULL,
  PRIMARY KEY (`adminID`),
  UNIQUE KEY `admin_unique` (`username`),
  KEY `admin_person_FK` (`personID`),
  CONSTRAINT `admin_person_FK` FOREIGN KEY (`personID`) REFERENCES `person` (`personID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin1','adminpass1',4),(2,'admin2','adminpass2',6);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dossierMED`
--

DROP TABLE IF EXISTS `dossierMED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dossierMED` (
  `dossierID` int NOT NULL AUTO_INCREMENT,
  `patientID` int DEFAULT NULL,
  PRIMARY KEY (`dossierID`),
  KEY `dossierMED_patient_FK` (`patientID`),
  CONSTRAINT `dossierMED_patient_FK` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dossierMED`
--

LOCK TABLES `dossierMED` WRITE;
/*!40000 ALTER TABLE `dossierMED` DISABLE KEYS */;
INSERT INTO `dossierMED` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8);
/*!40000 ALTER TABLE `dossierMED` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam` (
  `examID` int NOT NULL AUTO_INCREMENT,
  `datetime` datetime DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `feedback` varchar(100) DEFAULT NULL,
  `dossierID` int DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`examID`),
  KEY `exam_dossierMED_FK` (`dossierID`),
  CONSTRAINT `exam_dossierMED_FK` FOREIGN KEY (`dossierID`) REFERENCES `dossierMED` (`dossierID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (1,'2023-10-01 09:00:00',NULL,'Pending',NULL,1,NULL),(2,'2023-10-15 10:00:00',NULL,'Completed','No anomalies detected',1,NULL),(3,'2023-10-05 11:00:00',NULL,'Completed','Recommendation for further tests',2,NULL),(4,'2023-10-20 14:00:00',NULL,'Scheduled',NULL,2,NULL),(5,'2023-10-08 09:30:00',NULL,'Completed','Benign cyst found',3,NULL),(6,'2023-10-22 10:30:00',NULL,'Scheduled',NULL,3,NULL),(7,'2023-10-12 08:45:00',NULL,'Pending',NULL,4,NULL),(8,'2023-10-25 09:15:00',NULL,'Scheduled',NULL,4,NULL),(9,'2023-10-14 11:15:00',NULL,'Completed','Further examination required',5,NULL),(10,'2023-10-28 15:00:00',NULL,'Scheduled',NULL,5,NULL),(11,'2023-10-18 10:00:00',NULL,'Completed','Healthy tissue observed',6,NULL),(12,'2023-10-30 11:00:00',NULL,'Scheduled',NULL,6,NULL),(13,'2023-10-19 09:00:00',NULL,'Completed','No signs of concern',7,NULL),(14,'2023-11-02 10:30:00',NULL,'Scheduled',NULL,7,NULL),(15,'2023-10-21 08:30:00',NULL,'Pending',NULL,8,NULL),(16,'2023-11-05 09:45:00',NULL,'Scheduled',NULL,8,NULL),(17,'2024-11-10 09:00:00','Annual Health Check','Scheduled',NULL,2,'Clinic');
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `health_history`
--

DROP TABLE IF EXISTS `health_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `health_history` (
  `hadCancer` tinyint(1) DEFAULT NULL,
  `dateStart` date DEFAULT NULL,
  `dateEnd` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `feedback` varchar(100) DEFAULT NULL,
  `dossierID` int DEFAULT NULL,
  KEY `health_history_dossierMED_FK` (`dossierID`),
  CONSTRAINT `health_history_dossierMED_FK` FOREIGN KEY (`dossierID`) REFERENCES `dossierMED` (`dossierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_history`
--

LOCK TABLES `health_history` WRITE;
/*!40000 ALTER TABLE `health_history` DISABLE KEYS */;
INSERT INTO `health_history` VALUES (0,NULL,NULL,'No history','No prior cancer diagnosis',1),(1,'2019-05-10','2020-06-15','Remission','Completed treatment, in remission',2),(0,NULL,NULL,'No history','No prior cancer diagnosis',3),(1,'2021-08-20',NULL,'Under Treatment','Currently undergoing chemotherapy',4),(0,NULL,NULL,'No history','No prior cancer diagnosis',5),(0,NULL,NULL,'No history','No prior cancer diagnosis',6),(1,'2018-03-12','2019-07-25','Remission','Regular monitoring advised',7),(0,NULL,NULL,'No history','No prior cancer diagnosis',8);
/*!40000 ALTER TABLE `health_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredient` (
  `ingredientID` int NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`ingredientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'Parabens'),(2,'Phthalates'),(3,'Formaldehyde'),(4,'Sulfates'),(5,'Triclosan'),(6,'Benzophenone'),(7,'Toluene'),(8,'Lead'),(9,'Mineral Oil'),(10,'Petrolatum');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med`
--

DROP TABLE IF EXISTS `med`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `med` (
  `medID` int NOT NULL AUTO_INCREMENT,
  `datetime` datetime DEFAULT NULL,
  `medName` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `dossierID` int DEFAULT NULL,
  `frequency` enum('daily','weekly','monthly') DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`medID`),
  KEY `med_dossierMED_FK` (`dossierID`),
  CONSTRAINT `med_dossierMED_FK` FOREIGN KEY (`dossierID`) REFERENCES `dossierMED` (`dossierID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med`
--

LOCK TABLES `med` WRITE;
/*!40000 ALTER TABLE `med` DISABLE KEYS */;
INSERT INTO `med` VALUES (1,'2023-10-01 08:00:00','Tamoxifen','Prescribed',2,NULL,NULL),(2,'2023-10-02 08:00:00','Chemotherapy Drug A','Administered',4,NULL,NULL),(3,'2023-10-03 08:00:00','Anastrozole','Prescribed',7,NULL,NULL),(4,'2023-10-04 08:00:00','Pain Reliever X','Prescribed',4,NULL,NULL),(5,'2023-10-05 08:00:00','Vitamin D Supplement','Prescribed',1,NULL,NULL),(6,'2023-10-06 08:00:00','Antibiotic Y','Completed',3,NULL,NULL),(7,'2023-10-07 08:00:00','Chemotherapy Drug B','Administered',4,NULL,NULL),(8,'2023-10-08 08:00:00','Hormone Therapy Z','Prescribed',2,NULL,NULL),(9,'2024-10-01 08:00:00','Tamoxifen','Prescribed',1,'daily','2024-10-31'),(10,'2024-10-01 08:00:00','Chemotherapy Drug A','Prescribed',2,'weekly','2024-12-31'),(11,'2024-10-20 08:00:00','Tamoxifen','Prescribed',1,'daily','2024-11-20');
/*!40000 ALTER TABLE `med` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `notificationID` int NOT NULL AUTO_INCREMENT,
  `content` varchar(100) DEFAULT NULL,
  `sent` tinyint(1) DEFAULT NULL,
  `examID` int DEFAULT NULL,
  `medID` int DEFAULT NULL,
  `scheduledTime` datetime DEFAULT NULL,
  PRIMARY KEY (`notificationID`),
  KEY `notifications_exam_FK` (`examID`),
  KEY `notifications_med_FK` (`medID`),
  CONSTRAINT `notifications_exam_FK` FOREIGN KEY (`examID`) REFERENCES `exam` (`examID`),
  CONSTRAINT `notifications_med_FK` FOREIGN KEY (`medID`) REFERENCES `med` (`medID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,'Reminder: Upcoming exam on 2023-10-15',0,2,NULL,'2023-10-14 09:00:00'),(2,'Reminder: Take your medication Tamoxifen',0,NULL,1,'2023-10-02 08:00:00'),(3,'Result: Exam completed on 2023-10-05',1,3,NULL,'2023-10-05 12:00:00'),(4,'Reminder: Upcoming exam on 2023-10-20',0,4,NULL,'2023-10-19 09:00:00'),(5,'Reminder: Administer Chemotherapy Drug A',0,NULL,2,'2023-10-02 08:00:00'),(6,'Reminder: Take your medication Anastrozole',0,NULL,3,'2023-10-03 08:00:00'),(7,'Reminder: Take your medication Vitamin D Supplement',0,NULL,5,'2023-10-05 08:00:00'),(8,'Reminder: Upcoming exam on 2023-10-22',0,6,NULL,'2023-10-21 09:00:00'),(9,'Reminder: Take your medication Hormone Therapy Z',0,NULL,8,'2023-10-08 08:00:00'),(10,'Result: Exam completed on 2023-10-12',1,7,NULL,'2023-10-12 12:00:00');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `patientID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(24) DEFAULT NULL,
  `personID` int DEFAULT NULL,
  `parentID` int DEFAULT NULL,
  PRIMARY KEY (`patientID`),
  UNIQUE KEY `patient_unique` (`username`),
  KEY `patient_person_FK` (`personID`),
  KEY `patient_person_FK_1` (`parentID`),
  CONSTRAINT `patient_person_FK` FOREIGN KEY (`personID`) REFERENCES `person` (`personID`),
  CONSTRAINT `patient_person_FK_1` FOREIGN KEY (`parentID`) REFERENCES `person` (`personID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'amina.benkhelifa','password1',2,NULL),(2,'yasmine.belkacem','password2',3,NULL),(3,'fatima.zerouali','password3',5,NULL),(4,'nadia.cherifi','password4',7,NULL),(5,'lamia.hadjadj','password5',9,NULL),(6,'newusername','newpassword',1,1),(7,'rachid.sahnoun','password7',8,NULL),(8,'mustapha.belhadj','password8',10,NULL);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `personID` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `dbb` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`personID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Mohamed','Benali','1975-03-15','mohamed.benali@example.dz','+213661234567','123 Rue Didouche Mourad, Algiers'),(2,'Amina','Benkhelifa','1980-07-22','amina.benkhelifa@example.dz','+213662345678','456 Avenue Boumediene, Oran'),(3,'Yasmine','Belkacem','1990-11-05','yasmine.belkacem@example.dz','+213663456789','789 Boulevard Amirouche, Constantine'),(4,'Karim','Mansouri','1985-01-18','karim.mansouri@example.dz','+213664567890','1011 Rue Abane Ramdane, Blida'),(5,'Fatima','Zerouali','1995-06-30','fatima.zerouali@example.dz','+213665678901','1213 Avenue Pasteur, Annaba'),(6,'Samir','Boualem','1978-09-12','samir.boualem@example.dz','+213666789012','1415 Boulevard Krim Belkacem, Tlemcen'),(7,'Nadia','Cherifi','1988-12-24','nadia.cherifi@example.dz','+213667890123','1617 Rue Larbi Ben M\'hidi, Oran'),(8,'Rachid','Sahnoun','1982-04-10','rachid.sahnoun@example.dz','+213668901234','1819 Avenue Frantz Fanon, Algiers'),(9,'Lamia','Hadjadj','1992-08-27','lamia.hadjadj@example.dz','+213669012345','2021 Boulevard Colonel Lotfi, Oran'),(10,'Mustapha','Belhadj','1986-02-14','mustapha.belhadj@example.dz','+213670123456','2223 Rue Mohamed V, Constantine');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `productID` int NOT NULL AUTO_INCREMENT,
  `barcode` bigint DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `validated` int DEFAULT NULL,
  `personID` int DEFAULT NULL,
  PRIMARY KEY (`productID`),
  KEY `product_person_FK` (`personID`),
  CONSTRAINT `product_person_FK` FOREIGN KEY (`personID`) REFERENCES `person` (`personID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1234567890123,'Cosmetic Cream A','Approved',1,1),(2,2345678901234,'Lipstick B','Pending Approval',0,3),(3,3456789012345,'Shampoo C','Rejected',0,5),(4,4567890123456,'Lotion D','Approved',1,2),(5,5678901234567,'Sunscreen E','Approved',1,7),(6,6789012345678,'Foundation F','Pending Approval',0,9),(7,7890123456789,'Hair Gel G','Approved',1,6),(8,8901234567890,'Nail Polish H','Rejected',0,4),(9,9012345678901,'Body Wash I','Approved',1,8),(10,1122334455667,'Perfume J','Pending Approval',0,10);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_ingredient`
--

DROP TABLE IF EXISTS `product_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_ingredient` (
  `productID` int NOT NULL,
  `ingredientID` int NOT NULL,
  PRIMARY KEY (`productID`,`ingredientID`),
  KEY `ingredientID` (`ingredientID`),
  CONSTRAINT `product_ingredient_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`),
  CONSTRAINT `product_ingredient_ibfk_2` FOREIGN KEY (`ingredientID`) REFERENCES `ingredient` (`ingredientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_ingredient`
--

LOCK TABLES `product_ingredient` WRITE;
/*!40000 ALTER TABLE `product_ingredient` DISABLE KEYS */;
INSERT INTO `product_ingredient` VALUES (1,1),(4,1),(9,1),(6,2),(10,2),(7,3),(8,3),(1,4),(3,4),(7,4),(3,5),(9,5),(5,6),(10,6),(6,7),(8,7),(2,8),(2,9),(5,9),(4,10);
/*!40000 ALTER TABLE `product_ingredient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-19 22:56:25
