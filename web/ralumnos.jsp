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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro Alumno</title>
        <link rel="shortcut icon" href="img/pesta1.ico"/>
    </head>
    <body>
        <%
            Connection con=null;
            PreparedStatement sta;
            File archivo=null;
            List fileItems=null;
            String Usuario_Alum="";
            String Contraseña_Alum="";
            int NExterior_Alum=0;
            String Calle_Alum="";
            String Municipio_Alum="";
            int Id_Estado_Alum=0;
            String ApellidoP_Alum="";
            String ApellidoM_Alum="";
            String Nombre_Alum="";
            String FechaN_Alum="";
            int Id_Sexo_Alum=0;
            String Curp_Alum="";
            int Id_Grupo=0;
            int Id_Escuela=0;
            int Id_Tipo_Contacto=0;
            String Descripcionn="";
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con=DriverManager.getConnection("jdbc:mysql://localhost/Proyecto","root","n0m3l0");
            }
            catch(SQLException error) {
                out.println(error.toString());
            }
            try{
                String aux=config.getServletContext().getRealPath("/");
                String aux2="";
                aux+="";
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
                         }
                      }
                   }
                   catch(Exception ex) {
                      System.out.println(ex);
                   }
                   try {
                       List<FileItem> items = fileItems;
                        for (FileItem item : items) {
                            if (item.isFormField()) {
                                String fieldname = item.getFieldName();
                                String fieldvalue = item.getString();
                                if(fieldname.equals("Usuario")){
                                    Usuario_Alum=fieldvalue;
                                }
                                else{
                                    if(fieldname.equals("Contrasenia")){
                                        Contraseña_Alum=fieldvalue;
                                    }
                                    else{
                                        if(fieldname.equals("ApPaterno")){
                                            ApellidoP_Alum=fieldvalue;
                                        }
                                        else{
                                            if(fieldname.equals("ApMaterno")){
                                                ApellidoM_Alum=fieldvalue;
                                            }
                                            else{
                                                if(fieldname.equals("Nombre")){
                                                    Nombre_Alum=fieldvalue;
                                                }
                                                else{
                                                    if(fieldname.equals("FechaNacimiento")){
                                                        FechaN_Alum=fieldvalue;
                                                    }
                                                    else{
                                                        if(fieldname.equals("Sexo")){
                                                            Id_Sexo_Alum=Integer.parseInt(fieldvalue);
                                                        }
                                                        else{
                                                            if(fieldname.equals("Curp1")){
                                                                Curp_Alum=fieldvalue;
                                                            }
                                                            else{
                                                                if(fieldname.equals("TipoContacto")){
                                                                    Id_Tipo_Contacto=Integer.parseInt(fieldvalue);
                                                                }
                                                                else{
                                                                    if(fieldname.equals("Contacto")){
                                                                        Descripcionn=fieldvalue;
                                                                    }
                                                                    else{
                                                                        if(fieldname.equals("AlumMunicipio")){
                                                                            Municipio_Alum=fieldvalue;
                                                                        }
                                                                        else{
                                                                            if(fieldname.equals("AlumEstado")){
                                                                                Id_Estado_Alum=Integer.parseInt(fieldvalue);
                                                                            }
                                                                            else{
                                                                                if(fieldname.equals("AlumNumExt")){
                                                                                    NExterior_Alum=Integer.parseInt(fieldvalue);
                                                                                }
                                                                                else{
                                                                                    if(fieldname.equals("AlumCalle")){
                                                                                        Calle_Alum=fieldvalue;
                                                                                    }
                                                                                    else{
                                                                                        if(fieldname.equals("Escuela")){
                                                                                            Id_Escuela=Integer.parseInt(fieldvalue);
                                                                                        }
                                                                                        else{
                                                                                            if(fieldname.equals("Grupo")){
                                                                                                ResultSet result=null;
                                                                                                sta=con.prepareStatement("select Grupo.Id_Grupo from Grupo where Grupo.Id_Escuela=? and Grupo.Nombre=?;");
                                                                                                sta.setInt(1, Id_Escuela);
                                                                                                sta.setString(2, fieldvalue);
                                                                                                result=sta.executeQuery();
                                                                                                if(result.next()){
                                                                                                    Id_Grupo=result.getInt("Id_Grupo");
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
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                   }
                   catch(Exception e){
                       out.println(e.getMessage());
                   }
                }
                byte[] fileContent = null;
                try {
                    fileContent = FileUtils.readFileToByteArray(archivo);
                }
                catch (IOException e) {
                    out.print(e.getMessage());
                }
                sta=con.prepareCall("call sp_Alum(0,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);");
                sta.setBytes(1, fileContent);
                sta.setString(2, archivo.getName());
                sta.setString(3, Usuario_Alum);
                sta.setString(4, Contraseña_Alum);
                sta.setInt(5, NExterior_Alum);
                sta.setString(6, Calle_Alum);
                sta.setString(7, Municipio_Alum);
                sta.setInt(8, Id_Estado_Alum);
                sta.setString(9, ApellidoP_Alum);
                sta.setString(10, ApellidoM_Alum);
                sta.setString(11, Nombre_Alum);
                sta.setString(12, FechaN_Alum);
                sta.setInt(13, Id_Sexo_Alum);
                sta.setString(14, Curp_Alum);
                sta.setInt(15, Id_Grupo);
                sta.setInt(16, Id_Escuela);
                sta.setInt(17, Id_Tipo_Contacto);
                sta.setString(18, Descripcionn);
                sta.executeUpdate();
                con.close();
                archivo.delete();
                out.println("<script> alert('Registro hecho'); </script>");
                
                out.println("<script type='text/javascript'> window.location='http://localhost:8084/Proyecto_Fase_Final/todos.html'; </script>");
            }
            catch(SQLException e){
                out.println(e.getMessage());
            }
            
        %>
    </body>
</html>