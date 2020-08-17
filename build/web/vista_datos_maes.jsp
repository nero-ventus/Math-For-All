<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos maestro</title>
        <link rel="shortcut icon" href="img/pesta1.ico"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
            function cambi(){
                var aux1="previa",aux2="Ruta";
                document.getElementById(aux1).src=document.getElementById(aux2).value;
                document.getElementById("Sexo").selectedIndex=document.getElementById("sexo1").value;
                document.getElementById("Escuela").selectedIndex=document.getElementById("escuela1").value;
                document.getElementById("TContacto").selectedIndex=document.getElementById("tcontac1").value;
                document.getElementById("Estado").selectedIndex=document.getElementById("estado1").value;
                clearInterval(cambio);
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
            
            function ValidarDatos(){
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
                                                    alert("Completa el campo Imagen");
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
                                                                            alert("Completa el campo Tipo de Contacto");
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
                                                                                if(document.getElementById("Escuela").value === ""){
                                                                                    alert("Completa el campo Escuela");
                                                                                    document.getElementById("Escuela").focus();
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
                        document.getElementById("datosmaestro").submit();
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
                        document.getElementById("Escuela").selectedIndex = null;
                        document.getElementById("imagen").value = null;
                    }
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
                sta=con.prepareStatement("select Foto.Archivo as Foto,Foto.Nombre as Nombre_Foto,Datos_Cuenta.Usuario as Usuario,Datos_Cuenta.Contraseña as Contra,Datos_Usuario.Apellido_Paterno as ApellidoP,Datos_Usuario.Apellido_Materno as ApellidoM,Datos_Usuario.Nombre as Nombre_Maes,Datos_Usuario.Fecha_Nacimiento as Fecha,Datos_Usuario.Id_Sexo,Direccion.Numero_Exterior as NE_Maes,Direccion.Calle as Calle_Maes,Direccion.Municipio as Muni_Maes,Direccion.Id_Estado as Id_Estado_Maes,Maestro.RFC,Contacto.Id_TContacto as Id_TContac,Contacto.Descripcion as Contacto,Escuela.Id_Escuela from Foto inner join  Datos_Cuenta,Direccion,Datos_Usuario,Maestro,Contacto,Relacion_Usuario_Contacto,Relacion_Maestro_Escuela,Escuela where Datos_Usuario.Id_Foto=Foto.Id_Foto and Datos_Usuario.Id_Datos_Usuario=Maestro.Id_Datos_Usuario  and Datos_Usuario.Id_Direccion=Direccion.Id_Direccion and Contacto.Id_Contacto=Relacion_Usuario_Contacto.Id_Contacto and Relacion_Usuario_Contacto.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Relacion_Maestro_Escuela.Id_Maestro=Maestro.Id_Maestro and Relacion_Maestro_Escuela.Id_Escuela=Escuela.Id_Escuela and Datos_Usuario.Id_Datos_Cuenta=Datos_Cuenta.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=?;");
                sta.setInt(1, (int)(sesion.getAttribute("Id")));
                resul=sta.executeQuery();
                if(resul.next()){
                    out.println("<div style='position: absolute; right: 20%; left: 20%;'><div>");
                    out.println("<center><h1>Bienvenido Profesor</h1></center>");
                    out.println("<h3>Complete todos los campos para continuar</h3>");
                    out.println("</div><div>");
                    out.println("<fieldset><legend>Datos Personales</legend>");
                    out.println("Apellido Paterno: <input type='text' disabled  name='Apellido_Paterno' id='Apellido_Paterno' placeholder='Apellido Paterno' onkeypress='Validar()' onkeyup='Mayus2()' maxlength='30' value='"+resul.getString("ApellidoP")+"'>");
                    out.println("<br><br>");
                    out.println("Apellido Materno: <input type='text' disabled name='Apellido_Materno' id='Apellido_Materno' placeholder='Apellido Materno' onkeypress='Validar()' onkeyup='Mayus3()' maxlength='30' value='"+resul.getString("ApellidoM")+"'>");
                    out.println("<br><br>");
                    out.println("Nombre(s): <input type='text' name='Nombre' disabled id='Nombre' placeholder='Nombre(s)' onkeypress='Validar()' onkeyup='Mayus4()' maxlength='50' value='"+resul.getString("Nombre_Maes")+"'>");
                    out.println("<br><br>");
                    out.println("Fecha de Nacimiento<input type='date' name='FechaN' disabled id='FechaN' value='"+resul.getDate("Fecha")+"'>");
                    out.println("<br><br>");
                    out.println("<input id='sexo1' disabled value='"+resul.getInt("Id_Sexo")+"' type='text' name='sexo1' style='visibility: hidden; top: 0px; left: 0px; position: absolute;'>");
                    out.println("Sexo: <select disabled name='Sexo' id='Sexo'><option selected disabled>Selecione alguno</option><option>Masculino</option><option>Femenino</option></select>");
                    out.println("<br><br>");
                    out.println("<input accept='image/*' disabled type='file' name='imagen' id='imagen' onchange='prevista(imagen)' >");
                    out.println("<br><br>");
                    ResultSet resul2=null;
                    sta=con.prepareStatement("select Foto.Id_Foto,Foto.Archivo,Foto.Nombre from Foto inner join Datos_Cuenta,Datos_Usuario,Maestro where Foto.Id_Foto=Datos_Usuario.Id_Foto and Datos_Usuario.Id_Datos_Cuenta=Datos_Cuenta.Id_Datos_Cuenta and Maestro.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=?;");
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
                        out.println("<input id='Ruta' disabled value='"+("img/"+archivo.getName())+"' type='text' name='Ruta' style='visibility: hidden; top: 0px; left: 0px; position: absolute;'>");
                        out.println("<img id='previa' disabled src='img/cargando.gif' style='width: 30%; heigth: 30%;'>");
                    }
                    out.println("<br><br>");
                    out.println("<br>");
                    out.println("<fieldset><legend>Direccion</legend>");
                    out.println("Numero Exterior: <input type='text' disabled maxlength='5' name='NExterior' id='NExterior' placeholder='Numero Exterior' onkeypress='Validar2()' value='"+resul.getInt("NE_Maes")+"'>");
                    out.println("<br><br>");
                    out.println("Calle: <input type='text' name='Calle' disabled maxlength='60' id='Calle' placeholder='Calle' onkeypress='Validar4()' value='"+resul.getString("Calle_Maes")+"'>");
                    out.println("<br><br>");
                    out.println("Municipio: <input type='text' name='Municipio'  disabled maxlength='30' id='Municipio' placeholder='Municipio' onkeypress='Validar()' value='"+resul.getString("Muni_Maes")+"'>");
                    out.println("<br><br>");
                    out.println("<input id='estado1' disabled value='"+resul.getInt("Id_Estado_Maes")+"' disabled type='text' name='estado1' style='visibility: hidden; top: 0px; left: 0px; position: absolute;'>");
                    out.println("Estado: <select disabled name='Estado' id='Estado'><option selected disabled>Selecione uno</option><option>Ciudad de Mexico</option><option>Aguascalientes</option><option>Baja California</option><option>Baja California Sur</option><option>Campeche</option><option>Chihuahua</option><option>Chiapas</option><option>Coahuila</option><option>Colima</option><option>Durango</option><option>Guanajuato</option><option>Guerrero</option><option>Hidalgo</option><option>Jalisco</option><option>Estado de Mexico</option><option>Michoacan</option><option>Morelos</option><option>Nayarit</option><option>Nuevo Leon</option><option>Oaxaca</option><option>Puebla</option><option>Queretaro</option><option>Quintana Roo</option><option>San Luis Potosi</option><option>Sinaloa</option><option>Sonora</option><option>Tabasco</option><option>Tamaulipas</option><option>Tlaxcala</option><option>Veracruz</option><option>Yucatan</option><option>Zacatecas</option></select>");
                    out.println("</fieldset><fieldset>");
                    out.println("<legend>Datos de contacto</legend>");
                    out.println("<input id='tcontac1' disabled value='"+resul.getInt("Id_TContac")+"' type='text' name='tcontac1' style='visibility: hidden; top: 0px; left: 0px; position: absolute;'>");
                    out.println("<select name='TContacto' disabled id='TContacto' onchange='SpawnContacto()'><option selected disabled>Selecione alguna</option><option>Telefono movil</option><option>Telefono casa</option><option>Telefono oficina</option><option>E-mail</option></select>");
                    out.println("<input type='text' disabled name='Contacto' id='Contacto' placeholder='Contacto' disabled maxlength='30' value='"+resul.getString("Contacto")+"'>");
                    out.println("</fieldset></fieldset>");
                    out.println("<br><br><br>");
                    out.println("<fieldset>");
                    out.println("<legend>Datos de Director</legend>");
                    out.println("RFC: <input type='text' disabled name='RFC' id='RFC' placeholder='RFC' onkeypress='Validar3();' onkeyup='Mayus(this);' maxlength='13' value='"+resul.getString("RFC")+"'>");
                    out.println("</fieldset>");
                    out.println("<br><br><br>");
                    out.println("<fieldset>");
                    out.println("<legend>Datos de usuario</legend>");
                    out.println("<br>");
                    out.println("Usuario: <input disabled type='text' maxlength='30' name='usuario' id='usuario' placeholder='Usuario' onkeypress='Validar4();' value='"+resul.getString("Usuario")+"'>");
                    out.println("<br><br>");
                    out.println("Contraseña: <input disabled type='password' maxlength='20' name='contrasena' id='contrasena' placeholder='Contraseña' onkeypress='Validar4()' value='"+resul.getString("Contra")+"'>");
                    out.println("<br><br>");
                    out.println("</fieldset><br><br><br><fieldset><legend>Datos de Escuela</legend>");
                    ResultSet resul3=null;
                    sta=con.prepareStatement("select * from Escuela;");
                    resul3=sta.executeQuery();
                    out.println("<input id='escuela1' disabled value='"+resul.getInt("Id_Escuela")+"' type='text' name='escuela1' style='visibility: hidden; top: 0px; left: 0px; position: absolute;'>");
                    out.println("<select id='Escuela' disabled name='Escuela'>");
                    out.println("<option value='0'> Escuela </option>");
                    while(resul3.next()){
                        out.println("<option value='"+resul3.getInt("Id_Escuela")+"'>'"+resul3.getString("Nombre")+"'</option>");
                    }
                    out.println("</select>");
                    out.println("</fieldset><br></div></div>");
                }
            }
            catch(SQLException e){
                out.println(e.getMessage());
            }
        %>
    </body>
</html>