<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="shortcut icon" href="img/pesta1.ico"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <title>Registro de Usuarios</title>
    </head>
    <body>
        <div style="position: absolute; right: 20%; left: 20%;">
            <div>
            <center><h1>Bienvenido Profesor</h1></center>
            <h3>Complete todos los campos para continuar</h3>
            </div>
                <div>
                    <form action="rmaestro.jsp" method="post" enctype="multipart/form-data" id="datosmaestro">
            <fieldset>
                <legend>Datos Personales</legend>
                Apellido Paterno: <input type="text"  name="Apellido_Paterno" id="Apellido_Paterno" placeholder="Apellido Paterno" onkeypress="Validar()" onkeyup="Mayus2()" maxlength="30">
                <br>
                <br>
                Apellido Materno: <input type="text" name="Apellido_Materno" id="Apellido_Materno" placeholder="Apellido Materno" onkeypress="Validar()" onkeyup="Mayus3()" maxlength="30">
                <br>
                <br>
                Nombre(s): <input type="text" name="Nombre" id="Nombre" placeholder="Nombre(s)" onkeypress="Validar()" onkeyup="Mayus4()" maxlength="50">
                <br>
                <br>
                Fecha de Nacimiento<input type="date" name="FechaN" id="FechaN">
                <br>
                <br>
                Sexo: <select name="Sexo" id="Sexo">
                    <option selected disabled>Selecione alguno</option>
                    <option>Masculino</option>
                    <option>Femenino</option>
                </select>
                <br>
                <br>
                <input accept="image/*" type="file" name="imagen" id="imagen" onchange="prevista(imagen)" >
                <br>
                <br>
                <img style="visibility: hidden" id="previa" src="#">
                <br>
                <fieldset>
                    <legend>Direccion</legend>
                    Numero Exterior: <input type="text" maxlength="5" name="NExterior" id="NExterior" placeholder="Numero Exterior" onkeypress="Validar2()">
                    <br>
                    <br>
                    Calle: <input type="text" name="Calle" maxlength="60" id="Calle" placeholder="Calle" onkeypress="Validar4()">
                    <br>
                    <br>
                    Municipio: <input type="text" name="Municipio" maxlength="30" id="Municipio" placeholder="Municipio" onkeypress="Validar()">
                    <br>
                    <br>
                    Estado: <select name="Estado" id="Estado">
                        <option selected disabled>Selecione uno</option>
                        <option>Ciudad de Mexico</option>
                        <option>Aguascalientes</option>
                        <option>Baja California</option>
                        <option>Baja California Sur</option>
                        <option>Campeche</option>
                        <option>Chihuahua</option>
                        <option>Chiapas</option>
                        <option>Coahuila</option>
                        <option>Colima</option>
                        <option>Durango</option>
                        <option>Guanajuato</option>
                        <option>Guerrero</option>
                        <option>Hidalgo</option>
                        <option>Jalisco</option>
                        <option>Estado de Mexico</option>
                        <option>Michoacan</option>
                        <option>Morelos</option>
                        <option>Nayarit</option>
                        <option>Nuevo Leon</option>
                        <option>Oaxaca</option>
                        <option>Puebla</option>
                        <option>Queretaro</option>
                        <option>Quintana Roo</option>
                        <option>San Luis Potosi</option>
                        <option>Sinaloa</option>
                        <option>Sonora</option>
                        <option>Tabasco</option>
                        <option>Tamaulipas</option>
                        <option>Tlaxcala</option>
                        <option>Veracruz</option>
                        <option>Yucatan</option>
                        <option>Zacatecas</option>
                    </select>
                </fieldset>
                
                <fieldset>
                    <legend>Datos de contacto</legend>
                    <select name="TContacto" id="TContacto" onchange="SpawnContacto()">
                        <option selected disabled>Selecione alguna</option>
                        <option>Telefono movil</option>
                        <option>Telefono casa</option>
                        <option>Telefono oficina</option>
                        <option>E-mail</option>
                    </select>
                    <input type="text" name="Contacto" id="Contacto" placeholder="Contacto" disabled maxlength="30" >
                </fieldset>
            </fieldset>
                        <br><br><br>
                        <fieldset>
                    <legend>Datos de Director</legend>
                    RFC: <input type="text" name="RFC" id="RFC" placeholder="RFC" onkeypress="Validar3();" onkeyup="Mayus(this);" maxlength="13">
                </fieldset>
            
            <br><br><br>
                        <fieldset>
                <legend>Datos de usuario</legend>
                <br>
                Usuario: <input type="text" maxlength="30" name="usuario" id="usuario" placeholder="Usuario" onkeypress="Validar4();">
                <br>
                <br>
                Contraseña: <input type="password" maxlength="20" name="contrasena" id="contrasena" placeholder="Contraseña" onkeypress="Validar4()">
                <br>
                <br>
                Confirmar Contraseña: <input type="password" maxlength="20" name="conf_contrasena" id="conf_contrasena" placeholder="Confirmar Contraseña" onkeypress="Validar4()">
            </fieldset>
            <br><br><br>
            
            <fieldset>
                    <legend>Datos de Escuela</legend>
                    <%
                        Connection con=null;
                        PreparedStatement sta;
                        ResultSet resul=null;
                        try {
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            con=DriverManager.getConnection("jdbc:mysql://localhost/Proyecto","root","n0m3l0");
                        }
                        catch(SQLException error) {
                            out.println(error.toString());
                        }
                        try{
                            sta=con.prepareStatement("select * from Escuela;");
                            resul=sta.executeQuery();
                            out.println("<select id='Escuela' name='Escuela'>");
                            out.println("<option value='0'> Escuela </option>");
                            while(resul.next()){
                                out.println("<option value="+resul.getInt("Id_Escuela")+">"+resul.getString("Nombre")+"</option>");
                            }
                            out.println("</select>");
                        }
                        catch(SQLException error) {
                            out.println(error.toString());
                        }
                    %>
                </fieldset>
                
                
            <br>
            <input type="button" value="Enviar Datos" onclick="ValidarDatos();">
            </form>
            </div>
        
        </div>
    </body>
</html>
