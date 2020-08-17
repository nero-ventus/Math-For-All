-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `relacion_alumno_tema`
--

DROP TABLE IF EXISTS `relacion_alumno_tema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_alumno_tema` (
  `Id_RelacionAT` int(4) NOT NULL,
  `Id_Alumno` int(4) NOT NULL,
  `Id_Tema` int(4) NOT NULL,
  `Id_TRelacionAT` int(4) NOT NULL,
  PRIMARY KEY (`Id_RelacionAT`),
  KEY `Id_Alumno` (`Id_Alumno`),
  KEY `Id_Tema` (`Id_Tema`),
  KEY `Id_TRelacionAT` (`Id_TRelacionAT`),
  CONSTRAINT `relacion_alumno_tema_ibfk_1` FOREIGN KEY (`Id_Alumno`) REFERENCES `alumno` (`Id_Alumno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relacion_alumno_tema_ibfk_2` FOREIGN KEY (`Id_Tema`) REFERENCES `tema` (`Id_Tema`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relacion_alumno_tema_ibfk_3` FOREIGN KEY (`Id_TRelacionAT`) REFERENCES `tipo_relacion_alumno_tema` (`Id_TRelacionAT`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_alumno_tema`
--

LOCK TABLES `relacion_alumno_tema` WRITE;
/*!40000 ALTER TABLE `relacion_alumno_tema` DISABLE KEYS */;
INSERT INTO `relacion_alumno_tema` VALUES (1,1,1,2),(2,1,2,2),(3,1,3,2),(4,1,4,2),(5,1,5,2),(6,1,6,2),(7,1,7,2),(8,1,8,2),(9,1,9,2),(10,1,10,1),(11,1,11,1),(12,2,1,2),(13,2,2,2),(14,2,3,2),(15,2,4,2),(16,2,5,2),(17,2,6,2),(18,2,7,2),(19,2,8,2),(20,2,9,2),(21,2,10,1),(22,2,11,1),(23,3,1,2),(24,3,2,2),(25,3,3,2),(26,3,4,2),(27,3,5,2),(28,3,6,2),(29,3,7,2),(30,3,8,2),(31,3,9,2),(32,3,10,1),(33,3,11,1),(34,4,1,2),(35,4,2,2),(36,4,3,2),(37,4,4,2),(38,4,5,2),(39,4,6,2),(40,4,7,2),(41,4,8,2),(42,4,9,2),(43,4,10,1),(44,4,11,1),(45,5,1,2),(46,5,2,2),(47,5,3,2),(48,5,4,2),(49,5,5,2),(50,5,6,2),(51,5,7,2),(52,5,8,2),(53,5,9,2),(54,5,10,1),(55,5,11,1),(56,6,1,2),(57,6,2,2),(58,6,3,2),(59,6,4,2),(60,6,5,2),(61,6,6,2),(62,6,7,2),(63,6,8,2),(64,6,9,2),(65,6,10,1),(66,6,11,1);
/*!40000 ALTER TABLE `relacion_alumno_tema` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-18  9:24:09
