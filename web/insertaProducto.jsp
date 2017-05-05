<%-- 
    Document   : insertaAlumno
    Created on : 04-may-2017, 12:33:38
    Author     : María Jesús
--%>

<%@page import="leroy.Fichero"%>
<%@page import="java.io.*"%>
<%@page import="leroy.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserta Producto</title>
    </head>
    <%
            int id;
            String nombre=request.getParameter("nombre");
            String apellidos=request.getParameter("descripcion");
            float precio;
            String respuesta;
            
            
            try{
                Fichero f = new Fichero("almacen.bin","ab");
                id= Integer.parseUnsignedInt(request.getParameter("id"));   
                if(id==null 
                        || nombre==null 
                        || descripcion==null 
                        || request.getParameter("precio")==null)
                {
                    respuesta="Alguno de los campos quedó sin rellenar";
                }
                else{
                    f.escribirObjeto(new Producto(id, nombre, descripcion, precio));
                    respuesta="Se insertó con éxito";
                    
                }
                f.close();
            }catch(NumberFormatException nfe){
                respuesta="Error en los numeros";
            }
            
            
        %>
    <body>
        <h1>Inserta Producto</h1>
        <%@include file="html/nav.html" %>
        <h2>Formulario</h2>
        <form action="insertaProducto.jsp" method="POST">
            Id:<input type="number" name="id"><br>
            Nombre:<input type="text" name="nombre"><br>
            Descripción:<input type="text" name="descripcion"><br>
            Precio:<input type="number" name="precio"><br>
            <input type="submit" value="Enviar">
            <input type="reset" value="Reset">
        </form>
        <p><%=respuesta%></p>
              
    </body>
</html>
