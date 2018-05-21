DROP DATABASE  IF EXISTS `spring-hibernate-db`;

CREATE DATABASE  IF NOT EXISTS `spring-hibernate-db`;
USE `spring-hibernate-db`;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
	
  	`username` varchar(50) NOT NULL,
  	`password` varchar(60) NOT NULL,
  	`email` varchar(50) NOT NULL,
  	`enabled` tinyint(1) NOT NULL,
    
  	PRIMARY KEY (username),
    
  	UNIQUE KEY email_unique (email)
  
)ENGINE=InnoDB;

DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (

  	`id` int(10) NOT NULL AUTO_INCREMENT,
  	`authority` varchar(50) NOT NULL,
    
  	PRIMARY KEY (id)

)ENGINE=InnoDB AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `user_authorities`;
CREATE TABLE `user_authorities`(

	`username` varchar(50) NOT NULL,
    `id_auth` int(10) NOT NULL,
    
    PRIMARY KEY (username, id_auth),
    
    FOREIGN KEY (username) REFERENCES users (username),
    FOREIGN KEY (id_auth) REFERENCES authorities (id)

)ENGINE=InnoDB;

DROP TABLE IF EXISTS `genres`;
CREATE TABLE `genres`(

	`id` int(10) NOT NULL AUTO_INCREMENT,
    `genre` varchar(50) NOT NULL,
    
    PRIMARY KEY (id),
    
    UNIQUE KEY genre_unique (genre)

)ENGINE=InnoDB AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `authors`;
CREATE TABLE `authors`(

	`id` int(10) NOT NULL AUTO_INCREMENT,
    `author_name` varchar(100) NOT NULL,
    `birthday` date,
    `bibliography` varchar(10000),
    
    PRIMARY KEY (id),
    
    UNIQUE KEY author_unique (author_name)

)ENGINE=InnoDB AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`(

	`id` int(10) NOT NULL AUTO_INCREMENT,
    `title` varchar(100) NOT NULL,
    `synopsis` varchar(10000) NOT NULL,
    `publishing_year` int(4) NOT NULL,
    `id_genre` int(10) NOT NULL,
    `publishing_country` varchar(50),
    `publisher` varchar(100),
    `isbn` bigint(14) NOT NULL,
    `rating` int(1),
    `date_add` date NOT NULL,
    `uploaded_by` varchar(50) NOT NULL,
    `img` varchar(200),
    
    PRIMARY KEY (id),
    
    FOREIGN KEY (uploaded_by) REFERENCES users(username),
    FOREIGN KEY (id_genre) REFERENCES genres(id),
    
    UNIQUE KEY isbn_unique (isbn)

)ENGINE=InnoDB AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `authors_books`;
CREATE TABLE `authors_books`(

	`id_author` int(10),
    `id_book` int(10),
    
    PRIMARY KEY (id_author, id_book),
    
    FOREIGN KEY (id_author) REFERENCES authors(id),
    FOREIGN KEY (id_book) REFERENCES books(id)

)ENGINE=InnoDB;

DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE `wishlist`(

	`id` int(10) NOT NULL,
	`username` varchar(50) NOT NULL,
    `id_book` int(10) NOT NULL,
    `date` date NOT NULL,
    
    PRIMARY KEY (id),
    
    FOREIGN KEY (username) REFERENCES users (username),
    FOREIGN KEY (id_book) REFERENCES books (id)

)ENGINE=InnoDB;

DROP TABLE IF EXISTS `owned_books`;
CREATE TABLE `owned_books`(
	
    `id` int(10) AUTO_INCREMENT,
    `id_book` int(10) NOT NULL,
    `username` varchar(50) NOT NULL,
    `state_reading` varchar(50) NOT NULL,
    `date` date NOT NULL,
    
    PRIMARY KEY (id),
    
    FOREIGN KEY (username) REFERENCES users(username),
    FOREIGN KEY (id_book) REFERENCES books (id)

)ENGINE=InnoDB AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `loans_borrowed_books`;
CREATE TABLE `loans_borrowed_books`(
	
    `id` int(10) AUTO_INCREMENT,
	`id_user` varchar(50) NOT NULL,
    `id_owned_book` int(10) NOT NULL,
    `state_reading` varchar(50) NOT NULL,
    `date` date NOT NULL,
    
    PRIMARY KEY (id),
    
    FOREIGN KEY (id_user) REFERENCES users (username),
    FOREIGN KEY (id_owned_book) REFERENCES owned_books (id)

)ENGINE=InnoDB AUTO_INCREMENT=1;

--
-- password test123
--
INSERT INTO `users` VALUES 
('john','$2a$04$ejcASFNDYvvCS2.NuGGPP.KjB6dd1bG/ZCYkvph6u4k1nVs/3lD2O','john@myemail.com',1),
('mary','$2a$04$ejcASFNDYvvCS2.NuGGPP.KjB6dd1bG/ZCYkvph6u4k1nVs/3lD2O','mary@myemail.com',1),
('susan','$2a$04$ejcASFNDYvvCS2.NuGGPP.KjB6dd1bG/ZCYkvph6u4k1nVs/3lD2O','susan@myemail.com',1);

INSERT INTO `authorities` VALUES 
(1,'ROLE_USER'),
(2,'ROLE_ADMIN');

INSERT INTO `user_authorities` VALUES
('john', 1),
('mary',1),
('susan',1),
('susan',2);

INSERT INTO `genres` VALUES
(1, 'Thriller'),
(2, 'Romántica'),
(3, 'Aventura'),
(4, 'Terror'),
(5, 'Ficción'),
(6, 'Ciencia Ficción'),
(7, 'Intriga'),
(8, 'Biográfica'),
(9, 'Infantil'),
(10, 'Autoayuda'),
(11, 'Erótica'),
(12, 'Hogar'),
(13, 'Enciclopedia'),
(14, 'Política'),
(15, 'Economía'),
(16, 'Sociedad'),
(17, 'Deportes'),
(18, 'Cultura'),
(19, 'Historica'),
(20, 'Varios');

INSERT INTO `books` VALUES

(1, 'Angeles y demonios', 'El profesor de simbología Robert Langdon, recibe una 
misteriosa llamada a las tantas de la madrugada y se ve envuelto en una persecución en la que 
tratará de evitar la destrucción de la Ciudad del Vaticano. Acompañado de la científica 
Vittoria Vetra, ambos deberán encontrar la guarida de los Illuminati para detener a un hombre 
cuyo propósito es hacer explotar la antimateria y destruir el altar principal de la Iglesia 
junto a todas las personas que estén a su alrededor.', 2005, 7, 'EEUU', 'UMBRIEL', 
9788495618719, 0, '2018-02-01', 'susan','resources/img/angeles_y_demonios.jpg'),

(2, 'La biblia de los caidos', 'El mundo cuenta con un lado oculto, una 
cara sobrenatural que nos susurra, que se intuye, pero que muy pocos perciben. La inmensa 
mayoría de las personas no es consciente de ese lado paranormal... ni de sus riesgos. A veces 
la gente se topa con esos peligros y desespera, se atemoriza, y no sabe qué hacer ni a quién 
recurrir. Pero no todo está perdido... Dicen que en Madrid reposa una iglesia muy antigua, cuyo 
origen es desconocido. Allí, en su interior, frente a una cruz de piedra esculpida en uno de sus 
muros, se puede alzar una plegaria. También dicen que aquel que no tiene alma la escuchará, y si 
la fortuna acompaña, el ruego será atendido. Pero exigirá un elevado precio por sus servicios, 
uno que no todo el mundo está dispuesto a pagar. Mejor será asegurarse de que se quiere contar 
con él antes de recitar la plegaria. Eso es lo que dicen.', 2011, 1, 'España', 
'CreateSpace Independent Publishing Platform', 9781463548155, 0, '2018-02-02', 'susan', 
'resources/img/biblia_de_los_caidos.jpg'),

(3, 'Clan del oso cavernario', 'En la última fase de la Era Glacial, cuando 
Neandertales y Cromañones compartían la tierra, Ayla, una niña Cromañón de 5 años, queda 
aislada de su tribu por culpa de un terremoto y es acogida por un grupo de Neandertales. 
Valiente e indomable la joven al principio inspira sorpresa, luego cautela y, por fin, es 
aceptada por parte del Clan. Iza, la curandera y Creb, el Hombre Santo, cuidan de ella. Ayla se 
interesa por las cacerías y los preparativos de las armas, algo que está prohibido a las mujeres 
y que ella, no obstante, domina con maestría.', 2011, 19, 'EEUU', 'MAEVA', 
9788415120131, 0, '2018-02-03', 'susan', 'resources/img/clan_del_oso_cavernario.jpg'),

(4, 'El guardian invisible', 'Impactante thriller que tiene su mejor baza 
en el contraste entre lo racional y científico, y lo legendario y mítico. «Ainhoa Elizasu fue
 la segunda víctima del basajaun, aunque entonces la prensa todavía no lo llamaba así. Fue un 
 poco más tarde cuando trascendió que alrededor de los cadáveres aparecían pelos de animal, 
 restos de piel y rastros dudosamente humanos, unidos a una especie de fúnebre ceremonia de 
 purificación. Una fuerza maligna, telúrica y ancestral parecía haber marcado los cuerpos de 
 aquellas casi niñas con la ropa rasgada, el vello púbico rasurado y las manos dispuestas en 
 actitud virginal.» En los márgenes del río Baztán, en el valle de Navarra, aparece el cuerpo 
 desnudo de una adolescente en unas circunstancias que lo ponen en relación con un asesinato 
 ocurrido en los alrededores un mes atrás. La inspectora de la sección de homicidios de la 
 Policía Foral, Amaia Salazar, será la encargada de dirigir una investigación que la llevará 
 de vuelta a Elizondo, una pequeña población de donde es originaria y de la que ha tratado de 
 huir toda su vida. Enfrentada con las cada vez más complicadas derivaciones del caso y con 
 sus propios fantasmas familiares, la investigación de Amaia es una carrera contrarreloj para 
 dar con un asesino que puede mostrar el rostro más aterrador de una realidad brutal.', 2016,
 1, 'España', 'DESTINO', 9788423350995, 0, '2018-02-04', 'susan',
 'resources/img/el_guardian_invisible.jpg'),
 
(5, 'El psicoanalista', 'Frederick Starks, psicoanalista con una larga 
experiencia, recibe un anónimo y tendrá que emplear toda su astucia para, en sólo quince días, 
averiguar quién es el autor de esa amenazadora misiva que promete hacerle la existencia imposible. 
En caso contrario, deberá elegir entre suicidarse o ser testigo de cómo sus familiares y conocidos 
mueren por obra de un psicópata decidido a llevar hasta el fin su sed de venganza.', 2009, 
7, 'España', 'ZETA BOLSILLO', 9788498721805, 0, '2018-02-05', 'susan',
'resources/img/el_psicoanalista.jpg'),

(6, 'Historias de Terramar I', 'En estas dos primeras novelas de la saga, 
las aventuras vividas por el joven mago Ged y la sacerdotisa Tenar los transformarán profundamente, 
les harán crecer y liberarse de sus miedos, y se convertirán en auténticos héroes que ayudarán a 
restablecer el equilibrio cósmico. ', 2005, 5, 'España', 'MINOTAURO', 9788445076682,
0, '2018-02-06', 'susan', 'resources/img/historias_de_terramar.jpg'),

(7, 'La chica del tren', '¿Estabas en el tren de las 8.04? ¿Viste algo sospechoso? 
Rachel, sí. Rachel toma siempre el tren de las 8.04 h. Cada mañana lo mismo: el mismo paisaje, las 
mismas casas? y la misma parada en la señal roja. Son solo unos segundos, pero le permiten observar 
a una pareja desayunando tranquilamente en su terraza. Siente que los conoce y se inventa unos 
nombres para ellos: Jess y Jason. Su vida es perfecta, no como la suya. Pero un día ve algo. 
Sucede muy deprisa, pero es suficiente. ¿Y si Jess y Jason no son tan felices como ella cree? 
¿Y si nada es lo que parece? Tú no la conoces. Ella a ti, sí.', 2015, 1, 'España',
'PLANETA', 9788408141471, 0, '2018-02-07', 'susan', 'resources/img/la_chica_del_tren.jpg'),

(8, 'Trece runas', 'Una misteriosa secta escocesa; un oscuro secreto 
oculto durante siglos. Un thriller histórico en donde el gran escritor escocés Walter Scott 
investiga la muerte de su ayudante. Junto con su sobrino Quentin, emprende una investigación 
que lo llevará a buscar respuestas en las trece runas de la tumba del rey Roberto I de Escocia.
Quentin, además, ha encontrado el amor , pero ella también ha estado a punto  de ser asesinada...
Hermandades secretas, bibliotecas misteriosas: un mundo donde el afán por el poder admite el 
sacrificio humano, a no ser que un rayo consiga anular el poder de la espada de las runas.',
2008, 1, 'España', 'DEBOLSILLO', 9788483466759, 0, '2018-02-08', 'susan',
'resources/img/las_trece_runas.jpg'),

(9, 'Los pilares de la tierra', 'El gran maestro de la narrativa de acción y 
suspense nos transporta a la Edad Media, a un fascinante mundo de reyes, damas, caballeros, 
pugnas feudales, castillos y ciudades amuralladas. El amor y la muerte se entrecruzan vibrantemente 
en este magistral tapiz cuyo centro es la construcción de una catedral gótica. La historia se inicia 
con el ahorcamiento público de un inocente y finaliza con la humillación de un rey. Los pilares de 
la Tierra es la obra maestra de Ken Follett y constituye una excepcional evocación de una época de 
violentas pasiones.', 2010, 19, 'España', 'DEBOLSILLO', 9788499086514, 0, '2018-02-09',
'susan', 'resources/img/los_pilares_de_la_tierra.jpg'),

(10, 'Ready player one', 'Estamos en el año 2044 y, como el resto de la humanidad, 
Wade Watts prefiere mil veces el videojuego de OASIS al cada vez más sombrío mundo real. Se asegura 
que esconde las diabólicas piezas de un rompecabezas cuya resolución conduce a una fortuna incalculable. 
Las claves del enigma están basadas en la cultura de finales del siglo XX y, durante años, millones de 
humanos han intentado dar con ellas, sin éxito. De repente, Wade logra resolver el primer rompecabezas 
del premio, y, a partir de ese momento, debe competir contra miles de jugadores para conseguir el trofeo. 
La única forma de sobrevivir es ganar; pero para hacerlo tendrá que abandonar su existencia virtual y 
enfrentarse a la vida y al amor en el mundo real, del que siempre ha intentado escapar.', 2011,
6, 'España', 'S.A. EDICIONES B', 9788466649179, 0, '2018-02-10', 'susan',
'resources/img/ready_player_one.jpg'),

(11, 'El ultimo deseo', 'Geralt de Rivia, brujo y mutante sobrehumano, se gana 
la vida como cazador de monstruos en una tierra de magia y maravilla: con sus dos espadas al hombro 
-la de acero para hombres, y la de plata para bestias- da cuenta de estriges, manticoras, grifos, 
vampiros, quimeras y lobisomes, pero sólo cuando amenazan la paz. Irónico, cínico, descreído y siempre 
errante, sus pasos lo llevan de pueblo en pueblo ofreciendo sus servicios, hallando las más de las veces 
que los auténticos monstruos se esconden bajo rostros humanos. En su camino sorteará intrigas, elegirá 
el mal menor, debatirá cuestiones de precio, hollará el confín del mundo y realizará su último deseo: 
así comienzan las aventuras del brujo Geralt de Rivia.Andrzej Sapkowski es el gran renovador de la 
literatura fantástica de nuestros tiempos, un genio del lenguaje y la caracterización cuya prosa ya ha 
hechizado a millones de lectores en todo el mundo.', 2008, 5, 'España', 'ALAMUT EDICIONES',
9788498890372, 0, '2018-02-11', 'susan', 'resources/img/ultimo_deseo.jpg'),

(12, 'Una columna de fuego', 'Una columna de fuego arranca cuando el joven Ned Willard 
regresa a su hogar en Kingsbridge por Navidad. Corre el año 1558, un año que trastocará la vida de Ned y 
que cambiará Europa para siempre. Las antiguas piedras de la catedral de Kingsbridge contemplan una 
ciudad dividida por el odio religioso. Los principios elevados chocan con la amistad, la lealtad y el 
amor, y provocan derramamientos de sangre. Ned se encuentra de pronto en el bando contrario al de la 
muchacha con quien anhela casarse, Margery Fitzgerald. Cuando Isabel I llega al trono, toda Europa 
se vuelve en contra de Inglaterra. La joven monarca, astuta y decidida, organiza el primer servicio 
secreto del país para estar avisada ante cualquier indicio de intrigas homicidas, levantamientos o planes 
de invasión. En París, a la espera, se encuentra la seductora y obstinada María Estuardo, reina de los 
escoceses, en el seno de una familia francesa con una ambición descomunal. Proclamada legítima soberana 
de Inglaterra, María cuenta con sus propios partidarios, que conspiran para deshacerse de Isabel. 
Entretanto, Ned Willard busca a Jean Langlais, un personaje escu... Leer resumen completo', 2017,
19, 'España', 'PLAZA & JANES EDITORES', 9788401018251, 0, '2018-02-12', 'susan',
'resources/img/una_columna_de_fuego.jpg');

INSERT INTO `authors` VALUES
(1, 'Dan Brown', '1111-11-11', ''),
(2, 'Fernando Trujillo', '1111-11-11', ''),
(3, 'Jean M. Auel', '1111-11-11', ''),
(4, 'Dolores Redondo', '1111-11-11', ''),
(5, 'John Katzenbath', '1111-11-11', ''),
(6, 'Ursula K. Le Guin', '1111-11-11', ''),
(7, 'Paula Hawkins', '1111-11-11', ''),
(8, 'Michael Peinkofer', '1111-11-11', ''),
(9, 'Ken Follett', '1111-11-11', ''),
(10, 'Ernest cline', '1111-11-11', ''),
(11, 'Andrzej Sapkowski', '1111-11-11', '');

INSERT INTO `authors_books` VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(9,12);