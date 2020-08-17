use Proyecto;
drop procedure if exists sp_DirecE;
delimiter **
create procedure sp_DirecE(in id_Direc int(4),in Foto longblob,in Nombre_Foto varchar(100),in Usuario_Direc varchar(30),in Contraseña_Direc varchar(20),in NExterior_Direc int(5),in Calle_Direc varchar(30),in Municipio_Direc varchar(30),in Id_Estado_Direc int(4),in ApellidoP_Direc varchar(30),in ApellidoM_Direc varchar(30),in Nombre_Direc varchar(50),in FechaN_Direc date,in Id_Sexo_Direc int(4),in NExterior_Escuela int(5),in Calle_Escuela varchar(30),in Municipio_Escuela varchar(30),in Id_Estado_Escuela int(4),in Nombre_Escuela varchar(30),in CCT_Escuela varchar(30),in Id_TEscuela int(4),in RFC_Maestro varchar(30),in Id_Tipo_Contacto int(4),in Descripcionn varchar(30))
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
	insert into Director(Id_Director,RFC,Id_Datos_Usuario,Id_Escuela) values (xIdDirector,RFC_Maestro,xIdDatos_Usuario,1);
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
end;**