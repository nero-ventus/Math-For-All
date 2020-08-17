<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>Maestro</title>
<meta charset="UTF-8">
<link rel="shortcut icon" href="img/pesta1.ico"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="inicio.css">
<link rel="stylesheet" type="text/css" href="sesion.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Quicksand">
<link rel="stylesheet" type="text/css" href="barra_usuario.css">
<script>
    function cambi(){
        var aux1="FPerfil",aux2="Ruta";
        if(!(document.getElementById(aux2)===null)){
            document.getElementById(aux1).src=document.getElementById(aux2).value;
        }
    }
</script>
<style>
body,h1,h2,h3,h4,h5 {font-family: "Quicksand", sans-serif}
body {font-size:16px;}
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1}
</style>
<body onload="cambio=setInterval('cambi()',3000)">

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-red w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Cerrar Menú.</a>
  <div class="w3-container">
    <h3 class="w3-padding-64"><b>GOLDEN CODE<br>SOFTWARE</b></h3>
  </div>
  <div class="w3-bar-block">
      <a href="Gestion de Grupos Maestro.html" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Gestion de Grupos</a>
      <a href="imprimir_opciones_maes.html" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Impresion de datos</a>
      <a href="Perfil_Maestro.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Perfil</a>
      <a href="Registro_Preguntas_1.html" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Registro de Preguntas</a>
      <a href="Tablero de posiciones.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Tablero de Posiciones</a>
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
                sta=con.prepareStatement("select Foto.Id_Foto,Foto.Archivo,Foto.Nombre from Foto inner join Datos_Cuenta,Datos_Usuario where Foto.Id_Foto=Datos_Usuario.Id_Foto and Datos_Usuario.Id_Datos_Cuenta=Datos_Cuenta.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=?;");
                sta.setInt(1, (int)(sesion.getAttribute("Id")));
                resul=sta.executeQuery();
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
                if(resul.next()){
                    byte[] bytes=resul.getBytes("Archivo");
                    FileUtils.writeByteArrayToFile(new File(filePath,resul.getString("Nombre")), bytes);
                    archivo=new File(filePath+resul.getString("Nombre"));
                    out.println("<a class='w3-bar-item w3-button w3-hover-white'> Maestro: "+sesion.getAttribute("Nombre")+"</a>");
                    out.println("<input id='Ruta' value='"+("img/"+archivo.getName())+"' type='text' name='Ruta' style='visibility: hidden; top: 0px; left: 0px; position: absolute;'>");
                    out.println("<div class='div1'>");
                    out.println("<img id='FPerfil' src='img/cargando.gif' class='img1'>");
                    out.println("</div>");
                }
            }
            catch(SQLException e){
                out.println(e.getMessage());
            }
            out.println("<form action='cerrar.jsp' method='post'>");
            out.println("<button type='submit' name='boton' id='boton'>Cerrar sesion</button>");
            out.println("</form>");
        %>
  </div>
</nav>
<div id="id01" class="modal">
  
    <form class="modal-content animate" action="inicio.jsp">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="img/avatar.png" alt="Avatar" class="avatar" style="width: 13%">
    </div>

    <div class="container">
      <label for="uname"><b>Usuario</b></label>
      <input type="text" placeholder="Escribe tu nombre" name="usuario" required>

      <label for="psw"><b>Contraseña</b></label>
      <input type="password" placeholder="Escribe tu contraseña" name="contra" required>
        
      <button type="submit">Iniciar sesión</button>
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancelar</button>
      <span class="psw">¿No tienes cuenta? <a href="#">¡Registrate!</a></span>
    </div>
  </form>
</div>



<!-- Top menu on small screens -->
<header class="w3-container w3-top w3-hide-large w3-red w3-xlarge w3-padding">
  <a href="javascript:void(0)" class="w3-button w3-red w3-margin-right" onclick="w3_open()">☰</a>
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:340px;margin-right:40px" id="principal">

  <!-- Header -->
  <div class="w3-container" style="margin-top:15px" id="showcase">
    <h1 class="w3-xxxlarge"><b>MATH FOR ALL.</b></h1>
    <h3 class="w3-large"><b>“Programando, haciendo gente exitosa en un mundo cambiante”.</b></h3>
    <h3 class="w3-large">Este proyecto ayudará a que los estudiantes de secundaria 
        logren mejorar sus capacidades cognitivas para el área de conocimientos de matemáticas y con ello evitar
        la deserción escolar, aumentar el nivel de conocimientos 
        en el área de matemáticas a nivel secundaria y mejorar el porcentaje del nivel académico en la prueba PLANEA.</h3>
    <hr style="width:50px;border:5px solid red" class="w3-round">
  </div>
  <br>
  
<!-- CARRUSEL -->
<div class="w3-content" style="max-width:100%">
    <img class="mySlides" src="img/registro.png" style="width:100%">
    <img class="mySlides" src="img/lecciones.png" style="width:100%">
    <img class="mySlides" src="img/aprender.png" style="width:100%">
    <img class="mySlides" src="img/escuelas.png" style="width:100%">
    <img class="mySlides" src="img/perfil.png" style="width:100%">
</div>

<div class="w3-center">
    <button class="w3-button demo" onclick="currentDiv(1)" style="width: 5%">1</button> 
  <button class="w3-button demo" onclick="currentDiv(2)" style="width: 5%">2</button> 
  <button class="w3-button demo" onclick="currentDiv(3)" style="width: 5%">3</button> 
  <button class="w3-button demo" onclick="currentDiv(4)" style="width: 5%">4</button> 
  <button class="w3-button demo" onclick="currentDiv(5)" style="width: 5%">5</button> 
</div>
<!-- End page content -->
</div>

<!-- W3.CSS Container -->
<div class="w3-light-grey w3-container w3-padding-32" style="margin-top:20px;padding-right:58px"><p class="w3-right">Creado por GOLDEN CODE SOFTWARE</p></div>

<script>
// Script to open and close sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
    document.getElementById("principal").style.margin.top ="20px";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}

// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}

// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target === modal) {
        modal.style.display = "none";
    }
};
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1;}    
  if (n < 1) {slideIndex = x.length;}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-red", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-red";
}
</script>

</body>
</html>