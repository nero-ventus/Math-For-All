<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aprender</title>
        <link rel="shortcut icon" href="img/pesta1.ico"/>
        <link rel="stylesheet" type="text/css" href="prueba.css">
        <link rel="stylesheet" type="text/css" href="boton.css">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Quicksand">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
                                <a href="opcalum.jsp"><button id="myBtn"><i class="fa fa-home"></i></button></a>
                   
        <div class="principal" style="height: 100%; width: 100%; background-color: rgba(0,0,0,0.2);">
            <br><br><br><br><br><br><br>
            <h1>Aprender.</h1>
            <br>
        <a href="Cuestionarios y Problemarios.html"><button class="button">Cuestionarios y Problemarios</button></a>
        <br>
        <br>
        <%
            Connection con=null;
            PreparedStatement sta;
            HttpSession sesion=request.getSession();
            ResultSet resul=null;
            sesion.setAttribute("Recarga", 1);
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con=DriverManager.getConnection("jdbc:mysql://localhost/Proyecto","root","n0m3l0");
            }
            catch(SQLException error) {
                out.println(error.toString());
            }
            try{
                sta=con.prepareStatement("select Puntuacion.Id_Puntuacion as Id_Puntos,Puntuacion.Cantidad as Puntos from Puntuacion inner join Alumno,Datos_Usuario,Datos_Cuenta where Puntuacion.Id_Puntuacion=Alumno.Id_Puntuacion and Alumno.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Datos_Usuario.Id_Datos_Cuenta=Datos_Cuenta.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=?;");
                sta.setInt(1, (int)(sesion.getAttribute("Id")));
                resul=sta.executeQuery();
                if(resul.next()){
                    int Puntos=resul.getInt("Puntos");
                    if(Puntos==22 || Puntos==44 || Puntos==66 || Puntos==88){
                        out.println("<a href='examensubir.jsp'><button class='button'>Examen de nivel</button></a>");
                        out.println("<br><br>");
                    }
                    else{
                        out.println("<a disabled><button class='button' disabled>Examen de nivel</button></a>");
                        out.println("<br><br>");
                    }
                    int rando=(int)((Math.random()*10)+1);
                    if(rando==1){
                        out.println("<a href='examensor.jsp'><button class='button'>Examen Sorpresa</button></a>");
                        out.println("<br><br>");
                    }
                }
            }
            catch(SQLException error) {
                out.println(error.toString());
            }
        %>
    </body>
</html>