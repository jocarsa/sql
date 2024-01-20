SELECT 
pedidos.Identificador AS 'Número de pedido',
pedidos.fecha AS 'Fecha del pedido',
clientes.nombre AS 'Nombre del cliente',
productos.nombre AS 'Producto',
productos.precio AS 'Precio',
lineaspedido.cantidad AS 'Cantidad',
productos.precio*lineaspedido.cantidad AS 'Subtotal'
FROM pedidos
LEFT JOIN clientes 
ON pedidos.clientes_nombre = clientes.Identificador
LEFT JOIN lineaspedido
ON lineaspedido.pedidos_fecha = pedidos.Identificador
LEFT JOIN productos
ON lineaspedido.productos_nombre = productos.Identificador;