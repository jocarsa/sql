DELIMITER //
CREATE PROCEDURE ActualizarCodigoProvincia()
BEGIN

UPDATE 
codigospostales
SET idprovincia = LEFT(codigopostal,2)
WHERE idprovincia = '';

END //
DELIMITER ; 