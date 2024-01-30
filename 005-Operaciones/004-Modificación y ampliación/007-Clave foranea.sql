ALTER TABLE productos
ADD FOREIGN KEY (categorias_nombre) REFERENCES categorias(Identificador);