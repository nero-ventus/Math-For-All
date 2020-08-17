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
-- Table structure for table `relacion_maestro_escuela`
--

DROP TABLE IF EXISTS `relacion_maestro_escuela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_maestro_escuela` (
  `Id_RelacionMG` int(4) NOT NULL,
  `Id_Maestro` int(4) NOT NULL,
  `Id_Escuela` int(4) NOT NULL,
  PRIMARY KEY (`Id_RelacionMG`),
  KEY `Id_Maestro` (`Id_Maestro`),
  KEY `Id_Escuela` (`Id_Escuela`),
  CONSTRAINT `relacion_maestro_escuela_ibfk_1` FOREIGN KEY (`Id_Maestro`) REFERENCES `maestro` (`Id_Maestro`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relacion_maestro_escuela_ibfk_2` FOREIGN KEY (`Id_Escuela`) REFERENCES `escuela` (`Id_Escuela`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_maestro_escuela`
--

LOCK TABLES `relacion_maestro_escuela` WRITE;
/*!40000 ALTER TABLE `relacion_maestro_escuela` DISABLE KEYS */;
INSERT INTO `relacion_maestro_escuela` VALUES (1,1,1),(2,2,2),(3,3,3);
/*!40000 ALTER TABLE `relacion_maestro_escuela` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-18  9:23:59
