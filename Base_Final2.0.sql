drop database if exists Proyecto;
create database if not exists Proyecto;
use Proyecto;
create table Sexo(
	Id_Sexo int(4) primary key not null,
    Descripcion varchar(30) not null
);
insert into Sexo values(1,'Masculino');
insert into Sexo values(2,'Femenino');


create table Foto(
	Id_Foto int(4) primary key not null,
    Archivo longblob,
    Nombre varchar(100)
);

create table Datos_Cuenta(
	Id_Datos_Cuenta int(4) primary key not null,
    Usuario varchar(30) not null,
    Contraseña varchar(20) not null
);

create table Tipo_Contacto(
	Id_TContacto int(4) primary key not null,
    Descripcion varchar(30) not null
);
insert into Tipo_Contacto values(1,'Telefono movil');
insert into Tipo_Contacto values(2,'Telefono casa');
insert into Tipo_Contacto values(3,'Telefono oficina');
insert into Tipo_Contacto values(4,'E-mail');
insert into Tipo_Contacto values(5,'Fax');


create table Contacto(
	Id_Contacto int(4) primary key not null,
    Id_TContacto int(4) not null,
    Descripcion varchar(30) not null,
    foreign key (Id_TContacto) references Tipo_Contacto (Id_TContacto) on delete cascade on update cascade
);

create table Tipo_Escuela(
	Id_TEscuela int(4) primary key not null,
    Descripcion varchar(30) not null
);
insert into Tipo_Escuela values(1,'Publica');
insert into Tipo_Escuela values(2,'Privada');

create table Estado(
	Id_Estado int(4) primary key not null,
    Descripcion varchar(30) not null
);
insert into Estado values(1,'Ciudad de México');
insert into Estado values(2,'Aguascalientes');
insert into Estado values(3,'Baja California');
insert into Estado values(4,'Baja California Sur');
insert into Estado values(5,'Campeche');
insert into Estado values(6,'Chihuahua');
insert into Estado values(7,'Chiapas');
insert into Estado values(8,'Coahuila');
insert into Estado values(9,'Colima');
insert into Estado values(10,'Durango');
insert into Estado values(11,'Guanajuato');
insert into Estado values(12,'Guerrero');
insert into Estado values(13,'Hidalgo');
insert into Estado values(14,'Jalisco');
insert into Estado values(15,'Estado de México');
insert into Estado values(16,'Michoacán');
insert into Estado values(17,'Morelos');
insert into Estado values(18,'Nayarit');
insert into Estado values(19,'Nuevo León');
insert into Estado values(20,'Oaxaca');
insert into Estado values(21,'Puebla');
insert into Estado values(22,'Querétaro');
insert into Estado values(23,'Quintana Roo');
insert into Estado values(24,'San Luis Potosí');
insert into Estado values(25,'Sinaloa');
insert into Estado values(26,'Sonora');
insert into Estado values(27,'Tabasco');
insert into Estado values(28,'Tamaulipas');
insert into Estado values(29,'Tlaxcala');
insert into Estado values(30,'Veracruz');
insert into Estado values(31,'Yucatán');
insert into Estado values(32,'Zacatecas');

create table Direccion(
	Id_Direccion int(4) primary key not null,
    Numero_Exterior int(5) not null,
    Calle varchar(60) not null,
    Municipio varchar(30) not null,
    Id_Estado int(4) not null,
    foreign key (Id_Estado) references Estado (Id_Estado) on delete cascade on update cascade
);
insert into Direccion values(1,1196,'Centenario','Alvaro Obregon',1);
insert into Direccion values(2,219,'De Las Aguilas','Alvaro Obregon',1);
insert into Direccion values(3,83,'Ribera De San Cosme','Cuauhtemoc',1);
insert into Direccion values(4,1030,'Cordillera De Los Andes','San Nicolas De Los Garza',19);
insert into Direccion values(5,0,'Bonao','Gustavo A. Madero',1);
insert into Direccion values(6,00,'Emiliano Zapata','Gustavo A. Madero',1);
insert into Direccion values(7,665,'3 Sur','Venustiano Carranza',1);
insert into Direccion values(8,000,'Enriqueta','Gustavo A. Madero',1);
insert into Direccion values(9,592,'Corregidora','Tlalpan',1);
insert into Direccion values(10,0000,'6','Venustiano Carranza',1);

