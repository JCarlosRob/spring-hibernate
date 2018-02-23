DROP DATABASE  IF EXISTS `spring-hibernate-db`;

CREATE DATABASE  IF NOT EXISTS `spring-hibernate-db`;
USE `spring-hibernate-db`;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
	
  	`username` varchar(50) NOT NULL,
  	`password` varchar(60) NOT NULL,
  	`email` varchar(50) NOT NULL,
  	`enabled` tinyint(1) NOT NULL,
  	PRIMARY KEY (`username`),
  	UNIQUE KEY `email_unique` (`email`)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (

  	`id` int(10) NOT NULL,
  	`username` varchar(50) NOT NULL,
  	`authority` varchar(50) NOT NULL,
  	PRIMARY KEY (`id`),
  	UNIQUE KEY `authorities_unique` (`username`,`authority`),
  	KEY `authorities_fk` (`username`),
  	CONSTRAINT `authorities_fk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`(

	`id` int(10) NOT NULL,
    `title` varchar(100) NOT NULL,
    `author` varchar(100) NOT NULL,
    `dateAdd` date NOT NULL,
    `img` varchar(200),
    
    PRIMARY KEY (`id`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- password test123
--
INSERT INTO `users` VALUES 
('john','$2a$04$ejcASFNDYvvCS2.NuGGPP.KjB6dd1bG/ZCYkvph6u4k1nVs/3lD2O','john@myemail.com',1),
('mary','$2a$04$ejcASFNDYvvCS2.NuGGPP.KjB6dd1bG/ZCYkvph6u4k1nVs/3lD2O','mary@myemail.com',1),
('susan','$2a$04$ejcASFNDYvvCS2.NuGGPP.KjB6dd1bG/ZCYkvph6u4k1nVs/3lD2O','susan@myemail.com',1);

INSERT INTO `authorities` VALUES 
(1,'john','ROLE_USER'),
(2,'mary','ROLE_USER'),
(4,'susan','ROLE_USER'),
(5,'susan','ROLE_ADMIN');

INSERT INTO `books` VALUES
(1, 'Angeles y demonios', 'Dan Brown', '2018-02-22','resources/img/angeles_y_demonios.jpg'),
(2, 'La biblia de los caidos', 'Fernando Trujillo', '2018-02-22','resources/img/biblia_de_los_caidos.jpg'),
(3, 'Clan del oso cavernario', 'Jean M. Auel', '2018-02-22','resources/img/clan_del_oso_cavernario.jpg'),
(4, 'El guardian invisible', 'Dolores Redondo', '2018-02-22','resources/img/el_guardian_invisible.jpg'),
(5, 'El psicoanalista', 'John Katzenbath', '2018-02-22','resources/img/el_psicoanalista.jpg'),
(6, 'Historias de Terramar I', 'Ursula K. Le Guin', '2018-02-22','resources/img/historias_de_terramar.jpg'),
(7, 'La chica del tren', 'Paula Hawkins', '2018-02-22','resources/img/la_chica_del_tren.jpg'),
(8, 'Trece runas', 'Michael Peinkofer', '2018-02-22','resources/img/las_trece_runas.jpg'),
(9, 'Los pilares de la tierra', 'Ken Follett', '2018-02-22','resources/img/los_pilares_de_la_tierra.jpg'),
(10, 'Ready player one', 'Ernest cline', '2018-02-22','resources/img/ready_player_one.jpg'),
(11, 'El ultimo deseo', 'Andrzej Sapkowski', '2018-02-22','resources/img/ultimo_deseo.jpg'),
(12, 'Una columna de fuego', 'Ken Follett', '2018-02-22','resources/img/una_columna_de_fuego.jpg');
