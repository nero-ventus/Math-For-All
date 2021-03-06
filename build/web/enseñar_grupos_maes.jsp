<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="shortcut icon" href="img/pesta1.ico"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enseñar Grupos - Maestro</title>
        <link rel="stylesheet" type="text/css" href="prueba.css">
        <link rel="stylesheet" type="text/css" href="boton.css">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Quicksand">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <form action="registro_mg.jsp" method="post">
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
                    sta=con.prepareStatement("select Grupo.Id_Grupo,Grupo.Nombre from Grupo inner join Maestro,Datos_Usuario,Datos_Cuenta,Escuela,Relacion_Maestro_Escuela where Relacion_Maestro_Escuela.Id_Escuela=Grupo.Id_Escuela and Maestro.Id_Maestro=Relacion_Maestro_Escuela.Id_Maestro and Maestro.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=? group by Grupo.Id_Grupo;");
                    sta.setInt(1, (int)(sesion.getAttribute("Id")));
                    resul1=sta.executeQuery();
                    out.println("Grupos disponibles <select name='Grupos' id='Grupos'>");
                    out.println("<option disabled selected>Selecione un grupo</option>");
                    while(resul1.next()){
                        sta=con.prepareStatement("select Grupo.* from Grupo inner join Relacion_Maestro_Grupo where Relacion_Maestro_Grupo.Id_Grupo=Grupo.Id_Grupo and Grupo.Id_Grupo=?");
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
            <input type="submit" value="Enseñar Grupos">
        </form>
    </body>
</html>