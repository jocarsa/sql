SELECT 
*,
IF(peso <= 1,'Paquete','Caja') AS 'Embalaje de envío'
FROM productos;