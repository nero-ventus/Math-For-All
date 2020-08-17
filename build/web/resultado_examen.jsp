<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="prueba.css">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Quicksand">
        <title>Resultados examen</title>
        <link rel="shortcut icon" href="img/pesta1.ico"/>
    </head>
    <body>
        <%
            int puntuacion=0,auxi=Integer.parseInt(request.getParameter("cuantas"));
            double auxip=0;
            HttpSession sesion=request.getSession();
            for (int i=1;i<=auxi;i++) {
                String aux="opciones"+Integer.toString(i);
                if(request.getParameter(aux).equals("Correcta")){
                    auxip+=(double)10/auxi;
                }
            }
            puntuacion=(int)(auxip);
            out.println("<h3>Puntuacion: "+puntuacion+"</h3>");
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
                int type=(int)(sesion.getAttribute("Recarga"));
                if(type==1){
                    sta=con.prepareStatement("select Puntuacion.Id_Puntuacion as Id_Puntos,Puntuacion.Cantidad as Puntos from Puntuacion inner join Alumno,Datos_Usuario,Datos_Cuenta where Puntuacion.Id_Puntuacion=Alumno.Id_Puntuacion and Alumno.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Datos_Usuario.Id_Datos_Cuenta=Datos_Cuenta.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=?;");
                    sta.setInt(1, (int)(sesion.getAttribute("Id")));
                    resul=sta.executeQuery();
                    if(resul.next() && puntuacion>=6){
                        out.println("<h3>Pasas de Nivel¡</h3>");
                        out.println("<h3>Puntuacion Total: "+(1+resul.getInt("Puntos"))+"</h3>");
                        sta=con.prepareStatement("update Puntuacion set Puntuacion.Cantidad=? where Puntuacion.Id_Puntuacion=?;");
                        sta.setInt(1, (1+resul.getInt("Puntos")));
                        sta.setInt(2, resul.getInt("Id_Puntos"));
                        sta.executeUpdate();
                    }
                    else{
                        out.println("<h3>No pasas de nivel</h3>");
                        out.println("<h3>Puntuacion Total: "+(resul.getInt("Puntos")-(10-puntuacion))+"</h3>");
                        sta=con.prepareStatement("update Puntuacion set Puntuacion.Cantidad=? where Puntuacion.Id_Puntuacion=?;");
                        sta.setInt(1, (resul.getInt("Puntos")-(10-puntuacion)));
                        sta.setInt(2, resul.getInt("Id_Puntos"));
                        sta.executeUpdate();
                    }
                    sesion.setAttribute("Recarga", 2);
                }
                else{
                    out.println("<h3>Resultado ya dado</h3>");
                }
            }
            catch(SQLException e){
                out.println(e.getMessage());
            }
        %>
        <a href="Aprender.jsp">Regresar a aprender</a>
    </body>
</html>