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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema proyect_sql
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema proyect_sql
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyect_sql` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;
USE `proyect_sql` ;

-- -----------------------------------------------------
-- Table `proyect_sql`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyect_sql`.`actor` (
  `actor_id` INT NOT NULL,
  `first_name` VARCHAR(40) NULL DEFAULT NULL,
  `last_name` VARCHAR(40) NULL DEFAULT NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyect_sql`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyect_sql`.`inventory` (
  `inventory_id` INT NOT NULL,
  `film_film_id` INT NULL DEFAULT NULL,
  `store_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`inventory_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyect_sql`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyect_sql`.`film` (
  `film_id` INT NOT NULL,
  `title` VARCHAR(40) NULL DEFAULT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  `release_year` VARCHAR(45) NULL DEFAULT NULL,
  `language_id` INT NULL DEFAULT NULL,
  `rental_duration` INT NULL DEFAULT NULL,
  `rental_rate` VARCHAR(45) NULL DEFAULT NULL,
  `length` INT NULL DEFAULT NULL,
  `replacement_cost` FLOAT NULL DEFAULT NULL,
  `rating` VARCHAR(45) NULL DEFAULT NULL,
  `special_features` VARCHAR(70) NULL DEFAULT NULL,
  `inventory_inventory_id` INT NOT NULL,
  PRIMARY KEY (`film_id`),
  INDEX `fk_film_inventory1_idx` (`inventory_inventory_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_inventory1`
    FOREIGN KEY (`inventory_inventory_id`)
    REFERENCES `proyect_sql`.`inventory` (`inventory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyect_sql`.`old_hdd`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyect_sql`.`old_hdd` (
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `title` VARCHAR(40) NULL DEFAULT NULL,
  `release_year` VARCHAR(45) NULL DEFAULT NULL,
  `category_id` INT NULL DEFAULT NULL,
  `old_hdd_actor_id` INT NOT NULL,
  `film_id` INT NOT NULL,
  INDEX `old_hdd_actor_id` (`old_hdd_actor_id` ASC) VISIBLE,
  INDEX `film_id` (`film_id` ASC) VISIBLE,
  CONSTRAINT `old_hdd_ibfk_1`
    FOREIGN KEY (`old_hdd_actor_id`)
    REFERENCES `proyect_sql`.`actor` (`actor_id`)
    ON DELETE CASCADE,
  CONSTRAINT `old_hdd_ibfk_2`
    FOREIGN KEY (`film_id`)
    REFERENCES `proyect_sql`.`film` (`film_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyect_sql`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyect_sql`.`rental` (
  `rental_id` INT NULL DEFAULT NULL,
  `rental_date` VARCHAR(45) NULL DEFAULT NULL,
  `inventory_id` INT NULL DEFAULT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `return_date` VARCHAR(45) NULL DEFAULT NULL,
  `staff_id` INT NULL DEFAULT NULL,
  INDEX `inventory_id` (`inventory_id` ASC) VISIBLE,
  CONSTRAINT `rental_ibfk_1`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `proyect_sql`.`inventory` (`inventory_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
