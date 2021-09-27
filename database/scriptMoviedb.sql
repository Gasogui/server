-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema movie
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema movie
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `movie` DEFAULT CHARACTER SET utf8 ;
USE `movie` ;

-- -----------------------------------------------------
-- Table `movie`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movie`.`actor` (
  `act_id` INT NOT NULL COMMENT 'this is a unique ID for each actor',
  `act_fname` CHAR(20) NOT NULL COMMENT 'this is the first name of each actor',
  `act_lname` CHAR(20) NOT NULL COMMENT 'this is the last name of each actor',
  `act_gender` CHAR(1) NOT NULL COMMENT 'this is the gender of each actor',
  PRIMARY KEY (`act_id`),
  UNIQUE INDEX `act_id_UNIQUE` (`act_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie`.`movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movie`.`movie` (
  `mov_id` INT NOT NULL COMMENT 'this is the unique ID for each movie',
  `mov_title` CHAR(50) NOT NULL COMMENT 'this column represents the name of the movie',
  `mov_year` INT NOT NULL COMMENT 'this is the year of making the movie',
  `mov_time` INT NOT NULL COMMENT 'duration of the movie i.e. how long it was running',
  `mov_lang` CHAR(50) NOT NULL COMMENT 'the language in which movie was casted',
  `mov_dt_rel` DATE NULL DEFAULT NULL COMMENT 'this is the release date of the movie',
  `mov_rel_country` CHAR(5) NOT NULL COMMENT 'this is the name of the country(s) where the movie was released',
  PRIMARY KEY (`mov_id`),
  UNIQUE INDEX `mov_id_UNIQUE` (`mov_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie`.`movie_cast`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movie`.`movie_cast` (
  `mcast_id` INT NOT NULL AUTO_INCREMENT COMMENT 'this is the unique ID for each movie_cast',
  `act_id` INT NOT NULL COMMENT 'this is ID of actor, which is referencing the act_id column of actor table',
  `mov_id` INT NOT NULL COMMENT 'this is the ID of the movie, which is referencing the mov_id column of the table movie',
  `role` CHAR(30) NOT NULL COMMENT 'this is the name of a character in the movie, an actor acted for that character',
  INDEX `fk_actor_movie_cast_idx` (`act_id` ASC),
  INDEX `fk_movie_movie_cast_idx` (`mov_id` ASC),
  PRIMARY KEY (`mcast_id`, `act_id`, `mov_id`),
  UNIQUE INDEX `mcast_id_UNIQUE` (`mcast_id` ASC),
  CONSTRAINT `fk_actor_movie_cast`
    FOREIGN KEY (`act_id`)
    REFERENCES `movie`.`actor` (`act_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_movie_movie_cast`
    FOREIGN KEY (`mov_id`)
    REFERENCES `movie`.`movie` (`mov_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie`.`director`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movie`.`director` (
  `dir_id` INT NOT NULL COMMENT 'this is a unique ID for each director',
  `dir_fname` CHAR(20) NOT NULL COMMENT 'this is the first name of the director',
  `dir_lname` CHAR(20) NOT NULL COMMENT 'this is the last name of the director',
  PRIMARY KEY (`dir_id`),
  UNIQUE INDEX `dir_id_UNIQUE` (`dir_id` ASC))
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `movie`.`reviewer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movie`.`reviewer` (
  `rev_id` INT NOT NULL COMMENT 'this is the unique ID for each reviewer',
  `rev_name` CHAR(30) NULL DEFAULT NULL COMMENT 'this is the name of the reviewer',
  PRIMARY KEY (`rev_id`),
  UNIQUE INDEX `rev_id_UNIQUE` (`rev_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie`.`rating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movie`.`rating` (
  `rat_id` INT NOT NULL AUTO_INCREMENT COMMENT 'this is the unique ID for each rating',
  `mov_id` INT NOT NULL COMMENT 'this is the ID of the movie, which is referencing the mov_id column of the table movie',
  `rev_id` INT NOT NULL COMMENT 'this is the ID of the reviewer, which is referencing the rev_id column of the table reviewer',
  `rev_stars` FLOAT(4,2) NULL DEFAULT NULL COMMENT 'this is indicates how many stars a reviewer rated for a review of a movie',
  `num_o_ratings` INT NULL DEFAULT NULL COMMENT 'this indicates how many ratings a movie achieved till date',
  INDEX `fk_movie_rating_idx` (`mov_id` ASC),
  INDEX `fk_reviewer_rating_idx` (`rev_id` ASC),
  PRIMARY KEY (`rat_id`, `mov_id`, `rev_id`),
  UNIQUE INDEX `rat_id_UNIQUE` (`rat_id` ASC),
  CONSTRAINT `fk_movie_rating`
    FOREIGN KEY (`mov_id`)
    REFERENCES `movie`.`movie` (`mov_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_reviewer_rating`
    FOREIGN KEY (`rev_id`)
    REFERENCES `movie`.`reviewer` (`rev_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie`.`movie_direction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movie`.`movie_direction` (
  `mdir_id` INT NOT NULL AUTO_INCREMENT COMMENT 'this is the unique ID for each movie_direction',
  `dir_id` INT NOT NULL COMMENT 'this is the ID for each director, which is referencing the dir_id column of the table director',
  `mov_id` INT NOT NULL COMMENT 'this is the ID of the movie, which is referencing the mov_id column of the table movie',
  PRIMARY KEY (`mdir_id`, `dir_id`, `mov_id`),
  INDEX `fk_movie_movie_direction_idx` (`mov_id` ASC),
  UNIQUE INDEX `mdir_id_UNIQUE` (`mdir_id` ASC),
  CONSTRAINT `fk_director_movie_direction`
    FOREIGN KEY (`dir_id`)
    REFERENCES `movie`.`director` (`dir_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_movie_movie_direction`
    FOREIGN KEY (`mov_id`)
    REFERENCES `movie`.`movie` (`mov_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie`.`genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movie`.`genres` (
  `gen_id` INT NOT NULL COMMENT 'this is a unique ID for each genres',
  `gen_title` VARCHAR(20) NOT NULL COMMENT 'this is the description of the genres',
  PRIMARY KEY (`gen_id`),
  UNIQUE INDEX `gen_id_UNIQUE` (`gen_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie`.`movie_genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movie`.`movie_genres` (
  `mgen_id` INT NOT NULL AUTO_INCREMENT COMMENT 'this is a unique ID for each genres movie_genres',
  `mov_id` INT NOT NULL COMMENT 'this is the ID of the movie, which is referencing the mov_id column of the table movie',
  `gen_id` INT NOT NULL COMMENT 'this is the ID of each genres, which is referencing the gen_id column of the table genres',
  INDEX `fk_genres_movie_genres_idx` (`gen_id` ASC),
  PRIMARY KEY (`mgen_id`, `mov_id`, `gen_id`),
  UNIQUE INDEX `mgen_id_UNIQUE` (`mgen_id` ASC),
  CONSTRAINT `fk_genres_movie_genres`
    FOREIGN KEY (`gen_id`)
    REFERENCES `movie`.`genres` (`gen_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_movie_movie_genres`
    FOREIGN KEY (`mov_id`)
    REFERENCES `movie`.`movie` (`mov_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
