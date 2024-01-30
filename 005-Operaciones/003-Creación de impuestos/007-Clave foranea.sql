ALTER TABLE pedidos
ADD FOREIGN KEY (impuestos_nombre) REFERENCES impuestos(Identificador);