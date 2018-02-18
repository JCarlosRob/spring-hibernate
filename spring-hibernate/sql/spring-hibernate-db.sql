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

--
-- password test123
--
INSERT INTO `users` 
VALUES 
('john','$2a$04$ejcASFNDYvvCS2.NuGGPP.KjB6dd1bG/ZCYkvph6u4k1nVs/3lD2O','john@myemail.com',1),
('mary','$2a$04$ejcASFNDYvvCS2.NuGGPP.KjB6dd1bG/ZCYkvph6u4k1nVs/3lD2O','mary@myemail.com',1),
('susan','$2a$04$ejcASFNDYvvCS2.NuGGPP.KjB6dd1bG/ZCYkvph6u4k1nVs/3lD2O','susan@myemail.com',1);

INSERT INTO `authorities` 
VALUES 
(1,'john','ROLE_USER'),
(2,'mary','ROLE_USER'),
(4,'susan','ROLE_USER'),
(5,'susan','ROLE_ADMIN');


