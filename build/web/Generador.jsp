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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="prueba.css">
        <link rel="stylesheet" type="text/css" href="boton.css">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Quicksand">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Generador</title>
        <link rel="shortcut icon" href="img/pesta1.ico"/>
        <script>
            function confirmar(){
                var contador=0;
                for(var i=1;i<16;i++){
                    var auxx="opciones"+i;
                    var aux1=document.getElementsByName(auxx);
                    for(var j=0,conta=0;j<aux1.length;j++){
                        if(aux1[j].checked){
                            contador+=1;
                            break;
                        }
                        else{
                            conta+=1;
                        }
                        if(conta===4) {
                            alert("Favor de llenar la pregunta "+i);
                            document.getElementById(auxx).focus();
                            break;
                        }
                    }
                }
                if(contador===15){
                    if(confirm("¿Enviar respuestas?")){
                        alert("Se calculara la puntuacion");
                    }
                    else{
                        return false;
                    }
                }
                else {
                    return false;
                }
            }
            function cambi(){
                for(var i=1;i<16;i++){
                    var aux1="previa"+i,aux2="ruta"+i;
                    if(!(document.getElementById(aux2)===null)){
                        document.getElementById(aux1).src=document.getElementById(aux2).value;
                    }
                }
            }
        </script>
    </head>
    <body onload="cambio=setInterval('cambi()',3000)">
                <a href="indexp.html"><button id="myBtn"><i class="fa fa-home"></i></button></a>
                   
        <div class="principal" style="background-color: rgba(0,0,0,0.2);">
            <br>
            <h1>Resuelve el siguiente cuestionario:</h1>
            <br>
        <form action="resultado_Cuestionarios_Problemarios.jsp" method="post">
            <%
                Connection con=null;
                PreparedStatement sta;
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
                int NPregunta=1,RLimite=0,auxx=0,vez1=0,Necesitados=0;
                Numeros ran=new Numeros();
                int[] result,lista=new int[6],laux;
                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con=DriverManager.getConnection("jdbc:mysql://localhost/Proyecto","root","n0m3l0");
                }
                catch(SQLException error) {
                    out.println(error.toString());
                }
                try{
                    String tema=request.getParameter("tema");
                    String tpregunta=request.getParameter("tipo");
                    int aux1=0,aux2=0;
                    if(tpregunta.equals("Cuestionario")){
                        aux1=1;
                    }
                    else{
                        if(tpregunta.equals("Problemario")){
                            aux1=2;
                        }
                    }
                    if(tema.equals("Numero")){
                        aux2=1;
                    }
                    else{
                        if(tema.equals("Adicion y sustraccion")){
                            aux2=2;
                        }
                        else{
                            if(tema.equals("Multiplicacion y division")){
                                aux2=3;
                            }
                            else{
                                if(tema.equals("Proporcionalidad")){
                                    aux2=4;
                                }
                                else{
                                    if(tema.equals("Ecuaciones")){
                                        aux2=5;
                                    }
                                    else{
                                        if(tema.equals("Funciones")){
                                            aux2=6;
                                        }
                                        else{
                                            if(tema.equals("Patrones, figuras geometricas y expresiones equivalentes")){
                                                aux2=7;
                                            }
                                            else{
                                                if(tema.equals("Figuras y cuerpos geometricos")){
                                                    aux2=8;
                                                }
                                                else{
                                                    if(tema.equals("Magnitudes y medidas")){
                                                        aux2=9;
                                                    }
                                                    else{
                                                        if(tema.equals("Estadistica")){
                                                            aux2=10;
                                                        }
                                                        else{
                                                            if(tema.equals("Probabilidad")){
                                                                aux2=11;
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
                    sta=con.prepareStatement("select count(pregunta.Id_Pregunta) as numero from pregunta where pregunta.Id_Tema=? and pregunta.Id_TPregunta=? and pregunta.Id_TPregunta_Dificultad=?;");
                    sta.setInt(1, aux2);
                    sta.setInt(2, aux1);
                    sta.setInt(3, 1);
                    resul3=sta.executeQuery();
                    if(resul3.next()){
                        Necesitados=resul3.getInt("numero");
                    }
                    result=new int[Necesitados];
                    sta=con.prepareStatement("select pregunta.Id_Pregunta as numero from pregunta inner join relacion_preguntas_opciones where pregunta.Id_Tema=? and pregunta.Id_TPregunta=? and relacion_preguntas_opciones.Id_Pregunta=pregunta.Id_Pregunta and pregunta.Id_TPregunta_Dificultad=? group by relacion_preguntas_opciones.Id_Pregunta;");
                    sta.setInt(1, aux2);
                    sta.setInt(2, aux1);
                    sta.setInt(3, 1);
                    resul3=sta.executeQuery();
                    int ia=0;
                    while(resul3.next() && ia<result.length){
                        result[ia]=resul3.getInt("numero");
                        ia++;
                    }
                    ia=0;
                    laux=ran.rando(result);
                    for(int i=0;i<laux.length; i++){
                        lista[i]=laux[i];
                    }
                    for(int i=NPregunta,j=1;NPregunta<6;i++) {
                        if(!(lista[j-1]==0)){
                            sta=con.prepareStatement("select relacion_preguntas_opciones.Id_Opcion as Id_Opcion,pregunta.Descripcion as desp,pregunta.Id_Foto as Imagen from pregunta inner join relacion_preguntas_opciones where pregunta.Id_Tema=? and pregunta.Id_TPregunta=? and pregunta.Id_Pregunta=? and relacion_preguntas_opciones.Id_Pregunta=pregunta.Id_Pregunta and pregunta.Id_TPregunta_Dificultad=?;");
                            sta.setInt(1, aux2);
                            sta.setInt(2, aux1);
                            sta.setInt(3, lista[j-1]);
                            sta.setInt(4, 1);
                            resul1=sta.executeQuery();
                            j++;
                            String aux="";
                            int vez=0;
                            int conta=0;
                            while(resul1.next()){
                                if(vez==0){
                                    out.println("<h3>"+NPregunta+".-"+resul1.getString("desp")+"</h3>");
                                    aux=resul1.getString("desp");
                                    sta=con.prepareStatement("select * from Foto where Foto.Id_Foto=?;");
                                    sta.setInt(1, resul1.getInt("Imagen"));
                                    rimagen=sta.executeQuery();
                                    if(rimagen.next()){
                                        if(!(rimagen.getBytes("Archivo")==null)){
                                            byte[] bytes=rimagen.getBytes("Archivo");
                                            FileUtils.writeByteArrayToFile(new File(filePath,rimagen.getString("Nombre")), bytes);
                                            archivo=new File(filePath+rimagen.getString("Nombre"));
                                            out.println("<input id='ruta"+NPregunta+"' value='"+("img/"+archivo.getName())+"' type='text' name='ruta"+NPregunta+"' style='visibility: hidden; top: 0px; left: 0px; position: absolute;'>");
                                            out.println("<img id='previa"+NPregunta+"' src='img/cargando.gif' style='height: 50%;width: 50%;'>");
                                            out.println("<br><br>");
                                        }
                                    }
                                    vez=1;
                                }
                                if(!(aux.equals(resul1.getString("desp")))&&vez==1){
                                    out.println("<h3>"+NPregunta+".-"+resul1.getString("desp")+"</h3>");
                                    sta=con.prepareStatement("select * from Foto where Foto.Id_Foto=?;");
                                    sta.setInt(1, resul1.getInt("Imagen"));
                                    rimagen=sta.executeQuery();
                                    if(rimagen.next()){
                                        if(!(rimagen.getBytes("Archivo")==null)){
                                            byte[] bytes=rimagen.getBytes("Archivo");
                                            FileUtils.writeByteArrayToFile(new File(filePath,rimagen.getString("Nombre")), bytes);
                                            archivo=new File(filePath+rimagen.getString("Nombre"));
                                            out.println("<input id='ruta"+NPregunta+"' value='"+("img/"+archivo.getName())+"' type='text' name='ruta"+NPregunta+"' style='visibility: hidden; top: 0px; left: 0px; position: absolute;'>");
                                            out.println("<img id='previa"+NPregunta+"' src='img/cargando.gif' style='height: 50%;width: 50%;'>");
                                            out.println("<br><br>");
                                        }
                                    }
                                }
                                sta=con.prepareStatement("select * from Opcion where Id_Opcion="+resul1.getInt("Id_Opcion")+"");
                                resul2=sta.executeQuery();
                                if(resul2.next()){
                                    if(resul2.getInt("Id_TOpcion")==1){
                                        out.println("<input type='radio' value='Correcta' id='opciones"+NPregunta+"' name='opciones"+NPregunta+"'> "+resul2.getString("Descripcion")+"<br><br>");
                                    }
                                    else{
                                        if(resul2.getInt("Id_TOpcion")==2){
                                            out.println("<input type='radio' value='Incorrecta' id='opciones"+NPregunta+"' name='opciones"+NPregunta+"'> "+resul2.getString("Descripcion")+"<br><br>");
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
                    }
                    sta=con.prepareStatement("select count(pregunta.Id_Pregunta) as numero from pregunta where pregunta.Id_Tema=? and pregunta.Id_TPregunta=? and pregunta.Id_TPregunta_Dificultad=?;");
                    sta.setInt(1, aux2);
                    sta.setInt(2, aux1);
                    sta.setInt(3, 2);
                    resul3=sta.executeQuery();
                    if(resul3.next()){
                        Necesitados=resul3.getInt("numero");
                    }
                    result=new int[Necesitados];
                    sta=con.prepareStatement("select pregunta.Id_Pregunta as numero from pregunta inner join relacion_preguntas_opciones where pregunta.Id_Tema=? and pregunta.Id_TPregunta=? and relacion_preguntas_opciones.Id_Pregunta=pregunta.Id_Pregunta and pregunta.Id_TPregunta_Dificultad=? group by relacion_preguntas_opciones.Id_Pregunta;");
                    sta.setInt(1, aux2);
                    sta.setInt(2, aux1);
                    sta.setInt(3, 2);
                    resul3=sta.executeQuery();
                    while(resul3.next() && ia<result.length){
                        result[ia]=resul3.getInt("numero");
                        ia++;
                    }
                    ia=0;
                    laux=ran.rando(result);
                    for(int i=0;i<laux.length; i++){
                        lista[i]=laux[i];
                    }
                    for(int i=NPregunta,j=1;NPregunta<12;i++) {
                        if(!(lista[j-1]==0)){
                            sta=con.prepareStatement("select relacion_preguntas_opciones.Id_Opcion as Id_Opcion,pregunta.Descripcion as desp,pregunta.Id_Foto as Imagen from pregunta inner join relacion_preguntas_opciones where pregunta.Id_Tema=? and pregunta.Id_TPregunta=? and pregunta.Id_Pregunta=? and relacion_preguntas_opciones.Id_Pregunta=pregunta.Id_Pregunta and pregunta.Id_TPregunta_Dificultad=?;");
                            sta.setInt(1, aux2);
                            sta.setInt(2, aux1);
                            sta.setInt(3, lista[j-1]);
                            sta.setInt(4, 2);
                            resul1=sta.executeQuery();
                            j++;
                            String aux="";
                            int vez=0;
                            int conta=0;
                            while(resul1.next()){
                                if(vez==0){
                                    out.println("<h3>"+NPregunta+".-"+resul1.getString("desp")+"</h3>");
                                    aux=resul1.getString("desp");
                                    sta=con.prepareStatement("select * from Foto where Foto.Id_Foto=?;");
                                    sta.setInt(1, resul1.getInt("Imagen"));
                                    rimagen=sta.executeQuery();
                                    if(rimagen.next()){
                                        if(!(rimagen.getBytes("Archivo")==null)){
                                            byte[] bytes=rimagen.getBytes("Archivo");
                                            FileUtils.writeByteArrayToFile(new File(filePath,rimagen.getString("Nombre")), bytes);
                                            archivo=new File(filePath+rimagen.getString("Nombre"));
                                            out.println("<input id='ruta"+NPregunta+"' value='"+("img/"+archivo.getName())+"' type='text' name='ruta"+NPregunta+"' style='visibility: hidden; top: 0px; left: 0px; position: absolute;'>");
                                            out.println("<img id='previa"+NPregunta+"' src='img/cargando.gif' style='height: 50%;width: 50%;'>");
                                            out.println("<br><br>");
                                        }
                                    }
                                    vez=1;
                                }
                                if(!(aux.equals(resul1.getString("desp")))&&vez==1){
                                    out.println("<h3>"+NPregunta+".-"+resul1.getString("desp")+"</h3>");
                                    sta=con.prepareStatement("select * from Foto where Foto.Id_Foto=?;");
                                    sta.setInt(1, resul1.getInt("Imagen"));
                                    rimagen=sta.executeQuery();
                                    if(rimagen.next()){
                                        if(!(rimagen.getBytes("Archivo")==null)){
                                            byte[] bytes=rimagen.getBytes("Archivo");
                                            FileUtils.writeByteArrayToFile(new File(filePath,rimagen.getString("Nombre")), bytes);
                                            archivo=new File(filePath+rimagen.getString("Nombre"));
                                            out.println("<input id='ruta"+NPregunta+"' value='"+("img/"+archivo.getName())+"' type='text' name='ruta"+NPregunta+"' style='visibility: hidden; top: 0px; left: 0px; position: absolute;'>");
                                            out.println("<img id='previa"+NPregunta+"' src='img/cargando.gif' style='height: 50%;width: 50%;'>");
                                            out.println("<br><br>");
                                        }
                                    }
                                }
                                sta=con.prepareStatement("select * from Opcion where Id_Opcion="+resul1.getInt("Id_Opcion")+"");
                                resul2=sta.executeQuery();
                                if(resul2.next()){
                                    if(resul2.getInt("Id_TOpcion")==1){
                                        out.println("<input type='radio' value='Correcta' id='opciones"+NPregunta+"' name='opciones"+NPregunta+"'> "+resul2.getString("Descripcion")+"<br><br>");
                                    }
                                    else{
                                        if(resul2.getInt("Id_TOpcion")==2){
                                            out.println("<input type='radio' value='Incorrecta' id='opciones"+NPregunta+"' name='opciones"+NPregunta+"'> "+resul2.getString("Descripcion")+"<br><br>");
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
                    }
                    sta=con.prepareStatement("select count(pregunta.Id_Pregunta) as numero from pregunta where pregunta.Id_Tema=? and pregunta.Id_TPregunta=? and pregunta.Id_TPregunta_Dificultad=?;");
                    sta.setInt(1, aux2);
                    sta.setInt(2, aux1);
                    sta.setInt(3, 3);
                    resul3=sta.executeQuery();
                    if(resul3.next()){
                        Necesitados=resul3.getInt("numero");
                    }
                    result=new int[Necesitados];
                    sta=con.prepareStatement("select pregunta.Id_Pregunta as numero from pregunta inner join relacion_preguntas_opciones where pregunta.Id_Tema=? and pregunta.Id_TPregunta=? and relacion_preguntas_opciones.Id_Pregunta=pregunta.Id_Pregunta and pregunta.Id_TPregunta_Dificultad=? group by relacion_preguntas_opciones.Id_Pregunta;");
                    sta.setInt(1, aux2);
                    sta.setInt(2, aux1);
                    sta.setInt(3, 3);
                    resul3=sta.executeQuery();
                    while(resul3.next() && ia<result.length){
                        result[ia]=resul3.getInt("numero");
                        ia++;
                    }
                    ia=0;
                    laux=ran.rando(result);
                    for(int i=0;i<laux.length; i++){
                        lista[i]=laux[i];
                    }
                    for(int i=NPregunta,j=1;NPregunta<16;i++) {
                        if(!(lista[j-1]==0)){
                            sta=con.prepareStatement("select relacion_preguntas_opciones.Id_Opcion as Id_Opcion,pregunta.Descripcion as desp,pregunta.Id_Foto as Imagen from pregunta inner join relacion_preguntas_opciones where pregunta.Id_Tema=? and pregunta.Id_TPregunta=? and pregunta.Id_Pregunta=? and relacion_preguntas_opciones.Id_Pregunta=pregunta.Id_Pregunta and pregunta.Id_TPregunta_Dificultad=?;");
                            sta.setInt(1, aux2);
                            sta.setInt(2, aux1);
                            sta.setInt(3, lista[j-1]);
                            sta.setInt(4, 3);
                            resul1=sta.executeQuery();
                            j++;
                            String aux="";
                            int vez=0;
                            int conta=0;
                            while(resul1.next()){
                                if(vez==0){
                                    out.println("<h3>"+NPregunta+".-"+resul1.getString("desp")+"</h3>");
                                    aux=resul1.getString("desp");
                                    sta=con.prepareStatement("select * from Foto where Foto.Id_Foto=?;");
                                    sta.setInt(1, resul1.getInt("Imagen"));
                                    rimagen=sta.executeQuery();
                                    if(rimagen.next()){
                                        if(!(rimagen.getBytes("Archivo")==null)){
                                            byte[] bytes=rimagen.getBytes("Archivo");
                                            FileUtils.writeByteArrayToFile(new File(filePath,rimagen.getString("Nombre")), bytes);
                                            archivo=new File(filePath+rimagen.getString("Nombre"));
                                            out.println("<input id='ruta"+NPregunta+"' value='"+("img/"+archivo.getName())+"' type='text' name='ruta"+NPregunta+"' style='visibility: hidden; top: 0px; left: 0px; position: absolute;'>");
                                            out.println("<img id='previa"+NPregunta+"' src='img/cargando.gif' style='height: 50%;width: 50%;'>");
                                            out.println("<br><br>");
                                        }
                                    }
                                    vez=1;
                                }
                                if(!(aux.equals(resul1.getString("desp")))&&vez==1){
                                    out.println("<h3>"+NPregunta+".-"+resul1.getString("desp")+"</h3>");
                                    sta=con.prepareStatement("select * from Foto where Foto.Id_Foto=?;");
                                    sta.setInt(1, resul1.getInt("Imagen"));
                                    rimagen=sta.executeQuery();
                                    if(rimagen.next()){
                                        if(!(rimagen.getBytes("Archivo")==null)){
                                            byte[] bytes=rimagen.getBytes("Archivo");
                                            FileUtils.writeByteArrayToFile(new File(filePath,rimagen.getString("Nombre")), bytes);
                                            archivo=new File(filePath+rimagen.getString("Nombre"));
                                            out.println("<input id='ruta"+NPregunta+"' value='"+("img/"+archivo.getName())+"' type='text' name='ruta"+NPregunta+"' style='visibility: hidden; top: 0px; left: 0px; position: absolute;'>");
                                            out.println("<img id='previa"+NPregunta+"' src='img/cargando.gif' style='height: 50%;width: 50%;'>");
                                            out.println("<br><br>");
                                        }
                                    }
                                }
                                sta=con.prepareStatement("select * from Opcion where Id_Opcion="+resul1.getInt("Id_Opcion")+"");
                                resul2=sta.executeQuery();
                                if(resul2.next()){
                                    if(resul2.getInt("Id_TOpcion")==1){
                                        out.println("<input type='radio' value='Correcta' id='opciones"+NPregunta+"' name='opciones"+NPregunta+"'> "+resul2.getString("Descripcion")+"<br><br>");
                                    }
                                    else{
                                        if(resul2.getInt("Id_TOpcion")==2){
                                            out.println("<input type='radio' value='Incorrecta' id='opciones"+NPregunta+"' name='opciones"+NPregunta+"'> "+resul2.getString("Descripcion")+"<br><br>");
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
                    }
                    out.println("<input id='tema' value='"+aux2+"' type='text' name='tema' style='visibility: hidden; top: 0px; left: 0px; position: absolute;'>");
                }
                catch(Exception e){
                    out.print(e.getMessage());
                }
            %>
            <br>
            <input type="submit" value="Enviar respuestas" onclick="return confirmar()" class="button">
           
        </form>
             <br>
        </div>
    </body>
</html>