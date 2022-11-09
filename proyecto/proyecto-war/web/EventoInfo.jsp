<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>registrarse</title>
    </head>
    <body >
        <center>
            <div >
                <h1>registrar Evento</h1>
                <form action="./evento_servelt" method="POST">
                    <table>
                        <tr>
                            <td>Id</td>
                            <td><input type="text" name="evento_id"  /></td>
                        </tr>
                        <tr>
                            <td>NOMBRE EVENTO</td>
                            <td><input type="text" name="nombre_evento"  /></td>
                        </tr>
                        <tr>
                            <td>TIPO DE EVENTO</td>
                            <td><input type="text" name="tipo_evento"  /></td>
                        </tr>
                        <tr>
                            <td>LUGAR DEL EVENTO</td>
                            <td><input type="text" name="lugar_evento"  /></td>
                        </tr>
                        <tr>
                            <td>HORA DE RETRASO</td>
                            <td><input type="text" name="hora_retraso"  /></td>
                        </tr>
                        <tr>
                            <td>LATITUD</td>
                                <td><input type="text" name="latitud"  /></td>
                        </tr>
                        <tr>
                            <td>LONGITUD</td>
                            <td><input type="text" name="longitud"  /></td>
                        </tr>
                        <tr>
                            <tr>
                        <td colspan="2">
                            
                            <input type="submit" name="action" value="Add" />
                            <input type="submit" name="action" value="Edit" />
                            <input type="submit" name="action" value="Delete" />
                            
                        </td>
               
                        </tr>
                        
                    </table>
                </form>
                <br>
                <form action="./verEvento_1" method="POST">
                    <center>
                        <input type="submit" name="action" value="ver datos" />
                    </center>
                    <table border="1">
                        <th>ID</th>
                        <th>NOMBRE DEL EVENTO</th>
                        <th>TIPO DEL EVENTO</th>
                        <th>LUGAR DE EVENTO</th>
                        <th>HORA DE RETRASO</th>
                        <th>LATITUD</th>
                        <th>LONGITUD</th>
                            <c:forEach items="${allEventos}" var="event">
                                <tr>
                                    <td>${event.eventoId}</td>
                                    <td>${event.nombreEvento}</td>
                                    <td>${event.tipoEvento}</td>
                                    <td>${event.lugarEvento}</td>
                                    <td>${event.horaRetraso}</td>
                                    <td>${event.latitud}</td>
                                    <td>${event.longitud}</td>
                                </tr>
                            </c:forEach> 
                    </table>
                </form>
                
            </div>
        </center>
        
    </body>
</html>
