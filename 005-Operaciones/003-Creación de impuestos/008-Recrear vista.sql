CREATE VIEW totales_pedidos AS 
SELECT 
pedidos.Identificador AS 'Número de pedido',
pedidos.fecha AS 'Fecha del pedido',
clientes.nombre AS 'Nombre del cliente',
SUM(productos.precio*lineaspedido.cantidad) AS 'SubTotal',
impuestos.nombre AS 'Descrpción impuesto',
ROUND(SUM(productos.precio*lineaspedido.cantidad)*(impuestos.tipoimpositivo/100),2) AS "Impuesto",
ROUND(SUM(productos.precio*lineaspedido.cantidad) + SUM(productos.precio*lineaspedido.cantidad)*(impuestos.tipoimpositivo/100),2) AS 'Total'

FROM pedidos

LEFT JOIN clientes 
ON pedidos.clientes_nombre = clientes.Identificador
LEFT JOIN lineaspedido
ON lineaspedido.pedidos_fecha = pedidos.Identificador
LEFT JOIN productos
ON lineaspedido.productos_nombre = productos.Identificador
LEFT JOIN impuestos
ON pedidos.impuestos_nombre = impuestos.Identificador

GROUP BY clientes.Identificador;