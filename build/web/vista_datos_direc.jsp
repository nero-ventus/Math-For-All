<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="shortcut icon" href="img/pesta1.ico"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="formulario.css">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Quicksand">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
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
                document.getElementById("previa").style.heigth="30%";
            }
            function SpawnContacto(){
                R = TContacto.options[TContacto.selectedIndex].value;
                if( R ==="Telefono movil"  || R === "Telefono casa"  ||  R ==="Telefono oficina" ){
                    document.getElementById("Contacto").placeholder = "(55) 5555 5555";
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
            
            function Mayus(){
                var tecla = document.getElementById("RFC").value;
                var tecla2 = tecla.toUpperCase();
                document.getElementById("RFC").value = tecla2;
            }
            
            function Mayus2(){
                var tecla = document.getElementById("Apellido_Paterno").value;
                var tecla2 = tecla.toUpperCase();
                document.getElementById("Apellido_Paterno").value = tecla2;
            }
            
            function Mayus3(){
                var tecla = document.getElementById("Apellido_Materno").value;
                var tecla2 = tecla.toUpperCase();
                document.getElementById("Apellido_Materno").value = tecla2;
            }
            
            function Mayus4(){
                var tecla = document.getElementById("Nombre").value;
                var tecla2 = tecla.toUpperCase();
                document.getElementById("Nombre").value = tecla2;
            }
            
            function Mayus5(){
                var tecla = document.getElementById("Calle").value;
                var tecla2 = tecla.toUpperCase();
                document.getElementById("Calle").value = tecla2;
            }
            
            function Mayus6(){
                var tecla = document.getElementById("Municipio").value;
                var tecla2 = tecla.toUpperCase();
                document.getElementById("Municipio").value = tecla2;
            }
            
            function Mayus7(){
                var tecla = document.getElementById("Nombre_Escuela").value;
                var tecla2 = tecla.toUpperCase();
                document.getElementById("Nombre_Escuela").value = tecla2;
            }
            
            function Mayus8(){
                var tecla = document.getElementById("CCT_Escuela").value;
                var tecla2 = tecla.toUpperCase();
                document.getElementById("CCT_Escuela").value = tecla2;
            }
            
            function Mayus9(){
                var tecla = document.getElementById("Calle_Escuela").value;
                var tecla2 = tecla.toUpperCase();
                document.getElementById("Calle_Escuela").value = tecla2;
            }
            
            function Mayus10(){
                var tecla = document.getElementById("Municipio_Escuela").value;
                var tecla2 = tecla.toUpperCase();
                document.getElementById("Municipio_Escuela").value = tecla2;
            }
            
            
            function AcetarDatos(){
                var check = 0;
                var rfc = document.getElementById("RFC").value;
                
                if(document.getElementById("usuario").value === ""){
                    alert("Completa el campo Usuario");
                    document.getElementById("usuario").focus();
                    check++;
                }
                else
                    if(document.getElementById("contrasena").value === ""){
                        alert("Completa el campo Contraseña");
                        document.getElementById("contrasena").focus();
                        check++;
                    }
                    else
                        if(document.getElementById("conf_contrasena").value === ""){
                            alert("Completa el campo Confirmar Contraseña");
                            document.getElementById("conf_contrasena").focus();
                            check++;
                        }
                        else
                            if(document.getElementById("Apellido_Paterno").value === ""){
                                alert("Completa el campo Apellido Paterno");
                                document.getElementById("Apellido_Paterno").focus();
                                check++;
                            }
                            else
                                if(document.getElementById("Apellido_Materno").value === ""){
                                    alert("Completa el campo Apellido Materno");
                                    document.getElementById("Apellido_Materno").focus();
                                    check++;
                                }
                                else
                                    if(document.getElementById("Nombre").value === ""){
                                        alert("Completa el campo Nombre");
                                        document.getElementById("Nombre").focus();
                                        check++;
                                    }
                                    else
                                        if(document.getElementById("FechaN").value === ""){
                                            alert("Completa el campo Fecha de nacimiento");
                                            document.getElementById("FechaN").focus();
                                            check++;
                                        }
                                        else
                                            if(document.getElementById("Sexo").value === ""){
                                                alert("Completa el campo Sexo");
                                                document.getElementById("Sexo").focus();
                                                check++;
                                            }
                                            else
                                                if(document.getElementById("imagen").value === ""){
                                                    alert("Completa el campo imagen");
                                                    document.getElementById("imagen").focus();
                                                    check++;
                                                }
                                                else
                                                    if( rfc === "" || rfc.length < 12){
                                                        alert("Completa el campo RFC");
                                                        document.getElementById("RFC").focus();
                                                        check++;
                                                    }
                                                    else
                                                        if(document.getElementById("NExterior").value === ""){
                                                            alert("Completa el campo Numero Exterior");
                                                            document.getElementById("NExterior").focus();
                                                            check++;
                                                        }
                                                        else
                                                            if(document.getElementById("Calle").value === ""){
                                                                alert("Completa el campo Calle");
                                                                document.getElementById("Calle").focus();
                                                                check++;
                                                            }
                                                            else
                                                                if(document.getElementById("Municipio").value === ""){
                                                                    alert("Completa el campo Municipio");
                                                                    document.getElementById("Municipio").focus();
                                                                    check++;
                                                                }
                                                                else    
                                                                    if(document.getElementById("Estado").value === ""){
                                                                        alert("Completa el campo Estado");
                                                                        document.getElementById("Estado").focus();
                                                                        check++;
                                                                    }
                                                                    else
                                                                        if(document.getElementById("TContacto").value === ""){
                                                                            alert("Completa el campo Tipo de contacto");
                                                                            document.getElementById("TContacto").focus();
                                                                            check++;
                                                                        }
                                                                        else
                                                                            if(document.getElementById("Contacto").value === ""){
                                                                                alert("Completa el campo Contacto");
                                                                                document.getElementById("Contacto").focus();
                                                                                check++;
                                                                            }
                                                                            else
                                                                                if(document.getElementById("Nombre_Escuela").value === "" ){
                                                                                    alert("Completa el campo Nombre de la escuela");
                                                                                    document.getElementById("Nombre_Escuela").focus();
                                                                                    check++;
                                                                                }
                                                                                else
                                                                                    if(document.getElementById("CCT_Escuela").value === ""){
                                                                                        alert("Completa el campo CCT");
                                                                                        document.getElementById("CCT_Escuela").focus();
                                                                                        check++;
                                                                                    }
                                                                                    else
                                                                                        if(document.getElementById("TEscuela").value === ""){
                                                                                            alert("Completa el campo Tipo de Escuela");
                                                                                            document.getElementById("TEscuela").focus();
                                                                                            check++;
                                                                                        }
                                                                                        else
                                                                                            if(document.getElementById("NExterior_Escuela").value === ""){
                                                                                                alert("Completa el campo Numero Exterior de la Escuela");
                                                                                                document.getElementById("NExterior_Escuela").focus();
                                                                                                check++;
                                                                                            }
                                                                                            else
                                                                                                if(document.getElementById("Calle_Escuela").value === ""){
                                                                                                    alert("Completa el campo Calle de la Escuela");
                                                                                                    document.getElementById("Calle_Escuela").focus();
                                                                                                    check++;
                                                                                                }
                                                                                                else
                                                                                                    if(document.getElementById("Municipio_Escuela").value === ""){
                                                                                                        alert("Completa el campo Municipio de la Escuela");
                                                                                                        document.getElementById("Municipio_Escuela").focus();
                                                                                                        check++;
                                                                                                    }
                                                                                                    else
                                                                                                        if(document.getElementById("Estado_Escuela").value === ""){
                                                                                                            alert("Completa el campo Estado de la escuela");
                                                                                                            document.getElementById("Estado_Escuela").focus();
                                                                                                            check++;
                                                                                                        }
                                                                                                        else
                                                                                                            if(document.getElementById("contrasena").value !== document.getElementById("conf_contrasena").value ){
                                                                                                                alert("Las contraseñas no coinciden");
                                                                                                                document.getElementById("conf_contrasena").value = "";
                                                                                                                document.getElementById("conf_contrasena").focus();
                                                                                                                check++;
                                                                                                            }
                if(check === 0){
                    var result = confirm("¿Desea dar de alta este registro?");
                    if(result === true){
                        document.getElementById("datosdirector").submit();
                    }
                    else{
                        alert("Registro cancelado");
                    }
                    
                    if(opcion ===  true){
                        document.getElementById("Nombre").value = "";
                        document.getElementById("Apellido_Paterno").value = "";
                        document.getElementById("Apellido_Materno").value = "";
                        document.getElementById("FechaN").value = "";
                        document.getElementById("RFC").value = "";
                        document.getElementById("Sexo").selectedIndex = null;
                        document.getElementById("TContacto").selectedIndex = null;
                        document.getElementById("Contacto").value = "";
                        document.getElementById("NExterior").value = "";
                        document.getElementById("Calle").value = "";
                        document.getElementById("Municipio").value = "";
                        document.getElementById("Estado").selectedIndex = null;
                        document.getElementById("usuario").value = "";
                        document.getElementById("contrasena").value = "";
                        document.getElementById("conf_contrasena").value = "";
                        document.getElementById("Nombre_Escuela").selectedIndex = null;
                        document.getElementById("CCT_Escuela").value = "";
                        document.getElementById("TEscuela").selectedIndex = null
                        document.getElementById("NExterior_Escuela").value = "";
                        document.getElementById("Calle_Escuela").value = "";
                        document.getElementById("Municipio_Escuela").value = "";
                        document.getElementById("Estado_Escuela").selectedIndex = null;
                        document.getElementById("imagen").value = null;
                    }
                }                                                                                     
            }
        </script>
    </head>
    <body>
        <%
            Connection con=null;
            PreparedStatement sta;
            ResultSet resul=null,resul2=null;
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
                sta=con.prepareStatement("select Datos_Cuenta.Usuario,Datos_Cuenta.Contraseña,Datos_Usuario.Apellido_Paterno,Datos_Usuario.Apellido_Materno,Datos_Usuario.Nombre as Nombre_Direc,Datos_Usuario.Fecha_Nacimiento as Fecha,Datos_Usuario.Id_Sexo as Sexo,Foto.Archivo,Foto.Nombre as Nombre_Foto,Director.RFC,Director.Id_Escuela as Id,Direccion.Numero_Exterior as NExterior_Direc,Direccion.Calle as Calle_Direc,Direccion.Municipio as Muni_Direc,Direccion.Id_Estado as Estado_Direc,Contacto.Descripcion as Contacto,Contacto.Id_TContacto as TContac from Datos_Cuenta inner join Datos_Usuario,Foto,Director,Direccion,Contacto,Relacion_Usuario_Contacto where Datos_Usuario.Id_Direccion=Direccion.Id_Direccion and Relacion_Usuario_Contacto.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Relacion_Usuario_Contacto.Id_Contacto=Contacto.Id_Contacto and Datos_Usuario.Id_Datos_Usuario=Director.Id_Datos_usuario and Datos_Usuario.Id_Foto=Foto.Id_Foto and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=?;");
                sta.setInt(1, (int)(sesion.getAttribute("Id")));
                resul=sta.executeQuery();
                if(resul.next()){
                    out.println("<div style='position: absolute; right: 20%; left: 20%;'><form action='rdirector.jsp' id='datosdirector' method='post' enctype='multipart/form-data'><center><h1>Bienvenido Director</h1></center><h3>Complete todos los campos para continuar</h3><fieldset><legend>Datos de usuario</legend>");
                    out.println("Usuario: <input type='text' name='usuario' maxlength='30' id='usuario' placeholder='Usuario' onkeypress='Validar4()' value='"+resul.getString("Usuario")+"'>");
                    out.println("<br><br>");
                    out.println("Contraseña: <input type='password' name='contrasena' maxlength='20' id='contrasena' placeholder='Contraseña' onkeypress='Validar4()' value='"+resul.getString("Contraseña")+"'>");
                    out.println("<br><br>");
                    out.println("Confirmar Contraseña: <input type='password' name='conf_contrasena' maxlength='20' id='conf_contrasena' placeholder='Confirmar Contraseña' onkeypress='Validar4()' value='"+resul.getString("contraseña")+"'>");
                    out.println("<br><br>");
                    out.println("</fieldset><br><br><br><fieldset><legend>Datos Personales</legend>");
                    out.println("Apellido Paterno: <input type='text' maxlength='30' name='Apellido_Paterno' onkeyup='Mayus2()' id='Apellido_Paterno' placeholder='Apellido Paterno' onkeypress='Validar()' value='"+resul.getString("Apellido_Paterno")+"'>");
                    out.println("<br><br>");
                    out.println("Apellido Materno: <input type='text' maxlength='30' name='Apellido_Materno' onkeyup='Mayus3()' id='Apellido_Materno' placeholder='Apellido Materno' onkeypress='Validar()' value='"+resul.getString("Apellido_Materno")+"'>");
                    out.println("<br><br>");
                    out.println("Nombre(s): <input type='text' name='Nombre' maxlength='50' id='Nombre' onkeyup='Mayus4()' placeholder='Nombre(s)' onkeypress='Validar()' value='"+resul.getString("Nombre_Direc")+"'>");
                    out.println("<br><br>");
                    out.println("Fecha de Nacimiento<input type='date' name='FechaN' id='FechaN' value='"+resul.getDate("Fecha")+"'>");
                    out.println("<br><br>");
                    out.println("Sexo: <select name='Sexo' id='Sexo'><option selected disabled>Selecione alguno</option><option>Masculino</option><option>Femenino</option></select>");
                    out.println("<br><br>");
                    out.println("<input accept='image/*' type='file' name='imagen' id='imagen' onchange='prevista(imagen)' required>");
                    out.println("<br><br>");
                    out.println("<img style='visibility: hidden' id='previa' src='#'>");
                    out.println("<br><fieldset><legend>Datos de Director</legend>");
                    out.println("RFC: <input type='text' name='RFC' maxlength='13' id='RFC' onkeyup='Mayus()' placeholder='RFC' onkeypress='Validar3()' value='"+resul.getString("RFC")+"'>");
                    out.println("</fieldset><fieldset><legend>Direccion</legend>");
                    out.println("Numero Exterior: <input type='text' name='NExterior' maxlength='5' id='NExterior' placeholder='Numero Exterior' onkeypress='Validar2()' value='"+resul.getString("NExterior_Direc")+"'>");
                    out.println("<br><br>");
                    out.println("Calle: <input type='text' name='Calle' maxlength='60' id='Calle' placeholder='Calle' onkeypress='Validar()' onkeyup='Mayus5()' value='"+resul.getString("Calle_Direc")+"'>");
                    out.println("<br><br>");
                    out.println("Municipio: <input type='text' name='Municipio' maxlength='30' id='Municipio' onkeyup='Mayus6()' placeholder='Municipio' onkeypress='Validar()' value='"+resul.getString("Muni_Direc")+"'>");
                    out.println("<br><br>");
                    out.println("Estado: <select name='Estado' id='Estado'><option selected disabled>Selecione uno</option><option>Ciudad de Mexico</option><option>Aguascalientes</option><option>Baja California</option><option>Baja California Sur</option><option>Campeche</option><option>Chihuahua</option><option>Chiapas</option><option>Coahuila</option><option>Colima</option><option>Durango</option><option>Guanajuato</option><option>Guerrero</option><option>Hidalgo</option><option>Jalisco</option><option>Estado de Mexico</option><option>Michoacan</option><option>Morelos</option><option>Nayarit</option><option>Nuevo Leon</option><option>Oaxaca</option><option>Puebla</option><option>Queretaro</option><option>Quintana Roo</option><option>San Luis Potosi</option><option>Sinaloa</option><option>Sonora</option><option>Tabasco</option><option>Tamaulipas</option><option>Tlaxcala</option><option>Veracruz</option><option>Yucatan</option><option>Zacatecas</option></select>");
                    out.println("</fieldset><fieldset><legend>Datos de contacto</legend>");
                    out.println("<select name='TContacto' id='TContacto' onchange='SpawnContacto()'><option selected disabled>Selecione alguna</option><option>Telefono movil</option><option>Telefono casa</option><option>Telefono oficina</option><option>E-mail</option></select>");
                    out.println("<input type='text' name='Contacto' id='Contacto' placeholder='Contacto' disabled onkeypress='Validar4()' maxlength='30' value='"+resul.getString("Contacto")+"'>");
                    out.println("</fieldset></fieldset><br><br><br><fieldset><legend>Datos de Escuela</legend>");
                    sta=con.prepareStatement("select Escuela.Nombre,Escuela.CCT,Escuela.Id_TEscuela,Direccion.Numero_Exterior,Direccion.Calle,Direccion.Municipio,Direccion.Id_Estado from Direccion inner join Escuela where Direccion.Id_Direccion=Escuela.Id_Direccion and Escuela.Id_Escuela=?;");
                    sta.setInt(1, resul.getInt("Id"));
                    resul2=sta.executeQuery();
                    if(resul2.next()){
                        out.println("Nombre Escuela: <input type='text' maxlength='60' name='Nombre_Escuela' onkeyup='Mayus7()' id='Nombre_Escuela' placeholder='Nombre de la Escuela' onkeypress='Validar3()' value='"+resul2.getString("Nombre")+"'>");
                        out.println("<br><br>");
                        out.println("CCT: <input type='text' name='CCT_Escuela' maxlength='10' id='CCT_Escuela' placeholder='CCT' onkeypress='Validar3()' onkeyup='Mayus8()' value='"+resul2.getString("CCT")+"'>");
                        out.println("<br><br>");
                        out.println("Tipo de Escuela: <select name='TEscuela' id='TEscuela'><option selected disabled>Selecione alguno</option><option>Publica</option><option>Privada</option></select>");
                        out.println("<fieldset><legend>Direccion de la escuela</legend>");
                        out.println("Numero Exterior: <input type='text' maxlength='5' name='NExterior_Escuela' id='NExterior_Escuela' placeholder='Numero Exterior' onkeypress='Validar2()' value='"+resul2.getString("Numero_Exterior")+"'>");
                        out.println("<br><br>");
                        out.println("Calle: <input type='text' name='Calle_Escuela'  maxlength='60' id='Calle_Escuela' placeholder='Calle' onkeypress='Validar()' onkeyup='Mayus9()' value='"+resul2.getString("Calle")+"'>");
                        out.println("<br><br>");
                        out.println("Municipio: <input type='text' maxlength='30' onkeyup='Mayus10()' name='Municipio_Escuela' id='Municipio_Escuela' placeholder='Municipio' onkeypress='Validar()' value='"+resul2.getString("Municipio")+"'>");
                        out.println("<br><br>");
                        out.println("Estado: <select name='Estado_Escuela' id='Estado_Escuela'><option selected disabled>Selecione uno</option><option>Ciudad de Mexico</option><option>Aguascalientes</option><option>Baja California</option><option>Baja California Sur</option><option>Campeche</option><option>Chihuahua</option><option>Chiapas</option><option>Coahuila</option><option>Colima</option><option>Durango</option><option>Guanajuato</option><option>Guerrero</option><option>Hidalgo</option><option>Jalisco</option><option>Estado de Mexico</option><option>Michoacan</option><option>Morelos</option><option>Nayarit</option><option>Nuevo Leon</option><option>Oaxaca</option><option>Puebla</option><option>Queretaro</option><option>Quintana Roo</option><option>San Luis Potosi</option><option>Sinaloa</option><option>Sonora</option><option>Tabasco</option><option>Tamaulipas</option><option>Tlaxcala</option><option>Veracruz</option><option>Yucatan</option><option>Zacatecas</option></select>");
                        out.println("</fieldset></fieldset><br><input type='button' value='Enviar Datos' onclick='AcetarDatos()'></form></div>");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                    }
                }
            }
            catch(Exception e){
                out.println(e.getMessage());
            }
        %>
    </body>
</html>