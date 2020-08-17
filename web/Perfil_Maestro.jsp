<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil Maestro</title>
        <link rel="shortcut icon" href="img/pesta1.ico"/>
        <link rel="stylesheet" type="text/css" href="prueba.css">
        <link rel="stylesheet" type="text/css" href="perfil.css">
        <link rel="stylesheet" type="text/css" href="boton.css">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Quicksand">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <script>
            function cambi(){
                var aux1="FPerfil",aux2="Ruta";
                if(!(document.getElementById(aux2)===null)){
                    document.getElementById(aux1).src=document.getElementById(aux2).value;
                    clearInterval(cambio);
                }
            }
        </script>
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Quicksand">
    </head>
    <body onload="cambio=setInterval('cambi()',3000)">
        <a href='opcmaes.jsp'><button id='myBtn'><i class='fa fa-home'></i></button></a>
        <div class='principal' style='width:100%;height:100%;background-color: rgba(0,0,0,0.2);'><br><h1>Perfil Maestro</h1><br>
        <%
            Connection con=null;
            PreparedStatement sta;
            ResultSet resul=null;
            File archivo=null;
            List fileItems=null;
            HttpSession sesion=request.getSession();
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con=DriverManager.getConnection("jdbc:mysql://localhost/Proyecto","root","n0m3l0");
            }
            catch(SQLException error) {
                out.println(error.toString());
            }
            try{
                sta=con.prepareStatement("select Foto.Id_Foto,Foto.Archivo,Foto.Nombre from Foto inner join Datos_Cuenta,Datos_Usuario where Foto.Id_Foto=Datos_Usuario.Id_Foto and Datos_Usuario.Id_Datos_Cuenta=Datos_Cuenta.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=?;");
                sta.setInt(1, (int)(sesion.getAttribute("Id")));
                resul=sta.executeQuery();
                String aux=config.getServletContext().getRealPath("/");
                String aux2="";
                aux+="img/";
                int aux3=0,aux4=0;
                for (int i=0;i<aux.length();i++) {
                    if(aux.charAt(i)==92){
                        aux2+="/";
                    }
                    else{
                        aux2+=aux.charAt(i);
                    }
                }
                aux3=aux2.indexOf("/build");
                aux4=aux3+6;
                String aux5=aux2.substring(0, aux3)+aux.substring(aux4);
                String filePath = aux5;
                if(resul.next()){
                    byte[] bytes=resul.getBytes("Archivo");
                    FileUtils.writeByteArrayToFile(new File(filePath,resul.getString("Nombre")), bytes);
                    archivo=new File(filePath+resul.getString("Nombre"));
                    out.println("<div class='container'>");
                    out.println("<input id='Ruta' value='"+("img/"+archivo.getName())+"' type='text' name='Ruta' style='visibility: hidden; top: 0px; left: 0px; position: absolute'>");
                    out.println("<img id='FPerfil' src='img/cargando.gif' class='img1'>");
                    out.println("<h3 class='overlay'> Maestro: "+sesion.getAttribute("Nombre")+" &nbsp;&nbsp;</h3>");
                    out.println("</div>");
                    out.println("<br>");
                    out.println("<a href='vista_datos_maes.jsp'><button class='button'>Consultar datos</button></a>");
                    out.println("<br>");
                    out.println("<br>");
                    out.println("<a href='modificar_maes.jsp'><button class='button'>Modificar datos</button></a>");
                    out.println("<br>");
                    out.println("<br>");
                }
            }
            catch(SQLException e){
                out.println(e.getMessage());
            }
            out.println("<form action='cerrar.jsp' method='post'>");
            out.println("<input type='submit' name='boton' id='boton' class='button' value='Cerrar sesion'>");
            out.println("</form>");
            out.println("<br>");
        %>
        </div>
    </body>
</html>