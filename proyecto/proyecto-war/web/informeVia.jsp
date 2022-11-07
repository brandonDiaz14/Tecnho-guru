<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>TECNHO-GURU</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="estilos.css">
    </head>
    <body>
        <div id="home">
        <header>
            <h1 id ="titulo1">TECNHO</h1>
            <h2 id ="titulo2">GURU</h2>
        </header>
        <nav id="menu">
            <ul>
                <div id="opcion1">
                    <li><a href="#">NOTICIAS DE LA VIA</a></li>
                </div>
                <div id="opcion2">
                    <li><li><a href="index.html">INICIO</a></li></li>
                </div>
                <div id="opcion3">
                    <li><a href="informeVia.jsp">INFORME DE VIA</a></li>
                </div>
            </ul>
        </nav>
        
        <form action="./EventosUsuario" method="POST">
            <center>
                <input id="submit" type="submit" name="action" value="ver eventos de la via" />
                <a class="boton" onclick="getLocation()">Ver eventos cerca</a>
            </center>
            <table border="1">
                
                <th>NOMBRE DEL EVENTO</th>
                <th>TIPO DEL EVENTO</th>
                <th>LUGAR DE EVENTO</th>
                <th>HORA DE RETRASO</th>
                <th>VER EVENTO</th>
                    <c:forEach items="${allEventos}" var="event">
                        <tr>
                            
                            <td>${event.nombreEvento}</td>
                            <td>${event.tipoEvento}</td>
                            <td>${event.lugarEvento}</td>
                            <td>${event.horaRetraso}</td>
                            <td><a class="boton_eventos" onclick="iniciarMap(${event.latitud},${event.longitud})">VER EVENTO</a></td>
                        </tr>

                    </c:forEach> 
            </table>
        </form>
        
        <p id="geo"></p>
        <p id="lat"></p>
        <p id="long"></p>
        <div id="map"></div>
        
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBDaeWicvigtP9xPv919E-RNoxfvC-Hqik&callback=iniciarMap"></script>
        <script>
            var x = document.getElementById("geo");
            var lt = document.getElementById("lat");
            var lg = document.getElementById("long");
            var latitudUsuario;
            var longitudUsuario;
            function getLocation(){
                if(navigator.geolocation){
                    navigator.geolocation.getCurrentPosition(showPosition);
                }else{
                    x.innerHTML= "no es compatible tu navegador"
                }
            }

            function showPosition(position){
                latitudUsuario = position.coords.latitude;
                longitudUsuario = position.coords.longitude;
                x.innerHTML = "MI UBICACION";
                lt.innerText = latitudUsuario;
                lg.innerText = longitudUsuario;
                iniciarMap(latitudUsuario,longitudUsuario);
                eventosCerca(latitudUsuario,longitudUsuario);
            }
            
            function iniciarMap(latitud,longitud){
                var coord = {lat:latitud ,lng: longitud};
                var map = new google.maps.Map(document.getElementById('map'),{
                zoom: 18,
                center: coord
                });
                var marker = new google.maps.Marker({
                position: coord,
                map: map
                });
                var ubicacionActual = {lat:latitud ,lng: longitud};
                var actual = new google.maps.Marker({
                position: coord,
                map: map
                });

                
            }
            function eventosCerca(latitud,longitud){
                
            }
        </script>
        
    </body>
</html>
