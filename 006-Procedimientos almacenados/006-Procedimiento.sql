DELIMITER //

CREATE PROCEDURE ActualizarPagado(IN cantidadpagado INT)
BEGIN
	UPDATE pedidos
	SET pagado = cantidadpagado
    WHERE pagado = 0;
END //
DELIMITER ;