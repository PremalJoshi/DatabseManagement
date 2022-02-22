-- MySQL Script generated by MySQL Workbench
-- Sun Aug 15 21:13:43 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Country` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Country` (
  `country_id` INT NOT NULL AUTO_INCREMENT,
  `country_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE INDEX `country_id_UNIQUE` (`country_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Province`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Province` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Province` (
  `province_id` INT NOT NULL AUTO_INCREMENT,
  `province_name` VARCHAR(45) NOT NULL,
  `Country_country_id` INT NOT NULL,
  PRIMARY KEY (`province_id`),
  UNIQUE INDEX `province_id_UNIQUE` (`province_id` ASC),
  INDEX `fk_Province_Country1_idx` (`Country_country_id` ASC),
  CONSTRAINT `fk_Province_Country1`
    FOREIGN KEY (`Country_country_id`)
    REFERENCES `mydb`.`Country` (`country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`City`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`City` ;

CREATE TABLE IF NOT EXISTS `mydb`.`City` (
  `city_id` INT NOT NULL AUTO_INCREMENT,
  `city_name` VARCHAR(45) NOT NULL,
  `Province_province_id` INT NOT NULL,
  PRIMARY KEY (`city_id`),
  UNIQUE INDEX `city_id_UNIQUE` (`city_id` ASC),
  INDEX `fk_City_Province1_idx` (`Province_province_id` ASC),
  CONSTRAINT `fk_City_Province1`
    FOREIGN KEY (`Province_province_id`)
    REFERENCES `mydb`.`Province` (`province_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Client` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Client` (
  `client_ID` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `e-mail_id` VARCHAR(45) NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `contact_number` BIGINT(10) NOT NULL,
  `City_city_id` INT NOT NULL,
  PRIMARY KEY (`client_ID`),
  UNIQUE INDEX `Client_ID_UNIQUE` (`client_ID` ASC),
  INDEX `fk_Client_City1_idx` (`City_city_id` ASC),
  CONSTRAINT `fk_Client_City1`
    FOREIGN KEY (`City_city_id`)
    REFERENCES `mydb`.`City` (`city_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Album`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Album` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Album` (
  `album_id` INT NOT NULL AUTO_INCREMENT,
  `album_name` VARCHAR(45) NOT NULL,
  `release_date` DATE NOT NULL,
  `album_price` INT NOT NULL,
  `stock` INT NOT NULL,
  PRIMARY KEY (`album_id`),
  UNIQUE INDEX `album_id_UNIQUE` (`album_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Artist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Artist` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Artist` (
  `artist_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `birthdate` DATE NOT NULL,
  `band_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`artist_id`),
  UNIQUE INDEX `artist_id_UNIQUE` (`artist_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Genre` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Genre` (
  `genre_id` INT NOT NULL AUTO_INCREMENT,
  `genre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`genre_id`),
  UNIQUE INDEX `genre_id_UNIQUE` (`genre_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tracks`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Tracks` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Tracks` (
  `track_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `duration` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  `Artist_artist_id` INT NOT NULL,
  `stock` INT NOT NULL,
  `Album_album_id` INT NOT NULL,
  `Genre_genre_id` INT NOT NULL,
  PRIMARY KEY (`track_id`),
  UNIQUE INDEX `track_id_UNIQUE` (`track_id` ASC),
  INDEX `fk_Tracks_Artist1_idx` (`Artist_artist_id` ASC),
  INDEX `fk_Tracks_Album1_idx` (`Album_album_id` ASC),
  INDEX `fk_Tracks_Genre1_idx` (`Genre_genre_id` ASC),
  CONSTRAINT `fk_Tracks_Artist1`
    FOREIGN KEY (`Artist_artist_id`)
    REFERENCES `mydb`.`Artist` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tracks_Album1`
    FOREIGN KEY (`Album_album_id`)
    REFERENCES `mydb`.`Album` (`album_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tracks_Genre1`
    FOREIGN KEY (`Genre_genre_id`)
    REFERENCES `mydb`.`Genre` (`genre_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Orders` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `order_date` DATE NOT NULL,
  `order_total` INT NOT NULL,
  `discount` INT NULL,
  `Client_client_ID` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE INDEX `order_id_UNIQUE` (`order_id` ASC),
  INDEX `fk_Order_Client_idx` (`Client_client_ID` ASC),
  CONSTRAINT `fk_Order_Client`
    FOREIGN KEY (`Client_client_ID`)
    REFERENCES `mydb`.`Client` (`client_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Reviewer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Reviewer` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Reviewer` (
  `reviewer_id` INT NOT NULL AUTO_INCREMENT,
  `reviewer_name` VARCHAR(45) NOT NULL,
  `reviewer_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`reviewer_id`),
  UNIQUE INDEX `reviewer_id_UNIQUE` (`reviewer_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Album_has_Review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Album_has_Review` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Album_has_Review` (
  `album_review_id` INT NOT NULL,
  `rating` INT NOT NULL,
  `review_date` DATETIME NOT NULL,
  `Album_album_id` INT NOT NULL,
  `Reviewer_reviewer_id` INT NOT NULL,
  INDEX `fk_Album_has_Review_Album1_idx` (`Album_album_id` ASC),
  INDEX `fk_Album_has_Review_Reviewer1_idx` (`Reviewer_reviewer_id` ASC),
  PRIMARY KEY (`album_review_id`),
  UNIQUE INDEX `album_review_id_UNIQUE` (`album_review_id` ASC),
  CONSTRAINT `fk_Album_has_Review_Album1`
    FOREIGN KEY (`Album_album_id`)
    REFERENCES `mydb`.`Album` (`album_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Album_has_Review_Reviewer1`
    FOREIGN KEY (`Reviewer_reviewer_id`)
    REFERENCES `mydb`.`Reviewer` (`reviewer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tracks_has_Review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Tracks_has_Review` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Tracks_has_Review` (
  `track_review_id` INT NOT NULL,
  `rating` INT NOT NULL,
  `review_date` DATETIME NOT NULL,
  `Tracks_track_id` INT NOT NULL,
  `Reviewer_reviewer_id` INT NOT NULL,
  INDEX `fk_Tracks_has_Review_Tracks1_idx` (`Tracks_track_id` ASC),
  INDEX `fk_Tracks_has_Review_Reviewer1_idx` (`Reviewer_reviewer_id` ASC),
  PRIMARY KEY (`track_review_id`),
  UNIQUE INDEX `track_review_id_UNIQUE` (`track_review_id` ASC),
  CONSTRAINT `fk_Tracks_has_Review_Tracks1`
    FOREIGN KEY (`Tracks_track_id`)
    REFERENCES `mydb`.`Tracks` (`track_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tracks_has_Review_Reviewer1`
    FOREIGN KEY (`Reviewer_reviewer_id`)
    REFERENCES `mydb`.`Reviewer` (`reviewer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order_items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Order_items` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Order_items` (
  `order_item_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  `quantity` INT NOT NULL,
  `Tracks_track_id` INT NOT NULL,
  `Album_album_id` INT NOT NULL,
  `Order_order_id` INT NOT NULL,
  INDEX `fk_table1_Tracks1_idx` (`Tracks_track_id` ASC),
  INDEX `fk_table1_Album1_idx` (`Album_album_id` ASC),
  INDEX `fk_table1_Order1_idx` (`Order_order_id` ASC),
  PRIMARY KEY (`order_item_id`),
  UNIQUE INDEX `order_item_id_UNIQUE` (`order_item_id` ASC),
  CONSTRAINT `fk_table1_Tracks1`
    FOREIGN KEY (`Tracks_track_id`)
    REFERENCES `mydb`.`Tracks` (`track_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_Album1`
    FOREIGN KEY (`Album_album_id`)
    REFERENCES `mydb`.`Album` (`album_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_Order1`
    FOREIGN KEY (`Order_order_id`)
    REFERENCES `mydb`.`Orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
