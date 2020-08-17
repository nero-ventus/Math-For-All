package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.commons.io.FileUtils;
import java.util.List;
import org.apache.tomcat.util.http.fileupload.FileItem;
import java.util.Iterator;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import java.io.*;
import java.sql.*;

public final class opc1_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"barra_usuario.css\">\n");
      out.write("        <script>\n");
      out.write("            function cambi(){\n");
      out.write("                var aux1=\"FPerfil\",aux2=\"Ruta\";\n");
      out.write("                if(!(document.getElementById(aux2)===null)){\n");
      out.write("                    document.getElementById(aux1).src=document.getElementById(aux2).value;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body onload=\"cambio=setInterval('cambi()',3000)\">\n");
      out.write("        ");

            Connection con=null;
            PreparedStatement sta;
            ResultSet resul=null;
            File archivo=null;
            List fileItems=null;
            HttpSession sesion=request.getSession();
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con=DriverManager.getConnection("jdbc:mysql://localhost/Proyecto","root","X-blade");
            }
            catch(SQLException error) {
                out.println(error.toString());
            }
            try{
                out.println("<div class='div1'>");
                sta=con.prepareStatement("select Foto.Id_Foto,Foto.Archivo,Foto.Nombre,Puntuacion.Cantidad from Foto inner join Datos_Cuenta,Datos_Usuario,Puntuacion,Alumno where Foto.Id_Foto=Datos_Usuario.Id_Foto and Datos_Usuario.Id_Datos_Cuenta=Datos_Cuenta.Id_Datos_Cuenta and Puntuacion.Id_Puntuacion=Alumno.Id_Puntuacion and Alumno.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Datos_Cuenta.Id_Datos_Cuenta=?;");
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
                    if(resul.getInt("Cantidad")<23 && resul.getInt("Cantidad")>-1){
                        out.println("<div class='barrap'><div style='background-color: yellow; width: "+(resul.getInt("Cantidad")*100/22)+"%;'>"+resul.getInt("Cantidad")+"</div></div>");
                    }
                    else{
                        if(resul.getInt("Cantidad")<45 && resul.getInt("Cantidad")>22){
                            out.println("<div class='barrap'><div style='background-color: orange; width: "+((resul.getInt("Cantidad")-22)*100/22)+"%;'>"+resul.getInt("Cantidad")+"</div></div>");
                        }
                        else{
                            if(resul.getInt("Cantidad")<67 && resul.getInt("Cantidad")>44){
                                out.println("<div class='barrap'><div style='background-color: red; width: "+((resul.getInt("Cantidad")-44)*100/22)+"%;'>"+resul.getInt("Cantidad")+"</div></div>");
                            }
                            else{
                                if(resul.getInt("Cantidad")<89 && resul.getInt("Cantidad")>66){
                                    out.println("<div class='barrap'><div style='background-color: blue; width: "+((resul.getInt("Cantidad")-66)*100/22)+"%;'>"+resul.getInt("Cantidad")+"</div></div>");
                                }
                                else{
                                    if(resul.getInt("Cantidad")<111 && resul.getInt("Cantidad")>88){
                                        out.println("<div class='barrap'><div style='background-color: green; width: "+((resul.getInt("Cantidad")-88)*100/22)+"%;'>"+resul.getInt("Cantidad")+"</div></div>");
                                    }
                                }
                            }
                        }
                    }
                    out.println("<h3 class='h31'> Alumno: "+sesion.getAttribute("Nombre")+" &nbsp;&nbsp;</h3>");
                    out.println("<input id='Ruta' value='"+("img/"+archivo.getName())+"' type='text' name='Ruta' style='visibility: hidden; top: 0px; left: 0px; position: absolute;'>");
                    out.println("<img id='FPerfil' src='img/cargando.gif' class='img1'>");
                    out.println("<br><br>");
                }
            }
            catch(SQLException e){
                out.println(e.getMessage());
            }
            out.println("</div>");
            out.println("<div class='div2'>");
            out.println("<form action='cerrar.jsp' method='post'>");
            out.println("<input type='submit' name='boton' id='boton' value='Cerrar sesion'>");
            out.println("</form>");
            out.println("</div>");
        
      out.write("\n");
      out.write("        <br>\n");
      out.write("        <br>\n");
      out.write("        <br>\n");
      out.write("        <br>\n");
      out.write("        <br>\n");
      out.write("        <a href=\"Aprender.jsp\">Aprender</a><br>\n");
      out.write("        <a href=\"Tablero de posiciones.jsp\">Posiciones</a><br>\n");
      out.write("        <a href=\"\">Perfil</a><br>\n");
      out.write("        <a href=\"lecciones.html\">Lecciones</a><br>\n");
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
