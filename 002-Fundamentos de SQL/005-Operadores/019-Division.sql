SELECT 
nombre AS 'Nombre del producto',
descripcion AS 'Descripción',
precio AS 'Precio',
precio*0.21 AS 'Impuesto IVA 21%',
precio + precio*0.21 AS 'Total',
(precio + precio*0.21)/10 AS 'Descuento 10%'
FROM productos;
