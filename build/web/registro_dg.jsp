<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de grupo - director</title>
        <link rel="shortcut icon" href="img/pesta1.ico"/>
        <script>
            function regreso(){
                alert("Registro Hecho");
                window.location.replace('enseñar_grupos_direc.jsp'); 
            }
        </script>
    </head>
    <body>
        <%
            Connection con=null;
            PreparedStatement sta;
            HttpSession sesion=request.getSession();
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con=DriverManager.getConnection("jdbc:mysql://localhost/Proyecto","root","n0m3l0");
            }
            catch(SQLException error) {
                out.println(error.toString());
            }
            try{
                int Grupo=Integer.parseInt(request.getParameter("Grupos"));
                sta=con.prepareCall("call sp_RelaDG(0,?,?)");
                sta.setInt(1, (int)(sesion.getAttribute("Id")));
                sta.setInt(2, Grupo);
                sta.executeUpdate();
                out.println("<script>regreso();</script>");
            }
            catch(SQLException e){
                out.println(e.getMessage());
            }
        %>
    </body>
</html>