create table Escuela(
	Id_Escuela int(4) not null primary key,
    Nombre varchar(60) not null,
    CCT varchar(30) not null,
    Id_Direccion int(4) not null,
    Id_TEscuela int(4) not null,
	foreign key (Id_Direccion) references Direccion (Id_Direccion) on delete cascade on update cascade,
    foreign key (Id_TEscuela) references Tipo_Escuela (Id_TEscuela) on delete cascade on update cascade
);
insert into Escuela values(1,'Instituto San Ángel Inn','09PES0718E',1,2);
insert into Escuela values(2,'Instituto Asunción de México','09PES0222W',2,2);
insert into Escuela values(3,'Escuela Secundaria anexa a la Normal Superior de México','09DES1000O',3,1);
insert into Escuela values(4,'Centro Cultural y Educativo De Monterrey','19PES0225Z',4,2);
insert into Escuela values(5,'Escuela Secundaria Técnica 32','09DST0032S',5,1);
insert into Escuela values(6,'Lic. Adolfo López Mateos','09DES0144D',6,1);
insert into Escuela values(7,'Centro Escolar Morelos','09PPR0396T',7,2);
insert into Escuela values(8,'Escuela Secundaria Técnica 99','09DST0099Z',8,1);
insert into Escuela values(9,'Instituto Escuela del Sur','09PES0611M',9,2);
insert into Escuela values(10,'Escuela Secundaria Técnica 66','09DST0066I',10,1);

create table Turno(
	Id_Turno int(4) not null primary key,
    Descripcion varchar(30) not null
);
insert into Turno values(1,'Matutino');
insert into Turno values(2,'Vespertino');
insert into Turno values(3,'Completo');

create table Grupo(
	Id_Grupo int(4) not null primary key,
    Nombre varchar(30) not null,
    Id_Turno int(4) not null,
    Id_Escuela int(4) not null,
    foreign key (Id_Turno) references Turno (Id_Turno) on delete cascade on update cascade,
    foreign key (Id_Escuela) references Escuela (Id_Escuela) on delete cascade on update cascade
);
insert into Grupo values(1,'1IM1',1,1);
insert into Grupo values(2,'1IM2',1,1);
insert into Grupo values(3,'1IM3',1,1);
insert into Grupo values(4,'1IM1',1,2);
insert into Grupo values(5,'1IM2',1,2);
insert into Grupo values(6,'1IM3',1,2);
insert into Grupo values(7,'1IC1',3,3);
insert into Grupo values(8,'1IC2',3,3);
insert into Grupo values(9,'1IC3',3,3);
insert into Grupo values(10,'1IM1',1,4);
insert into Grupo values(11,'1IM2',1,4);
insert into Grupo values(12,'1IM3',1,4);
insert into Grupo values(13,'1IV1',2,4);
insert into Grupo values(14,'1IV2',2,4);
insert into Grupo values(15,'1IV3',2,4);
insert into Grupo values(16,'1IM1',1,5);
insert into Grupo values(17,'1IM2',1,5);
insert into Grupo values(18,'1IM3',1,5);
insert into Grupo values(19,'1IC1',3,6);
insert into Grupo values(20,'1IC2',3,6);
insert into Grupo values(21,'1IC3',3,6);
insert into Grupo values(22,'1IM1',1,7);
insert into Grupo values(23,'1IM2',1,7);
insert into Grupo values(24,'1IM3',1,7);
insert into Grupo values(25,'1IV1',2,7);
insert into Grupo values(26,'1IV2',2,7);
insert into Grupo values(27,'1IV3',2,7);
insert into Grupo values(28,'1IC1',3,8);
insert into Grupo values(29,'1IC2',3,8);
insert into Grupo values(30,'1IC3',3,8);
insert into Grupo values(31,'1IM1',1,9);
insert into Grupo values(32,'1IM2',1,9);
insert into Grupo values(33,'1IM3',1,9);
insert into Grupo values(34,'1IV1',2,9);
insert into Grupo values(35,'1IV2',2,9);
insert into Grupo values(36,'1IV3',2,9);
insert into Grupo values(37,'1IM1',1,10);
insert into Grupo values(38,'1IM2',1,10);
insert into Grupo values(39,'1IM3',1,10);
create table Puntuacion(
	Id_Puntuacion int(4) not null primary key,
    Cantidad int(5) not null
);

