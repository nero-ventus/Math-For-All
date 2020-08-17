package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class Aprender_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Aprender</title>\n");
      out.write("        <link rel=\"shortcut icon\" href=\"img/pesta1.ico\"/>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"prueba.css\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"boton.css\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"https://fonts.googleapis.com/css?family=Quicksand\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("                                <a href=\"opcalum.jsp\"><button id=\"myBtn\"><i class=\"fa fa-home\"></i></button></a>\n");
      out.write("                   \n");
      out.write("        <div class=\"principal\" style=\"height: 100%; width: 100%; background-color: rgba(0,0,0,0.2);\">\n");
      out.write("            <br><br><br><br><br><br><br>\n");
      out.write("            <h1>Aprender.</h1>\n");
      out.write("            <br>\n");
      out.write("        <a href=\"Cuestionarios y Problemarios.html\"><button class=\"button\">Cuestionarios y Problemarios</button></a>\n");
      out.write("        <br>\n");
      out.write("        <br>\n");
      out.write("        ");

            Connection con=null;
            PreparedStatement sta;
            HttpSession sesion=request.getSession();
            ResultSet resul=null;
            sesion.setAttribute("Recarga", 1);
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con=DriverManager.getConnection("jdbc:mysql://localhost/Proyecto","root","n0m3l0");
            }
            catch(SQLException error) {
                out.println(error.toString());
            }
            try{
                sta=con.prepareStatement("select Puntuacion.Id_Puntuacion as Id_Puntos,Puntuacion.Cantidad as Puntos from Puntuacion inner join Alumno,Datos_Usuario,Datos_Cuenta where Puntuacion.Id_Puntuacion=Alumno.Id_Puntuacion and Alumno.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Datos_Usuario.Id_Datos_Cuenta=Datos_Cuenta.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=?;");
                sta.setInt(1, (int)(sesion.getAttribute("Id")));
                resul=sta.executeQuery();
                if(resul.next()){
                    int Puntos=resul.getInt("Puntos");
                    if(Puntos==22 || Puntos==44 || Puntos==66 || Puntos==88){
                        out.println("<a href='examensubir.jsp'><button class='button'>Examen de nivel</button></a>");
                        out.println("<br><br>");
                    }
                    else{
                        out.println("<a disabled><button class='button' disabled>Examen de nivel</button></a>");
                        out.println("<br><br>");
                    }
                    int rando=(int)((Math.random()*10)+1);
                    if(rando==1){
                        out.println("<a href='examensor.jsp'><button class='button'>Examen Sorpresa</button></a>");
                        out.println("<br><br>");
                    }
                    else{
                        out.println("<a disabled><button class='button' disabled>Examen Sorpresa</button></a>");
                        out.println("<br><br>");
                    }
                }
            }
            catch(SQLException error) {
                out.println(error.toString());
            }
        
      out.write("\n");
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
