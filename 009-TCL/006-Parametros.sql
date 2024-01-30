DELIMITER //

CREATE PROCEDURE LineaPedidoParametro(IN idproducto INT)
BEGIN
    START TRANSACTION;

    SELECT existencias INTO @existencias FROM productos WHERE Identificador = idproducto;

    IF @existencias < 1 THEN
        ROLLBACK;
    ELSE
        INSERT INTO lineaspedido VALUES (NULL, '2024001', idproducto, '1', '');    
        UPDATE productos SET existencias = existencias - 1 WHERE Identificador = idproducto;
        COMMIT;
    END IF;
END //
DELIMITER ;