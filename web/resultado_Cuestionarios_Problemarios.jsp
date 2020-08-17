<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="prueba.css">
        <link rel="stylesheet" type="text/css" href="boton.css">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Quicksand">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Resultados</title>
        <link rel="shortcut icon" href="img/pesta1.ico"/>
    </head>
    <body>
                        <a href="opcalum.jsp"><button id="myBtn"><i class="fa fa-home"></i></button></a>
                   
        <div class="principal" style="height: 100%; width: 100%; background-color: rgba(0,0,0,0.2);">
            <br><br><br><br><br><br><br>
            <h1>Estos son tus resultados:</h1>
            <br>
        <%
            int puntuacion=0;
            double auxip=0;
            HttpSession sesion=request.getSession();
            for (int i=1;i<16;i++) {
                String aux="opciones"+Integer.toString(i);
                if(request.getParameter(aux).equals("Correcta") && i<6){
                    auxip+=(double)2/5;
                    System.out.println(i);
                    System.out.println(auxip);
                }
                else{
                    if(request.getParameter(aux).equals("Correcta") && i<12){
                        auxip+=(double)4/6;
                        System.out.println(i);
                        System.out.println(auxip);
                    }
                    else{
                        if(request.getParameter(aux).equals("Correcta") && i<16){
                            auxip+=1;
                            System.out.println(i);
                            System.out.println(auxip);
                        }
                    }
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
                    if(resul.next()){
                        if((resul.getInt("Puntos")<23 && (puntuacion+resul.getInt("Puntos"))>22) || (resul.getInt("Puntos")<45 && (puntuacion+resul.getInt("Puntos"))>44) || (resul.getInt("Puntos")<67 && (puntuacion+resul.getInt("Puntos"))>66) || (resul.getInt("Puntos")<89 && (puntuacion+resul.getInt("Puntos"))>88) || (resul.getInt("Puntos")<111 && (puntuacion+resul.getInt("Puntos"))>110)){
                            if(resul.getInt("Puntos")<23 && (puntuacion+resul.getInt("Puntos"))>22){
                                out.println("<h3>Puntuacion Total: "+22+"</h3>");
                                sta=con.prepareStatement("update Puntuacion set Puntuacion.Cantidad=? where Puntuacion.Id_Puntuacion=?;");
                                sta.setInt(1, 22);
                                sta.setInt(2, resul.getInt("Id_Puntos"));
                                sta.executeUpdate();
                            }
                            else{
                                if(resul.getInt("Puntos")<45 && (puntuacion+resul.getInt("Puntos"))>44){
                                    out.println("<h3>Puntuacion Total: "+44+"</h3>");
                                    sta=con.prepareStatement("update Puntuacion set Puntuacion.Cantidad=? where Puntuacion.Id_Puntuacion=?;");
                                    sta.setInt(1, 44);
                                    sta.setInt(2, resul.getInt("Id_Puntos"));
                                    sta.executeUpdate();
                                }
                                else{
                                    if(resul.getInt("Puntos")<67 && (puntuacion+resul.getInt("Puntos"))>66){
                                        out.println("<h3>Puntuacion Total: "+66+"</h3>");
                                        sta=con.prepareStatement("update Puntuacion set Puntuacion.Cantidad=? where Puntuacion.Id_Puntuacion=?;");
                                        sta.setInt(1, 66);
                                        sta.setInt(2, resul.getInt("Id_Puntos"));
                                        sta.executeUpdate();
                                    }
                                    else{
                                        if(resul.getInt("Puntos")<89 && (puntuacion+resul.getInt("Puntos"))>88){
                                            out.println("<h3>Puntuacion Total: "+88+"</h3>");
                                            sta=con.prepareStatement("update Puntuacion set Puntuacion.Cantidad=? where Puntuacion.Id_Puntuacion=?;");
                                            sta.setInt(1, 88);
                                            sta.setInt(2, resul.getInt("Id_Puntos"));
                                            sta.executeUpdate();
                                        }
                                        else{
                                            if(resul.getInt("Puntos")<111 && (puntuacion+resul.getInt("Puntos"))>110){
                                                out.println("<h3>Puntuacion Total: "+110+"</h3>");
                                                sta=con.prepareStatement("update Puntuacion set Puntuacion.Cantidad=? where Puntuacion.Id_Puntuacion=?;");
                                                sta.setInt(1, 110);
                                                sta.setInt(2, resul.getInt("Id_Puntos"));
                                                sta.executeUpdate();
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        else{
                            out.println("<h3>Puntuacion Total: "+(puntuacion+resul.getInt("Puntos"))+"</h3>");
                            sta=con.prepareStatement("update Puntuacion set Puntuacion.Cantidad=? where Puntuacion.Id_Puntuacion=?;");
                            sta.setInt(1, (puntuacion+resul.getInt("Puntos")));
                            sta.setInt(2, resul.getInt("Id_Puntos"));
                            sta.executeUpdate();
                        }
                    }
                    sta=con.prepareCall("call sp_RelaAT(?,?);");
                    sta.setInt(1, (int)(sesion.getAttribute("Id")));
                    sta.setInt(2, Integer.parseInt(request.getParameter("tema")));
                    sta.executeUpdate();
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
        <br><br>
        <a href="Aprender.jsp"><button class="button">Regresar a aprender</button></a>
    </body>
</html>