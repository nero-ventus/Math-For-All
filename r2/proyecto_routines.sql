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
-- Dumping events for database 'proyecto'
--

--
-- Dumping routines for database 'proyecto'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_Alum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Alum`(in id_Alum int(4),in Foto longblob,in Nombre_Foto varchar(100),in Usuario_Alum varchar(30),in Contraseña_Alum varchar(20),in NExterior_Alum int(5),in Calle_Alum varchar(30),in Municipio_Alum varchar(30),in Id_Estado_Alum int(4),in ApellidoP_Alum varchar(30),in ApellidoM_Alum varchar(30),in Nombre_Alum varchar(50),in FechaN_Alum date,in Id_Sexo_Alum int(4),in Curp_Alum varchar(20),in xId_Grupo int(4), in Id_Escuela int(4),in Id_Tipo_Contacto int(4),in Descripcionn varchar(30))
begin
declare xIdFoto int;
declare xIdDatos_Cuenta int;
declare xIdDireccion_Alum int;
declare xIdDatos_Usuario int;
declare xIdPuntuacion int;
declare xIdAlum int;
declare xIdRelacionAT int;
declare xIdContacto int;
declare xIdRelacionUC int;
if(id_Alum=0) then

	set xIdFoto=(select ifnull(max(Id_Foto),0)+1 from Foto);
	insert into Foto(Id_Foto,Archivo,Nombre) values (xIdFoto,Foto,Nombre_Foto);
    
    set xIdDatos_Cuenta=(select ifnull(max(Id_Datos_Cuenta),0)+1 from Datos_Cuenta);
	insert into Datos_Cuenta(Id_Datos_Cuenta,Usuario,Contraseña) values (xIdDatos_Cuenta,Usuario_Alum,Contraseña_Alum);
    
    set xIdDireccion_Alum=(select ifnull(max(Id_Direccion),0)+1 from Direccion);
	insert into Direccion(Id_Direccion,Numero_Exterior,Calle,Municipio,Id_Estado) values (xIdDireccion_Alum,NExterior_Alum,Calle_Alum,Municipio_Alum,Id_Estado_Alum);
	
    set xIdDatos_Usuario=(select ifnull(max(Id_Datos_Usuario),0)+1 from Datos_Usuario);
	insert into Datos_Usuario(Id_Datos_Usuario,Apellido_Paterno,Apellido_Materno,Nombre,Id_Direccion,Fecha_Nacimiento,Id_Sexo,Id_Datos_Cuenta,Id_Foto) values (xIdDatos_Usuario,ApellidoP_Alum,ApellidoM_Alum,Nombre_Alum,xIdDireccion_Alum,FechaN_Alum,Id_Sexo_Alum,xIdDatos_Cuenta,xIdFoto);
	
    set xIdPuntuacion=(select ifnull(max(Id_Puntuacion),0)+1 from Puntuacion);
	insert into Puntuacion(Id_Puntuacion,Cantidad) values (xIdPuntuacion,0);
    
    set xIdAlum=(select ifnull(max(Id_Alumno),0)+1 from Alumno);
	insert into Alumno(Id_Alumno,Curp,Id_Grupo,Id_Datos_Usuario,Id_Escuela,Id_Puntuacion) values (xIdAlum,Curp_Alum,xId_Grupo,xIdDatos_Usuario,Id_Escuela,xIdPuntuacion);
	
    set xIdRelacionAT=(select ifnull(max(Id_RelacionAT),0)+1 from Relacion_Alumno_Tema);
	insert into Relacion_Alumno_Tema(Id_RelacionAT,Id_Alumno,Id_Tema,Id_TRelacionAT) values (xIdRelacionAT,xIdAlum,1,2);
    set xIdRelacionAT=(select ifnull(max(Id_RelacionAT),0)+1 from Relacion_Alumno_Tema);
	insert into Relacion_Alumno_Tema(Id_RelacionAT,Id_Alumno,Id_Tema,Id_TRelacionAT) values (xIdRelacionAT,xIdAlum,2,2);
    set xIdRelacionAT=(select ifnull(max(Id_RelacionAT),0)+1 from Relacion_Alumno_Tema);
	insert into Relacion_Alumno_Tema(Id_RelacionAT,Id_Alumno,Id_Tema,Id_TRelacionAT) values (xIdRelacionAT,xIdAlum,3,2);
    set xIdRelacionAT=(select ifnull(max(Id_RelacionAT),0)+1 from Relacion_Alumno_Tema);
	insert into Relacion_Alumno_Tema(Id_RelacionAT,Id_Alumno,Id_Tema,Id_TRelacionAT) values (xIdRelacionAT,xIdAlum,4,2);
    set xIdRelacionAT=(select ifnull(max(Id_RelacionAT),0)+1 from Relacion_Alumno_Tema);
	insert into Relacion_Alumno_Tema(Id_RelacionAT,Id_Alumno,Id_Tema,Id_TRelacionAT) values (xIdRelacionAT,xIdAlum,5,2);
    set xIdRelacionAT=(select ifnull(max(Id_RelacionAT),0)+1 from Relacion_Alumno_Tema);
	insert into Relacion_Alumno_Tema(Id_RelacionAT,Id_Alumno,Id_Tema,Id_TRelacionAT) values (xIdRelacionAT,xIdAlum,6,2);
    set xIdRelacionAT=(select ifnull(max(Id_RelacionAT),0)+1 from Relacion_Alumno_Tema);
	insert into Relacion_Alumno_Tema(Id_RelacionAT,Id_Alumno,Id_Tema,Id_TRelacionAT) values (xIdRelacionAT,xIdAlum,7,2);
    set xIdRelacionAT=(select ifnull(max(Id_RelacionAT),0)+1 from Relacion_Alumno_Tema);
	insert into Relacion_Alumno_Tema(Id_RelacionAT,Id_Alumno,Id_Tema,Id_TRelacionAT) values (xIdRelacionAT,xIdAlum,8,2);
    set xIdRelacionAT=(select ifnull(max(Id_RelacionAT),0)+1 from Relacion_Alumno_Tema);
	insert into Relacion_Alumno_Tema(Id_RelacionAT,Id_Alumno,Id_Tema,Id_TRelacionAT) values (xIdRelacionAT,xIdAlum,9,2);
    set xIdRelacionAT=(select ifnull(max(Id_RelacionAT),0)+1 from Relacion_Alumno_Tema);
	insert into Relacion_Alumno_Tema(Id_RelacionAT,Id_Alumno,Id_Tema,Id_TRelacionAT) values (xIdRelacionAT,xIdAlum,10,2);
    set xIdRelacionAT=(select ifnull(max(Id_RelacionAT),0)+1 from Relacion_Alumno_Tema);
	insert into Relacion_Alumno_Tema(Id_RelacionAT,Id_Alumno,Id_Tema,Id_TRelacionAT) values (xIdRelacionAT,xIdAlum,11,2);
    
    set xIdContacto=(select ifnull(max(Id_Contacto),0)+1 from Contacto);
	insert into Contacto(Id_Contacto,Id_TContacto,Descripcion) values (xIdContacto,Id_Tipo_Contacto,Descripcionn);
    
    set xIdRelacionUC=(select ifnull(max(Id_RelacionUC),0)+1 from Relacion_Usuario_Contacto);
	insert into Relacion_Usuario_Contacto(Id_RelacionUC,Id_Datos_Usuario,Id_Contacto) values (xIdRelacionUC,xIdDatos_Usuario,xIdContacto);
else
	set xIdFoto=(select Foto.Id_Foto from Foto inner join Datos_Usuario,Datos_Cuenta where Datos_Usuario.Id_Foto=Foto.Id_Foto and  Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=id_Alum);
    update Foto set Archivo=Foto,Nombre=Nombre_Foto where Foto.Id_Foto=xIdFoto;
    set xIdDatos_Cuenta=id_Alum;
    update Datos_Cuenta set Usuario=Usuario_Alum,Contraseña=Contraseña_Alum where Datos_Cuenta.Id_Datos_Cuenta=xIdDatos_Cuenta;
    set xIdDireccion_Alum=(select Direccion.Id_Direccion from Direccion inner join Alumno,Datos_Usuario,Datos_Cuenta where Direccion.Id_Direccion=Datos_Usuario.Id_Direccion and Datos_Usuario.Id_Datos_Usuario=Alumno.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=id_Alum group by Direccion.Id_Direccion);
    update Direccion set Numero_Exterior=NExterior_Alum,Calle=Calle_Alum,Municipio=Municipio_Alum,Id_Estado=Id_Estado_Alum where Direccion.Id_Direccion=xIdDireccion_Alum;
    set xIdDatos_Usuario=(select Datos_Usuario.Id_Datos_Usuario from Datos_Usuario inner join Alumno,Datos_Cuenta where Datos_Usuario.Id_Datos_Usuario=Alumno.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=id_Alum group by Datos_Usuario.Id_Datos_Usuario);
    update Datos_Usuario set Apellido_Paterno=ApellidoP_Alum,Apellido_Materno=ApellidoM_Alum,Nombre=Nombre_Alum,Fecha_Nacimiento=FechaN_Alum,Id_Sexo=Id_Sexo_Alum where Datos_Usuario.Id_Datos_Usuario=xIdDatos_Usuario;
    set xIdAlum=(select Alumno.Id_Alumno from Alumno inner join Datos_Cuenta,Datos_Usuario where Datos_Usuario.Id_Datos_Usuario=Alumno.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=id_Alum group by Alumno.Id_Alumno);
    update Alumno set Curp=Curp_Alum,Id_Grupo=xId_Grupo,Id_Escuela=Id_Escuela where Alumno.Id_Alumno=xIdAlum;
    set xIdContacto=(select Contacto.Id_Contacto from Contacto inner join Relacion_Usuario_Contacto,Datos_Cuenta,Datos_Usuario where Relacion_Usuario_Contacto.Id_Contacto=Contacto.Id_Contacto and Relacion_Usuario_Contacto.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=id_Alum group by Contacto.Id_Contacto);
    update Contacto set Id_TContacto=Id_Tipo_Contacto,Descripcion=Descripcionn where Contacto.Id_Contacto=xIdContacto;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DirecE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DirecE`(in id_Direc int(4),in Foto longblob,in Nombre_Foto varchar(100),in Usuario_Direc varchar(30),in Contraseña_Direc varchar(20),in NExterior_Direc int(5),in Calle_Direc varchar(30),in Municipio_Direc varchar(30),in Id_Estado_Direc int(4),in ApellidoP_Direc varchar(30),in ApellidoM_Direc varchar(30),in Nombre_Direc varchar(50),in FechaN_Direc date,in Id_Sexo_Direc int(4),in NExterior_Escuela int(5),in Calle_Escuela varchar(30),in Municipio_Escuela varchar(30),in Id_Estado_Escuela int(4),in Nombre_Escuela varchar(30),in CCT_Escuela varchar(30),in Id_TEscuela int(4),in RFC_Maestro varchar(30),in Id_Tipo_Contacto int(4),in Descripcionn varchar(30))
