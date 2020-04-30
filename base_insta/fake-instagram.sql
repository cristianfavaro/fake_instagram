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
CREATE SCHEMA IF NOT EXISTS `fake-instagram` DEFAULT CHARACTER SET utf8 ;
USE `fake-instagram` ;

-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE users (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(192) ,
  `email` VARCHAR(192)  UNIQUE,
  `username` VARCHAR(45) UNIQUE,
  `password` VARCHAR(192) ,
  `avatar` VARCHAR(192),
  `create_at` DATETIME,
  `update_at` DATETIME
  );


-- -----------------------------------------------------
-- Table `mydb`.`publications`
-- -----------------------------------------------------
CREATE TABLE publications(
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `image` VARCHAR(192),
  `like` INT,
  `create_ate`DATETIME,
  `update_at` DATETIME,
  `users_id` INT NOT NULL,
    FOREIGN KEY (users_id) REFERENCES users (id)
    );


-- -----------------------------------------------------
-- Table `mydb`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fake-instagram`.`comments` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `description` TEXT,
  `create_at` DATETIME,
  `update_at` DATETIME,
  `publications_id` INT NOT NULL,
    FOREIGN KEY (publications_id)
    REFERENCES publications (id)
    )

