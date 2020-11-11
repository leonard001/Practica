-- -----------------------------------------------------
-- Schema abuesoft
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `abuesoft` DEFAULT CHARACTER SET utf8 ;

USE `abuesoft` ;

-- -----------------------------------------------------
-- Table `abuesoft`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `abuesoft`.`rol` (
  `idrol` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`idrol`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `abuesoft`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `abuesoft`.`usuario` (
  `idusuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `tipo_doc` VARCHAR(45) NOT NULL,
  `documento` VARCHAR(45) NOT NULL,
  `telefono` INT(11) NOT NULL,
  `idrol` INT(11) NOT NULL,
  PRIMARY KEY (`idusuario`),
  INDEX `rol_idx` (`idrol` ASC),
  UNIQUE INDEX `documento_UNIQUE` (`documento` ASC),
  CONSTRAINT `rol`
    FOREIGN KEY (`idrol`)
    REFERENCES `abuesoft`.`rol` (`idrol`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `abuesoft`.`abuelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `abuesoft`.`abuelo` (
  `idabuelo` INT(11) NOT NULL AUTO_INCREMENT,
  `habitacion` INT(11) NULL DEFAULT NULL,
  `edad` INT(11) NULL DEFAULT NULL,
  `idusuario` INT(11) NOT NULL,
  PRIMARY KEY (`idabuelo`),
  INDEX `usuario_idx` (`idusuario` ASC),
  CONSTRAINT `usuario1`
    FOREIGN KEY (`idusuario`)
    REFERENCES `abuesoft`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `abuesoft`.`medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `abuesoft`.`medicamento` (
  `idmedicamento` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `laboratorio` VARCHAR(45) NULL DEFAULT NULL,
  `fechaVencimiento` DATE NULL DEFAULT NULL,
  `fechaRegistro` DATE NULL DEFAULT NULL,
  `dosis` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idmedicamento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `abuesoft`.`abuelo_medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `abuesoft`.`abuelo_medicamento` (
  `idabuelo_medicamento` INT(11) NOT NULL AUTO_INCREMENT,
  `idabuelo` INT(11) NOT NULL,
  `idmedicamento` INT(11) NULL DEFAULT NULL,
  `cantidad_medicamento` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idabuelo_medicamento`),
  INDEX `abuelo_idx` (`idabuelo` ASC),
  INDEX `medicamento_idx` (`idmedicamento` ASC),
  CONSTRAINT `abuelo2`
    FOREIGN KEY (`idabuelo`)
    REFERENCES `abuesoft`.`abuelo` (`idabuelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `medicamento`
    FOREIGN KEY (`idmedicamento`)
    REFERENCES `abuesoft`.`medicamento` (`idmedicamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `abuesoft`.`servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `abuesoft`.`servicio` (
  `idservicio` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  `precio` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`idservicio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `abuesoft`.`abuelo_servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `abuesoft`.`abuelo_servicio` (
  `idabuelo_servicio` INT(11) NOT NULL AUTO_INCREMENT,
  `idabuelo` INT(11) NOT NULL,
  `idservicio` INT(11) NOT NULL,
  `fechaServicio` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idabuelo_servicio`),
  INDEX `abuelo_idx` (`idabuelo` ASC),
  INDEX `servicio_idx` (`idservicio` ASC),
  CONSTRAINT `abuelo4`
    FOREIGN KEY (`idabuelo`)
    REFERENCES `abuesoft`.`abuelo` (`idabuelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `servicio`
    FOREIGN KEY (`idservicio`)
    REFERENCES `abuesoft`.`servicio` (`idservicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `abuesoft`.`dieta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `abuesoft`.`dieta` (
  `iddieta` INT(11) NOT NULL AUTO_INCREMENT,
  `idabuelo` INT(11) NOT NULL,
  `descripcion` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`iddieta`),
  INDEX `abuelo_idx` (`idabuelo` ASC),
  CONSTRAINT `abuelo3`
    FOREIGN KEY (`idabuelo`)
    REFERENCES `abuesoft`.`abuelo` (`idabuelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `abuesoft`.`notas_enfermeria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `abuesoft`.`notas_enfermeria` (
  `idnotas` INT(11) NOT NULL AUTO_INCREMENT,
  `idabuelo` INT(11) NOT NULL,
  `idusuario` INT(11) NOT NULL,
  `fecha_nota` DATETIME NULL DEFAULT NULL,
  `observacion` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`idnotas`),
  INDEX `usuario_idx` (`idusuario` ASC),
  INDEX `abuelo_idx` (`idabuelo` ASC),
  CONSTRAINT `abuelo1`
    FOREIGN KEY (`idabuelo`)
    REFERENCES `abuesoft`.`abuelo` (`idabuelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `usuario2`
    FOREIGN KEY (`idusuario`)
    REFERENCES `abuesoft`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `abuesoft`.`login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `abuesoft`.`login` (
  `idlogin` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NOT NULL,
  `contrasena` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(100) NULL,
  `idusuario` INT(11) NOT NULL,
  PRIMARY KEY (`idlogin`),
  INDEX `fk_login_usuario1_idx` (`idusuario` ASC),
  CONSTRAINT `fk_login_usuario1`
    FOREIGN KEY (`idusuario`)
    REFERENCES `abuesoft`.`usuario` (`idusuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
