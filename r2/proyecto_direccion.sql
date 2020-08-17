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
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direccion` (
  `Id_Direccion` int(4) NOT NULL,
  `Numero_Exterior` int(5) NOT NULL,
  `Calle` varchar(60) NOT NULL,
  `Municipio` varchar(30) NOT NULL,
  `Id_Estado` int(4) NOT NULL,
  PRIMARY KEY (`Id_Direccion`),
  KEY `Id_Estado` (`Id_Estado`),
  CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`Id_Estado`) REFERENCES `estado` (`Id_Estado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,1196,'Centenario','Alvaro Obregon',1),(2,219,'De Las Aguilas','Alvaro Obregon',1),(3,83,'Ribera De San Cosme','Cuauhtemoc',1),(4,1030,'Cordillera De Los Andes','San Nicolas De Los Garza',19),(5,0,'Bonao','Gustavo A. Madero',1),(6,0,'Emiliano Zapata','Gustavo A. Madero',1),(7,665,'3 Sur','Venustiano Carranza',1),(8,0,'Enriqueta','Gustavo A. Madero',1),(9,592,'Corregidora','Tlalpan',1),(10,0,'6','Venustiano Carranza',1),(11,1,'DE LA LUZ','TULTEPEC',15),(12,1,'DE LA LUZ','TULTEPEC',15),(13,1,'DE LA LUZ','TULTEPEC',15),(14,2,'DE LA DIA','TULTEPEC',15),(15,2,'DE LA DIA','TULTEPEC',15),(16,2,'DE LA DIA','TULTEPEC',15),(17,1,'DE LA PAZ','TULTEPEC',15),(18,1,'DE LA PAZ','TULTEPEC',15),(19,1,'DE LA PAZ','TULTEPEC',15),(20,1,'DE LA PAZ','TULTEPEC',15),(21,1,'DE LA PAZ','TULTEPEC',15),(22,1,'DE LA PAZ','TULTEPEC',15),(23,2,'DE LA SOLEDAD','TULTEPEC',15);
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
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
