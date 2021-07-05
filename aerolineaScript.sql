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
  `idequipaje` INT NOT NULL,
  PRIMARY KEY (`idcliente`),
  UNIQUE INDEX `idcliente_UNIQUE` (`idcliente` ASC) VISIBLE,
  UNIQUE INDEX `documento_UNIQUE` (`documento` ASC) VISIBLE,
  UNIQUE INDEX `idequipaje_UNIQUE` (`idequipaje` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `aerolinea`.`itenerario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aerolinea`.`itenerario` (
  `iditenerario` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `vuelo_idvuelo` INT NOT NULL,
  PRIMARY KEY (`iditenerario`),
  UNIQUE INDEX `iditenerario_UNIQUE` (`iditenerario` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `aerolinea`.`destino`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aerolinea`.`destino` (
  `iddestino` INT NOT NULL AUTO_INCREMENT,
  `aeropuerto` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `itenerario_iditenerario` INT NOT NULL,
  PRIMARY KEY (`iddestino`),
  INDEX `fk_destino_itenerario1_idx` (`itenerario_iditenerario` ASC) VISIBLE,
  CONSTRAINT `fk_destino_itenerario1`
    FOREIGN KEY (`itenerario_iditenerario`)
    REFERENCES `aerolinea`.`itenerario` (`iditenerario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `aerolinea`.`equipaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aerolinea`.`equipaje` (
  `idequipaje` INT NOT NULL,
  `peso` INT NOT NULL,
  PRIMARY KEY (`idequipaje`),
  CONSTRAINT `fk_equipaje_cliente1`
    FOREIGN KEY (`idequipaje`)
    REFERENCES `aerolinea`.`cliente` (`idequipaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `aerolinea`.`origen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aerolinea`.`origen` (
  `idorigen` INT NOT NULL AUTO_INCREMENT,
  `aeropuerto` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `itenerario_iditenerario` INT NOT NULL,
  PRIMARY KEY (`idorigen`),
  INDEX `fk_origen_itenerario1_idx` (`itenerario_iditenerario` ASC) VISIBLE,
  CONSTRAINT `fk_origen_itenerario1`
    FOREIGN KEY (`itenerario_iditenerario`)
    REFERENCES `aerolinea`.`itenerario` (`iditenerario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 25
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `aerolinea`.`pasaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aerolinea`.`pasaje` (
  `idpasaje` INT NOT NULL AUTO_INCREMENT,
  `clase` VARCHAR(45) NULL DEFAULT NULL,
  `asiento` VARCHAR(45) NULL DEFAULT NULL,
  `valor` INT NOT NULL,
  `idcliente` INT NOT NULL,
  `cliente_idcliente` INT NOT NULL,
  PRIMARY KEY (`idpasaje`),
  UNIQUE INDEX `idpasaje_UNIQUE` (`idpasaje` ASC) VISIBLE,
  INDEX `fk_pasaje_cliente1_idx` (`cliente_idcliente` ASC) VISIBLE,
  CONSTRAINT `fk_pasaje_cliente1`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `aerolinea`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `aerolinea`.`vuelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aerolinea`.`vuelo` (
  `idvuelo` INT NOT NULL AUTO_INCREMENT,
  `capacidad` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `itenerario_iditenerario` INT NOT NULL,
  `pasaje_idpasaje` INT NOT NULL,
  PRIMARY KEY (`idvuelo`),
  INDEX `fk_vuelo_itenerario1_idx` (`itenerario_iditenerario` ASC) VISIBLE,
  INDEX `fk_vuelo_pasaje1_idx` (`pasaje_idpasaje` ASC) VISIBLE,
  CONSTRAINT `fk_vuelo_itenerario1`
    FOREIGN KEY (`itenerario_iditenerario`)
    REFERENCES `aerolinea`.`itenerario` (`iditenerario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vuelo_pasaje1`
    FOREIGN KEY (`pasaje_idpasaje`)
    REFERENCES `aerolinea`.`pasaje` (`idpasaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 701
DEFAULT CHARACTER SET = utf8mb3;

/*Cliente*/
insert into cliente (nombre,edad,telefono,documento,email,idpasaje,idequipaje) 
value ('cristian',24,44444,1017241658,'crisf@gmail.com',1,200);
insert into cliente(nombre,edad,telefono,documento,email,idpasaje,idequipaje)
value ('beatriz',25,5555,1012546875,'bea@gmail.com',2,250);
insert into cliente(nombre,edad,telefono,documento,email,idpasaje,idequipaje)
value ('jenni',35,66666,78520410,'jen@gmail.com',3,230);
insert into cliente(nombre,edad,telefono,documento,email,idpasaje,idequipaje)
value ('daniela',40,7777,82453374,'dani@gmail.com',4,240);

/*Equipaje*/
insert into equipaje (idequipaje,peso) value (200,15);
insert into equipaje (idequipaje,peso) value (250,40);
insert into equipaje (idequipaje,peso) value (240,50);
insert into equipaje (idequipaje,peso) value (230,60);

/*Pasaje*/
insert into pasaje (clase,asiento,valor,idcliente,idvuelo) value ('vip',10,350000,1,700);
insert into pasaje (clase,asiento,valor,idcliente,idvuelo) value ('vip',5,350000,2,700);
insert into pasaje (clase,asiento,valor,idcliente,idvuelo) value ('clasico',105,70000,3,600);
insert into pasaje (clase,asiento,valor,idcliente,idvuelo) value ('clasico',110,70000,3,600);

/*Vuelo*/
insert into vuelo (idvuelo,capacidad,id_itenerario,fecha,hora) value (700,45,1,'2020/4/24','13:00:00');
insert into vuelo (idvuelo,capacidad,id_itenerario,fecha,hora) value (600,45,2,'2020/4/25','14:00:00');

/*Itinerario*/
insert into itenerario (iddestino,idorigen,hora,fecha) values (20,24,'13:35:00','2020-04-24');
insert into itenerario (iddestino,idorigen,hora,fecha) values (5,8,'14:35:00','2020-04-25');

/*Destino*/
insert into destino (iddestino,aeropuerto,ciudad) value (20,'Rojas','Cali');
insert into destino (iddestino,aeropuerto,ciudad) value (8,'Robert','Medellin');

/*Origen*/
insert into origen (idorigen,aeropuerto,ciudad) value (24,'Maria jose','Barranquilla');
insert into origen (idorigen,aeropuerto,ciudad) value (5,'Sekiro','Bogota');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