create table Eje(
	Id_Eje int(4) not null primary key,
    Descripcion varchar(50) not null
);
insert into Eje values(1,'Número, álgebra y variación');
insert into Eje values(2,'Forma, espacio y medida');
insert into Eje values(3,'Análisis de datos');

create table Tema(
	Id_Tema int(4) not null primary key,
    Descripcion varchar(60) not null,
    Id_Eje int(4) not null,
    foreign key (Id_Eje) references Eje (Id_Eje) on delete cascade on update cascade
);
insert into Tema values(1,'Número',1);
insert into Tema values(2,'Adición y sustracción',1);
insert into Tema values(3,'Multiplicación y división',1);
insert into Tema values(4,'Proporcionalidad',1);
insert into Tema values(5,'Ecuaciones',1);
insert into Tema values(6,'Funciones',1);
insert into Tema values(7,'Patrones, figuras geométricas y expresiones equivalentes',1);
insert into Tema values(8,'Figuras y cuerpos geométricos',2);
insert into Tema values(9,'Magnitudes y medidas',2);
insert into Tema values(10,'Estadística',3);
insert into Tema values(11,'Probabilidad',3);

create table Video(
	Id_Video int(4) not null primary key,
    Enlace varchar(50) not null,
    Id_Tema int(4),
    foreign key (Id_Tema) references Tema (Id_Tema) on delete cascade on update cascade
);

create table Tipo_Pregunta(
	Id_TPregunta int(4) not null primary key,
    Descripcion varchar(50) not null
);
insert into Tipo_Pregunta values(1,'Cuestionario');
insert into Tipo_Pregunta values(2,'Problemario');
insert into Tipo_Pregunta values(3,'Examen');
insert into Tipo_Pregunta values(4,'Examen Sorpresa');

create table Tipo_Pregunta_Dificultad(
	Id_TPregunta_Dificultad int(4) not null primary key,
    Descripcion varchar(50) not null
);
insert into Tipo_Pregunta_Dificultad values(1,'Facil');
insert into Tipo_Pregunta_Dificultad values(2,'Media');
insert into Tipo_Pregunta_Dificultad values(3,'Dificil');

create table Pregunta(
	Id_Pregunta int(4) primary key not null,
    Descripcion varchar(100) not null,
    Id_Tema int(4) not null,
    Id_TPregunta int(4) not null,
    Id_TPregunta_Dificultad int(4) not null,
    Id_Foto int(4),
    foreign key (Id_TPregunta_Dificultad) references Tipo_Pregunta_Dificultad (Id_TPregunta_Dificultad) on delete cascade on update cascade,
    foreign key (Id_Tema) references Tema (Id_Tema) on delete cascade on update cascade,
    foreign key (Id_TPregunta) references Tipo_Pregunta (Id_TPregunta) on delete cascade on update cascade,
    foreign key (Id_Foto) references Foto (Id_Foto) on delete cascade on update cascade
);

create table Tipo_Opcion(
	Id_TOpcion int(4) not null primary key,
    Descripcion varchar(30) not null
);
insert into Tipo_Opcion values(1,'Correcta');
insert into Tipo_Opcion values(2,'Incorrecta');

create table Opcion(
	Id_Opcion int(4) primary key not null,
    Descripcion varchar(50) not null,
    Id_TOpcion int(4) not null,
    foreign key (Id_TOpcion) references Tipo_Opcion (Id_TOpcion) on delete cascade on update cascade
);

create table Relacion_Preguntas_Opciones(
	Id_RelacionPO int(4) not null primary key,
    Id_Pregunta int(4) not null,
    Id_Opcion int(4) not null,
    foreign key (Id_Pregunta) references Pregunta (Id_Pregunta) on delete cascade on update cascade,
    foreign key (Id_Opcion) references Opcion (Id_Opcion) on delete cascade on update cascade
);

create table Datos_Usuario(
	Id_Datos_Usuario int(4) not null primary key,
    Apellido_Paterno varchar(30) not null,
    Apellido_Materno varchar(30) not null,
    Nombre varchar(50) not null,
    Id_Direccion int(4) not null,
    Fecha_Nacimiento date not null,
    Id_Sexo int(4) not null,
    Id_Datos_Cuenta int(4) not null,
    Id_Foto int(4) not null,
    foreign key (Id_Sexo) references Sexo (Id_Sexo) on delete cascade on update cascade,
    foreign key (Id_Direccion) references Direccion (Id_Direccion) on delete cascade on update cascade,
    foreign key (Id_Datos_Cuenta) references Datos_Cuenta (Id_Datos_Cuenta) on delete cascade on update cascade,
    foreign key (Id_Foto) references Foto (Id_Foto) on delete cascade on update cascade
);

