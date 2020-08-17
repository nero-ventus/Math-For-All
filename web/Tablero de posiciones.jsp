<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="img/pesta1.ico"/>
        <link rel="stylesheet" type="text/css" href="prueba.css">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Quicksand">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Tablero de posiciones</title>
        <link rel="stylesheet" type="text/css" href="colores.css">
        <style>
        * {box-sizing: border-box}
        
        body,h1,h2,h3,h4,h5 {font-family: "Quicksand", sans-serif}
body {font-size:16px;}
        /* Set height of body and the document to 100% */
        body, html {
            height: 100%;
            margin: 0;
        }

        /* Style tab links */
        .tablink {
            background-color: rgba(0,0,0,0.2);;
            color: white;
            float: left;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 14px 16px;
            font-size: 25px;
            width: 33.333333333333333333333333333%;
        }

        .tablink:hover {
            background-color: #777;
        }

        /* Style the tab content (and add height:100% for full page content) */
        .tabcontent {
            color: white;
            display: none;
            padding: 100px 20px;
            height: 100%;
        }

        </style>
    </head>
    <body>
        
        <button class="tablink" onclick="openPage('Alumnos', this, '#555')" id="defaultOpen"><h2>ALUMNOS</h2></button>
        <button class="tablink" onclick="openPage('Grupos', this, '#555')"><h2>GRUPOS</h2></button>
        <button class="tablink" onclick="openPage('Escuelas', this, '#555')"><h2>ESCUELAS</h2></button>

<div id="Alumnos" class="tabcontent">
    <br><br><br>
    <h3>Alumnos</h3>
  <p>Calificaciones Alumnos</p> 
  <br>
  <center>  
  <table class="w3-table w3-striped w3-border">
    <tr>
      <th>Posici&oacuten &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
      <th>Escuela &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
      <th>Apellido&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
      <th>Nombre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
      <th>Nivel&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
      <th>Puntuaci&oacuten total</th>
    </tr>
    <%
        Connection con=null;
        PreparedStatement sta=null;
        ResultSet alumnos,alumnos2;
        HttpSession sesion=request.getSession();
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con=DriverManager.getConnection("jdbc:mysql://localhost/Proyecto","root","n0m3l0");
        }
        catch(SQLException error) {
            out.println(error.toString());
        }
        try{
            sta=con.prepareStatement("select Puntuacion.Cantidad,Escuela.Nombre as Nombre_Escuela,Datos_Usuario.Apellido_Paterno,Datos_Usuario.Apellido_Materno,Datos_Usuario.Nombre as Nombre_Alumno from Puntuacion inner join Escuela,Datos_Usuario,Alumno where Alumno.Id_Puntuacion=Puntuacion.Id_Puntuacion and Alumno.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Alumno.Id_Escuela=Escuela.Id_Escuela order by Puntuacion.Cantidad desc;");
            alumnos=sta.executeQuery();
            int i=0;
            while(alumnos.next() && i<6){
                if(!(i==5)){
                    out.println("<tr>");
                    out.println("<td>"+(i+1)+"</td>");
                    out.println("<td>"+alumnos.getString("Nombre_Escuela")+"</td>");
                    out.println("<td>"+alumnos.getString("Apellido_Paterno")+" "+alumnos.getString("Apellido_Materno")+"</td>");
                    out.println("<td>"+alumnos.getString("Nombre_Alumno")+"</td>");
                    if(alumnos.getInt("Cantidad")<23 && alumnos.getInt("Cantidad")>-1){
                        out.println("<td>1</td>");
                    }
                    else{
                        if(alumnos.getInt("Cantidad")<45 && alumnos.getInt("Cantidad")>22){
                            out.println("<td>2</td>");
                        }
                        else{
                            if(alumnos.getInt("Cantidad")<67 && alumnos.getInt("Cantidad")>44){
                                out.println("<td>3</td>");
                            }
                            else{
                                if(alumnos.getInt("Cantidad")<89 && alumnos.getInt("Cantidad")>66){
                                    out.println("<td>4</td>");
                                }
                                else{
                                    if(alumnos.getInt("Cantidad")<111 && alumnos.getInt("Cantidad")>88){
                                        out.println("<td>5</td>");
                                    }
                                }
                            }
                        }
                    }
                    out.println("<td>"+alumnos.getInt("Cantidad")+"</td>");
                    out.println("</tr>");
                }
                else{
                    if(!(sesion.getAttribute("Id")==null)){
                        sta=con.prepareStatement("select Puntuacion.Cantidad,Escuela.Nombre as Nombre_Escuela,Datos_Usuario.Apellido_Paterno,Datos_Usuario.Apellido_Materno,Datos_Usuario.Nombre as Nombre_Alumno from Puntuacion inner join Escuela,Datos_Usuario,Alumno,Datos_Cuenta where Alumno.Id_Puntuacion=Puntuacion.Id_Puntuacion and Alumno.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Alumno.Id_Escuela=Escuela.Id_Escuela and Datos_Usuario.Id_Datos_Cuenta=Datos_Cuenta.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=? order by Puntuacion.Cantidad desc;");
                        sta.setInt(1, (int)(sesion.getAttribute("Id")));
                        alumnos=sta.executeQuery();
                        if(alumnos.next()){
                            out.println("<tr>");
                            out.println("</tr>");
                            out.println("<tr>");
                            out.println("<th>Mis Datos</th>");
                            out.println("</tr>");
                            out.println("<tr>");
                            sta=con.prepareStatement("select count(Id_Puntuacion) as posicion from Puntuacion where Cantidad>=? order by Cantidad desc;");
                            sta.setInt(1, alumnos.getInt("Cantidad"));
                            alumnos2=sta.executeQuery();
                            if(alumnos2.next()){
                                out.println("<td>"+alumnos2.getInt("posicion")+"</td>");
                            }
                            out.println("<td>"+alumnos.getString("Nombre_Escuela")+"</td>");
                            out.println("<td>"+alumnos.getString("Apellido_Paterno")+" "+alumnos.getString("Apellido_Materno")+"</td>");
                            out.println("<td>"+alumnos.getString("Nombre_Alumno")+"</td>");
                            if(alumnos.getInt("Cantidad")<23 && alumnos.getInt("Cantidad")>-1){
                                out.println("<td>1</td>");
                            }
                            else{
                                if(alumnos.getInt("Cantidad")<45 && alumnos.getInt("Cantidad")>22){
                                    out.println("<td>2</td>");
                                }
                                else{
                                    if(alumnos.getInt("Cantidad")<67 && alumnos.getInt("Cantidad")>44){
                                        out.println("<td>3</td>");
                                    }
                                    else{
                                        if(alumnos.getInt("Cantidad")<89 && alumnos.getInt("Cantidad")>66){
                                            out.println("<td>4</td>");
                                        }
                                        else{
                                            if(alumnos.getInt("Cantidad")<111 && alumnos.getInt("Cantidad")>88){
                                                out.println("<td>5</td>");
                                            }
                                        }
                                    }
                                }
                            }
                            out.println("<td>"+alumnos.getInt("Cantidad")+"</td>");
                            out.println("</tr>");
                        }
                    }
                }
                i++;
            }
        }
        catch(SQLException e){
            out.print(e.getMessage());
        }
    %>
  </table>
  </center>
