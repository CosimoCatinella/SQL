-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema gestioneordinidb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema gestioneordinidb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gestioneordinidb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `gestioneordinidb` ;

-- -----------------------------------------------------
-- Table `gestioneordinidb`.`clienti`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioneordinidb`.`clienti` (
  `IDCliente` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(50) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`IDCliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gestioneordinidb`.`prodotti`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioneordinidb`.`prodotti` (
  `IDProdotto` INT NOT NULL AUTO_INCREMENT,
  `NomeProdotto` VARCHAR(100) NULL DEFAULT NULL,
  `Prezzo` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`IDProdotto`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gestioneordinidb`.`ordini`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioneordinidb`.`ordini` (
  `IDOrdine` INT NOT NULL AUTO_INCREMENT,
  `IDProdotto` INT NULL DEFAULT NULL,
  `IDCliente` INT NULL DEFAULT NULL,
  `Quantità` INT NULL DEFAULT NULL,
  PRIMARY KEY (`IDOrdine`),
  INDEX `IDProdotto` (`IDProdotto` ASC) VISIBLE,
  INDEX `IDCliente` (`IDCliente` ASC) VISIBLE,
  CONSTRAINT `ordini_ibfk_1`
    FOREIGN KEY (`IDProdotto`)
    REFERENCES `gestioneordinidb`.`prodotti` (`IDProdotto`),
  CONSTRAINT `ordini_ibfk_2`
    FOREIGN KEY (`IDCliente`)
    REFERENCES `gestioneordinidb`.`clienti` (`IDCliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gestioneordinidb`.`dettaglioordine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestioneordinidb`.`dettaglioordine` (
  `IDOrdine` INT NOT NULL,
  `IDProdotto` INT NOT NULL,
  `IDCliente` INT NOT NULL,
  `PrezzoTotale` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`IDOrdine`, `IDProdotto`, `IDCliente`),
  INDEX `IDProdotto` (`IDProdotto` ASC) VISIBLE,
  INDEX `IDCliente` (`IDCliente` ASC) VISIBLE,
  CONSTRAINT `dettaglioordine_ibfk_1`
    FOREIGN KEY (`IDOrdine`)
    REFERENCES `gestioneordinidb`.`ordini` (`IDOrdine`),
  CONSTRAINT `dettaglioordine_ibfk_2`
    FOREIGN KEY (`IDProdotto`)
    REFERENCES `gestioneordinidb`.`prodotti` (`IDProdotto`),
  CONSTRAINT `dettaglioordine_ibfk_3`
    FOREIGN KEY (`IDCliente`)
    REFERENCES `gestioneordinidb`.`clienti` (`IDCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
