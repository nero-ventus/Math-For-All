<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="shortcut icon" href="img/pesta1.ico"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cerrar</title>
        <script>
            function regreso(){
                window.location.replace('todos.html'); 
            }
        </script>
    </head>
    <body>
        <%
            HttpSession sesion=request.getSession();
            sesion.invalidate();
            out.println("<script>regreso();</script>");
        %>
    </body>
</html>