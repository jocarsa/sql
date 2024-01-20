SELECT 
*,
    CASE
        WHEN precio <= 40 THEN 'Barato'
        ELSE 'Caro'
    END AS 'Tipo de producto'
FROM productos;