<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Registro de Usuarios</title>
        <link rel="shortcut icon" href="img/pesta1.ico"/>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script>
            
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
    <body>
        <div style="position: absolute; right: 20%; left: 20%;">
        <div> 
            <center><h1>Bienvenido Alumno</h1></center>
            <h3>Complete todos los campos para continuar</h3>
        </div>
        <div>
            <form action="ralumnos.jsp" method="post" id="DatosAlum" name="DatosAlum" enctype="multipart/form-data">
            <fieldset>
                <legend>Datos Personales</legend>
                Nombre(s): <input type="text" name="Nombre" id="Nombre" onkeypress="Validar()" placeholder="Nombre" onkeyup="Mayus4()" maxlength="50">
                Apellido Paterno: <input type="text" name="ApPaterno" id="ApPaterno" onkeypress="Validar()" placeholder="Apellido Paterno" onkeyup="Mayus2()" maxlength="30">
                Apellido Materno: <input type="text" name="ApMaterno" id="ApMaterno" onkeypress="Validar()" placeholder="Apellido Materno" onkeyup="Mayus3()" maxlength="30">
                Fecha de Nacimiento: <input type="date" name="FechaNacimiento" id="FechaNacimiento" max="2004-12-31" min="1950-12-31" >
                Curp: <input type="text" name="Curp1" id="Curp1" onkeypress="Validar3()" maxlength="18" placeholder="CURP" onkeyup="Mayus();">
                <select id="Sexo" name="Sexo" onclick="Desactivar()">
                        <option  value="OpcSexo" > Sexo </option>
                        <option  value="1" > Masculino </option>
                        <option  value="2"> Femenino </option>
                </select>
                
                <select id="TipoContacto" name="TipoContacto" onchange="  SpawnContacto();" onclick="Desactivar()" >
                        <option  value="OpcContacto" > Tipo de Contacto </option>
                        <option  value="1" > Telefono movil </option>
                        <option  value="2"> Telefono Casa </option>
                        <option  value="3"> Telefono Oficina </option>
                        <option  value="4"> E-mail </option>
                </select>
                
                <input type="text" id="Contacto" name="Contacto" disabled onkeypress="Validar4()" placeholder="Contacto" maxlength="30">
                
                <fieldset>
                    <legend>Direccion</legend>
                        Numero Exterior: <input type="text" name="AlumNumExt" id="AlumNumExt" onkeypress="Validar2()" placeholder="Numero Exterior" maxlength="5">
                        Calle: <input type="text" name="AlumCalle" id="AlumCalle" onkeyup="Mayus5()" onkeypress="Validar4()" placeholder="Calle" maxlength="60">
                        Municipio: <input type="text" name="AlumMunicipio" id="AlumMunicipio" onkeyup="Mayus6()" onkeypress="Validar()" placeholder="Municipio" maxlength="30">
                        <select id="AlumEstado" name="AlumEstado" onclick="Desactivar();">
                            <option  value="0" > Seleecione su Estado </option>
                            <option  value="1" > Ciudad de Mexico </option>
                            <option  value="2" > Aguascaliente </option>
                            <option  value="3" > Baja California </option>
                            <option  value="4" > Baja California Sur </option>
                            <option  value="5" > Campeche  </option>
                            <option  value="6" > Chihuahua </option>
                            <option  value="7" > Chiapas </option>
                            <option  value="8" > Coahuila  </option>
                            <option  value="9" > Colima </option>
                            <option  value="10" > Durango </option>
                            <option  value="11" > Guanajuato </option>
                            <option  value="12" > Guerrero </option>
                            <option  value="13" > Hidalgo </option>
                            <option  value="14" > Jalisco </option>
                            <option  value="15" > Estado de Mexico </option>
                            <option  value="16" > Michoacan </option>
                            <option  value="17" > Morelos </option>
                            <option  value="18" >  Nayarit</option>
                            <option  value="19" > Nuevo Leon </option>
                            <option  value="20" > Oaxaca </option>
                            <option  value="21" > Puebla </option>
                            <option  value="22" > Queretaro </option>
                            <option  value="23" > Quintana Roo </option>
                            <option  value="24" > San Luis Potosi </option>
                            <option  value="25" > Sinaloa  </option>
                            <option  value="26" > Sonora </option>
                            <option  value="27" > Tabasco </option>
                            <option  value="28" > Tamaulipas </option>
                            <option  value="29" > Tlaxcala </option>
                            <option  value="30" > Veracruz </option>
                            <option  value="31" > Yucatan </option>
                            <option  value="32" > Zacatecas </option>
                        </select>
                </fieldset>
                
            </fieldset>
            <br>
            <br>
            <br>
            <fieldset>
                <legend> Datos Usuario</legend>
                Usuario: <input type="text" id="Usuario" name="Usuario" onkeypress="Validar4()" placeholder="Usuario" maxlength="30">
                Contraseña <input type="password" id="Contrasenia" name="Contrasenia" onkeypress="Validar4()" placeholder="Contraseña" maxlength="20">
                Confirmar Contraseña <input type="password" id="ConfContrasenia" name="ConfContrasenia" onkeypress="Validar4()" placeholder="Confirmar Contraseña" maxlength="20">
                Foto de Perfil: <input accept="image/*" type="file" name="imagen" id="imagen" onchange="prevista(imagen)"  >
                <br>
                <img style="visibility: hidden" id="previa" src="#">
            </fieldset>
            
            <br>
            <br><br>
            <fieldset>
                <legend>Datos Escolares</legend>
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
                        out.println("<select id='Escuela' name='Escuela' onclick='Desactivar();' onchange='borrar(Grupo), Agregar();'>");
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
                <select id="Grupo" name="Grupo" onclick="Desactivar()" onchange="ActiTurno()" disabled>
                    <option  value="0" > Grupo </option>
                </select>
                <input type="text" id="Turno" name="Turno" style="visibility: hidden;">
            </fieldset>
            <br>
            <input type="button" id="Aceptar" name="Aceptar" value="Aceptar" onclick="AceptarDatos();">
        </form>
        </div>
        </div>
    </body>
</html>