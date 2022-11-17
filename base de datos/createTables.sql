-- MySQL Script generated by MySQL Workbench
-- Mon Nov 14 13:26:17 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
show tables;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema proyectodb
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`alertas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`alertas` (
  `idalertas` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `tipo_alerta` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idalertas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Administrador` (
  `idAdministrador` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  `alertas_idalertas` INT NOT NULL,
  PRIMARY KEY (`idAdministrador`),
  UNIQUE INDEX `usuario_UNIQUE` (`usuario` ASC),
  INDEX `fk_Administrador_alertas1_idx` (`alertas_idalertas` ASC),
  CONSTRAINT `fk_Administrador_alertas1`
    FOREIGN KEY (`alertas_idalertas`)
    REFERENCES `mydb`.`alertas` (`idalertas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`evento` (
  `idevento` INT NOT NULL,
  `nombre_evento` VARCHAR(50) NOT NULL,
  `tipo_evento` VARCHAR(50) NOT NULL,
  `lugar_evento` VARCHAR(50) NOT NULL,
  `hora_retraso` INT NOT NULL,
  `latitud` VARCHAR(50) NOT NULL,
  `longitud` VARCHAR(50) NOT NULL,
  `Administrador_idAdministrador` INT NOT NULL,
  PRIMARY KEY (`idevento`),
  INDEX `fk_evento_Administrador1_idx` (`Administrador_idAdministrador` ASC),
  CONSTRAINT `fk_evento_Administrador1`
    FOREIGN KEY (`Administrador_idAdministrador`)
    REFERENCES `mydb`.`Administrador` (`idAdministrador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`sensores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sensores` (
  `idsensores` INT NOT NULL,
  `latitud` VARCHAR(45) NOT NULL,
  `longitud` VARCHAR(45) NOT NULL,
  `mensaje` VARCHAR(45) NOT NULL,
  `ubicacion_actual` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idsensores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`sensores_has_alertas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sensores_has_alertas` (
  `sensores_idsensores` INT NOT NULL,
  `alertas_idalertas` INT NOT NULL,
  PRIMARY KEY (`sensores_idsensores`, `alertas_idalertas`),
  INDEX `fk_sensores_has_alertas_alertas1_idx` (`alertas_idalertas` ASC),
  INDEX `fk_sensores_has_alertas_sensores_idx` (`sensores_idsensores` ASC),
  CONSTRAINT `fk_sensores_has_alertas_sensores`
    FOREIGN KEY (`sensores_idsensores`)
    REFERENCES `mydb`.`sensores` (`idsensores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sensores_has_alertas_alertas1`
    FOREIGN KEY (`alertas_idalertas`)
    REFERENCES `mydb`.`alertas` (`idalertas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `idusuario` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `latitud` VARCHAR(45) NOT NULL,
  `longitud` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`sistema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sistema` (
  `idsistema` INT NOT NULL,
  `evento_idevento` INT NOT NULL,
  `usuario_idusuario` INT NOT NULL,
  PRIMARY KEY (`idsistema`),
  INDEX `fk_sistema_evento1_idx` (`evento_idevento` ASC),
  INDEX `fk_sistema_usuario1_idx` (`usuario_idusuario` ASC),
  CONSTRAINT `fk_sistema_evento1`
    FOREIGN KEY (`evento_idevento`)
    REFERENCES `mydb`.`evento` (`idevento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sistema_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `mydb`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `idusuario` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `latitud` VARCHAR(45) NOT NULL,
  `longitud` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`sistema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sistema` (
  `idsistema` INT NOT NULL,
  `evento_idevento` INT NOT NULL,
  `usuario_idusuario` INT NOT NULL,
  PRIMARY KEY (`idsistema`),
  INDEX `fk_sistema_evento1_idx` (`evento_idevento` ASC) ,
  INDEX `fk_sistema_usuario1_idx` (`usuario_idusuario` ASC),
  CONSTRAINT `fk_sistema_evento1`
    FOREIGN KEY (`evento_idevento`)
    REFERENCES `mydb`.`evento` (`idevento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sistema_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `mydb`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
show tables;