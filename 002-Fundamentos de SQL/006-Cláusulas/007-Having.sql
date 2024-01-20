SELECT
*
FROM productos
GROUP BY categoria HAVING precio > 200;
