<%@page import="org.apache.tomcat.util.http.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.util.List"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="prueba.css">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Quicksand">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="img/pesta1.ico"/>
        <title>Registro Preguntas Completado</title>
    </head>
    <body>
        <div class="principal" style="height: 100%; width: 100%; background-color: rgba(0,0,0,0.2);">
            
            <br><br><br><br><br><br><br><br><br><br><br><br>
            <h1>Registro Hecho</h1>
            <br>
        <%
            Connection con=null;
            PreparedStatement sta;
            File archivo=null;
            String opciones="";
            String tema="";
            String a="";
            String b="";
            String c="";
            String d="";
            String tipo="";
            String difi="";
            String auxz="";
            int tipo_subida=1;
            List fileItems=null;
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con=DriverManager.getConnection("jdbc:mysql://localhost/Proyecto","root","n0m3l0");
            }
            catch(SQLException error) {
                out.println(error.toString());
            }
            try {
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
                File file=null ;
                archivo= new File(aux5+"fantasma.png");
                int maxFileSize = 5000 * 1024;
                int maxMemSize = 5000 * 1024;
                ServletContext context = pageContext.getServletContext();
                String filePath = aux5;
                String contentType = request.getContentType();
                if ((contentType.indexOf("multipart/form-data") >= 0)) {
                   DiskFileItemFactory factory = new DiskFileItemFactory();
                   factory.setSizeThreshold(maxMemSize);
                   factory.setRepository(new File(filePath));
                   ServletFileUpload upload = new ServletFileUpload(factory);
                   upload.setSizeMax( maxFileSize );
                   try { 
                      fileItems = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(new ServletRequestContext(request));
                      Iterator i = fileItems.iterator();
                      while ( i.hasNext () ) {
                         FileItem fi = (FileItem)i.next();
                         if ( !fi.isFormField () ) {
                            String fieldName = fi.getFieldName();
                            String fileName = fi.getName();
                            boolean isInMemory = fi.isInMemory();
                            long sizeInBytes = fi.getSize();
                            if( fileName.lastIndexOf("\\") >= 0 ) {
                               file = new File( filePath + 
                               fileName.substring( fileName.lastIndexOf("\\"))) ;
                            }
                            else {
                               file = new File( filePath + 
                               fileName.substring(fileName.lastIndexOf("\\")+1)) ;
                            }
                            fi.write( file ) ;
                            archivo=new File(filePath+fileName);
                            tipo_subida=0;
                            //out.println("Archivo Subido");
                         }
                      }
                   }
                   catch(Exception ex) {
                      System.out.println(ex);
                   }
                   try{
                        List<FileItem> items = fileItems;
                        for (FileItem item : items) {
                            if (item.isFormField()) {
                                String fieldname = item.getFieldName();
                                String fieldvalue = item.getString();
                                if(fieldname.equals("pregunta")){
                                    auxz=fieldvalue;
                                }
                                else{
                                    if(fieldname.equals("opciones")){
                                        opciones=fieldvalue;
                                    }
                                    else{
                                        if(fieldname.equals("a")){
                                            a=fieldvalue;
                                        }
                                        else{
                                            if(fieldname.equals("b")){
                                                b=fieldvalue;
                                            }
                                            else{
                                                if(fieldname.equals("c")){
                                                    c=fieldvalue;
                                                }
                                                else{
                                                    if(fieldname.equals("d")){
                                                        d=fieldvalue;
                                                    }
                                                    else{
                                                        if(fieldname.equals("tipo")){
                                                            tipo=fieldvalue;
                                                        }
                                                        else{
                                                            if(fieldname.equals("tema")){
                                                                tema=fieldvalue;
                                                            }
                                                            else{
                                                                if(fieldname.equals("dificultad")){
                                                                    difi=fieldvalue;
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                   }
                   catch(Error e){
                       out.print(e.getMessage());
                   }
                }
                else {
                   out.println("<p>Archivo no subido</p>"); 
                }
                byte[] fileContent = null;
                try {
                    fileContent = FileUtils.readFileToByteArray(archivo);
                }
                catch (IOException e) {
                    out.print(e.getMessage());
                }
                int aux6=1,aux7=1,aux8=1,aux10=1,aux12=1,aux13=1,aux14=1;
                if(opciones.equals("a")){
                    aux7=1;
                }
                else {
                    aux7=2;
                }
                if(opciones.equals("b")){
                    aux6=1;
                }
                else {
                    aux6=2;
                }
                if(opciones.equals("c")){
                    aux8=1;
                }
                else {
                    aux8=2;
                }
                if(opciones.equals("d")){
                    aux10=1;
                }
                else {
                    aux10=2;
                }
                if(tema.equals("Numero")){
                    aux12=1;
                }
                else{
                    if(tema.equals("Adicion y sustraccion")){
                        aux12=2;
                    }
                    else{
                        if(tema.equals("Multiplicacion y division")){
                            aux12=3;
                        }
                        else{
                            if(tema.equals("Proporcionalidad")){
                                aux12=4;
                            }
                            else{
                                if(tema.equals("Ecuaciones")){
                                    aux12=5;
                                }
                                else{
                                    if(tema.equals("Funciones")){
                                        aux12=6;
                                    }
                                    else{
                                        if(tema.equals("Patrones, figuras geometricas y expresiones equivalentes")){
                                            aux12=7;
                                        }
                                        else{
                                            if(tema.equals("Figuras y cuerpos geometricos")){
                                                aux12=8;
                                            }
                                            else{
                                                if(tema.equals("Magnitudes y medidas")){
                                                    aux12=9;
                                                }
                                                else{
                                                    if(tema.equals("Estadistica")){
                                                        aux12=10;
                                                    }
                                                    else{
                                                        if(tema.equals("Probabilidad")){
                                                            aux12=11;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                if(tipo.equals("Cuestionario")){
                    aux13=1;
                }
                else{
                    if(tipo.equals("Problemario")){
                        aux13=2;
                    }
                    else{
                        if(tipo.equals("Examen")){
                            aux13=3;
                        }
                        else{
                            if(tipo.equals("Examen Sorpresa")){
                                aux13=4;
                            }
                        }
                    }
                }
                if(difi.equals("Facil")){
                    aux14=1;
                }
                else{
                    if(difi.equals("Media")){
                        aux14=2;
                    }
                    else{
                        if(difi.equals("Dificil")){
                            aux14=3;
                        }
                    }
                }
                sta=con.prepareCall("call sp_pregunta("+tipo_subida+",?,?,?,?,?,?,?,?,?,?,?,?,?,?);");
                sta.setBytes(1, fileContent);
                sta.setString(2, archivo.getName());
                sta.setString(3, a);
                sta.setInt(4, aux7);
                sta.setString(5, b);
                sta.setInt(6, aux6);
                sta.setString(7, c);
                sta.setInt(8, aux8);
                sta.setString(9, d);
                sta.setInt(10, aux10);
                sta.setString(11, auxz);
                sta.setInt(12, aux12);
                sta.setInt(13, aux13);
                sta.setInt(14, aux14);
                sta.executeUpdate();
                con.close();
                if(tipo_subida==0){
                    archivo.delete();
                }
            }
            catch(SQLException error){
                out.println(error.toString());
            }
        %>
        <a href="Registro_Preguntas.html" class="button">Regresar al registro</a>
        </div>
    </body>
</html>