begin
declare xIdFoto int;
declare xIdDatos_Cuenta int;
declare xIdDireccion_Direc int;
declare xIdDatos_Usuario int;
declare xIdDireccion_Escuela int;
declare xIdEscuela int;
declare xIdDirector int;
declare xIdContacto int;
declare xIdRelacionUC int;
if(id_Direc=0) then
	set xIdFoto=(select ifnull(max(Id_Foto),0)+1 from Foto);
	insert into Foto(Id_Foto,Archivo,Nombre) values (xIdFoto,Foto,Nombre_Foto);
    set xIdDatos_Cuenta=(select ifnull(max(Id_Datos_Cuenta),0)+1 from Datos_Cuenta);
	insert into Datos_Cuenta(Id_Datos_Cuenta,Usuario,Contraseña) values (xIdDatos_Cuenta,Usuario_Direc,Contraseña_Direc);
    set xIdDireccion_Direc=(select ifnull(max(Id_Direccion),0)+1 from Direccion);
	insert into Direccion(Id_Direccion,Numero_Exterior,Calle,Municipio,Id_Estado) values (xIdDireccion_Direc,NExterior_Direc,Calle_Direc,Municipio_Direc,Id_Estado_Direc);
	set xIdDatos_Usuario=(select ifnull(max(Id_Datos_Usuario),0)+1 from Datos_Usuario);
	insert into Datos_Usuario(Id_Datos_Usuario,Apellido_Paterno,Apellido_Materno,Nombre,Id_Direccion,Fecha_Nacimiento,Id_Sexo,Id_Datos_Cuenta,Id_Foto) values (xIdDatos_Usuario,ApellidoP_Direc,ApellidoM_Direc,Nombre_Direc,xIdDireccion_Direc,FechaN_Direc,Id_Sexo_Direc,xIdDatos_Cuenta,xIdFoto);
    set xIdDirector=(select ifnull(max(Id_Director),0)+1 from Director);
	insert into Director(Id_Director,RFC,Id_Datos_Usuario,Id_Escuela) values (xIdDirector,RFC_Maestro,xIdDatos_Usuario,3);
	set xIdContacto=(select ifnull(max(Id_Contacto),0)+1 from Contacto);
	insert into Contacto(Id_Contacto,Id_TContacto,Descripcion) values (xIdContacto,Id_Tipo_Contacto,Descripcionn);
    set xIdRelacionUC=(select ifnull(max(Id_RelacionUC),0)+1 from Relacion_Usuario_Contacto);
	insert into Relacion_Usuario_Contacto(Id_RelacionUC,Id_Datos_Usuario,Id_Contacto) values (xIdRelacionUC,xIdDatos_Usuario,xIdContacto);
