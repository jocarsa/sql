SELECT
categoria AS 'Categoria',
COUNT(categoria) AS 'Número'
FROM productos
GROUP BY categoria;
