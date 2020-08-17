<%@page import="java.sql.*"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="shortcut icon" href="img/pesta1.ico"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Imprimir Escuela</title>
        <script>
            function regreso(){
                window.location.replace('datos.pdf'); 
            }
        </script>
    </head>
    <body onload="cambio=setInterval('regreso()',3000)">
        <%
            Connection con=null;
            PreparedStatement sta;
            ResultSet resul=null,alumnos=null;
            HttpSession sesion=request.getSession();
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con=DriverManager.getConnection("jdbc:mysql://localhost/Proyecto","root","n0m3l0");
            }
            catch(SQLException error) {
                out.println(error.toString());
            }
            try{
                sta=con.prepareStatement("select Escuela.Id_Escuela from Escuela inner join Datos_Usuario,Datos_Cuenta,Director where Escuela.Id_Escuela=Director.Id_Escuela and Director.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Datos_Usuario.Id_Datos_Cuenta=Datos_Cuenta.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=?;");
                sta.setInt(1, (int)(sesion.getAttribute("Id")));
                resul=sta.executeQuery();
                if(resul.next()){
                    String ruta=config.getServletContext().getRealPath("/");
                    sta=con.prepareStatement("select Grupo.Nombre as Grupo,Puntuacion.Cantidad,Escuela.Nombre as Nombre_Escuela,Datos_Usuario.Apellido_Paterno,Datos_Usuario.Apellido_Materno,Datos_Usuario.Nombre as Nombre_Alumno from Puntuacion inner join Escuela,Datos_Usuario,Alumno,Grupo,Director where Grupo.Id_Grupo=Alumno.Id_Grupo and Alumno.Id_Puntuacion=Puntuacion.Id_Puntuacion and Alumno.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Alumno.Id_Escuela=Director.Id_Escuela and Escuela.Id_Escuela=Alumno.Id_Escuela and Escuela.Id_Escuela=? order by Puntuacion.Cantidad desc;");
                    sta.setInt(1, resul.getInt("Id_Escuela"));
                    alumnos=sta.executeQuery();
                    Document documento=new Document();
                    FileOutputStream ficheropdf=new FileOutputStream(ruta+"\\datos.pdf");
                    int cuentas=0;
                    PdfWriter.getInstance(documento, ficheropdf).setInitialLeading(10);
                    documento.open();
                    documento.add(new Paragraph("Datos de la escuela"));
                    documento.add(new Paragraph(" "));
                    PdfPTable tabla=new PdfPTable(6);
                    tabla.addCell("Apellido");
                    tabla.addCell("Nombre");
                    tabla.addCell("Escuela");
                    tabla.addCell("Grupo");
                    tabla.addCell("Nivel");
                    tabla.addCell("Puntuacion");
                    while(alumnos.next()){
                        tabla.addCell(alumnos.getString("Apellido_Paterno")+" "+alumnos.getString("Apellido_Materno"));
                        tabla.addCell(alumnos.getString("Nombre_Alumno"));
                        tabla.addCell(alumnos.getString("Nombre_Escuela"));
                        tabla.addCell(alumnos.getString("Grupo"));
                        if(alumnos.getInt("Cantidad")<23 && alumnos.getInt("Cantidad")>-1){
                            tabla.addCell("1");
                        }
                        else{
                            if(alumnos.getInt("Cantidad")<45 && alumnos.getInt("Cantidad")>22){
                                tabla.addCell("2");
                            }
                            else{
                                if(alumnos.getInt("Cantidad")<67 && alumnos.getInt("Cantidad")>44){
                                    tabla.addCell("3");
                                }
                                else{
                                    if(alumnos.getInt("Cantidad")<89 && alumnos.getInt("Cantidad")>66){
                                        tabla.addCell("4");
                                    }
                                    else{
                                        if(alumnos.getInt("Cantidad")<111 && alumnos.getInt("Cantidad")>88){
                                            tabla.addCell("5");
                                        }
                                    }
                                }
                            }
                        }
                        tabla.addCell(Integer.toString(alumnos.getInt("Cantidad")));
                        cuentas++;
                    }
                    documento.add(tabla);
                    documento.close();
                }
            }
            catch(Exception e) {
                out.println("El error es "+e.getMessage());
            }
            out.println("<script>alert('Generado')</script>");
        %>
    </body>
</html>