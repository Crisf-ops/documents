-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema aerolinea
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `aerolinea` ;

-- -----------------------------------------------------
-- Schema aerolinea
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `aerolinea` DEFAULT CHARACTER SET utf8 ;
USE `aerolinea` ;

-- -----------------------------------------------------
-- Table `aerolinea`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aerolinea`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `edad` INT NULL DEFAULT NULL,
  `telefono` INT NOT NULL,
  `documento` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `idpasaje` INT NOT NULL,
  `idequipaje` INT NOT NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;

CREATE UNIQUE INDEX `idcliente_UNIQUE` ON `aerolinea`.`cliente` (`idcliente` ASC) VISIBLE;

CREATE UNIQUE INDEX `documento_UNIQUE` ON `aerolinea`.`cliente` (`documento` ASC) VISIBLE;

CREATE UNIQUE INDEX `idpasaje_UNIQUE` ON `aerolinea`.`cliente` (`idpasaje` ASC) VISIBLE;

CREATE UNIQUE INDEX `idequipaje_UNIQUE` ON `aerolinea`.`cliente` (`idequipaje` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `aerolinea`.`pasaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aerolinea`.`pasaje` (
  `idPasaje` INT NOT NULL AUTO_INCREMENT,
  `clase` VARCHAR(45) NOT NULL,
  `asiento` VARCHAR(45) NOT NULL,
  `valor` INT NOT NULL,
  `idcliente` INT NOT NULL,
  `idvuelo` INT NOT NULL,
  PRIMARY KEY (`idPasaje`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb3;

CREATE UNIQUE INDEX `idPasaje_UNIQUE` ON `aerolinea`.`pasaje` (`idPasaje` ASC) VISIBLE;

CREATE UNIQUE INDEX `asiento_UNIQUE` ON `aerolinea`.`pasaje` (`asiento` ASC) VISIBLE;

CREATE UNIQUE INDEX `idcliente_UNIQUE` ON `aerolinea`.`pasaje` (`idcliente` ASC) VISIBLE;

CREATE INDEX `pasajevuelo_idx` ON `aerolinea`.`pasaje` (`idvuelo` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `aerolinea`.`vuelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aerolinea`.`vuelo` (
  `idvuelo` INT NOT NULL AUTO_INCREMENT,
  `capacidad` INT NOT NULL,
  `id_itenerario` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `hora` TIME NOT NULL,
  PRIMARY KEY (`idvuelo`))
ENGINE = InnoDB
AUTO_INCREMENT = 701
DEFAULT CHARACTER SET = utf8mb3;

CREATE UNIQUE INDEX `id_itenerario_UNIQUE` ON `aerolinea`.`vuelo` (`id_itenerario` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `aerolinea`.`itenerario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aerolinea`.`itenerario` (
  `iditenerario` INT NOT NULL AUTO_INCREMENT,
  `iddestino` INT NOT NULL,
  `idorigen` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `hora` TIME NOT NULL,
  PRIMARY KEY (`iditenerario`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;

CREATE UNIQUE INDEX `iditenerario_UNIQUE` ON `aerolinea`.`itenerario` (`iditenerario` ASC) VISIBLE;

CREATE UNIQUE INDEX `iddestino_UNIQUE` ON `aerolinea`.`itenerario` (`iddestino` ASC) VISIBLE;

CREATE UNIQUE INDEX `idorigen_UNIQUE` ON `aerolinea`.`itenerario` (`idorigen` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `aerolinea`.`destino`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aerolinea`.`destino` (
  `iddestino` INT NOT NULL AUTO_INCREMENT,
  `aeropuerto` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`iddestino`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `aerolinea`.`equipaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aerolinea`.`equipaje` (
  `idequipaje` INT NOT NULL,
  `peso` INT NOT NULL,
  PRIMARY KEY (`idequipaje`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE UNIQUE INDEX `idequipaje_UNIQUE` ON `aerolinea`.`equipaje` (`idequipaje` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `aerolinea`.`origen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aerolinea`.`origen` (
  `idorigen` INT NOT NULL AUTO_INCREMENT,
  `aeropuerto` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idorigen`))
ENGINE = InnoDB
AUTO_INCREMENT = 25
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;