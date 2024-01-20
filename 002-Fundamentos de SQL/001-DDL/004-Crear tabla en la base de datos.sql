CREATE TABLE `empresa`.`usuarios` 
(
    `Identificador` INT(10) NOT NULL AUTO_INCREMENT , 
     `nombre` VARCHAR(50) NOT NULL , 
     `contrasena` VARCHAR(50) NOT NULL , 
     `nombrepropio` VARCHAR(50) NOT NULL , 
     `apellidos` VARCHAR(100) NOT NULL , 
     `email` VARCHAR(100) NOT NULL , 
     `telefono` VARCHAR(50) NOT NULL , 
     PRIMARY KEY (`Identificador`)
) 
ENGINE = InnoDB 
COMMENT = 'En esta tabla guardaremos los usuarios';