create table Relacion_Usuario_Contacto(
	Id_RelacionUC int(4) not null primary key,
    Id_Datos_Usuario int(4) not null,
    Id_Contacto int(4) not null,
    foreign key (Id_Datos_Usuario) references Datos_Usuario (Id_Datos_Usuario) on delete cascade on update cascade,
    foreign key (Id_Contacto) references Contacto (Id_Contacto) on delete cascade on update cascade
);

create table Alumno(
	Id_Alumno int(4) not null primary key,
    Curp varchar(20) not null,
    Id_Grupo int(4) not null,
    Id_Datos_Usuario int(4) not null,
    Id_Escuela int(4) not null,
    Id_Puntuacion int(4) not null,
    foreign key (Id_Grupo) references Grupo (Id_Grupo) on delete cascade on update cascade,
    foreign key (Id_Datos_Usuario) references Datos_Usuario (Id_Datos_Usuario) on delete cascade on update cascade,
    foreign key (Id_Escuela) references Escuela (Id_Escuela) on delete cascade on update cascade,
    foreign key (Id_Puntuacion) references Puntuacion (Id_Puntuacion) on delete cascade on update cascade
);

create table Maestro(
	Id_Maestro int(4) not null primary key,
    RFC varchar(30) not null,
    Id_Datos_Usuario int(4) not null,
    foreign key (Id_Datos_Usuario) references Datos_Usuario (Id_Datos_Usuario) on delete cascade on update cascade
);

create table Director(
	Id_Director int(4) not null primary key,
    RFC varchar(30) not null,
    Id_Datos_Usuario int(4) not null,
    Id_Escuela int(4) not null,
    foreign key (Id_Escuela) references Escuela (Id_Escuela) on delete cascade on update cascade,
    foreign key (Id_Datos_Usuario) references Datos_Usuario (Id_Datos_Usuario) on delete cascade on update cascade
);

create table Relacion_Maestro_Grupo(
	Id_RelacionMG int(4) not null primary key,
    Id_Maestro int(4) not null,
    Id_Grupo int(4) not null,
    foreign key (Id_Maestro) references Maestro (Id_Maestro) on delete cascade on update cascade,
    foreign key (Id_Grupo) references Grupo (Id_Grupo) on delete cascade on update cascade
);

create table Relacion_Director_Grupo(
	Id_RelacionDG int(4) not null primary key,
    Id_Director int(4) not null,
    Id_Grupo int(4) not null,
    foreign key (Id_Director) references Director (Id_Director) on delete cascade on update cascade,
    foreign key (Id_Grupo) references Grupo (Id_Grupo) on delete cascade on update cascade
);

create table Relacion_Maestro_Escuela(
	Id_RelacionMG int(4) not null primary key,
    Id_Maestro int(4) not null,
    Id_Escuela int(4) not null,
    foreign key (Id_Maestro) references Maestro (Id_Maestro) on delete cascade on update cascade,
    foreign key (Id_Escuela) references Escuela (Id_Escuela) on delete cascade on update cascade
);

create table Tipo_Relacion_Alumno_Tema(
	Id_TRelacionAT int(4) primary key not null,
    Descripcion varchar(30) not null
);
insert into Tipo_Relacion_Alumno_Tema values(1,'Visto');
insert into Tipo_Relacion_Alumno_Tema values(2,'No visto');