else
	set xIdFoto=(select Foto.Id_Foto from Foto inner join Director,Datos_Usuario,Datos_Cuenta where Datos_Usuario.Id_Datos_Usuario=Director.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=id_Direc);
    update Foto set Archivo=Foto,Nombre=Nombre_Foto where Foto.Id_Foto=xIdFoto;
    set xIdDatos_Cuenta=id_Direc;
    update Datos_Cuenta set Usuario=Usuario_Direc,Contraseña=Contraseña_Direc where Datos_Cuenta.Id_Datos_Cuenta=xIdDatos_Cuenta;
    set xIdDireccion_Direc=(select Direccion.Id_Direccion from Direccion inner join Director,Datos_Usuario,Datos_Cuenta where Direccion.Id_Direccion=Datos_Usuario.Id_Direccion and Datos_Usuario.Id_Datos_Usuario=Director.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=id_Direc);
    update Direccion set Numero_Exterior=NExterior_Direc,Calle=Calle_Direc,Municipio=Municipio_Direc,Id_Estado=Id_Estado_Direc where Direccion.Id_Direccion=xIdDireccion_Direc;
    set xIdDatos_Usuario=(select Datos_Usuario.Id_Datos_Usuario from Datos_Usuario inner join Director,Datos_Cuenta where Datos_Usuario.Id_Datos_Usuario=Director.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=id_Direc);
    update Datos_Usuario set Apellido_Paterno=ApellidoP_Direc,Apellido_Materno=ApellidoM_Direc,Nombre=Nombre_Direc,Fecha_Nacimiento=FechaN_Direc,Id_Sexo=Id_Sexo_Direc where Datos_Usuario.Id_Datos_Usuario=xIdDatos_Usuario;
    set xIdDireccion_Escuela=(select Direccion.Id_Direccion from Direccion inner join Director,Datos_Usuario,Datos_Cuenta,Escuela where Direccion.Id_Direccion=Escuela.Id_Direccion and Director.Id_Escuela=Escuela.Id_Escuela and Datos_Usuario.Id_Datos_Usuario=Director.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=id_Direc);
    update Direccion set Numero_Exterior=NExterior_Escuela,Calle=Calle_Escuela,Municipio=Municipio_Escuela,Id_Estado=Id_Estado_Escuela where Direccion.Id_Direccion=xIdDireccion_Escuela;
    set xIdEscuela=(select Escuela.Id_Escuela from Escuela inner join Director,Datos_Usuario,Datos_Cuenta where Director.Id_Escuela=Escuela.Id_Escuela and Datos_Usuario.Id_Datos_Usuario=Director.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=id_Direc);
    update Escuela set Nombre=Nombre_Escuelae,CCT=CCT_Escuela,Id_TEscuela=Id_TEscuela where Escuela.Id_Escuela=xIdEscuela;
    set xIdDirector=(select Director.Id_Director from Director inner join Datos_Usuario,Datos_Cuenta where Datos_Usuario.Id_Datos_Usuario=Director.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=id_Direc);
    update Director set RFC=RFC_Maestro,Id_Escuela=xIdEscuela where Director.Id_Director=xIdDirector;
    set xIdContacto=(select Contacto.Id_Contacto from Contacto inner join Relacion_Usuario_Contacto,Datos_Cuenta,Datos_Usuario where Relacion_Usuario_Contacto.Id_Contacto=Contacto.Id_Contacto and Relacion_Usuario_Contacto.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=id_Direc);
    update Contacto set Id_TContacto=Id_Tipo_Contacto,Descripcion=Descripcionn where Contacto.Id_Contacto=xIdContacto;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_EliminarDG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EliminarDG`(in Cuenta int(4),in Grupoo int(4))
begin
declare xIdRela int;
set xIdRela=(select Relacion_Director_Grupo.Id_RelacionDG from Relacion_Director_Grupo inner join Datos_Cuenta,Datos_Usuario,Grupo,Director where Relacion_Director_Grupo.Id_Grupo=Grupo.Id_Grupo and Grupo.Id_Grupo=Grupoo and Relacion_Director_Grupo.Id_Director=Director.Id_Director and Director.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=Cuenta);
delete from Relacion_Director_Grupo where Relacion_Director_Grupo.Id_RelacionDG=xIdRela;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_EliminarMG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EliminarMG`(in Cuenta int(4),in Grupoo int(4))
begin
declare xIdRela int;
set xIdRela=(select Relacion_Maestro_Grupo.Id_RelacionMG from Relacion_Maestro_Grupo inner join Datos_Cuenta,Datos_Usuario,Grupo,Maestro where Relacion_Maestro_Grupo.Id_Grupo=Grupo.Id_Grupo and Grupo.Id_Grupo=Grupoo and Relacion_Maestro_Grupo.Id_Maestro=Maestro.Id_Maestro and Maestro.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=Cuenta);
delete from Relacion_Maestro_Grupo where Relacion_Maestro_Grupo.Id_RelacionMG=xIdRela;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Grupo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Grupo`(in id_Grup int(4),in Nombree varchar(30),in Turno int(4),in Cuenta int(4))
begin
declare xIdGrupo int;
declare xIdEscuela int;
if(id_Grup=0) then
	set xIdEscuela=(select Escuela.Id_Escuela from Escuela inner join Director,Datos_Usuario,Datos_Cuenta where Director.Id_Escuela=Escuela.Id_Escuela and Datos_Usuario.Id_Datos_Usuario=Director.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=Cuenta);
	set xIdGrupo=(select ifnull(max(Id_Grupo),0)+1 from Grupo);
	insert into Grupo(Id_Grupo,Nombre,Id_Turno,Id_Escuela) values (xIdGrupo,Nombree,Turno,xIdEscuela);
else
	set xIdGrupo=id_Grup;
    update Grupo set Nombre=Nombree,Id_Turno=Turno where Grupo.Id_Grupo=xIdGrupo;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Maes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Maes`(in id_Maes int(4),in Foto longblob,in Nombre_Foto varchar(100),in Usuario_Maes varchar(30),in Contraseña_Maes varchar(20),in NExterior_Maes int(5),in Calle_Maes varchar(30),in Municipio_Maes varchar(30),in Id_Estado_Maes int(4),in ApellidoP_Maes varchar(30),in ApellidoM_Maes varchar(30),in Nombre_Maes varchar(50),in FechaN_Maes date,in Id_Sexo_Maes int(4),in RFC_Maes varchar(30),in Id_Escuela int(4),in Id_Tipo_Contacto int(4),in Descripcionn varchar(30))
