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
-- Table structure for table `datos_usuario`
--

DROP TABLE IF EXISTS `datos_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos_usuario` (
  `Id_Datos_Usuario` int(4) NOT NULL,
  `Apellido_Paterno` varchar(30) NOT NULL,
  `Apellido_Materno` varchar(30) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Id_Direccion` int(4) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Id_Sexo` int(4) NOT NULL,
  `Id_Datos_Cuenta` int(4) NOT NULL,
  `Id_Foto` int(4) NOT NULL,
  PRIMARY KEY (`Id_Datos_Usuario`),
  KEY `Id_Sexo` (`Id_Sexo`),
  KEY `Id_Direccion` (`Id_Direccion`),
  KEY `Id_Datos_Cuenta` (`Id_Datos_Cuenta`),
  KEY `Id_Foto` (`Id_Foto`),
  CONSTRAINT `datos_usuario_ibfk_1` FOREIGN KEY (`Id_Sexo`) REFERENCES `sexo` (`Id_Sexo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `datos_usuario_ibfk_2` FOREIGN KEY (`Id_Direccion`) REFERENCES `direccion` (`Id_Direccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `datos_usuario_ibfk_3` FOREIGN KEY (`Id_Datos_Cuenta`) REFERENCES `datos_cuenta` (`Id_Datos_Cuenta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `datos_usuario_ibfk_4` FOREIGN KEY (`Id_Foto`) REFERENCES `foto` (`Id_Foto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_usuario`
--

LOCK TABLES `datos_usuario` WRITE;
/*!40000 ALTER TABLE `datos_usuario` DISABLE KEYS */;
INSERT INTO `datos_usuario` VALUES (1,'LODAZA','GRACIA','JUAN',11,'2007-02-10',1,1,1),(2,'LODAZA','GRACIA','NICO',12,'2007-02-10',1,2,2),(3,'LODAZA','GRACIA','LUZ',13,'2001-12-10',2,3,3),(4,'LUZANO','DIAZ','NIDIA',14,'1990-06-16',2,4,4),(5,'LUZANO','DIAZ','ILIANA',15,'1990-06-16',2,5,5),(6,'LUZANO','DIAZ','FERNANDO',16,'1990-06-16',2,6,6),(7,'ALANIS','ROJAS','ZARET',17,'1992-11-18',2,7,7),(8,'ALANIS','ROJAS','LUIS',18,'1992-11-18',1,8,8),(9,'ALANIS','ROJAS','DIANA',19,'1992-11-18',2,9,9),(10,'ALANIS','ROJAS','MELIODAS',20,'1992-11-18',1,10,10),(11,'ALANIS','ROJAS','ZACK',21,'1992-11-18',1,11,48),(12,'ALANIS','ROJAS','ARNOLD',22,'1992-11-18',1,12,80),(13,'LOZADA','RUIZ','MANUEL',23,'2010-03-23',1,13,141);
/*!40000 ALTER TABLE `datos_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-18  9:24:10
