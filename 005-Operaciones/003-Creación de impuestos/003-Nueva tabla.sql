CREATE TABLE pedidos 
(
    Identificador INT(10) NOT NULL AUTO_INCREMENT , 
    fecha DATE NOT NULL , 
    clientes_nombre INT(10) NOT NULL , 
    impuestos_nombre INT(10) NOT NULL , 
    FOREIGN KEY (clientes_nombre) REFERENCES clientes(Identificador),
    FOREIGN KEY (impuestos_nombre) REFERENCES impuestos(Identificador),
    PRIMARY KEY (`Identificador`)
) ENGINE = InnoDB;