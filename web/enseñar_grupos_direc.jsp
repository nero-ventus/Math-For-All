<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="shortcut icon" href="img/pesta1.ico"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enseñar Grupos - Director</title>
        <link rel="stylesheet" type="text/css" href="prueba.css">
        <link rel="stylesheet" type="text/css" href="boton.css">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Quicksand">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <a href="opcdirec.jsp"><button id="myBtn2"><i class="fa fa-home"></i></button></a>
         <div class="principal" style="height: 100%; width: 100%; background-color: rgba(0,0,0,0.2);">
            <br><br><br><br><br><br>
            <h1 style="font-weight: 900;">Enseñar Grupos - Director</h1>
            <br><br>
        <form action="registro_dg.jsp" method="post">
            <%
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
                    sta=con.prepareStatement("select Grupo.Id_Grupo,Grupo.Nombre from Grupo inner join Director,Datos_Usuario,Datos_Cuenta,Escuela where Director.Id_Escuela=Grupo.Id_Escuela and Director.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=? group by Grupo.Id_Grupo;");
                    sta.setInt(1, (int)(sesion.getAttribute("Id")));
                    resul1=sta.executeQuery();
                    out.println("<h3>Grupos disponibles</h3><select name='Grupos' id='Grupos'>");
                    out.println("<option disabled selected>Selecione un grupo</option>");
                    while(resul1.next()){
                        sta=con.prepareStatement("select Grupo.* from Grupo inner join Relacion_Director_Grupo where Relacion_Director_Grupo.Id_Grupo=Grupo.Id_Grupo and Grupo.Id_Grupo=?");
                        sta.setInt(1, resul1.getInt("Id_Grupo"));
                        resul2=sta.executeQuery();
                        if(!(resul2.next())){
                            out.println("<option value='"+resul1.getInt("Id_Grupo")+"'>"+resul1.getString("Nombre")+"</option>");
                        }
                    }
                    out.println("</select>");
                }
                catch(SQLException error) {
                    out.println(error.toString());
                }
            %>
            <br>
            <br>
            <input type="submit" value="Enseñar Grupos" class="button">
        </form>
    </body>
</html>