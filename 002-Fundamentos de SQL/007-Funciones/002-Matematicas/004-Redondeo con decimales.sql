SELECT
ROUND(AVG(precio),2) AS 'Cantidad',
categoria AS 'Categoria'
FROM productos
GROUP BY categoria;