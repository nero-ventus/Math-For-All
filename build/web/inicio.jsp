<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="shortcut icon" href="img/pesta1.ico"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <script>
            function presionar(){
                document.getElementById('boton').form.submit();
            }
            function regreso(){
                alert("Datos erroneos de sesion");
                window.location.replace('todos.html'); 
            }
        </script>
    </head>
    <body>
        <%
            String usuario=request.getParameter("usuario"),contra=request.getParameter("contra");
            Connection con=null;
            PreparedStatement sta;
            ResultSet resul1=null,resul2=null;
            HttpSession sesion=request.getSession();
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con=DriverManager.getConnection("jdbc:mysql://localhost/Proyecto","root","n0m3l0");
            }
            catch(SQLException error) {
                out.println(error.toString());
            }
            try {
                sta=con.prepareStatement("select Datos_Cuenta.Id_Datos_Cuenta as Id from Datos_Cuenta where Datos_Cuenta.Usuario=? and Datos_Cuenta.Contraseña=?;");
                sta.setString(1, usuario);
                sta.setString(2, contra);
                resul1=sta.executeQuery();
                if(resul1.next()){
                    sesion.setAttribute("Id", resul1.getInt("Id"));
                    sesion.setAttribute("Usuario", usuario);
                    sesion.setAttribute("Contra", contra);
                    sta=con.prepareStatement("select Datos_Usuario.Nombre as Nombre from Datos_Usuario inner join Datos_Cuenta,Alumno where Datos_Cuenta.Id_Datos_Cuenta=? and Datos_Usuario.Id_Datos_Cuenta=Datos_Cuenta.Id_Datos_Cuenta and Datos_Usuario.Id_Datos_Usuario=Alumno.Id_Datos_Usuario;");
                    sta.setInt(1, resul1.getInt("Id"));
                    resul2=sta.executeQuery();
                    if(resul2.next()){
                        sesion.setAttribute("Nombre", resul2.getString("Nombre"));
                        out.println("<form action='opcalum.jsp' method='post'>");
                        out.println("<input type='submit' name='boton' id='boton' style='visibility: hidden;'>");
                        out.println("</form>");
                        out.print("<script>presionar();</script>");
                    }
                    else{
                        sta=con.prepareStatement("select Datos_Usuario.Nombre as Nombre from Datos_Usuario inner join Datos_Cuenta,Maestro where Datos_Cuenta.Id_Datos_Cuenta=? and Datos_Usuario.Id_Datos_Cuenta=Datos_Cuenta.Id_Datos_Cuenta and Datos_Usuario.Id_Datos_Usuario=Maestro.Id_Datos_Usuario;");
                        sta.setInt(1, resul1.getInt("Id"));
                        resul2=sta.executeQuery();
                        if(resul2.next()){
                            sesion.setAttribute("Nombre", resul2.getString("Nombre"));
                            out.println("<form action='opcmaes.jsp' method='post'>");
                            out.println("<input type='submit' name='boton' id='boton' style='visibility: hidden;'>");
                            out.println("</form>");
                            out.print("<script>presionar();</script>");
                        }
                        else{
                            sta=con.prepareStatement("select Datos_Usuario.Nombre as Nombre from Datos_Usuario inner join Datos_Cuenta,Director where Datos_Cuenta.Id_Datos_Cuenta=? and Datos_Usuario.Id_Datos_Cuenta=Datos_Cuenta.Id_Datos_Cuenta and Datos_Usuario.Id_Datos_Usuario=Director.Id_Datos_Usuario;");
                            sta.setInt(1, resul1.getInt("Id"));
                            resul2=sta.executeQuery();
                            if(resul2.next()){
                                sesion.setAttribute("Nombre", resul2.getString("Nombre"));
                                out.println("<form action='opcdirec.jsp' method='post'>");
                                out.println("<input type='submit' name='boton' id='boton' style='visibility: hidden;'>");
                                out.println("</form>");
                                out.print("<script>presionar();</script>");
                            }
                        }
                    }
                }
                else{
                    out.println("<script>regreso();</script>");
                }
            }
            catch(SQLException error) {
                out.println(error.toString());
            }
        %>
    </body>
</html>