<%-- 
    Document   : listaProducto
    Created on : 04-may-2017, 12:42:50
    Author     : María Jesús
--%>

<%@page import="java.io.EOFException"%>
<%@page import="colegio.Alumno"%>
<%@page import="java.io.*"%>
<%@page import="colegio.Fichero"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista producto</title>
    </head>
    <body>
        <h1>Lista de Productos</h1>
        <%@include file="html/nav.html" %>
        <table>
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Descripción</th>
                <th>Precio</th>
            </tr>
        <%
            ObjectInputStream ois;
            String respuesta="";
            
           
                Fichero f = new Fichero("fichero.bin","rb");
                Alumno aux = (Alumno) f.leerObjeto();
                while(aux!=null){
                    
                    respuesta+="<tr>\n"
                            + "<td>"+aux.getNombre()+"</td>\n"
                            + "<td>"+aux.getApellidos()+"<td>\n"
                            + "<td>"+aux.getEdad()+"</td>\n"
                            + "</tr>\n";
                    //respuesta+=aux.toString();
                   
                    
                    aux = (Alumno) f.leerObjeto();
                }
            
            f.close();
        %>
        <%=respuesta%>
       </table>
        
    </body>
</html>
