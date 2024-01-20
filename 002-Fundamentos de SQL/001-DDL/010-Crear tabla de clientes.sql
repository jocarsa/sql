CREATE TABLE clientes
(
    Identificador INT(10) NOT NULL AUTO_INCREMENT , 
    nombre VARCHAR(150) NOT NULL , 
    idfiscal VARCHAR(50) NOT NULL , 
    direccion VARCHAR(250) NOT NULL , 
    codigopostal VARCHAR(20) NOT NULL , 
    nombrepersonacontacto VARCHAR(250) NOT NULL , 
    emailpersonacontacto VARCHAR(100) NOT NULL , 
    imagen VARCHAR(100) NOT NULL ,
    PRIMARY KEY (Identificador)
) 
ENGINE = InnoDB 
COMMENT = 'En esta tabla guardaremos los clientes';