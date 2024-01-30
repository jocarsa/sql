UPDATE pedidos SET impuestos_nombre = NULL 
WHERE impuestos_nombre NOT IN (SELECT Identificador FROM impuestos);