</div>

<div id="Grupos" class="tabcontent">
    <br><br><br>
  <h3>Grupos</h3>
  <center>
  <p>Calificaciones Grupos</p>
  <br>
  <table class="w3-table w3-striped w3-border">
    <tr>
      <th>Posici&oacuten &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
      <th>Grupo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
      <th>Puntuaci&oacuten promedio</th>
    </tr>
    <%
        ResultSet grupo,grupo2;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con=DriverManager.getConnection("jdbc:mysql://localhost/Proyecto","root","n0m3l0");
        }
        catch(SQLException error) {
            out.println(error.toString());
        }
        try{
            sta=con.prepareStatement("select sum(Puntuacion.Cantidad) as Cantidad,Grupo.Nombre from Puntuacion inner join Grupo,Alumno where Puntuacion.Id_Puntuacion=Alumno.Id_Puntuacion and Alumno.Id_Grupo=Grupo.Id_Grupo group by Grupo.Nombre order by Cantidad desc;");
            grupo=sta.executeQuery();
            int i=0;
            while(grupo.next() && i<6){
                if(!(i==5)){
                    out.println("<tr>");
                    out.println("<td>"+(i+1)+"</td>");
                    out.println("<td>"+grupo.getString("Nombre")+"</td>");
                    out.println("<td>"+grupo.getInt("Cantidad")+"</td>");
                    out.println("</tr>");
                }
                else{
                    if(!(sesion.getAttribute("Id")==null)){
                        sta=con.prepareStatement("select Puntuacion.Cantidad,Escuela.Nombre as Nombre_Escuela,Datos_Usuario.Apellido_Paterno,Datos_Usuario.Apellido_Materno,Datos_Usuario.Nombre as Nombre_Alumno from Puntuacion inner join Escuela,Datos_Usuario,Alumno,Datos_Cuenta where Alumno.Id_Puntuacion=Puntuacion.Id_Puntuacion and Alumno.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Alumno.Id_Escuela=Escuela.Id_Escuela and Datos_Usuario.Id_Datos_Cuenta=Datos_Cuenta.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=? order by Puntuacion.Cantidad desc;");
                        sta.setInt(1, (int)(sesion.getAttribute("Id")));
                        grupo=sta.executeQuery();
                        if(grupo.next()){
                            out.println("<tr>");
                            sta=con.prepareStatement("select count(Tablaaux.Id_Grupo) as posicion from (select sum(Puntuacion.Cantidad) as Cantidad,Grupo.Id_Grupo from Puntuacion inner join Grupo,Alumno where Puntuacion.Id_Puntuacion=Alumno.Id_Puntuacion and Alumno.Id_Grupo=Grupo.Id_Grupo and Cantidad>=? group by Grupo.Id_Grupo order by Cantidad desc) as Tablaaux;");
                            sta.setInt(1, grupo.getInt("Cantidad"));
                            grupo2=sta.executeQuery();
                            if(grupo2.next()){
                                out.println("<td>"+grupo2.getInt("posicion")+"</td>");
                            }
                            out.println("<td>"+grupo.getString("Nombre")+"</td>");
                            out.println("<td>"+grupo.getInt("Cantidad")+"</td>");
                            out.println("</tr>");
                        }
                    }
                }
                i++;
            }
        }
        catch(SQLException e){
            out.print(e.getMessage());
        }
    %>
  </table>
  </center>
