-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 24-09-2021 a las 15:47:59
-- Versión del servidor: 5.7.24
-- Versión de PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `movie`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actor`
--

DROP TABLE IF EXISTS `actor`;
CREATE TABLE IF NOT EXISTS `actor` (
  `act_id` int(11) NOT NULL COMMENT 'this is a unique ID for each actor',
  `act_fname` char(20) NOT NULL COMMENT 'this is the first name of each actor',
  `act_lname` char(20) NOT NULL COMMENT 'this is the last name of each actor',
  `act_gender` char(1) NOT NULL COMMENT 'this is the gender of each actor',
  PRIMARY KEY (`act_id`),
  UNIQUE KEY `act_id_UNIQUE` (`act_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `actor`
--

INSERT INTO `actor` (`act_id`, `act_fname`, `act_lname`, `act_gender`) VALUES
(101, 'James', 'Stewart', 'M'),
(102, 'Deborah', 'Kerr', 'F'),
(103, 'Peter', 'OToole', 'M'),
(104, 'Robert', 'De Niro', 'M'),
(105, 'F. Murray', 'Abraham', 'M'),
(106, 'Harrison', 'Ford', 'M'),
(107, 'Nicole', 'Kidman', 'F'),
(108, 'Stephen', 'Baldwin', 'M'),
(109, 'Jack', 'Nicholson', 'M'),
(110, 'Mark', 'Wahlberg', 'M'),
(111, 'Woody', 'Allen', 'M'),
(112, 'Claire', 'Danes', 'F'),
(113, 'Tim', 'Robbins', 'M'),
(114, 'Kevin', 'Spacey', 'M'),
(115, 'Kate', 'Winslet', 'F'),
(116, 'Robin', 'Williams', 'M'),
(117, 'Jon', 'Voight', 'M'),
(118, 'Ewan', 'McGregor', 'M'),
(119, 'Christian', 'Bale', 'M'),
(120, 'Maggie', 'Gyllenhaal', 'F'),
(121, 'Dev', 'Patel', 'M'),
(122, 'Sigourney', 'Weaver', 'F'),
(123, 'David', 'Aston', 'M'),
(124, 'Ali', 'Astin', 'F');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `director`
--

