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
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pregunta` (
  `Id_Pregunta` int(4) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `Id_Tema` int(4) NOT NULL,
  `Id_TPregunta` int(4) NOT NULL,
  `Id_TPregunta_Dificultad` int(4) NOT NULL,
  `Id_Foto` int(4) DEFAULT NULL,
  PRIMARY KEY (`Id_Pregunta`),
  KEY `Id_TPregunta_Dificultad` (`Id_TPregunta_Dificultad`),
  KEY `Id_Tema` (`Id_Tema`),
  KEY `Id_TPregunta` (`Id_TPregunta`),
  KEY `Id_Foto` (`Id_Foto`),
  CONSTRAINT `pregunta_ibfk_1` FOREIGN KEY (`Id_TPregunta_Dificultad`) REFERENCES `tipo_pregunta_dificultad` (`Id_TPregunta_Dificultad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pregunta_ibfk_2` FOREIGN KEY (`Id_Tema`) REFERENCES `tema` (`Id_Tema`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pregunta_ibfk_3` FOREIGN KEY (`Id_TPregunta`) REFERENCES `tipo_pregunta` (`Id_TPregunta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pregunta_ibfk_4` FOREIGN KEY (`Id_Foto`) REFERENCES `foto` (`Id_Foto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
INSERT INTO `pregunta` VALUES (1,'5-6=?',11,1,1,11),(2,'8+4=?',11,1,1,12),(3,'5-20=?',11,1,1,13),(4,'60-(-6)=?',11,1,1,14),(5,'-50-(-3)=?',11,1,1,15),(6,'5*4=?',11,1,2,16),(7,'5*-7=?',11,1,2,17),(8,'8*8=?',11,1,2,18),(9,'12*-11=?',11,1,2,19),(10,'10*0=?',11,1,2,20),(11,'10*0=?',11,1,2,21),(12,'Raiz de 64=?',11,1,3,22),(13,'Raiz de 81=?',11,1,3,23),(14,'Raiz de 144=?',11,1,3,24),(15,'Raiz de 169=?',11,1,3,25),(16,'Raiz de 100=?',11,1,3,26),(17,'5-6=?',10,1,1,27),(18,'8+4=?',10,1,1,28),(19,'5-20=?',10,1,1,29),(20,'60-(-6)=?',10,1,1,30),(21,'-50-(-3)=?',10,1,1,31),(22,'5*4=?',10,1,2,32),(23,'5*-7=?',10,1,2,33),(24,'8*8=?',10,1,2,34),(25,'12*-11=?',10,1,2,35),(26,'10*0=?',10,1,2,36),(27,'10*0=?',10,1,2,37),(28,'Raiz de 64=?',10,1,3,38),(29,'Raiz de 81=?',10,1,3,39),(30,'Raiz de 144=?',10,1,3,40),(31,'Raiz de 169=?',10,1,3,41),(32,'Raiz de 100=?',10,1,3,42),(33,'5-6=?',11,2,1,43),(34,'8+4=?',11,2,1,44),(35,'5-20=?',11,2,1,45),(36,'60-(-6)=?',11,2,1,46),(37,'-50-(-3)=?',11,2,1,47),(38,'5*4=?',11,2,2,49),(39,'5*-7=?',11,2,2,50),(40,'8*8=?',11,2,2,51),(41,'12*-11=?',11,2,2,52),(42,'10*0=?',11,2,2,53),(43,'10*0=?',11,2,2,54),(44,'Raiz de 64=?',11,2,3,55),(45,'Raiz de 81=?',11,2,3,56),(46,'Raiz de 144=?',11,2,3,57),(47,'Raiz de 169=?',11,2,3,58),(48,'Raiz de 100=?',11,2,3,59),(49,'5-6=?',10,2,1,60),(50,'8+4=?',10,2,1,61),(51,'5-20=?',10,2,1,62),(52,'60-(-6)=?',10,2,1,63),(53,'-50-(-3)=?',10,2,1,64),(54,'5*4=?',10,2,2,65),(55,'5*-7=?',10,2,2,66),(56,'8*8=?',10,2,2,67),(57,'12*-11=?',10,2,2,68),(58,'10*0=?',10,2,2,69),(59,'10*0=?',10,2,2,70),(60,'Raiz de 64=?',10,2,3,71),(61,'Raiz de 81=?',10,2,3,72),(62,'Raiz de 144=?',10,2,3,73),(63,'Raiz de 169=?',10,2,3,74),(64,'Raiz de 100=?',10,2,3,75),(65,'5-6=?',11,3,1,76),(66,'8+4=?',11,3,1,77),(67,'5-20=?',11,3,1,78),(68,'60-(-6)=?',11,3,1,79),(69,'-50-(-3)=?',11,3,1,81),(70,'5*4=?',11,3,2,82),(71,'5*-7=?',11,3,2,83),(72,'8*8=?',11,3,2,84),(73,'12*-11=?',11,3,2,85),(74,'10*0=?',11,3,2,86),(75,'10*0=?',11,3,2,87),(76,'Raiz de 64=?',11,3,3,88),(77,'Raiz de 81=?',11,3,3,89),(78,'Raiz de 144=?',11,3,3,90),(79,'Raiz de 169=?',11,3,3,91),(80,'Raiz de 100=?',11,3,3,92),(81,'5-6=?',10,3,1,93),(82,'8+4=?',10,3,1,94),(83,'5-20=?',10,3,1,95),(84,'60-(-6)=?',10,3,1,96),(85,'-50-(-3)=?',10,3,1,97),(86,'5*4=?',10,3,2,98),(87,'5*-7=?',10,3,2,99),(88,'8*8=?',10,3,2,100),(89,'12*-11=?',10,3,2,101),(90,'10*0=?',10,3,2,102),(91,'10*0=?',10,3,2,103),(92,'Raiz de 64=?',10,3,3,104),(93,'Raiz de 81=?',10,3,3,105),(94,'Raiz de 144=?',10,3,3,106),(95,'Raiz de 169=?',10,3,3,107),(96,'Raiz de 100=?',10,3,3,108),(97,'5-6=?',11,4,1,109),(98,'8+4=?',11,4,1,110),(99,'5-20=?',11,4,1,111),(100,'60-(-6)=?',11,4,1,112),(101,'-50-(-3)=?',11,4,1,113),(102,'5*4=?',11,4,2,114),(103,'5*-7=?',11,4,2,115),(104,'8*8=?',11,4,2,116),(105,'12*-11=?',11,4,2,117),(106,'10*0=?',11,4,2,118),(107,'10*0=?',11,4,2,119),(108,'Raiz de 64=?',11,4,3,120),(109,'Raiz de 81=?',11,4,3,121),(110,'Raiz de 144=?',11,4,3,122),(111,'Raiz de 169=?',11,4,3,123),(112,'Raiz de 100=?',11,4,3,124),(113,'5-6=?',10,4,1,125),(114,'8+4=?',10,4,1,126),(115,'5-20=?',10,4,1,127),(116,'60-(-6)=?',10,4,1,128),(117,'-50-(-3)=?',10,4,1,129),(118,'5*4=?',10,4,2,130),(119,'5*-7=?',10,4,2,131),(120,'8*8=?',10,4,2,132),(121,'12*-11=?',10,4,2,133),(122,'10*0=?',10,4,2,134),(123,'10*0=?',10,4,2,135),(124,'Raiz de 64=?',10,4,3,136),(125,'Raiz de 81=?',10,4,3,137),(126,'Raiz de 144=?',10,4,3,138),(127,'Raiz de 169=?',10,4,3,139),(128,'Raiz de 100=?',10,4,3,140);
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-18  9:24:02