</div>

<div id="Escuelas" class="tabcontent">
    <br><br><br>
  <h3>Escuelas</h3>
  <p>Califiacaciones Escuelas</p>
  <br>
  <center>
  <table class="w3-table w3-striped w3-border">
    <tr>
      <th>Posici&oacuten &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
      <th>Escuela secundaria&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
      <th>Tipo de escuela&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
      <th>Puntuaci&oacuten promedio</th>
    </tr>
    <%
        ResultSet escuela,escuela2;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con=DriverManager.getConnection("jdbc:mysql://localhost/Proyecto","root","n0m3l0");
        }
        catch(SQLException error) {
            out.println(error.toString());
        }
        try{
            sta=con.prepareStatement("select sum(Puntuacion.Cantidad) as Cantidad,Escuela.Nombre as Nombre,Tipo_Escuela.Descripcion as Tipo from Puntuacion inner join Escuela,Alumno,Tipo_Escuela where Puntuacion.Id_Puntuacion=Alumno.Id_Puntuacion and Tipo_Escuela.Id_TEscuela=Escuela.Id_TEscuela and Alumno.Id_Escuela=Escuela.Id_Escuela group by Escuela.Nombre order by Cantidad desc;");
            escuela=sta.executeQuery();
            int i=0;
            while(escuela.next() && i<6){
                if(!(i==5)){
                    out.println("<tr>");
                    out.println("<td>"+(i+1)+"</td>");
                    out.println("<td>"+escuela.getString("Nombre")+"</td>");
                    out.println("<td>"+escuela.getString("Tipo")+"</td>");
                    out.println("<td>"+escuela.getInt("Cantidad")+"</td>");
                    out.println("</tr>");
                }
                else{
                    if(!(sesion.getAttribute("Id")==null)){
                        sta=con.prepareStatement("select sum(Puntuacion.Cantidad) as Cantidad,Escuela.Nombre,Tipo_Escuela.Descripcion from Puntuacion inner join Escuela,Alumno,Tipo_Escuela,Datos_Usuario,Datos_Cuenta where Puntuacion.Id_Puntuacion=Alumno.Id_Puntuacion and Tipo_Escuela.Id_TEscuela=Escuela.Id_TEscuela and Alumno.Id_Escuela=Escuela.Id_Escuela and Alumno.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Datos_Usuario.Id_Datos_Cuenta=Datos_Cuenta.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=? group by Escuela.Nombre order by Cantidad desc;");
                        sta.setInt(1, (int)(sesion.getAttribute("Id")));
                        escuela=sta.executeQuery();
                        if(escuela.next()){
                            out.println("<tr>");
                            sta=con.prepareStatement("select count(Tablaaux.Id_Escuela) as posicion from (select sum(Puntuacion.Cantidad) as Cantidad,Escuela.Id_Escuela from Puntuacion inner join Escuela,Alumno where Puntuacion.Id_Puntuacion=Alumno.Id_Puntuacion and Alumno.Id_Escuela=Escuela.Id_Escuela and Cantidad>=0 group by Escuela.Id_Escuela order by Cantidad desc) as Tablaaux;");
                            sta.setInt(1, escuela.getInt("Cantidad"));
                            escuela2=sta.executeQuery();
                            if(escuela2.next()){
                                out.println("<td>"+escuela2.getInt("posicion")+"</td>");
                            }
                            out.println("<td>"+escuela.getString("Nombre")+"</td>");
                            out.println("<td>"+escuela.getString("Tipo")+"</td>");
                            out.println("<td>"+escuela.getInt("Cantidad")+"</td>");
                            out.println("</tr>");
                        }
                    }
                }
                i++;
            }
        }
        catch(SQLException e){
            out.print(e.getMessage());
        }
    %>
  </table>
  </center>
</div>

<script>
function openPage(pageName,elmnt,color) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.backgroundColor = "";
    }
    document.getElementById(pageName).style.display = "block";
    elmnt.style.backgroundColor = color;

}
// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
    </body>
</html>