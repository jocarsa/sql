SELECT
SUM(precio) AS 'Cantidad',
categoria AS 'Categoria'
FROM productos
GROUP BY categoria;
