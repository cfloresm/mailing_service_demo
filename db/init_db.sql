SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `mailing` ;
CREATE SCHEMA IF NOT EXISTS `mailing` DEFAULT CHARACTER SET latin1 ;
USE `mailing` ;

-- -----------------------------------------------------
-- Table `mailing`.`ROL`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mailing`.`ROL` ;

CREATE TABLE IF NOT EXISTS `mailing`.`ROL` (
  `IDROL` INT NOT NULL,
  `NAME` VARCHAR(45) NULL,
  PRIMARY KEY (`IDROL`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mailing`.`USER`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mailing`.`USER` ;

CREATE TABLE IF NOT EXISTS `mailing`.`USER` (
  `IDUSER` BIGINT(20) NOT NULL,
  `USERNAME` VARCHAR(30) NOT NULL,
  `PASSWORD` VARCHAR(100) NOT NULL,
  `ROL_IDROL` INT NOT NULL,
  PRIMARY KEY (`IDUSER`),
  INDEX `fk_USER_ROL1_idx` (`ROL_IDROL` ASC),
  CONSTRAINT `fk_USER_ROL1`
    FOREIGN KEY (`ROL_IDROL`)
    REFERENCES `mailing`.`ROL` (`IDROL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mailing`.`SESSION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mailing`.`SESSION` ;

CREATE TABLE IF NOT EXISTS `mailing`.`SESSION` (
  `IDSESSION` VARCHAR(50) NOT NULL,
  `USER_IDUSER` BIGINT(20) NOT NULL,
  `EXPIREDAT` DATETIME NOT NULL,
  PRIMARY KEY (`IDSESSION`),
  INDEX `fk_SESSION_USER1_idx` (`USER_IDUSER` ASC),
  CONSTRAINT `fk_SESSION_USER1`
    FOREIGN KEY (`USER_IDUSER`)
    REFERENCES `mailing`.`USER` (`IDUSER`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

