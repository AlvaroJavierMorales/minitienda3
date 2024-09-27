-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema minitienda3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema minitienda3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `minitienda3` DEFAULT CHARACTER SET utf8 ;
USE `minitienda3` ;

-- -----------------------------------------------------
-- Table `minitienda3`.`tbl_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `minitienda3`.`tbl_usuarios` (
  `usu_id` INT NOT NULL AUTO_INCREMENT,
  `usu_correo` VARCHAR(45) NOT NULL,
  `usu_contraseña` TEXT NOT NULL,
  `usu_salt` TEXT NOT NULL,
  `usu_estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`usu_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `minitienda3`.`tbl_proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `minitienda3`.`tbl_proveedores` (
  `prov_id` INT NOT NULL AUTO_INCREMENT,
  `prov_nit` VARCHAR(45) NOT NULL,
  `prov_nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`prov_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `minitienda3`.`tbl_categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `minitienda3`.`tbl_categorias` (
  `cat_id` INT NOT NULL AUTO_INCREMENT,
  `cat_descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cat_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `minitienda3`.`tbl_productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `minitienda3`.`tbl_productos` (
  `pro_id` INT NOT NULL AUTO_INCREMENT,
  `pro_codigo` VARCHAR(45) NOT NULL,
  `pro_descripcion` VARCHAR(45) NOT NULL,
  `pro_cantidad` INT NOT NULL,
  `pro_precio` DOUBLE NOT NULL,
  `tbl_proveedores_prov_id` INT NOT NULL,
  `tbl_categorias_cat_id` INT NOT NULL,
  PRIMARY KEY (`pro_id`, `tbl_proveedores_prov_id`, `tbl_categorias_cat_id`),
  INDEX `fk_tbl_productos_tbl_proveedores_idx` (`tbl_proveedores_prov_id` ASC) ,
  INDEX `fk_tbl_productos_tbl_categorias1_idx` (`tbl_categorias_cat_id` ASC) ,
  CONSTRAINT `fk_tbl_productos_tbl_proveedores`
    FOREIGN KEY (`tbl_proveedores_prov_id`)
    REFERENCES `minitienda3`.`tbl_proveedores` (`prov_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_productos_tbl_categorias1`
    FOREIGN KEY (`tbl_categorias_cat_id`)
    REFERENCES `minitienda3`.`tbl_categorias` (`cat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
