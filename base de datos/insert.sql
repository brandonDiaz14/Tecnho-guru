USE `mydb` ;
show tables;
describe administrador;
INSERT INTO administrador(idAdministrador,nombre,apellido,usuario,contraseña)
VALUES (1,'brandon','diaz','adminBrandon','crisbra1406'),(2,'catalina','morales','adminCatalina','123456'),(3,'tatiana','garzon','adminTatiana','1567612'),
		(4,'sergio','martinez','adminSergio','165421351'),(5,'juan','quintero','adminjuan','2486356');
select * from administrador;

describe alertas;
INSERT INTO alertas(idalertas,nombre,tipo_alerta,Administrador_idAdministrador)
VALUES (1,'choque usme','preventiva',1),(2,'mantenimiento avenia 34','informativa',2),(3,'choque en la 26','preventiva',3),
		(4,'cierre de via manifestacion','informativa',4),(5,'choque centro','preventiva',5);
select * from alertas;

describe evento;
INSERT INTO evento(idevento,nombre_evento,tipo_evento,lugar_evento,hora_retraso,latitud,longitud,Administrador_idAdministrador)
VALUES (1,'choque usme','choque','carrera 5 '),(2,'mantenimiento avenia 34','informativa',2),(3,'choque en la 26','preventiva',3),
		(4,'cierre de via manifestacion','informativa',4),(5,'choque centro','preventiva',5);
select * from alertas;