begin
declare xIdFoto int;
declare xIdDatos_Cuenta int;
declare xIdDireccion_Maes int;
declare xIdDatos_Usuario int;
declare xIdMaestro int;
declare xIdRelaME int;
declare xIdContacto int;
declare xIdRelacionUC int;
if(id_Maes=0) then
	set xIdFoto=(select ifnull(max(Id_Foto),0)+1 from Foto);
	insert into Foto(Id_Foto,Archivo,Nombre) values (xIdFoto,Foto,Nombre_Foto);
    set xIdDatos_Cuenta=(select ifnull(max(Id_Datos_Cuenta),0)+1 from Datos_Cuenta);
	insert into Datos_Cuenta(Id_Datos_Cuenta,Usuario,Contraseña) values (xIdDatos_Cuenta,Usuario_Maes,Contraseña_Maes);
    set xIdDireccion_Maes=(select ifnull(max(Id_Direccion),0)+1 from Direccion);
	insert into Direccion(Id_Direccion,Numero_Exterior,Calle,Municipio,Id_Estado) values (xIdDireccion_Maes,NExterior_Maes,Calle_Maes,Municipio_Maes,Id_Estado_Maes);
	set xIdDatos_Usuario=(select ifnull(max(Id_Datos_Usuario),0)+1 from Datos_Usuario);
	insert into Datos_Usuario(Id_Datos_Usuario,Apellido_Paterno,Apellido_Materno,Nombre,Id_Direccion,Fecha_Nacimiento,Id_Sexo,Id_Datos_Cuenta,Id_Foto) values (xIdDatos_Usuario,ApellidoP_Maes,ApellidoM_Maes,Nombre_Maes,xIdDireccion_Maes,FechaN_Maes,Id_Sexo_Maes,xIdDatos_Cuenta,xIdFoto);
    set xIdMaestro=(select ifnull(max(Id_Maestro),0)+1 from Maestro);
	insert into Maestro(Id_Maestro,RFC,Id_Datos_Usuario) values (xIdMaestro,RFC_Maes,xIdDatos_Usuario);
	set xIdRelaME=(select ifnull(max(Id_RelacionMG),0)+1 from Relacion_Maestro_Escuela);
	insert into Relacion_Maestro_Escuela(Id_RelacionMG,Id_Maestro,Id_Escuela) values (xIdRelaME,xIdMaestro,Id_Escuela);
	set xIdContacto=(select ifnull(max(Id_Contacto),0)+1 from Contacto);
	insert into Contacto(Id_Contacto,Id_TContacto,Descripcion) values (xIdContacto,Id_Tipo_Contacto,Descripcionn);
    set xIdRelacionUC=(select ifnull(max(Id_RelacionUC),0)+1 from Relacion_Usuario_Contacto);
	insert into Relacion_Usuario_Contacto(Id_RelacionUC,Id_Datos_Usuario,Id_Contacto) values (xIdRelacionUC,xIdDatos_Usuario,xIdContacto);
