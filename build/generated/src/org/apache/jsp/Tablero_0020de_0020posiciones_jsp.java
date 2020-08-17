package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class Tablero_0020de_0020posiciones_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"colores.css\">\n");
      out.write("        <style>\n");
      out.write("        * {box-sizing: border-box}\n");
      out.write("\n");
      out.write("        /* Set height of body and the document to 100% */\n");
      out.write("        body, html {\n");
      out.write("            height: 100%;\n");
      out.write("            margin: 0;\n");
      out.write("            font-family: Arial;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* Style tab links */\n");
      out.write("        .tablink {\n");
      out.write("            background-color: #555;\n");
      out.write("            color: white;\n");
      out.write("            float: left;\n");
      out.write("            border: none;\n");
      out.write("            outline: none;\n");
      out.write("            cursor: pointer;\n");
      out.write("            padding: 14px 16px;\n");
      out.write("            font-size: 25px;\n");
      out.write("            width: 33.333333333333333333333333333%;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .tablink:hover {\n");
      out.write("            background-color: #777;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* Style the tab content (and add height:100% for full page content) */\n");
      out.write("        .tabcontent {\n");
      out.write("            color: white;\n");
      out.write("            display: none;\n");
      out.write("            padding: 100px 20px;\n");
      out.write("            height: 100%;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("<button class=\"tablink\" onclick=\"openPage('Alumnos', this, '#27ae60')\" id=\"defaultOpen\">ALUMNOS</button>\n");
      out.write("<button class=\"tablink\" onclick=\"openPage('Grupos', this, '#3498db')\">GRUPOS</button>\n");
      out.write("<button class=\"tablink\" onclick=\"openPage('Escuelas', this, '#9b59b6')\">ESCUELAS</button>\n");
      out.write("\n");
      out.write("<div id=\"Alumnos\" class=\"tabcontent w3-flat-nephritis\">\n");
      out.write("  <h3>Alumnos</h3>\n");
      out.write("  <p>Calificaciones Alumnos</p> \n");
      out.write("  <table class=\"w3-table w3-striped w3-border\">\n");
      out.write("    <tr>\n");
      out.write("      <th>Posici&oacuten &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>\n");
      out.write("      <th>Escuela &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>\n");
      out.write("      <th>Apellido&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>\n");
      out.write("      <th>Nombre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>\n");
      out.write("      <th>Nivel&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>\n");
      out.write("      <th>Puntuaci&oacuten total</th>\n");
      out.write("    </tr>\n");
      out.write("    ");

        Connection con=null;
        PreparedStatement sta=null;
        ResultSet alumnos,alumnos2;
        HttpSession sesion=request.getSession();
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con=DriverManager.getConnection("jdbc:mysql://localhost/Proyecto","root","n0m3l0");
        }
        catch(SQLException error) {
            out.println(error.toString());
        }
        try{
            sta=con.prepareStatement("select Puntuacion.Cantidad,Escuela.Nombre as Nombre_Escuela,Datos_Usuario.Apellido_Paterno,Datos_Usuario.Apellido_Materno,Datos_Usuario.Nombre as Nombre_Alumno from Puntuacion inner join Escuela,Datos_Usuario,Alumno where Alumno.Id_Puntuacion=Puntuacion.Id_Puntuacion and Alumno.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Alumno.Id_Escuela=Escuela.Id_Escuela order by Puntuacion.Cantidad desc;");
            alumnos=sta.executeQuery();
            int i=0;
            while(alumnos.next() && i<6){
                if(!(i==5)){
                    out.println("<tr>");
                    out.println("<td>"+(i+1)+"</td>");
                    out.println("<td>"+alumnos.getString("Nombre_Escuela")+"</td>");
                    out.println("<td>"+alumnos.getString("Apellido_Paterno")+" "+alumnos.getString("Apellido_Materno")+"</td>");
                    out.println("<td>"+alumnos.getString("Nombre_Alumno")+"</td>");
                    if(alumnos.getInt("Cantidad")<23 && alumnos.getInt("Cantidad")>-1){
                        out.println("<td>1</td>");
                    }
                    else{
                        if(alumnos.getInt("Cantidad")<45 && alumnos.getInt("Cantidad")>22){
                            out.println("<td>2</td>");
                        }
                        else{
                            if(alumnos.getInt("Cantidad")<67 && alumnos.getInt("Cantidad")>44){
                                out.println("<td>3</td>");
                            }
                            else{
                                if(alumnos.getInt("Cantidad")<89 && alumnos.getInt("Cantidad")>66){
                                    out.println("<td>4</td>");
                                }
                                else{
                                    if(alumnos.getInt("Cantidad")<111 && alumnos.getInt("Cantidad")>88){
                                        out.println("<td>5</td>");
                                    }
                                }
                            }
                        }
                    }
                    out.println("<td>"+alumnos.getInt("Cantidad")+"</td>");
                    out.println("</tr>");
                }
                else{
                    if(!(sesion.getAttribute("Id")==null)){
                        sta=con.prepareStatement("select Puntuacion.Cantidad,Escuela.Nombre as Nombre_Escuela,Datos_Usuario.Apellido_Paterno,Datos_Usuario.Apellido_Materno,Datos_Usuario.Nombre as Nombre_Alumno from Puntuacion inner join Escuela,Datos_Usuario,Alumno,Datos_Cuenta where Alumno.Id_Puntuacion=Puntuacion.Id_Puntuacion and Alumno.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Alumno.Id_Escuela=Escuela.Id_Escuela and Datos_Usuario.Id_Datos_Cuenta=Datos_Cuenta.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=? order by Puntuacion.Cantidad desc;");
                        sta.setInt(1, (int)(sesion.getAttribute("Id")));
                        alumnos=sta.executeQuery();
                        if(alumnos.next()){
                            out.println("<tr>");
                            sta=con.prepareStatement("select count(Id_Puntuacion) as posicion from Puntuacion where Cantidad>=? order by Cantidad desc;");
                            sta.setInt(1, alumnos.getInt("Cantidad"));
                            alumnos2=sta.executeQuery();
                            if(alumnos2.next()){
                                out.println("<td>"+alumnos2.getInt("posicion")+"</td>");
                            }
                            out.println("<td>"+alumnos.getString("Nombre_Escuela")+"</td>");
                            out.println("<td>"+alumnos.getString("Apellido_Paterno")+" "+alumnos.getString("Apellido_Materno")+"</td>");
                            out.println("<td>"+alumnos.getString("Nombre_Alumno")+"</td>");
                            if(alumnos.getInt("Cantidad")<23 && alumnos.getInt("Cantidad")>-1){
                                out.println("<td>1</td>");
                            }
                            else{
                                if(alumnos.getInt("Cantidad")<45 && alumnos.getInt("Cantidad")>22){
                                    out.println("<td>2</td>");
                                }
                                else{
                                    if(alumnos.getInt("Cantidad")<67 && alumnos.getInt("Cantidad")>44){
                                        out.println("<td>3</td>");
                                    }
                                    else{
                                        if(alumnos.getInt("Cantidad")<89 && alumnos.getInt("Cantidad")>66){
                                            out.println("<td>4</td>");
                                        }
                                        else{
                                            if(alumnos.getInt("Cantidad")<111 && alumnos.getInt("Cantidad")>88){
                                                out.println("<td>5</td>");
                                            }
                                        }
                                    }
                                }
                            }
                            out.println("<td>"+alumnos.getInt("Cantidad")+"</td>");
                            out.println("</tr>");
                        }
                    }
                }
                i++;
            }
        }
        catch(SQLException e){
            out.print(e.getMessage());
        }
    
      out.write("\n");
      out.write("  </table>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<div id=\"Grupos\" class=\"tabcontent w3-flat-peter-river\">\n");
      out.write("  <h3>Grupos</h3>\n");
      out.write("  <p>Calificaciones Grupos</p>\n");
      out.write("  <table class=\"w3-table w3-striped w3-border\">\n");
      out.write("    <tr>\n");
      out.write("      <th>Posici&oacuten &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>\n");
      out.write("      <th>Grupo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>\n");
      out.write("      <th>Puntuaci&oacuten promedio</th>\n");
      out.write("    </tr>\n");
      out.write("    ");

        ResultSet grupo,grupo2;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con=DriverManager.getConnection("jdbc:mysql://localhost/Proyecto","root","X-blade");
        }
        catch(SQLException error) {
            out.println(error.toString());
        }
        try{
            sta=con.prepareStatement("select sum(Puntuacion.Cantidad) as Cantidad,Grupo.Nombre from Puntuacion inner join Grupo,Alumno where Puntuacion.Id_Puntuacion=Alumno.Id_Puntuacion and Alumno.Id_Grupo=Grupo.Id_Grupo group by Grupo.Nombre order by Cantidad desc;");
            grupo=sta.executeQuery();
            int i=0;
            while(grupo.next() && i<6){
                if(!(i==5)){
                    out.println("<tr>");
                    out.println("<td>"+(i+1)+"</td>");
                    out.println("<td>"+grupo.getString("Nombre")+"</td>");
                    out.println("<td>"+grupo.getInt("Cantidad")+"</td>");
                    out.println("</tr>");
                }
                else{
                    if(!(sesion.getAttribute("Id")==null)){
                        sta=con.prepareStatement("select Puntuacion.Cantidad,Escuela.Nombre as Nombre_Escuela,Datos_Usuario.Apellido_Paterno,Datos_Usuario.Apellido_Materno,Datos_Usuario.Nombre as Nombre_Alumno from Puntuacion inner join Escuela,Datos_Usuario,Alumno,Datos_Cuenta where Alumno.Id_Puntuacion=Puntuacion.Id_Puntuacion and Alumno.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Alumno.Id_Escuela=Escuela.Id_Escuela and Datos_Usuario.Id_Datos_Cuenta=Datos_Cuenta.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=? order by Puntuacion.Cantidad desc;");
                        sta.setInt(1, (int)(sesion.getAttribute("Id")));
                        grupo=sta.executeQuery();
                        if(grupo.next()){
                            out.println("<tr>");
                            sta=con.prepareStatement("select count(Tablaaux.Id_Grupo) as posicion from (select sum(Puntuacion.Cantidad) as Cantidad,Grupo.Id_Grupo from Puntuacion inner join Grupo,Alumno where Puntuacion.Id_Puntuacion=Alumno.Id_Puntuacion and Alumno.Id_Grupo=Grupo.Id_Grupo and Cantidad>=? group by Grupo.Id_Grupo order by Cantidad desc) as Tablaaux;");
                            sta.setInt(1, grupo.getInt("Cantidad"));
                            grupo2=sta.executeQuery();
                            if(grupo2.next()){
                                out.println("<td>"+grupo2.getInt("posicion")+"</td>");
                            }
                            out.println("<td>"+grupo.getString("Nombre")+"</td>");
                            out.println("<td>"+grupo.getInt("Cantidad")+"</td>");
                            out.println("</tr>");
                        }
                    }
                }
                i++;
            }
        }
        catch(SQLException e){
            out.print(e.getMessage());
        }
    
      out.write("\n");
      out.write("  </table>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<div id=\"Escuelas\" class=\"tabcontent w3-flat-amethyst\">\n");
      out.write("  <h3>Escuelas</h3>\n");
      out.write("  <p>Califiacaciones Escuelas</p>\n");
      out.write("  <table class=\"w3-table w3-striped w3-border\">\n");
      out.write("    <tr>\n");
      out.write("      <th>Posici&oacuten &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>\n");
      out.write("      <th>Escuela secundaria&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>\n");
      out.write("      <th>Tipo de escuela&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>\n");
      out.write("      <th>Puntuaci&oacuten promedio</th>\n");
      out.write("    </tr>\n");
      out.write("    ");

        ResultSet escuela,escuela2;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con=DriverManager.getConnection("jdbc:mysql://localhost/Proyecto","root","X-blade");
        }
        catch(SQLException error) {
            out.println(error.toString());
        }
        try{
            sta=con.prepareStatement("select sum(Puntuacion.Cantidad) as Cantidad,Escuela.Nombre as Nombre,Tipo_Escuela.Descripcion as Tipo from Puntuacion inner join Escuela,Alumno,Tipo_Escuela where Puntuacion.Id_Puntuacion=Alumno.Id_Puntuacion and Tipo_Escuela.Id_TEscuela=Escuela.Id_TEscuela and Alumno.Id_Escuela=Escuela.Id_Escuela group by Escuela.Nombre order by Cantidad desc;");
            escuela=sta.executeQuery();
            int i=0;
            while(escuela.next() && i<6){
                if(!(i==5)){
                    out.println("<tr>");
                    out.println("<td>"+(i+1)+"</td>");
                    out.println("<td>"+escuela.getString("Nombre")+"</td>");
                    out.println("<td>"+escuela.getString("Tipo")+"</td>");
                    out.println("<td>"+escuela.getInt("Cantidad")+"</td>");
                    out.println("</tr>");
                }
                else{
                    if(!(sesion.getAttribute("Id")==null)){
                        sta=con.prepareStatement("select sum(Puntuacion.Cantidad) as Cantidad,Escuela.Nombre,Tipo_Escuela.Descripcion from Puntuacion inner join Escuela,Alumno,Tipo_Escuela,Datos_Usuario,Datos_Cuenta where Puntuacion.Id_Puntuacion=Alumno.Id_Puntuacion and Tipo_Escuela.Id_TEscuela=Escuela.Id_TEscuela and Alumno.Id_Escuela=Escuela.Id_Escuela and Alumno.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Datos_Usuario.Id_Datos_Cuenta=Datos_Cuenta.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=? group by Escuela.Nombre order by Cantidad desc;");
                        sta.setInt(1, (int)(sesion.getAttribute("Id")));
                        escuela=sta.executeQuery();
                        if(escuela.next()){
                            out.println("<tr>");
                            sta=con.prepareStatement("select count(Tablaaux.Id_Escuela) as posicion from (select sum(Puntuacion.Cantidad) as Cantidad,Escuela.Id_Escuela from Puntuacion inner join Escuela,Alumno where Puntuacion.Id_Puntuacion=Alumno.Id_Puntuacion and Alumno.Id_Escuela=Escuela.Id_Escuela and Cantidad>=0 group by Escuela.Id_Escuela order by Cantidad desc) as Tablaaux;");
                            sta.setInt(1, escuela.getInt("Cantidad"));
                            escuela2=sta.executeQuery();
                            if(escuela2.next()){
                                out.println("<td>"+escuela2.getInt("posicion")+"</td>");
                            }
                            out.println("<td>"+escuela.getString("Nombre")+"</td>");
                            out.println("<td>"+escuela.getString("Tipo")+"</td>");
                            out.println("<td>"+escuela.getInt("Cantidad")+"</td>");
                            out.println("</tr>");
                        }
                    }
                }
                i++;
            }
        }
        catch(SQLException e){
            out.print(e.getMessage());
        }
    
      out.write("\n");
      out.write("  </table>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("function openPage(pageName,elmnt,color) {\n");
      out.write("    var i, tabcontent, tablinks;\n");
      out.write("    tabcontent = document.getElementsByClassName(\"tabcontent\");\n");
      out.write("    for (i = 0; i < tabcontent.length; i++) {\n");
      out.write("        tabcontent[i].style.display = \"none\";\n");
      out.write("    }\n");
      out.write("    tablinks = document.getElementsByClassName(\"tablink\");\n");
      out.write("    for (i = 0; i < tablinks.length; i++) {\n");
      out.write("        tablinks[i].style.backgroundColor = \"\";\n");
      out.write("    }\n");
      out.write("    document.getElementById(pageName).style.display = \"block\";\n");
      out.write("    elmnt.style.backgroundColor = color;\n");
      out.write("\n");
      out.write("}\n");
      out.write("// Get the element with id=\"defaultOpen\" and click on it\n");
      out.write("document.getElementById(\"defaultOpen\").click();\n");
      out.write("</script>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
