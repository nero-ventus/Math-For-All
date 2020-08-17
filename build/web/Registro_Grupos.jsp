<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
       <title>Registro Grupos Completado</title>
        <link rel="stylesheet" type="text/css" href="prueba.css">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Quicksand">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="img/pesta1.ico"/>
    </head>
    <body>
        <div class="principal" style="height: 100%; width: 100%; background-color: rgba(0,0,0,0.2);">
            <br><br><br><br><br><br><br><br><br><br><br><br>
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
                String Nombre=request.getParameter("Nombre_G");
                int Turno=Integer.parseInt(request.getParameter("Turno"));
                int id=(int)(sesion.getAttribute("Id"));
                sta=con.prepareCall("call sp_Grupo(0,?,?,?);");
                sta.setString(1, Nombre);
                sta.setInt(2, Turno);
                sta.setInt(3, id);
                sta.executeUpdate();
                out.println("<h1>Registro Realizado con Exito</h1>");
            }
            catch(SQLException e){
                out.println(e.getMessage());
            }
        %>
        <a href="Registro_Grupos.html"><button class="button">Regresar a registro de grupos</button></a>
        </div>
    </body>
</html>