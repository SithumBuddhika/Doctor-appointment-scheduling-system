-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: dcoappoitments
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS appointments;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE appointments (
  AppID int NOT NULL AUTO_INCREMENT,
  DocID varchar(45) NOT NULL,
  `Date` date NOT NULL,
  `Day` varchar(45) DEFAULT NULL,
  StartTime time NOT NULL,
  EndTime time NOT NULL,
  AppointmentDuration varchar(45) NOT NULL,
  MaximumAppointments int NOT NULL,
  BreakTime time NOT NULL,
  SpecialNote varchar(200) NOT NULL,
  `Status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (AppID),
  UNIQUE KEY AppID_UNIQUE (AppID)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES appointments WRITE;
/*!40000 ALTER TABLE appointments DISABLE KEYS */;
INSERT INTO appointments VALUES (15,'DOC64','2025-03-29','Tuesday','09:00:00','13:00:00','60',5,'10:15:00','Dentist','Confirmed'),(25,'DOC64','2024-10-14','Monday','17:00:00','21:00:00','15',6,'18:56:00','Prescription refill','Schedule'),(26,'DOC64','2024-10-14','Monday','14:00:00','15:00:00','15',4,'13:00:00','Consultation','Schedule'),(27,'DOC64','2024-10-13','Monday','12:00:00','17:00:00','15',5,'14:00:00','sdvcsdvsdvdsv','Schedule'),(29,'DOC64','2024-11-03','Sunday','03:00:00','08:00:00','15',5,'04:00:00','acsaawcwsac','Schedule'),(30,'DOC64','2024-10-16','Thursday','05:55:00','08:58:00','15',1,'06:57:00','wdwxswsx','dwdw'),(33,'DOC69','2024-10-15','Tuesday','18:00:00','21:00:00','15',12,'20:00:00','Testing 123','Schedule'),(34,'DOC69','2025-03-29','Saturday','03:04:00','09:06:00','15',5,'07:07:00','Update health records','Schedul');
/*!40000 ALTER TABLE appointments ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctordb`
--

DROP TABLE IF EXISTS doctordb;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE doctordb (
  username varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  email varchar(45) DEFAULT NULL,
  PRIMARY KEY (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctordb`
--

LOCK TABLES doctordb WRITE;
/*!40000 ALTER TABLE doctordb DISABLE KEYS */;
INSERT INTO doctordb VALUES ('DOC64','doc123','doc64@gmail.com'),('DOC66','doc123','doc66@gmail.com'),('DOC69','doc123','doc69@gmail.com'),('DOC7788','doc123','doc7788@gmail.com'),('DOC999','doc123','do999@gmail.com');
/*!40000 ALTER TABLE doctordb ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-28 19:39:31
