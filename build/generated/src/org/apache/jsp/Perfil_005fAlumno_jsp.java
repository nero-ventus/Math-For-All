package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import java.sql.*;
import java.io.*;

public final class Perfil_005fAlumno_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
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
                sta=con.prepareStatement("select Foto.Archivo,Foto.Nombre as Foto,Datos_Cuenta.Usuario,Datos_Cuenta.Contraseña,Direccion.Numero_Exterior,Direccion.Calle,Direccion.Municipio,Estado.Descripcion as Estado,Datos_Usuario.Apellido_Paterno,Datos_Usuario.Apellido_Materno,Datos_Usuario.Nombre as Nombre_Usuario,Datos_Usuario.Fecha_Nacimiento,Sexo.Descripcion as Sexo,Alumno.Curp,Grupo.Nombre as Grupo,Escuela.Nombre as Escuela,Contacto.Descripcion as Contacto,Tipo_Contacto.Descripcion as TipoC from Foto inner join Datos_Cuenta,Direccion,Estado,Datos_Usuario,Sexo,Alumno,Grupo,Escuela,Contacto,Tipo_Contacto,Relacion_Usuario_Contacto where Foto.Id_Foto=Datos_Usuario.Id_Foto and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Direccion.Id_Direccion=Datos_Usuario.Id_Direccion and Direccion.Id_Estado=Estado.Id_Estado and Sexo.Id_Sexo=Datos_Usuario.Id_Sexo and Alumno.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Grupo.Id_Grupo=Alumno.Id_Grupo and Alumno.Id_Escuela=Escuela.Id_Escuela and Relacion_Usuario_Contacto.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario and Contacto.Id_Contacto=Relacion_Usuario_Contacto.Id_Contacto and Contacto.Id_TContacto=Tipo_Contacto.Id_TContacto and Datos_Cuenta.Id_Datos_Cuenta=?;");
                sta.setInt(1, (int)(sesion.getAttribute("Id")));
                resul=sta.executeQuery();
                out.println(config.getServletContext().getRealPath("/"));
            }
            catch(SQLException e ){
                out.println(e.getMessage());
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