DROP TABLE IF EXISTS `director`;
CREATE TABLE IF NOT EXISTS `director` (
  `dir_id` int(11) NOT NULL COMMENT 'this is a unique ID for each director',
  `dir_fname` char(20) NOT NULL COMMENT 'this is the first name of the director',
  `dir_lname` char(20) NOT NULL COMMENT 'this is the last name of the director',
  PRIMARY KEY (`dir_id`),
  UNIQUE KEY `dir_id_UNIQUE` (`dir_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';

--
-- Volcado de datos para la tabla `director`
--

INSERT INTO `director` (`dir_id`, `dir_fname`, `dir_lname`) VALUES
(201, 'Alfred', 'Hitchcock'),
(202, 'Jack', 'Clayton'),
(203, 'David', 'Lean'),
(204, 'Michael', 'Cimino'),
(205, 'Milos', 'Forman'),
(206, 'Ridley', 'Scott'),
(207, 'Stanley', 'Kubrick'),
(208, 'Bryan', 'Singer'),
(209, 'Roman', 'Polanski'),
(210, 'Paul', 'Thomas Anderson'),
(211, 'Woody', 'Allen'),
(212, 'Hayao', 'Miyazaki'),
(213, 'Frank', 'Darabont'),
(214, 'Sam', 'Mendes'),
(215, 'James', 'Cameron'),
(216, 'Gus', 'Van Sant'),
(217, 'John', 'Boorman'),
(218, 'Danny', 'Boyle'),
(219, 'Christopher', 'Nolan'),
(220, 'Richard', 'Kelly'),
(221, 'Kevin', 'Spacey'),
(222, 'Andrei', 'Tarkovsky'),
(223, 'Peter', 'Jackson');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genres`
--

DROP TABLE IF EXISTS `genres`;
CREATE TABLE IF NOT EXISTS `genres` (
  `gen_id` int(11) NOT NULL COMMENT 'this is a unique ID for each genres',
  `gen_title` varchar(20) NOT NULL COMMENT 'this is the description of the genres',
  PRIMARY KEY (`gen_id`),
  UNIQUE KEY `gen_id_UNIQUE` (`gen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `genres`
--

INSERT INTO `genres` (`gen_id`, `gen_title`) VALUES
(1001, 'Action'),
(1002, 'Adventure'),
(1003, 'Animation'),
(1004, 'Biography'),
(1005, 'Comedy'),
(1006, 'Crime'),
(1007, 'Drama'),
(1008, 'Horror'),
(1009, 'Music'),
(1010, 'Mystery'),
(1011, 'Romance'),
(1012, 'Thriller'),
(1013, 'War');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movie`
--

DROP TABLE IF EXISTS `movie`;
CREATE TABLE IF NOT EXISTS `movie` (
  `mov_id` int(11) NOT NULL COMMENT 'this is the unique ID for each movie',
  `mov_title` char(50) NOT NULL COMMENT 'this column represents the name of the movie',
  `mov_year` int(11) NOT NULL COMMENT 'this is the year of making the movie',
  `mov_time` int(11) NOT NULL COMMENT 'duration of the movie i.e. how long it was running',
  `mov_lang` char(50) NOT NULL COMMENT 'the language in which movie was casted',
  `mov_dt_rel` date DEFAULT NULL COMMENT 'this is the release date of the movie',
  `mov_rel_country` char(5) NOT NULL COMMENT 'this is the name of the country(s) where the movie was released',
  PRIMARY KEY (`mov_id`),
  UNIQUE KEY `mov_id_UNIQUE` (`mov_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `movie`
--

INSERT INTO `movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES
(901, 'Vertigo', 1958, 128, 'English', '1958-08-24', 'UK'),
(902, 'The Innocents', 1961, 100, 'English', '1962-02-19', 'SW'),
(903, 'Lawrence of Arabia', 1962, 216, 'English', '1962-12-11', 'UK'),
(904, 'The Deer Hunter', 1978, 183, 'English', '1979-03-08', 'UK'),
(905, 'Amadeus', 1984, 160, 'English', '1985-01-07', 'UK'),
(906, 'Blade Runner', 1982, 117, 'English', '1982-09-09', 'UK'),
(907, 'Eyes Wide Shut', 1999, 159, 'English', NULL, 'UK'),
(908, 'The Usual Suspects', 1995, 106, 'English', '1995-08-25', 'UK'),
(909, 'Chinatown', 1974, 130, 'English', '1974-08-09', 'UK'),
(910, 'Boogie Nights', 1997, 155, 'English', '1998-02-16', 'UK'),
(911, 'Annie Hall', 1977, 93, 'English', '1977-04-20', 'USA'),
(912, 'Princess Mononoke', 1997, 134, 'Japanese', '2001-10-19', 'UK'),
(913, 'The Shawshank Redemption', 1994, 142, 'English', '1995-02-17', 'UK'),
(914, 'American Beauty', 1999, 122, 'English', NULL, 'UK'),
(915, 'Titanic', 1997, 194, 'English', '1998-01-23', 'UK'),
(916, 'Good Will Hunting', 1997, 126, 'English', '1998-06-03', 'UK'),
(917, 'Deliverance', 1972, 109, 'English', '1982-10-05', 'UK'),
(918, 'Trainspotting', 1996, 94, 'English', '1996-02-23', 'UK'),
(919, 'The Prestige', 2006, 130, 'English', '2006-11-10', 'UK'),
(920, 'Donnie Darko', 2001, 113, 'English', NULL, 'UK'),
(921, 'Slumdog Millionaire', 2008, 120, 'English', '2009-01-09', 'UK'),
(922, 'Aliens', 1986, 137, 'English', '1986-08-29', 'UK'),
(923, 'Beyond the Sea', 2004, 118, 'English', '2004-11-26', 'UK'),
(924, 'Avatar', 2009, 162, 'English', '2009-12-17', 'UK'),
(925, 'Braveheart', 1995, 178, 'English', '1995-09-08', 'UK'),
(926, 'Seven Samurai', 1954, 207, 'Japanese', '1954-04-26', 'JP'),
(927, 'Spirited Away', 2001, 125, 'Japanese', '2003-09-12', 'UK'),
(928, 'Back to the Future', 1985, 116, 'English', '1985-12-04', 'UK');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movie_cast`
--

DROP TABLE IF EXISTS `movie_cast`;
CREATE TABLE IF NOT EXISTS `movie_cast` (
  `mcast_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'this is the unique ID for each movie_cast',
  `act_id` int(11) NOT NULL COMMENT 'this is ID of actor, which is referencing the act_id column of actor table',
  `mov_id` int(11) NOT NULL COMMENT 'this is the ID of the movie, which is referencing the mov_id column of the table movie',
  `role` char(30) NOT NULL COMMENT 'this is the name of a character in the movie, an actor acted for that character',
  PRIMARY KEY (`mcast_id`,`act_id`,`mov_id`),
  UNIQUE KEY `mcast_id_UNIQUE` (`mcast_id`),
  KEY `fk_actor_movie_cast_idx` (`act_id`),
  KEY `fk_movie_movie_cast_idx` (`mov_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `movie_cast`
--

INSERT INTO `movie_cast` (`mcast_id`, `act_id`, `mov_id`, `role`) VALUES
(1, 101, 901, 'John Scottie Ferguson'),
(2, 102, 902, 'Miss Giddens'),
(3, 103, 903, 'T.E. Lawrence'),
(4, 104, 904, 'Michael'),
(5, 105, 905, 'Antonio Salieri'),
(6, 106, 906, 'Rick Deckard'),
(7, 107, 907, 'Alice Harford'),
(8, 108, 908, 'McManus'),
(9, 110, 910, 'Eddie Adams'),
(10, 111, 911, 'Alvy Singer'),
(11, 112, 912, 'San'),
(12, 113, 913, 'Andy Dufresne'),
(13, 114, 914, 'Lester Burnham'),
(14, 115, 915, 'Rose DeWitt Bukater'),
(15, 116, 916, 'Sean Maguire'),
(16, 117, 917, 'Ed'),
(17, 118, 918, 'Renton'),
(18, 120, 920, 'Elizabeth Darko'),
(19, 121, 921, 'Older Jamal'),
(20, 122, 922, 'Ripley'),
(21, 114, 923, 'Bobby Darin'),
(22, 109, 909, 'J.J. Gittes'),
(23, 119, 919, 'Alfred Borden');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movie_direction`
--

DROP TABLE IF EXISTS `movie_direction`;
CREATE TABLE IF NOT EXISTS `movie_direction` (
  `mdir_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'this is the unique ID for each movie_direction',
  `dir_id` int(11) NOT NULL COMMENT 'this is the ID for each director, which is referencing the dir_id column of the table director',
  `mov_id` int(11) NOT NULL COMMENT 'this is the ID of the movie, which is referencing the mov_id column of the table movie',
  PRIMARY KEY (`mdir_id`,`dir_id`,`mov_id`),
  UNIQUE KEY `mdir_id_UNIQUE` (`mdir_id`),
  KEY `fk_movie_movie_direction_idx` (`mov_id`),
  KEY `fk_director_movie_direction` (`dir_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `movie_direction`
--

INSERT INTO `movie_direction` (`mdir_id`, `dir_id`, `mov_id`) VALUES
(1, 201, 901),
(2, 202, 902),
(3, 203, 903),
(4, 204, 904),
(5, 205, 905),
(6, 206, 906),
(7, 207, 907),
(8, 208, 908),
(9, 209, 909),
(10, 210, 910),
(11, 211, 911),
(12, 212, 912),
(13, 213, 913),
(14, 214, 914),
(15, 215, 915),
(16, 216, 916),
(17, 217, 917),
(18, 218, 918),
(19, 219, 919),
(20, 220, 920),
(21, 218, 921),
(22, 215, 922),
(23, 221, 923);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movie_genres`
--

DROP TABLE IF EXISTS `movie_genres`;
CREATE TABLE IF NOT EXISTS `movie_genres` (
  `mgen_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'this is a unique ID for each genres movie_genres',
  `mov_id` int(11) NOT NULL COMMENT 'this is the ID of the movie, which is referencing the mov_id column of the table movie',
  `gen_id` int(11) NOT NULL COMMENT 'this is the ID of each genres, which is referencing the gen_id column of the table genres',
  PRIMARY KEY (`mgen_id`,`mov_id`,`gen_id`),
  UNIQUE KEY `mgen_id_UNIQUE` (`mgen_id`),
  KEY `fk_genres_movie_genres_idx` (`gen_id`),
  KEY `fk_movie_movie_genres` (`mov_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `movie_genres`
--

INSERT INTO `movie_genres` (`mgen_id`, `mov_id`, `gen_id`) VALUES
(1, 922, 1001),
(2, 917, 1002),
(3, 903, 1002),
(4, 912, 1003),
(5, 911, 1005),
(6, 908, 1006),
(7, 913, 1006),
(8, 926, 1007),
(9, 928, 1007),
(10, 918, 1007),
(11, 921, 1007),
(12, 902, 1008),
(13, 923, 1009),
(14, 907, 1010),
(15, 927, 1010),
(16, 901, 1010),
(17, 914, 1011),
(18, 906, 1012),
(19, 904, 1013);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE IF NOT EXISTS `rating` (
  `rat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'this is the unique ID for each rating',
  `mov_id` int(11) NOT NULL COMMENT 'this is the ID of the movie, which is referencing the mov_id column of the table movie',
  `rev_id` int(11) NOT NULL COMMENT 'this is the ID of the reviewer, which is referencing the rev_id column of the table reviewer',
  `rev_stars` float(4,2) DEFAULT NULL COMMENT 'this is indicates how many stars a reviewer rated for a review of a movie',
  `num_o_ratings` int(11) DEFAULT NULL COMMENT 'this indicates how many ratings a movie achieved till date',
  PRIMARY KEY (`rat_id`,`mov_id`,`rev_id`),
  UNIQUE KEY `rat_id_UNIQUE` (`rat_id`),
  KEY `fk_movie_rating_idx` (`mov_id`),
  KEY `fk_reviewer_rating_idx` (`rev_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rating`
--

INSERT INTO `rating` (`rat_id`, `mov_id`, `rev_id`, `rev_stars`, `num_o_ratings`) VALUES
(1, 901, 9001, 8.40, 263575),
(2, 902, 9002, 7.90, 20207),
(3, 903, 9003, 8.30, 202778),
(4, 906, 9005, 8.20, 484746),
(5, 924, 9006, 7.30, NULL),
(6, 908, 9007, 8.60, 779489),
(7, 909, 9008, NULL, 227235),
(8, 910, 9009, 3.00, 195961),
(9, 911, 9010, 8.10, 203875),
(10, 912, 9011, 8.40, NULL),
(11, 914, 9013, 7.00, 862618),
(12, 915, 9001, 7.70, 830095),
(13, 916, 9014, 4.00, 642132),
(14, 925, 9015, 7.70, 81328),
(15, 918, 9016, NULL, 580301),
(16, 920, 9017, 8.10, 609451),
(17, 921, 9018, 8.00, 667758),
(18, 922, 9019, 8.40, 511613),
(19, 923, 9020, 6.70, 13091);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reviewer`
--

DROP TABLE IF EXISTS `reviewer`;
CREATE TABLE IF NOT EXISTS `reviewer` (
  `rev_id` int(11) NOT NULL COMMENT 'this is the unique ID for each reviewer',
  `rev_name` char(30) DEFAULT NULL COMMENT 'this is the name of the reviewer',
  PRIMARY KEY (`rev_id`),
  UNIQUE KEY `rev_id_UNIQUE` (`rev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reviewer`
--

INSERT INTO `reviewer` (`rev_id`, `rev_name`) VALUES
(9001, 'Righty Sock'),
(9002, 'Jack Malvern'),
(9003, 'Flagrant Baronessa'),
(9004, 'Alec Shaw'),
(9005, NULL),
(9006, 'Victor Woeltjen'),
(9007, 'Simon Wright'),
(9008, 'Neal Wruck'),
(9009, 'Paul Monks'),
(9010, 'Mike Salvati'),
(9011, NULL),
(9012, 'Wesley S. Walker'),
(9013, 'Sasha Goldshtein'),
(9014, 'Josh Cates'),
(9015, 'Krug Stillo'),
(9016, 'Scott LeBrun'),
(9017, 'Hannah Steele'),
(9018, 'Vincent Cadena'),
(9019, 'Brandt Sponseller'),
(9020, 'Richard Adams');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD CONSTRAINT `fk_actor_movie_cast` FOREIGN KEY (`act_id`) REFERENCES `actor` (`act_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_movie_movie_cast` FOREIGN KEY (`mov_id`) REFERENCES `movie` (`mov_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `movie_direction`
--
ALTER TABLE `movie_direction`
  ADD CONSTRAINT `fk_director_movie_direction` FOREIGN KEY (`dir_id`) REFERENCES `director` (`dir_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_movie_movie_direction` FOREIGN KEY (`mov_id`) REFERENCES `movie` (`mov_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `movie_genres`
--
ALTER TABLE `movie_genres`
  ADD CONSTRAINT `fk_genres_movie_genres` FOREIGN KEY (`gen_id`) REFERENCES `genres` (`gen_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_movie_movie_genres` FOREIGN KEY (`mov_id`) REFERENCES `movie` (`mov_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `fk_movie_rating` FOREIGN KEY (`mov_id`) REFERENCES `movie` (`mov_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_reviewer_rating` FOREIGN KEY (`rev_id`) REFERENCES `reviewer` (`rev_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
