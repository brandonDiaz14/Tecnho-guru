<%-- 
    Document   : response
    Created on : 20/09/2022, 03:32:31 PM
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LABORATORIO JSP | U Piloto Metodos Formales</title>
    </head>
    <body>

        <jsp:useBean id="myBean" scope="session" class="co.edu.unipiloto.labjsp.NameHandler" />
        <jsp:useBean id="clock" scope="session" class="co.edu.unipiloto.labjsp.NameHandler" />

        <jsp:setProperty name="myBean" property="name"/>
        <jsp:setProperty name="myBean" property="fechaNac"/>
        <jsp:setProperty name="myBean" property="edadStr" value="{<%=myBean%>}"/>
        <jsp:setProperty name="clock" property="ahoraTime"/>

        <h1>**************************************************
        <h1>*                   Bienvenido                   *
        <h1>**************************************************   
            <br> 
            <c:choose>
                <c:when test="${clock.ahoraTime>=12 && clock.ahoraTime<=18}">  
                    Buenas tardes
                </c:when>
                <c:when test="${clock.ahoraTime>=19 && clock.ahoraTime<=23}"> 
                    Buenas noches
                </c:when>
                <c:otherwise>
                    Buenos dias
                </c:otherwise>
            </c:choose>
            
            <jsp:getProperty name="myBean" property="name" />
            al curso de metodos formales.
             <br> Su fecha de nacimiento es:<jsp:getProperty name="myBean" property="fechaNac" />
             <br> Su edad es: <jsp:getProperty name="myBean" property="edadStr"/>
        </h1>     
    </body>
</html>
