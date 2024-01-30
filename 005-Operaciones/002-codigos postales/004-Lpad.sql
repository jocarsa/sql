ALTER TABLE `codigospostales` CHANGE `codigopostal` `codigopostal` VARCHAR(5) NULL DEFAULT NULL;


UPDATE codigospostales
SET codigopostal = LPAD(codigopostal,5,'0');