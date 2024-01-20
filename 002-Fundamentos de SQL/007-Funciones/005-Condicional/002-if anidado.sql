SELECT 
*,
IF(peso <= 1,
   IF(peso > 0,'Paquete','No aplicable')
   ,'Caja') AS 'Embalaje de envío'
FROM productos;