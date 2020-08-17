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
-- Table structure for table `escuela`
--

DROP TABLE IF EXISTS `escuela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escuela` (
  `Id_Escuela` int(4) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `CCT` varchar(30) NOT NULL,
  `Id_Direccion` int(4) NOT NULL,
  `Id_TEscuela` int(4) NOT NULL,
  PRIMARY KEY (`Id_Escuela`),
  KEY `Id_Direccion` (`Id_Direccion`),
  KEY `Id_TEscuela` (`Id_TEscuela`),
  CONSTRAINT `escuela_ibfk_1` FOREIGN KEY (`Id_Direccion`) REFERENCES `direccion` (`Id_Direccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `escuela_ibfk_2` FOREIGN KEY (`Id_TEscuela`) REFERENCES `tipo_escuela` (`Id_TEscuela`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escuela`
--

LOCK TABLES `escuela` WRITE;
/*!40000 ALTER TABLE `escuela` DISABLE KEYS */;
INSERT INTO `escuela` VALUES (1,'Instituto San Ángel Inn','09PES0718E',1,2),(2,'Instituto Asunción de México','09PES0222W',2,2),(3,'Escuela Secundaria anexa a la Normal Superior de México','09DES1000O',3,1),(4,'Centro Cultural y Educativo De Monterrey','19PES0225Z',4,2),(5,'Escuela Secundaria Técnica 32','09DST0032S',5,1),(6,'Lic. Adolfo López Mateos','09DES0144D',6,1),(7,'Centro Escolar Morelos','09PPR0396T',7,2),(8,'Escuela Secundaria Técnica 99','09DST0099Z',8,1),(9,'Instituto Escuela del Sur','09PES0611M',9,2),(10,'Escuela Secundaria Técnica 66','09DST0066I',10,1);
/*!40000 ALTER TABLE `escuela` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-18  9:24:06
