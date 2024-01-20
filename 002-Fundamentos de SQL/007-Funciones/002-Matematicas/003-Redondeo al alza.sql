SELECT
CEIL(AVG(precio)) AS 'Cantidad',
categoria AS 'Categoria'
FROM productos
GROUP BY categoria;