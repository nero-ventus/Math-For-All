<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import='java.sql.*'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="shortcut icon" href="img/pesta1.ico"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar alumno</title>
        <script>
            function cambi(){
                var aux1="previa",aux2="Ruta";
                document.getElementById(aux1).src=document.getElementById(aux2).value;
                document.getElementById("Sexo").selectedIndex=document.getElementById("sexo1").value;
                document.getElementById("Escuela").selectedIndex=document.getElementById("escuela1").value;
                document.getElementById("TipoContacto").selectedIndex=document.getElementById("tcontac1").value;
                document.getElementById("AlumEstado").selectedIndex=document.getElementById("estado1").value;
                borrar(Grupo);
                Agregar();
                var esc = document.getElementById("Escuela").selectedIndex;
                if(esc === 1 || esc === 2 || esc === 5 || esc === 10 || esc === 3 || esc === 6 || esc === 8){
                    var y=document.getElementById("grupo1").value-3;
                    var x=document.getElementById("grupo1").value-y;
                    document.getElementById("Grupo").selectedIndex=x;
                }
                else{
                    if(esc === 4 || esc === 7 || esc === 9){
                        var y=document.getElementById("grupo1").value-4;
                        var x=document.getElementById("grupo1").value-y;
                        document.getElementById("Grupo").selectedIndex=x;
                    }
                }
                clearInterval(cambio);
            }
            function SpawnContacto(){
                R = TipoContacto.options[TipoContacto.selectedIndex].value;
                if( R ==="1"  || R === "2"  ||  R ==="3" ){
                    document.getElementById("Contacto").placeholder = "(55) 5555 5555";
                    document.getElementById("Contacto").maxlength = "15";
                }
                else{
                    document.getElementById("Contacto").placeholder = "Ejemplo1@GoldenCode.com";
                }
                document.getElementById("Contacto").disabled = false;
            }
            
            function Desactivar(){
                Sexo.options[0].disabled = true;
                TipoContacto.options[0].disabled = true;
                AlumEstado.options[0].disabled = true;
                Escuela.options[0].disabled = true;
                Grupo.options[0].disabled = true;
            }
            
            function Validar(){
                var letras = " abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
                var x = event.keyCode;
                var letra = String.fromCharCode(x);
                var n = letras.indexOf(letra);
                if(n===-1)
                    event.returnValue = false;
            }
            
            function Validar2(){
                var letras = " 1234567890";
                var x = event.keyCode;
                var letra = String.fromCharCode(x);
                var n = letras.indexOf(letra);
                if(n===-1)
                    event.returnValue = false;
            }
            
            function Validar3(){
                var letras = "abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ 1234567890";
                var x = event.keyCode;
                var letra = String.fromCharCode(x);
                var n = letras.indexOf(letra);
                if(n===-1)
                    event.returnValue = false;
            }
            
            function Validar4(){
                var letras = "-.,_{}[]´+¿'?!¡@#$%&/abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ 1234567890";
                var x = event.keyCode;
                var letra = String.fromCharCode(x);
                var n = letras.indexOf(letra);
                if(n===-1)
                    event.returnValue = false;
            }
            
            function prevista(imagen) {
                if (imagen.files && imagen.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        document.getElementById("previa").src=e.target.result;
                    }
                    reader.readAsDataURL(imagen.files[0]);
                }
                document.getElementById("previa").style.visibility="visible";
                document.getElementById("previa").style.width="30%";
                document.getElementById("previa").style.heigth="30%"
            }
            
            function Mayus(){
                var tecla = document.getElementById("Curp1").value;
                var tecla2 = tecla.toUpperCase();
                document.getElementById("Curp1").value = tecla2;
            }
            
             function Mayus2(){
                var tecla = document.getElementById("ApPaterno").value;
                var tecla2 = tecla.toUpperCase();
                document.getElementById("ApPaterno").value = tecla2;
            }
            
            function Mayus3(){
                var tecla = document.getElementById("ApMaterno").value;
                var tecla2 = tecla.toUpperCase();
                document.getElementById("ApMaterno").value = tecla2;
            }
            
            function Mayus4(){
                var tecla = document.getElementById("Nombre").value;
                var tecla2 = tecla.toUpperCase();
                document.getElementById("Nombre").value = tecla2;
            }
            
            function Mayus5(){
                var tecla = document.getElementById("AlumCalle").value;
                var tecla2 = tecla.toUpperCase();
                document.getElementById("AlumCalle").value = tecla2;
            }
            
            function Mayus6(){
                var tecla = document.getElementById("AlumMunicipio").value;
                var tecla2 = tecla.toUpperCase();
                document.getElementById("AlumMunicipio").value = tecla2;
            }
            
            function AceptarDatos(){
                var nom = document.getElementById("Nombre").value;
                var ApPat = document.getElementById("ApPaterno").value;
                var ApMat = document.getElementById("ApMaterno").value;
                var FechNaci = document.getElementById("FechaNacimiento").value;
                var CURP = document.getElementById("Curp1").value;
                var sexo = document.getElementById("Sexo").value;
                var TContac = document.getElementById("TipoContacto").value;
                var Contac = document.getElementById("Contacto").value;
                var ANumExt =  document.getElementById("AlumNumExt").value;
                var ACalle = document.getElementById("AlumCalle").value;
                var AMunici =  document.getElementById("AlumMunicipio").value;
                var AEstado = document.getElementById("AlumEstado").value;
                var Usuar = document.getElementById("Usuario").value;
                var Contra = document.getElementById("Contrasenia").value;
                var ConfContra = document.getElementById("ConfContrasenia").value;
                var Esc = document.getElementById("Escuela").value;
                var Grup = document.getElementById("Grupo").value;
                var foto = document.getElementById("imagen").value;
                var check = 0;
                
                if(nom === ""){
                    alert("Completa el campo Nombre");
                    document.getElementById("Nombre").focus();
                    check++;
                }
                else
                    if(ApPat === ""){
                        alert("Completa el campo Apellido Paterno");
                        document.getElementById("ApPaterno").focus();
                        check++;
                    }
                    else
                        if(ApMat === ""){
                            alert("Completa el campo Apellido Materno");
                            document.getElementById("ApMaterno").focus();
                            check++;
                        }
                        else
                            if(FechNaci === ""){
                                alert("Completa el campo Fecha de Nacimiento");
                                document.getElementById("FechaNacimiento").focus();
                                check++;
                            }
                            else
                                if(CURP === "" || CURP.length < 18){
                                    alert("Completa el campo CURP");
                                    document.getElementById("Curp1").focus();
                                    check++;
                                }
                                else
                                    if(sexo === "OpcSexo"){
                                        alert("Completa el campo Sexo");
                                        document.getElementById("Sexo").focus();
                                        check++;
                                    }
                                    else
                                        if(TContac === "OpcContacto"){
                                            alert("Completa el campo Tipo de contacto");
                                            document.getElementById("TipoContacto").focus();
                                            check++;
                                        }
                                        else
                                            if(Contac === ""){
                                                alert("Completa el campo Contacto");
                                                document.getElementById("Contacto").focus();
                                                check++;
                                            }
                                            else
                                                if(ANumExt === ""){
                                                    alert("Completa el campo Numero exterior");
                                                    document.getElementById("AlumNumExt").focus();
                                                    check++;
                                                }
                                                else
                                                    if(ACalle === ""){
                                                        alert("Completa el campo Calle");
                                                        document.getElementById("AlumCalle").focus();
                                                        check++;
                                                    }
                                                    else
                                                        if(AMunici === ""){
                                                            alert("Completa el campo Municipio");
                                                            document.getElementById("AlumMunicipio").focus();
                                                            check++;
                                                        }
                                                        else
                                                            if(AEstado === "0"){
                                                                alert("Completa el campo Estado");
                                                                document.getElementById("AlumEstado").focus();
                                                                check++;
                                                            }
                                                            else
                                                                if( Usuar === ""){
                                                                    alert("Completa el campo Usuario");
                                                                    document.getElementById("Usuario").focus();
                                                                    check++;
                                                                }
                                                                else
                                                                    if( Contra === ""){
                                                                        alert("Completa el campo Contraseña");
                                                                        document.getElementById("Contrasenia").focus();
                                                                        check++;
                                                                    }
                                                                    else
                                                                        if( ConfContra === ""){
                                                                            alert("Completa el campo Confirmar Contraseña");
                                                                            document.getElementById("ConfContrasenia").focus();
                                                                            check++;
                                                                        }
                                                                        else
                                                                            if( foto === ""){
                                                                                alert("Completa el campo Foto");
                                                                                document.getElementById("imagen").focus();
                                                                                check++;
                                                                            }
                                                                            else
                                                                                if( Esc === "0"){
                                                                                    alert("Completa el campo Escuela");
                                                                                    document.getElementById("Escuela").focus();
                                                                                    check++;
                                                                                }
                                                                                else
                                                                                    if(Grup === "0"){
                                                                                        alert("Completa el campo Grupo");
                                                                                        document.getElementById("Grupo").focus();
                                                                                        check++;
                                                                                    }
                                                                                    else
                                                                                        if(Contra !== ConfContra){
                                                                                            alert("Las contrasenias no coinciden");
                                                                                            document.getElementById("Contrasenia").focus();
                                                                                            check++;
                                                                                        }
                                                                                                      
                                                                                                            
                if(check === 0){
                    var result = confirm("¿Desea dar de alta este registro?");
                    if(result === true){
                        document.getElementById("DatosAlum").submit();
                    }
                    else{
                        alert("Registro cancelado");
                    }
                    
                    if(opcion ===  true){
                        document.getElementById("Nombre").value = "";
                        document.getElementById("ApPaterno").value = "";
                        document.getElementById("ApMaterno").value = "";
                        document.getElementById("FechaNacimiento").value = "";
                        document.getElementById("Curp1").value = "";
                        document.getElementById("Sexo").selectedIndex = null;
                        document.getElementById("TipoContacto").selectedIndex = null;
                        document.getElementById("Contacto").value = "";
                        document.getElementById("AlumNumExt").value = "";
                        document.getElementById("AlumCalle").value = "";
                        document.getElementById("AlumMunicipio").value = "";
                        document.getElementById("AlumEstado").selectedIndex = null;
                        document.getElementById("Usuario").value = "";
                        document.getElementById("Contrasenia").value = "";
                        document.getElementById("ConfContrasenia").value = "";
                        document.getElementById("Escuela").selectedIndex = null;
                        document.getElementById("Grupo").selectedIndex = null;
                        document.getElementById("Turno").value = "";
                        document.getElementById("imagen").value = null;
                    }
                }
            }
            function Agregar(){
                var esc = document.getElementById("Escuela").selectedIndex;
                if(esc === 1 || esc === 2 || esc === 5 || esc === 10){
                    document.getElementById("Grupo").disabled = false;
                    grupos = ["1IM1","1IM2","1IM3"];
                    for( i = 0; i < grupos.length;i++)
                        Grupo.options[i+1] = new Option(grupos[i]);
                }
                else
                    if(esc === 3 || esc === 6 || esc === 8){
                        document.getElementById("Grupo").disabled = false;
                        grupos = ["1IC1","1IC2","1IC3"];
                        for( i = 0; i < grupos.length;i++)
                            Grupo.options[i+1] = new Option(grupos[i]);
                    }
                    else
                        if(esc === 4 || esc === 7 || esc === 9){
                            document.getElementById("Grupo").disabled = false;
                            grupos = ["1IM1","1IM2","1IM3","1IV1","1IV2","1IV3"];
                            for( i = 0; i < grupos.length;i++)
                                Grupo.options[i+1] = new Option(grupos[i]);
                        }
                
            }
            function borrar(){
                Grupo.options[0].disabled = false;
                Turno.value = "";
                var contador = 0;
                var cuantos = Grupo.length;
                for(contador = 1; contador<=cuantos; contador++)
                    Grupo.options[1] = null;
            }
            
            function desplegarfecha(){
                alert(document.getElementById("FechaNacimiento").value);
            }
            
            function ActiTurno(){
                var grup = Grupo.options[Grupo.selectedIndex].value;
                if(grup === "1IM1" || grup === "1IM2" || grup === "1IM3"){
                    Turno.value = "1";
                }
                else
                    if(grup === "1IV1" || grup === "1IV2" || grup === "1IV3"){
                        Turno.value = "2";
                    }
                    else
                        if(grup === "1IC1" || grup === "1IC2" || grup === "1IC3"){
                            Turno.value = "3";
                        }
            }
        </script>
        <link rel="stylesheet" type="text/css" href="formulario.css">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Quicksand">
    </head>
    <body onload="cambio=setInterval('cambi()',3000)">
        <%
            Connection con=null;
            PreparedStatement sta;
            ResultSet resul=null;
            File archivo=null;
            List fileItems=null;
            HttpSession sesion=request.getSession();
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con=DriverManager.getConnection("jdbc:mysql://localhost/Proyecto","root","n0m3l0");
            }
            catch(SQLException error) {
                out.println(error.toString());
            }
            try{
                sta=con.prepareStatement("select Foto.Archivo as Foto,Foto.Nombre as Nombre_Foto,Datos_Cuenta.Usuario as Usuario,Datos_Cuenta.Contraseña as Contra,Direccion.Numero_Exterior as NE_Alum,Direccion.Calle as Calle_Alum,Direccion.Municipio as Muni_Alum,Direccion.Id_Estado as Id_Estado_Alum,Datos_Usuario.Apellido_Paterno as ApellidoP,Datos_Usuario.Apellido_Materno as ApellidoM,Datos_Usuario.Nombre as Nombre_Alum,Datos_Usuario.Fecha_Nacimiento as Fecha,Datos_Usuario.Id_Sexo as Id_Sexo_Alum,Alumno.Curp as Curp,Alumno.Id_Grupo as Id_Grupo_Alum,Alumno.Id_Escuela as Id_Escuela_Alum,Contacto.Id_TContacto as Id_TContac,Contacto.Descripcion as Contacto from Foto inner join Datos_Cuenta,Direccion,Datos_Usuario,Alumno,Contacto,Relacion_Usuario_Contacto where Datos_Usuario.Id_Foto=Foto.Id_Foto and Datos_Usuario.Id_Datos_Usuario=Alumno.Id_Datos_Usuario and Datos_Usuario.Id_Direccion=Direccion.Id_Direccion and Contacto.Id_Contacto=Relacion_Usuario_Contacto.Id_Contacto and Relacion_Usuario_Contacto.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Datos_Usuario.Id_Datos_Cuenta=Datos_Cuenta.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=?;");
                sta.setInt(1, (int)(sesion.getAttribute("Id")));
                resul=sta.executeQuery();
                if(resul.next()){
                    out.println("<div style='position: absolute; right: 20%; left: 20%;'><div>");
                    out.println("<center><h1>Bienvenido Alumno</h1></center>");
                    out.println("<h3>Complete todos los campos para continuar</h3>");
                    out.println("</div>");
                    out.println("<div>");
                    out.println("<form action='actualizar_alumno.jsp' method='post' id='DatosAlum' name='DatosAlum' enctype='multipart/form-data'>");
                    out.println("<fieldset>");
                    out.println("<legend>Datos Personales</legend>");
                    out.println("Nombre(s): <input type='text' name='Nombre' id='Nombre' onkeypress='Validar()' placeholder='Nombre' onkeyup='Mayus4()' maxlength='50' value='"+resul.getString("Nombre_Alum")+"'>");
                    out.println("Apellido Paterno: <input type='text' name='ApPaterno' id='ApPaterno' onkeypress='Validar()' placeholder='Apellido Paterno' onkeyup='Mayus2()' maxlength='30' value='"+resul.getString("ApellidoP")+"'>");
                    out.println("Apellido Materno: <input type='text' name='ApMaterno' id='ApMaterno' onkeypress='Validar()' placeholder='Apellido Materno' onkeyup='Mayus3()' maxlength='30' value='"+resul.getString("ApellidoM")+"'>");
                    out.println("Fecha de Nacimiento: <input type='date' name='FechaNacimiento' id='FechaNacimiento' max='2004-12-31' min='1950-12-31' value='"+resul.getDate("Fecha")+"'>");
                    out.println("Curp: <input type='text' name='Curp1' id='Curp1' onkeypress='Validar3()' maxlength='18' placeholder='CURP' onkeyup='Mayus();' value='"+resul.getString("Curp")+"'>");
                    out.println("<input id='sexo1' value='"+resul.getInt("Id_Sexo_Alum")+"' type='text' name='sexo1' style='visibility: hidden; top: 0px; left: 0px; position: absolute;'>");
                    out.println("<select id='Sexo' name='Sexo' onclick='Desactivar()'>");
                    out.println("<option  value='OpcSexo' > Sexo </option>");
                    out.println("<option  value='1' > Masculino </option>");
                    out.println("<option  value='2'> Femenino </option>");
                    out.println("</select>");
                    out.println("<input id='tcontac1' value='"+resul.getInt("Id_TContac")+"' type='text' name='tcontac1' style='visibility: hidden; top: 0px; left: 0px; position: absolute;'>");
                    out.println("<select id='TipoContacto' name='TipoContacto' onchange='  SpawnContacto();' onclick='Desactivar()' >");
                    out.println("<option  value='OpcContacto' > Tipo de Contacto </option><option  value='1' > Telefono movil </option><option  value='2'> Telefono Casa </option><option  value='3'> Telefono Oficina </option><option  value='4'> E-mail </option>");
                    out.println("</select>");
                    out.println("<input type='text' id='Contacto' name='Contacto' disabled onkeypress='Validar4()' placeholder='Contacto' maxlength='30' value='"+resul.getString("Contacto")+"'>");
                    out.println("<fieldset>");
                    out.println("<legend>Direccion</legend>");
                    out.println("Numero Exterior: <input type='text' name='AlumNumExt' id='AlumNumExt' onkeypress='Validar2()' placeholder='Numero Exterior' maxlength='5' value='"+resul.getInt("NE_Alum")+"'>");
                    out.println("Calle: <input type='text' name='AlumCalle' id='AlumCalle' onkeyup='Mayus5()' onkeypress='Validar4()' placeholder='Calle' maxlength='60' value='"+resul.getString("Calle_Alum")+"'>");
                    out.println("Municipio: <input type='text' name='AlumMunicipio' id='AlumMunicipio' onkeyup='Mayus6()' onkeypress='Validar()' placeholder='Municipio' maxlength='30' value='"+resul.getString("Muni_Alum")+"'>");
                    out.println("<input id='estado1' value='"+resul.getInt("Id_Escuela_Alum")+"' type='text' name='estado1' style='visibility: hidden; top: 0px; left: 0px; position: absolute;'>");
                    out.println("Estado: <select id='AlumEstado' name='AlumEstado' onclick='Desactivar();'>");
                    out.println("<option  value='0' > Seleecione su Estado </option><option  value='1' > Ciudad de Mexico </option><option  value='2' > Aguascaliente </option><option  value='3' > Baja California </option><option  value='4' > Baja California Sur </option><option  value='5' > Campeche  </option><option  value='6' > Chihuahua </option><option  value='7' > Chiapas </option><option  value='8' > Coahuila  </option><option  value='9' > Colima </option><option  value='10' > Durango </option><option  value='11' > Guanajuato </option><option  value='12' > Guerrero </option><option  value='13' > Hidalgo </option><option  value='14' > Jalisco </option><option  value='15' > Estado de Mexico </option><option  value='16' > Michoacan </option><option  value='17' > Morelos </option><option  value='18' >  Nayarit</option><option  value='19' > Nuevo Leon </option><option  value='20' > Oaxaca </option><option  value='21' > Puebla </option><option  value='22' > Queretaro </option><option  value='23' > Quintana Roo </option><option  value='24' > San Luis Potosi </option><option  value='25' > Sinaloa  </option><option  value='26' > Sonora </option><option  value='27' > Tabasco </option><option  value='28' > Tamaulipas </option><option  value='29' > Tlaxcala </option><option  value='30' > Veracruz </option><option  value='31' > Yucatan </option><option  value='32' > Zacatecas </option>");
                    out.println("</select>");
                    out.println("</fieldset>");
                    out.println("</fieldset>");
                    out.println("<br>");
                    out.println("<fieldset>");
                    out.println("<legend> Datos Usuario</legend>");
                    out.println("Usuario: <input type='text' id='Usuario' name='Usuario' onkeypress='Validar4()' placeholder='Usuario' maxlength='30' value='"+resul.getString("Usuario")+"'>");
                    out.println("Contraseña <input type='password' id='Contrasenia' name='Contrasenia' onkeypress='Validar4()' placeholder='Contraseña' maxlength='20' value='"+resul.getString("Contra")+"'>");
                    out.println("Confirmar Contraseña <input type='password' id='ConfContrasenia' name='ConfContrasenia' onkeypress='Validar4()' placeholder='Confirmar Contraseña' maxlength='20' value='"+resul.getString("Contra")+"'>");
                    out.println("Foto de Perfil: <input accept='image/*' type='file' name='imagen' id='imagen' onchange='prevista(imagen)'>");
                    out.println("<br>");
                    ResultSet resul2=null;
                    sta=con.prepareStatement("select Foto.Id_Foto,Foto.Archivo,Foto.Nombre,Puntuacion.Cantidad from Foto inner join Datos_Cuenta,Datos_Usuario,Puntuacion,Alumno where Foto.Id_Foto=Datos_Usuario.Id_Foto and Datos_Usuario.Id_Datos_Cuenta=Datos_Cuenta.Id_Datos_Cuenta and Puntuacion.Id_Puntuacion=Alumno.Id_Puntuacion and Alumno.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=?;");
                    sta.setInt(1, (int)(sesion.getAttribute("Id")));
                    resul2=sta.executeQuery();
                    String aux=config.getServletContext().getRealPath("/");
                    String aux2="";
                    aux+="img/";
                    int aux3=0,aux4=0;
                    for (int i=0;i<aux.length();i++) {
                        if(aux.charAt(i)==92){
                            aux2+="/";
                        }
                        else{
                            aux2+=aux.charAt(i);
                        }
                    }
                    aux3=aux2.indexOf("/build");
                    aux4=aux3+6;
                    String aux5=aux2.substring(0, aux3)+aux.substring(aux4);
                    String filePath = aux5;
                    if(resul2.next()){
                        byte[] bytes=resul2.getBytes("Archivo");
                        FileUtils.writeByteArrayToFile(new File(filePath,resul2.getString("Nombre")), bytes);
                        archivo=new File(filePath+resul2.getString("Nombre"));
                        out.println("<input id='Ruta' value='"+("img/"+archivo.getName())+"' type='text' name='Ruta' style='visibility: hidden; top: 0px; left: 0px; position: absolute;'>");
                        out.println("<img id='previa' src='img/cargando.gif' style='width: 30%; heigth: 30%;'>");
                    }
                    out.println("</fieldset>");
                    out.println("<br>");
                    out.println("<fieldset>");
                    out.println("<legend>Datos Escolares</legend>");
                    ResultSet resul3=null;
                    sta=con.prepareStatement("select * from Escuela;");
                    resul3=sta.executeQuery();
                    out.println("<input id='escuela1' value='"+resul.getInt("Id_Escuela_Alum")+"' type='text' name='escuela1' style='visibility: hidden; top: 0px; left: 0px; position: absolute;'>");
                    out.println("<select id='Escuela' name='Escuela' onclick='Desactivar();' onchange='borrar(Grupo), Agregar();'>");
                    out.println("<option value='0'> Escuela </option>");
                    while(resul3.next()){
                        out.println("<option value='"+resul3.getInt("Id_Escuela")+"'>'"+resul3.getString("Nombre")+"'</option>");
                    }
                    out.println("</select>");
                    out.println("<input id='grupo1' value='"+resul.getInt("Id_Grupo_Alum")+"' type='text' name='grupo1' style='visibility: hidden; top: 0px; left: 0px; position: absolute;'>");
                    out.println("<select id='Grupo' name='Grupo' onclick='Desactivar()' onchange='ActiTurno()' disabled><option  value='0' > Grupo </option></select>");
                    out.println("<input type='text' id='Turno' name='Turno' style='visibility: hidden;'>");
                    out.println("</fieldset>");
                    out.println("<br>");
                    out.println("<input type='button' id='Aceptar' name='Aceptar' value='Aceptar' onclick='AceptarDatos();'>");
                    out.println("</form></div></div>");
                }
            }
            catch(SQLException e){
                out.println(e.getMessage());
            }
        %>
    </body>
</html>