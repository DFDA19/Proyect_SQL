-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyect_sql` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema proyect_sql
-- -----------------------------------------------------
USE `proyect_sql` ;

-- -----------------------------------------------------
-- Table `proyect_sql`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyect_sql`.`actor` (
  `actor_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyect_sql`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyect_sql`.`film` (
  `film_id` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `release_year` VARCHAR(45) NULL,
  `language_id` VARCHAR(45) NULL,
  `rental_duration` VARCHAR(45) NULL,
  `rental_rate` VARCHAR(45) NULL,
  `length` VARCHAR(45) NULL,
  `replacement_cost` VARCHAR(45) NULL,
  `rating` VARCHAR(45) NULL,
  `special_features` VARCHAR(45) NULL,
  PRIMARY KEY (`film_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyect_sql`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyect_sql`.`inventory` (
  `inventory_id` INT NOT NULL,
  `film_film_id` INT NOT NULL,
  `store_id` VARCHAR(45) NULL,
  `title` VARCHAR(45) NULL,
  PRIMARY KEY (`inventory_id`, `film_film_id`),
  INDEX `fk_inventory_film1_idx` (`film_film_id` ASC) VISIBLE,
  CONSTRAINT `fk_inventory_film1`
    FOREIGN KEY (`film_film_id`)
    REFERENCES `proyect_sql`.`film` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyect_sql`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyect_sql`.`rental` (
  `rental_id` INT NOT NULL,
  `rental_date` VARCHAR(45) NULL,
  `inventory_inventory_id` INT NOT NULL,
  `customer_id` VARCHAR(45) NULL,
  `return_date` VARCHAR(45) NULL,
  `staff_id` VARCHAR(45) NULL,
  `inventory_film_film_id` INT NOT NULL,
  PRIMARY KEY (`rental_id`, `inventory_inventory_id`, `inventory_film_film_id`),
  INDEX `fk_rental_inventory1_idx` (`inventory_inventory_id` ASC, `inventory_film_film_id` ASC) VISIBLE,
  CONSTRAINT `fk_rental_inventory1`
    FOREIGN KEY (`inventory_inventory_id` , `inventory_film_film_id`)
    REFERENCES `proyect_sql`.`inventory` (`inventory_id` , `film_film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyect_sql`.`old_HDD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyect_sql`.`old_HDD` (
  `actor_actor_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `title` VARCHAR(45) NULL,
  `film_id` VARCHAR(45) NULL,
  `category_id` VARCHAR(45) NULL,
  `movie_genre` VARCHAR(45) NULL,
  `release_year` VARCHAR(45) NULL,
  PRIMARY KEY (`actor_actor_id`),
  INDEX `fk_old_HDD_actor1_idx` (`actor_actor_id` ASC) VISIBLE,
  CONSTRAINT `fk_old_HDD_actor1`
    FOREIGN KEY (`actor_actor_id`)
    REFERENCES `proyect_sql`.`actor` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyect_sql`.`old_HDD_has_film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyect_sql`.`old_HDD_has_film` (
  `old_HDD_actor_actor_id` INT NOT NULL,
  `film_film_id` INT NOT NULL,
  PRIMARY KEY (`old_HDD_actor_actor_id`, `film_film_id`),
  INDEX `fk_old_HDD_has_film_film1_idx` (`film_film_id` ASC) VISIBLE,
  INDEX `fk_old_HDD_has_film_old_HDD1_idx` (`old_HDD_actor_actor_id` ASC) VISIBLE,
  CONSTRAINT `fk_old_HDD_has_film_old_HDD1`
    FOREIGN KEY (`old_HDD_actor_actor_id`)
    REFERENCES `proyect_sql`.`old_HDD` (`actor_actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_old_HDD_has_film_film1`
    FOREIGN KEY (`film_film_id`)
    REFERENCES `proyect_sql`.`film` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