create table Relacion_Alumno_Tema(
	Id_RelacionAT int(4) primary key not null,
    Id_Alumno int(4) not null,
    Id_Tema int(4) not null,
    Id_TRelacionAT int(4) not null,
    foreign key (Id_Alumno) references Alumno (Id_Alumno) on delete cascade on update cascade,
    foreign key (Id_Tema) references Tema (Id_Tema) on delete cascade on update cascade,
    foreign key (Id_TRelacionAT) references Tipo_Relacion_Alumno_Tema (Id_TRelacionAT) on delete cascade on update cascade
);
drop procedure if exists sp_EliminarDG;
delimiter **
create procedure sp_EliminarDG(in Cuenta int(4),in Grupoo int(4))
begin
declare xIdRela int;
set xIdRela=(select Relacion_Director_Grupo.Id_RelacionDG from Relacion_Director_Grupo inner join Datos_Cuenta,Datos_Usuario,Grupo,Director where Relacion_Director_Grupo.Id_Grupo=Grupo.Id_Grupo and Grupo.Id_Grupo=Grupoo and Relacion_Director_Grupo.Id_Director=Director.Id_Director and Director.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=Cuenta);
delete from Relacion_Director_Grupo where Relacion_Director_Grupo.Id_RelacionDG=xIdRela;
end;**
drop procedure if exists sp_EliminarMG;
delimiter **
create procedure sp_EliminarMG(in Cuenta int(4),in Grupoo int(4))
begin
declare xIdRela int;
set xIdRela=(select Relacion_Maestro_Grupo.Id_RelacionMG from Relacion_Maestro_Grupo inner join Datos_Cuenta,Datos_Usuario,Grupo,Maestro where Relacion_Maestro_Grupo.Id_Grupo=Grupo.Id_Grupo and Grupo.Id_Grupo=Grupoo and Relacion_Maestro_Grupo.Id_Maestro=Maestro.Id_Maestro and Maestro.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=Cuenta);
delete from Relacion_Maestro_Grupo where Relacion_Maestro_Grupo.Id_RelacionMG=xIdRela;
end;**
set global max_allowed_packet=33554432;
drop procedure if exists sp_Alum;
delimiter **
create procedure sp_Alum(in id_Alum int(4),in Foto longblob,in Nombre_Foto varchar(100),in Usuario_Alum varchar(30),in Contraseña_Alum varchar(20),in NExterior_Alum int(5),in Calle_Alum varchar(30),in Municipio_Alum varchar(30),in Id_Estado_Alum int(4),in ApellidoP_Alum varchar(30),in ApellidoM_Alum varchar(30),in Nombre_Alum varchar(50),in FechaN_Alum date,in Id_Sexo_Alum int(4),in Curp_Alum varchar(20),in xId_Grupo int(4), in Id_Escuela int(4),in Id_Tipo_Contacto int(4),in Descripcionn varchar(30))
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
end;**
drop procedure if exists sp_Grupo;
delimiter **
create procedure sp_Grupo(in id_Grup int(4),in Nombree varchar(30),in Turno int(4),in Cuenta int(4))
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
end;**
drop procedure if exists sp_Maes;
delimiter **
create procedure sp_Maes(in id_Maes int(4),in Foto longblob,in Nombre_Foto varchar(100),in Usuario_Maes varchar(30),in Contraseña_Maes varchar(20),in NExterior_Maes int(5),in Calle_Maes varchar(30),in Municipio_Maes varchar(30),in Id_Estado_Maes int(4),in ApellidoP_Maes varchar(30),in ApellidoM_Maes varchar(30),in Nombre_Maes varchar(50),in FechaN_Maes date,in Id_Sexo_Maes int(4),in RFC_Maes varchar(30),in Id_Escuela int(4),in Id_Tipo_Contacto int(4),in Descripcionn varchar(30))
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
end;**
drop procedure if exists sp_pregunta;
delimiter **
create procedure sp_pregunta(in idP int(4),in bite longblob,in nomi varchar(100),in descripopc1 varchar(50),in idTopc1 int(4),in descripopc2 varchar(50),in idTopc2 int(4),in descripopc3 varchar(50),in idTopc3 int(4),in descripopc4 varchar(50),in idTopc4 int(4),in descripp varchar(100),in idTema int(4),in idTPregunta int(4),in idTPreguntaD int(4))
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
end;**
drop procedure if exists sp_RelaAT;
delimiter **
create procedure sp_RelaAT(in Cuenta int(4),in Tema int(4))
begin
declare xIdAlum int;
set xIdAlum=(select Alumno.Id_Alumno from Alumno inner join Datos_Cuenta,Datos_Usuario where Datos_Usuario.Id_Datos_Usuario=Alumno.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=Cuenta);
update Relacion_Alumno_Tema set Id_TRelacionAT=1 where Id_Tema=Tema and Id_Alumno=xIdAlum;
end;**
drop procedure if exists sp_RelaDG;
delimiter **
create procedure sp_RelaDG(in id_Rela int(4),in Cuenta int(4),in Grupo int(4))
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
end;**
drop procedure if exists sp_RelaMG;
delimiter **
create procedure sp_RelaMG(in id_Rela int(4),in Cuenta int(4),in Grupo int(4))
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
end;**