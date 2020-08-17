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
        <link rel="shortcut icon" href="img/pesta1.ico"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrador de maestro</title>
    </head>
    <body>
        <%
            Connection con=null;
            PreparedStatement sta;
            File archivo=null;
            List fileItems=null;
            String Usuario_Maes="";
            String Contraseña_Maes="";
            String Calle_Maes="";
            String Municipio_Maes="";
            String ApellidoP_Maes="";
            String ApellidoM_Maes="";
            String Nombre_Maes="";
            String FechaN_Maes="";
            String RFC_Maestro="";
            String Descripcionn="";
            int NExterior_Maes=0;
            int Id_Estado_Maes=0;
            int Id_Sexo_Maes=0;
            int Id_Escuela=0;
            int Id_Tipo_Contacto=0;
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
                                if(fieldname.equals("usuario")){
                                    Usuario_Maes=fieldvalue;
                                }
                                else{
                                    if(fieldname.equals("contrasena")){
                                        Contraseña_Maes=fieldvalue;
                                    }
                                    else{
                                        if(fieldname.equals("Apellido_Paterno")){
                                            ApellidoP_Maes=fieldvalue;
                                        }
                                        else{
                                            if(fieldname.equals("Apellido_Materno")){
                                                ApellidoM_Maes=fieldvalue;
                                            }
                                            else{
                                                if(fieldname.equals("Nombre")){
                                                    Nombre_Maes=fieldvalue;
                                                }
                                                else{
                                                    if(fieldname.equals("FechaN")){
                                                        FechaN_Maes=fieldvalue;
                                                    }
                                                    else{
                                                        if(fieldname.equals("Sexo")){
                                                            if(fieldvalue.equals("Masculino")){
                                                                Id_Sexo_Maes=1;
                                                            }
                                                            else{
                                                                if(fieldvalue.equals("Femenino")){
                                                                    Id_Sexo_Maes=2;
                                                                }
                                                            }
                                                        }
                                                        else{
                                                            if(fieldname.equals("RFC")){
                                                                RFC_Maestro=fieldvalue;
                                                            }
                                                            else{
                                                                if(fieldname.equals("NExterior")){
                                                                    NExterior_Maes=Integer.parseInt(fieldvalue);
                                                                }
                                                                else{
                                                                    if(fieldname.equals("Calle")){
                                                                        Calle_Maes=fieldvalue;
                                                                    }
                                                                    else{
                                                                        if(fieldname.equals("Municipio")){
                                                                            Municipio_Maes=fieldvalue;
                                                                        }
                                                                        else{
                                                                            if(fieldname.equals("Estado")){
                                                                                if(fieldvalue.equals("Ciudad de Mexico")){
                                                                                    Id_Estado_Maes=1;
                                                                                }
                                                                                else{
                                                                                    if(fieldvalue.equals("Aguascalientes")){
                                                                                        Id_Estado_Maes=2;
                                                                                    }
                                                                                    else{
                                                                                        if(fieldvalue.equals("Baja California")){
                                                                                            Id_Estado_Maes=3;
                                                                                        }
                                                                                        else{
                                                                                            if(fieldvalue.equals("Baja California Sur")){
                                                                                                Id_Estado_Maes=4;
                                                                                            }
                                                                                            else{
                                                                                                if(fieldvalue.equals("Campeche")){
                                                                                                    Id_Estado_Maes=5;
                                                                                                }
                                                                                                else{
                                                                                                    if(fieldvalue.equals("Chihuahua")){
                                                                                                        Id_Estado_Maes=6;
                                                                                                    }
                                                                                                    else{
                                                                                                        if(fieldvalue.equals("Chiapas")){
                                                                                                            Id_Estado_Maes=7;
                                                                                                        }
                                                                                                        else{
                                                                                                            if(fieldvalue.equals("Coahuila")){
                                                                                                                Id_Estado_Maes=8;
                                                                                                            }
                                                                                                            else{
                                                                                                                if(fieldvalue.equals("Colima")){
                                                                                                                    Id_Estado_Maes=9;
                                                                                                                }
                                                                                                                else{
                                                                                                                    if(fieldvalue.equals("Durango")){
                                                                                                                        Id_Estado_Maes=10;
                                                                                                                    }
                                                                                                                    else{
                                                                                                                        if(fieldvalue.equals("Guanajuato")){
                                                                                                                            Id_Estado_Maes=11;
                                                                                                                        }
                                                                                                                        else{
                                                                                                                            if(fieldvalue.equals("Guerrero")){
                                                                                                                                Id_Estado_Maes=12;
                                                                                                                            }
                                                                                                                            else{
                                                                                                                                if(fieldvalue.equals("Hidalgo")){
                                                                                                                                    Id_Estado_Maes=13;
                                                                                                                                }
                                                                                                                                else{
                                                                                                                                    if(fieldvalue.equals("Jalisco")){
                                                                                                                                        Id_Estado_Maes=14;
                                                                                                                                    }
                                                                                                                                    else{
                                                                                                                                        if(fieldvalue.equals("Estado de Mexico")){
                                                                                                                                            Id_Estado_Maes=15;
                                                                                                                                        }
                                                                                                                                        else{
                                                                                                                                            if(fieldvalue.equals("Michoacan")){
                                                                                                                                                Id_Estado_Maes=16;
                                                                                                                                            }
                                                                                                                                            else{
                                                                                                                                                if(fieldvalue.equals("Morelos")){
                                                                                                                                                    Id_Estado_Maes=17;
                                                                                                                                                }
                                                                                                                                                else{
                                                                                                                                                    if(fieldvalue.equals("Nayarit")){
                                                                                                                                                        Id_Estado_Maes=18;
                                                                                                                                                    }
                                                                                                                                                    else{
                                                                                                                                                        if(fieldvalue.equals("Nuevo Leon")){
                                                                                                                                                            Id_Estado_Maes=19;
                                                                                                                                                        }
                                                                                                                                                        else{
                                                                                                                                                            if(fieldvalue.equals("Oaxaca")){
                                                                                                                                                                Id_Estado_Maes=20;
                                                                                                                                                            }
                                                                                                                                                            else{
                                                                                                                                                                if(fieldvalue.equals("Puebla")){
                                                                                                                                                                    Id_Estado_Maes=21;
                                                                                                                                                                }
                                                                                                                                                                else{
                                                                                                                                                                    if(fieldvalue.equals("Queretaro")){
                                                                                                                                                                        Id_Estado_Maes=22;
                                                                                                                                                                    }
                                                                                                                                                                    else{
                                                                                                                                                                        if(fieldvalue.equals("Quintana Roo")){
                                                                                                                                                                            Id_Estado_Maes=23;
                                                                                                                                                                        }
                                                                                                                                                                        else{
                                                                                                                                                                            if(fieldvalue.equals("San Luis Potosi")){
                                                                                                                                                                                Id_Estado_Maes=24;
                                                                                                                                                                            }
                                                                                                                                                                            else{
                                                                                                                                                                                if(fieldvalue.equals("Sinaloa")){
                                                                                                                                                                                    Id_Estado_Maes=25;
                                                                                                                                                                                }
                                                                                                                                                                                else{
                                                                                                                                                                                    if(fieldvalue.equals("Sonora")){
                                                                                                                                                                                        Id_Estado_Maes=26;
                                                                                                                                                                                    }
                                                                                                                                                                                    else{
                                                                                                                                                                                        if(fieldvalue.equals("Tabasco")){
                                                                                                                                                                                            Id_Estado_Maes=27;
                                                                                                                                                                                        }
                                                                                                                                                                                        else{
                                                                                                                                                                                            if(fieldvalue.equals("Tamaulipas")){
                                                                                                                                                                                                Id_Estado_Maes=28;
                                                                                                                                                                                            }
                                                                                                                                                                                            else{
                                                                                                                                                                                                if(fieldvalue.equals("Tlaxcala")){
                                                                                                                                                                                                    Id_Estado_Maes=29;
                                                                                                                                                                                                }
                                                                                                                                                                                                else{
                                                                                                                                                                                                    if(fieldvalue.equals("Veracruz")){
                                                                                                                                                                                                        Id_Estado_Maes=30;
                                                                                                                                                                                                    }
                                                                                                                                                                                                    else{
                                                                                                                                                                                                        if(fieldvalue.equals("Yucatan")){
                                                                                                                                                                                                            Id_Estado_Maes=31;
                                                                                                                                                                                                        }
                                                                                                                                                                                                        else{
                                                                                                                                                                                                            if(fieldvalue.equals("Zacatecas")){
                                                                                                                                                                                                                Id_Estado_Maes=32;
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
                                                                            else{
                                                                                if(fieldname.equals("TContacto")){
                                                                                    if(fieldvalue.equals("Telefono movil")){
                                                                                        Id_Tipo_Contacto=1;
                                                                                    }
                                                                                    else{
                                                                                        if(fieldvalue.equals("Telefono casa")){
                                                                                            Id_Tipo_Contacto=2;
                                                                                        }
                                                                                        else{
                                                                                            if(fieldvalue.equals("Telefono oficina")){
                                                                                                Id_Tipo_Contacto=3;
                                                                                            }
                                                                                            else{
                                                                                                if(fieldvalue.equals("E-mail")){
                                                                                                    Id_Tipo_Contacto=4;
                                                                                                }
                                                                                                else{
                                                                                                    if(fieldvalue.equals("Fax")){
                                                                                                        Id_Tipo_Contacto=5;
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                                else{
                                                                                    if(fieldname.equals("Contacto")){
                                                                                        Descripcionn=fieldvalue;
                                                                                    }
                                                                                    else{
                                                                                        if(fieldname.equals("Escuela")){
                                                                                            Id_Escuela=Integer.parseInt(fieldvalue);
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
                sta=con.prepareCall("call sp_Maes(0,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);");
                sta.setBytes(1, fileContent);
                sta.setString(2, archivo.getName());
                sta.setString(3, Usuario_Maes);
                sta.setString(4, Contraseña_Maes);
                sta.setInt(5, NExterior_Maes);
                sta.setString(6, Calle_Maes);
                sta.setString(7, Municipio_Maes);
                sta.setInt(8, Id_Estado_Maes);
                sta.setString(9, ApellidoP_Maes);
                sta.setString(10, ApellidoM_Maes);
                sta.setString(11, Nombre_Maes);
                sta.setString(12, FechaN_Maes);
                sta.setInt(13, Id_Sexo_Maes);
                sta.setString(14, RFC_Maestro);
                sta.setInt(15, Id_Escuela);
                sta.setInt(16, Id_Tipo_Contacto);
                sta.setString(17, Descripcionn);
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