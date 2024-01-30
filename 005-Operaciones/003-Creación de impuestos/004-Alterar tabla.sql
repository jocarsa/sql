ALTER TABLE pedidos
ADD COLUMN impuestos_nombre INT(10) NOT NULL,
ADD FOREIGN KEY (impuestos_nombre) REFERENCES impuestos(Identificador);