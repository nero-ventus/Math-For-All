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
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `Id_Grupo` int(4) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Id_Turno` int(4) NOT NULL,
  `Id_Escuela` int(4) NOT NULL,
  PRIMARY KEY (`Id_Grupo`),
  KEY `Id_Turno` (`Id_Turno`),
  KEY `Id_Escuela` (`Id_Escuela`),
  CONSTRAINT `grupo_ibfk_1` FOREIGN KEY (`Id_Turno`) REFERENCES `turno` (`Id_Turno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `grupo_ibfk_2` FOREIGN KEY (`Id_Escuela`) REFERENCES `escuela` (`Id_Escuela`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,'1IM1',1,1),(2,'1IM2',1,1),(3,'1IM3',1,1),(4,'1IM1',1,2),(5,'1IM2',1,2),(6,'1IM3',1,2),(7,'1IC1',3,3),(8,'1IC2',3,3),(9,'1IC3',3,3),(10,'1IM1',1,4),(11,'1IM2',1,4),(12,'1IM3',1,4),(13,'1IV1',2,4),(14,'1IV2',2,4),(15,'1IV3',2,4),(16,'1IM1',1,5),(17,'1IM2',1,5),(18,'1IM3',1,5),(19,'1IC1',3,6),(20,'1IC2',3,6),(21,'1IC3',3,6),(22,'1IM1',1,7),(23,'1IM2',1,7),(24,'1IM3',1,7),(25,'1IV1',2,7),(26,'1IV2',2,7),(27,'1IV3',2,7),(28,'1IC1',3,8),(29,'1IC2',3,8),(30,'1IC3',3,8),(31,'1IM1',1,9),(32,'1IM2',1,9),(33,'1IM3',1,9),(34,'1IV1',2,9),(35,'1IV2',2,9),(36,'1IV3',2,9),(37,'1IM1',1,10),(38,'1IM2',1,10),(39,'1IM3',1,10);
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-18  9:24:05
