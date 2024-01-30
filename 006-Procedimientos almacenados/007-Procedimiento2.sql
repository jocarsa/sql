DELIMITER //

CREATE PROCEDURE ActualizarPagado(IN cantidadpagado INT)
BEGIN
	UPDATE pedidos
	SET pagado = cantidadpagado;
END //
DELIMITER ;