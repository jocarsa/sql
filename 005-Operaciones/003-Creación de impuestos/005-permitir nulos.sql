ALTER TABLE `pedidos` ADD `impuestos_nombre` INT(255) NOT NULL AFTER `clientes_nombre`;

ALTER TABLE pedidos MODIFY impuestos_nombre INT(10);
