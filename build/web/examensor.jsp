<%@page import="Clases.Numeros"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
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
        <link rel="shortcut icon" href="img/pesta1.ico"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="prueba.css">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Quicksand">
        <title>Examen Sorpresa</title>
        <script>
            function confirmar(){
                if(confirm("¿Enviar respuestas?")){
                    alert("Se calculara la puntuacion");
                }
                else{
                    return false;
                }
            }
            function cambi(){
                for(var i=1;i<10;i++){
                    var aux1="previa"+i,aux2="ruta"+i;
                    if(!(document.getElementById(aux2)===null)){
                        document.getElementById(aux1).src=document.getElementById(aux2).value;
                    }
                }
            }
        </script>
    </head>
    <body onload="cambio=setInterval('cambi()',3000)">
        <form action="resultado_examen_sor.jsp" method="post">
            <%
                Connection con=null;
                PreparedStatement sta;
                HttpSession sesion=request.getSession();
                File archivo=null;
                String auxr1=config.getServletContext().getRealPath("/");
                String auxr2="";
                auxr1+="img/";
                int auxr3=0,auxr4=0;
                for (int i=0;i<auxr1.length();i++) {
                    if(auxr1.charAt(i)==92){
                        auxr2+="/";
                    }
                    else{
                        auxr2+=auxr1.charAt(i);
                    }
                }
                auxr3=auxr2.indexOf("/build");
                auxr4=auxr3+6;
                String auxr5=auxr2.substring(0, auxr3)+auxr1.substring(auxr4);
                String filePath = auxr5;
                ResultSet resul1=null,resul2=null,resul3=null,rimagen=null;
                int NPregunta=1,RLimite=0,auxx=0,vez1=0,Necesitados=0,cuantas=0;
                Numeros ran=new Numeros();
                int[] result,lista=new int[3],laux;
                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con=DriverManager.getConnection("jdbc:mysql://localhost/Proyecto","root","n0m3l0");
                }
                catch(SQLException error) {
                    out.println(error.toString());
                }
                try{
                    int aux1=4,k=0;
                    sta=con.prepareStatement("select count(Relacion_Alumno_Tema.Id_Tema) as NTemas from Relacion_Alumno_Tema inner join Alumno,Datos_Cuenta,Datos_Usuario where Relacion_Alumno_Tema.Id_Alumno=Alumno.Id_Alumno and Alumno.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario  and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=? and Relacion_Alumno_Tema.Id_TRelacionAT=1;");
                    sta.setInt(1, (int)(sesion.getAttribute("Id")));
                    resul3=sta.executeQuery();
                    int[] temasv=new int[1];
                    if(resul3.next()){
                        temasv=new int[resul3.getInt("NTemas")];
                    }
                    sta=con.prepareStatement("select Relacion_Alumno_Tema.Id_Tema as Temas from Relacion_Alumno_Tema inner join Alumno,Datos_Cuenta,Datos_Usuario where Relacion_Alumno_Tema.Id_Alumno=Alumno.Id_Alumno and Alumno.Id_Datos_Usuario=Datos_Usuario.Id_Datos_Usuario  and Datos_Cuenta.Id_Datos_Cuenta=Datos_Usuario.Id_Datos_Cuenta and Datos_Cuenta.Id_Datos_Cuenta=? and Relacion_Alumno_Tema.Id_TRelacionAT=1;");
                    sta.setInt(1, (int)(sesion.getAttribute("Id")));
                    resul3=sta.executeQuery();
                    while(resul3.next() && k<temasv.length){
                        temasv[k]=resul3.getInt("Temas");
                        k++;
                    }
                    for (int f=0,l=0;l<temasv.length;l++) {
                        int radi=(int)((Math.random()*3)+1);
                        sta=con.prepareStatement("select count(pregunta.Id_Pregunta) as numero from pregunta where pregunta.Id_Tema=? and pregunta.Id_TPregunta=? and pregunta.Id_TPregunta_Dificultad=?;");
                        sta.setInt(1, temasv[l]);
                        sta.setInt(2, aux1);
                        sta.setInt(3, radi);
                        resul3=sta.executeQuery();
                        if(resul3.next()){
                            Necesitados=resul3.getInt("numero");
                        }
                        result=new int[Necesitados];
                        sta=con.prepareStatement("select pregunta.Id_Pregunta as numero from pregunta inner join relacion_preguntas_opciones where pregunta.Id_Tema=? and pregunta.Id_TPregunta=? and relacion_preguntas_opciones.Id_Pregunta=pregunta.Id_Pregunta and pregunta.Id_TPregunta_Dificultad=? group by relacion_preguntas_opciones.Id_Pregunta;");
                        sta.setInt(1, temasv[l]);
                        sta.setInt(2, aux1);
                        sta.setInt(3, radi);
                        resul3=sta.executeQuery();
                        int ia=0;
                        while(resul3.next() && ia<result.length){
                            result[ia]=resul3.getInt("numero");
                            ia++;
                        }
                        ia=0;
                        laux=ran.rando(result);
                        for(int i=0;i<lista.length; i++){
                            lista[i]=laux[i];
                        }
                        for(int i=NPregunta,j=1;NPregunta<3;i++) {
                            if(!(lista[j-1]==0)){
                                sta=con.prepareStatement("select relacion_preguntas_opciones.Id_Opcion as Id_Opcion,pregunta.Descripcion as desp,pregunta.Id_Foto as Imagen from pregunta inner join relacion_preguntas_opciones where pregunta.Id_Tema=? and pregunta.Id_TPregunta=? and pregunta.Id_Pregunta=? and relacion_preguntas_opciones.Id_Pregunta=pregunta.Id_Pregunta and pregunta.Id_TPregunta_Dificultad=?;");
                                sta.setInt(1, temasv[l]);
                                sta.setInt(2, aux1);
                                sta.setInt(3, lista[j-1]);
                                sta.setInt(4, radi);
                                resul1=sta.executeQuery();
                                j++;
                                String aux="";
                                int vez=0;
                                int conta=0;
                                while(resul1.next()){
                                    if(vez==0){
                                        out.println("<h3>"+(f+1)+".-"+resul1.getString("desp")+"</h3>");
                                        aux=resul1.getString("desp");
                                        sta=con.prepareStatement("select * from Foto where Foto.Id_Foto=?;");
                                        sta.setInt(1, resul1.getInt("Imagen"));
                                        rimagen=sta.executeQuery();
                                        if(rimagen.next()){
                                            if(!(rimagen.getBytes("Archivo")==null)){
                                                byte[] bytes=rimagen.getBytes("Archivo");
                                                FileUtils.writeByteArrayToFile(new File(filePath,rimagen.getString("Nombre")), bytes);
                                                archivo=new File(filePath+rimagen.getString("Nombre"));
                                                out.println("<input id='ruta"+(f+1)+"' value='"+("img/"+archivo.getName())+"' type='text' name='ruta"+(f+1)+"' style='visibility: hidden; top: 0px; left: 0px; position: absolute;'>");
                                                out.println("<img id='previa"+(f+1)+"' src='img/cargando.gif' style='height: 50%;width: 50%;'>");
                                                out.println("<br><br>");
                                            }
                                        }
                                        vez=1;
                                    }
                                    if(!(aux.equals(resul1.getString("desp")))&&vez==1){
                                        out.println("<h3>"+(f+1)+".-"+resul1.getString("desp")+"</h3>");
                                        sta=con.prepareStatement("select * from Foto where Foto.Id_Foto=?;");
                                        sta.setInt(1, resul1.getInt("Imagen"));
                                        rimagen=sta.executeQuery();
                                        if(rimagen.next()){
                                            if(!(rimagen.getBytes("Archivo")==null)){
                                                byte[] bytes=rimagen.getBytes("Archivo");
                                                FileUtils.writeByteArrayToFile(new File(filePath,rimagen.getString("Nombre")), bytes);
                                                archivo=new File(filePath+rimagen.getString("Nombre"));
                                                out.println("<input id='ruta"+(f+1)+"' value='"+("img/"+archivo.getName())+"' type='text' name='ruta"+(f+1)+"' style='visibility: hidden; top: 0px; left: 0px; position: absolute;'>");
                                                out.println("<img id='previa"+(f+1)+"' src='img/cargando.gif' style='height: 50%;width: 50%;'>");
                                                out.println("<br><br>");
                                            }
                                        }
                                    }
                                    sta=con.prepareStatement("select * from Opcion where Id_Opcion="+resul1.getInt("Id_Opcion")+"");
                                    resul2=sta.executeQuery();
                                    if(resul2.next()){
                                        if(resul2.getInt("Id_TOpcion")==1){
                                            out.println("<input type='radio' value='Correcta' id='opciones"+(f+1)+"' name='opciones"+(f+1)+"'> "+resul2.getString("Descripcion")+"<br><br>");
                                        }
                                        else{
                                            if(resul2.getInt("Id_TOpcion")==2){
                                                out.println("<input type='radio' value='Incorrecta' id='opciones"+(f+1)+"' name='opciones"+(f+1)+"'> "+resul2.getString("Descripcion")+"<br><br>");
                                            }
                                        }
                                    }
                                    aux=resul1.getString("desp");
                                    conta++;
                                    if(conta==4){
                                        NPregunta++;
                                    }
                                }
                            }
                            f++;
                        }
                        NPregunta=1;
                        l++;
                        if(temasv.length==l){
                            l=0;
                        }
                        cuantas=f;
                    }
                    out.println("<input id='cuantas' value='"+cuantas+"' type='text' name='cuantas' style='visibility: hidden; top: 0px; left: 0px; position: absolute;'>");
                }
                catch(Exception e){
                    out.print(e.getMessage());
                }
            %>
            <input type="submit" value="Enviar respuestas" onclick="return confirmar()">
        </form>
        <a href="index.html">Regresar al index</a>
    </body>
</html>