else
	set xIdFoto=(select Foto.Id_Foto from Foto inner join Datos_Usuario,Datos_Cuenta,Maestro where Datos_Usuario.Id_Datos_Usuario=Maestro.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=id_Maes and Datos_Usuario.Id_Foto=Foto.Id_Foto);
    update Foto set Archivo=Foto,Nombre=Nombre_Foto where Foto.Id_Foto=xIdFoto;
    set xIdDatos_Cuenta=id_Maes;
    update Datos_Cuenta set Usuario=Usuario_Maes,Contraseña=Contraseña_Maes where Datos_Cuenta.Id_Datos_Cuenta=xIdDatos_Cuenta;
    set xIdDireccion_Maes=(select Direccion.Id_Direccion from Direccion inner join Maestro,Datos_Usuario,Datos_Cuenta where Direccion.Id_Direccion=Datos_Usuario.Id_Direccion and Datos_Usuario.Id_Datos_Usuario=Maestro.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=id_Maes);
    update Direccion set Numero_Exterior=NExterior_Maes,Calle=Calle_Maes,Municipio=Municipio_Maes,Id_Estado=Id_Estado_Maes where Direccion.Id_Direccion=xIdDireccion_Maes;
    set xIdDatos_Usuario=(select Datos_Usuario.Id_Datos_Usuario from Datos_Usuario inner join Maestro,Datos_Cuenta where Datos_Usuario.Id_Datos_Usuario=Maestro.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=id_Maes);
    update Datos_Usuario set Apellido_Paterno=ApellidoP_Maes,Apellido_Materno=ApellidoM_Maes,Nombre=Nombre_Maes,Fecha_Nacimiento=FechaN_Maes,Id_Sexo=Id_Sexo_Maes where Datos_Usuario.Id_Datos_Usuario=xIdDatos_Usuario;
    set xIdMaestro=(select Maestro.Id_Maestro from Maestro inner join Datos_Usuario,Datos_Cuenta where Datos_Usuario.Id_Datos_Cuenta=Datos_Cuenta.Id_Datos_Cuenta and Maestro.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=id_Maes);
    update Maestro set RFC=RFC_Maes where Maestro.Id_Maestro=xIdMaestro;
    set xIdRelaME=(select Relacion_Maestro_Escuela.Id_RelacionMG from Relacion_Maestro_Escuela inner join Datos_Usuario,Datos_Cuenta,maestro where Relacion_Maestro_Escuela.Id_Maestro=Maestro.Id_maestro and Maestro.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Datos_Usuario.Id_Datos_Cuenta=Datos_Cuenta.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=id_Maes);
    update Relacion_Maestro_Escuela set Id_Escuela=Id_Escuela where Relacion_Maestro_Escuela.Id_RelacionMG=xIdRelaME;
    set xIdContacto=(select Contacto.Id_Contacto from Contacto inner join Relacion_Usuario_Contacto,Datos_Cuenta,Datos_Usuario where Relacion_Usuario_Contacto.Id_Contacto=Contacto.Id_Contacto and Relacion_Usuario_Contacto.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=id_Maes);
    update Contacto set Id_TContacto=Id_Tipo_Contacto,Descripcion=Descripcionn where Contacto.Id_Contacto=xIdContacto;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_pregunta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pregunta`(in idP int(4),in bite longblob,in nomi varchar(100),in descripopc1 varchar(50),in idTopc1 int(4),in descripopc2 varchar(50),in idTopc2 int(4),in descripopc3 varchar(50),in idTopc3 int(4),in descripopc4 varchar(50),in idTopc4 int(4),in descripp varchar(100),in idTema int(4),in idTPregunta int(4),in idTPreguntaD int(4))
begin
declare xIdFoto int;
declare xIdOpciona int;
declare xIdOpcionb int;
declare xIdOpcionc int;
declare xIdOpciond int;
declare xIdRelacion int;
declare xIdPregunta int;
if(idP=0) then
	set xIdFoto=(select ifnull(max(Id_Foto),0)+1 from Foto);
	insert into Foto(Id_Foto,Archivo,Nombre) values (xIdFoto,bite,nomi);
    set xIdOpciona=(select ifnull(max(Id_Opcion),0)+1 from Opcion);
	insert into Opcion(Id_Opcion,Descripcion,Id_TOpcion) values (xIdOpciona,descripopc1,idTopc1);
    set xIdOpcionb=(select ifnull(max(Id_Opcion),0)+1 from Opcion);
	insert into Opcion(Id_Opcion,Descripcion,Id_TOpcion) values (xIdOpcionb,descripopc2,idTopc2);
    set xIdOpcionc=(select ifnull(max(Id_Opcion),0)+1 from Opcion);
	insert into Opcion(Id_Opcion,Descripcion,Id_TOpcion) values (xIdOpcionc,descripopc3,idTopc3);
    set xIdOpciond=(select ifnull(max(Id_Opcion),0)+1 from Opcion);
	insert into Opcion(Id_Opcion,Descripcion,Id_TOpcion) values (xIdOpciond,descripopc4,idTopc4);
    set xIdPregunta=(select ifnull(max(Id_Pregunta),0)+1 from Pregunta);
	insert into Pregunta(Id_Pregunta,Descripcion,Id_Tema,Id_TPregunta,Id_TPregunta_Dificultad,Id_Foto) values (xIdPregunta,descripp,idTema,idTPregunta,idTPreguntaD,xIdFoto);
    set xIdRelacion=(select ifnull(max(Id_RelacionPO),0)+1 from Relacion_Preguntas_Opciones);
	insert into Relacion_Preguntas_Opciones(Id_RelacionPO,Id_Pregunta,Id_Opcion) values (xIdRelacion,xIdPregunta,xIdOpciona);
    set xIdRelacion=(select ifnull(max(Id_RelacionPO),0)+1 from Relacion_Preguntas_Opciones);
	insert into Relacion_Preguntas_Opciones(Id_RelacionPO,Id_Pregunta,Id_Opcion) values (xIdRelacion,xIdPregunta,xIdOpcionb);
    set xIdRelacion=(select ifnull(max(Id_RelacionPO),0)+1 from Relacion_Preguntas_Opciones);
	insert into Relacion_Preguntas_Opciones(Id_RelacionPO,Id_Pregunta,Id_Opcion) values (xIdRelacion,xIdPregunta,xIdOpcionc);
    set xIdRelacion=(select ifnull(max(Id_RelacionPO),0)+1 from Relacion_Preguntas_Opciones);
	insert into Relacion_Preguntas_Opciones(Id_RelacionPO,Id_Pregunta,Id_Opcion) values (xIdRelacion,xIdPregunta,xIdOpciond);
else
    set xIdFoto=(select ifnull(max(Id_Foto),0)+1 from Foto);
	insert into Foto(Id_Foto,Archivo,Nombre) values (xIdFoto,null,null);
    set xIdOpciona=(select ifnull(max(Id_Opcion),0)+1 from Opcion);
	insert into Opcion(Id_Opcion,Descripcion,Id_TOpcion) values (xIdOpciona,descripopc1,idTopc1);
    set xIdOpcionb=(select ifnull(max(Id_Opcion),0)+1 from Opcion);
	insert into Opcion(Id_Opcion,Descripcion,Id_TOpcion) values (xIdOpcionb,descripopc2,idTopc2);
    set xIdOpcionc=(select ifnull(max(Id_Opcion),0)+1 from Opcion);
	insert into Opcion(Id_Opcion,Descripcion,Id_TOpcion) values (xIdOpcionc,descripopc3,idTopc3);
    set xIdOpciond=(select ifnull(max(Id_Opcion),0)+1 from Opcion);
	insert into Opcion(Id_Opcion,Descripcion,Id_TOpcion) values (xIdOpciond,descripopc4,idTopc4);
    set xIdPregunta=(select ifnull(max(Id_Pregunta),0)+1 from Pregunta);
	insert into Pregunta(Id_Pregunta,Descripcion,Id_Tema,Id_TPregunta,Id_TPregunta_Dificultad,Id_Foto) values (xIdPregunta,descripp,idTema,idTPregunta,idTPreguntaD,xIdFoto);
    set xIdRelacion=(select ifnull(max(Id_RelacionPO),0)+1 from Relacion_Preguntas_Opciones);
	insert into Relacion_Preguntas_Opciones(Id_RelacionPO,Id_Pregunta,Id_Opcion) values (xIdRelacion,xIdPregunta,xIdOpciona);
    set xIdRelacion=(select ifnull(max(Id_RelacionPO),0)+1 from Relacion_Preguntas_Opciones);
	insert into Relacion_Preguntas_Opciones(Id_RelacionPO,Id_Pregunta,Id_Opcion) values (xIdRelacion,xIdPregunta,xIdOpcionb);
    set xIdRelacion=(select ifnull(max(Id_RelacionPO),0)+1 from Relacion_Preguntas_Opciones);
	insert into Relacion_Preguntas_Opciones(Id_RelacionPO,Id_Pregunta,Id_Opcion) values (xIdRelacion,xIdPregunta,xIdOpcionc);
    set xIdRelacion=(select ifnull(max(Id_RelacionPO),0)+1 from Relacion_Preguntas_Opciones);
	insert into Relacion_Preguntas_Opciones(Id_RelacionPO,Id_Pregunta,Id_Opcion) values (xIdRelacion,xIdPregunta,xIdOpciond);
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RelaAT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_RelaAT`(in Cuenta int(4),in Tema int(4))
begin
declare xIdAlum int;
set xIdAlum=(select Alumno.Id_Alumno from Alumno inner join Datos_Cuenta,Datos_Usuario where Datos_Usuario.Id_Datos_Usuario=Alumno.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=Cuenta);
update Relacion_Alumno_Tema set Id_TRelacionAT=1 where Id_Tema=Tema and Id_Alumno=xIdAlum;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RelaDG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_RelaDG`(in id_Rela int(4),in Cuenta int(4),in Grupo int(4))
begin
declare xIdRela int;
declare xIdDirec int;
if(id_Rela=0) then
	set xIdRela=(select ifnull(max(Id_RelacionDG),0)+1 from Relacion_Director_Grupo);
    set xIdDirec=(select Director.Id_Director from Director inner join Datos_Usuario,Datos_Cuenta where Datos_Usuario.Id_Datos_Usuario=Director.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=Cuenta);
	insert into Relacion_Director_Grupo(Id_RelacionDG,Id_Director,Id_Grupo) values (xIdRela,xIdDirec,Grupo);
else
	set xIdRela=id_Rela;
    set xIdDirec=(select Director.Id_Director from Director inner join Datos_Usuario,Datos_Cuenta where Datos_Usuario.Id_Datos_Usuario=Director.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=Cuenta);
    update Relacion_Director_Grupo set Id_Director=xIdDirec,Id_Grupo=Grupo where Relacion_Director_Grupo.Id_RelacionDG=xIdRela;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RelaMG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_RelaMG`(in id_Rela int(4),in Cuenta int(4),in Grupo int(4))
begin
declare xIdRela int;
declare xIdMaes int;
if(id_Rela=0) then
	set xIdRela=(select ifnull(max(Id_RelacionMG),0)+1 from Relacion_Maestro_Grupo);
    set xIdMaes=(select Maestro.Id_Maestro from Maestro inner join Datos_Usuario,Datos_Cuenta where Datos_Usuario.Id_Datos_Cuenta=Datos_Cuenta.Id_Datos_Cuenta and Maestro.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Cuenta);
	insert into Relacion_Maestro_Grupo(Id_RelacionMG,Id_Maestro,Id_Grupo) values (xIdRela,xIdMaes,Grupo);
else
	set xIdRela=id_Rela;
    set xIdMaes=(select Maestro.Id_Maestro from Maestro inner join Datos_Usuario,Datos_Cuenta where Datos_Usuario.Id_Datos_Cuenta=Datos_Cuenta.Id_Datos_Cuenta and Maestro.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Cuenta);
    update Relacion_Maestro_Grupo set Id_Maestro=xIdMaes,Id_Grupo=Grupo where Relacion_Maestro_Grupo.Id_RelacionMG=xIdRela;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-18  9:24:14
