CREATE DATABASE  IF NOT EXISTS `proyecto22026`;
USE `proyecto22026`;

DROP TABLE IF EXISTS `socios`;
DROP TABLE IF EXISTS `estado`;

CREATE TABLE `estado` (
  `id_estado` tinyint(1) NOT NULL,
  `nombre` char(10) DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
);

INSERT INTO `estado` VALUES (0,'Inactivo'),(1,'Activo');


CREATE TABLE `socios` (
  `id_socio` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `dni` int(8) NOT NULL,
  `mail` varchar(30) DEFAULT NULL,
  `fecha_alta` datetime DEFAULT CURRENT_TIMESTAMP(),
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_socio`),
  UNIQUE KEY `dni_UNIQUE` (`dni`), 
  UNIQUE KEY `mail_UNIQUE` (`MAIL`),
  KEY `estado` (`estado`),
  CONSTRAINT `socios_ibfk_1` FOREIGN KEY (`estado`) REFERENCES `estado` (`id_estado`)
);

INSERT INTO `socios`(nombre,apellido,dni,mail,estado) 
VALUES ('Arnold','Schwarzenegger',1000,'sarasa1@mail.com',1),('Aziz','Shavershian',1001,'sarasa2@mail.com',0),('Dwayne','Johnson',1002,'sarasa3@mail.com',1),('Ronald','Coleman',1003,'sarasa4@mail.com',1),('Chris','Bumstead',1004,'sarasa5@mail.com',1),('Martyn','Ford',1005,'sarasa6@mail.com',1);
select * from socios;

