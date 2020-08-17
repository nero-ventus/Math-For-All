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
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumno` (
  `Id_Alumno` int(4) NOT NULL,
  `Curp` varchar(20) NOT NULL,
  `Id_Grupo` int(4) NOT NULL,
  `Id_Datos_Usuario` int(4) NOT NULL,
  `Id_Escuela` int(4) NOT NULL,
  `Id_Puntuacion` int(4) NOT NULL,
  PRIMARY KEY (`Id_Alumno`),
  KEY `Id_Grupo` (`Id_Grupo`),
  KEY `Id_Datos_Usuario` (`Id_Datos_Usuario`),
  KEY `Id_Escuela` (`Id_Escuela`),
  KEY `Id_Puntuacion` (`Id_Puntuacion`),
  CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`Id_Grupo`) REFERENCES `grupo` (`Id_Grupo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `alumno_ibfk_2` FOREIGN KEY (`Id_Datos_Usuario`) REFERENCES `datos_usuario` (`Id_Datos_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `alumno_ibfk_3` FOREIGN KEY (`Id_Escuela`) REFERENCES `escuela` (`Id_Escuela`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `alumno_ibfk_4` FOREIGN KEY (`Id_Puntuacion`) REFERENCES `puntuacion` (`Id_Puntuacion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (1,'ASDGJASGDJKASGDASG',3,7,1,1),(2,'ASDGJASGDJKASGDASG',2,8,1,2),(3,'ASDGJASGDJKASGDASG',6,9,2,3),(4,'ASDGJASGDJKASGDASG',5,10,2,4),(5,'ASDGJASGDJKASGDASG',9,11,3,5),(6,'ASDGJASGDJKASGDASG',8,12,3,6);
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
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
