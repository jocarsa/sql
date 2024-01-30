SELECT 
clientes.nombre,
clientes.idfiscal,
clientes.direccion,
clientes.nombrepersonacontacto,
clientes.emailpersonacontacto,
codigospostales.nombremunicipio,
codigospostales.codigopostal,
provincias.provincia

FROM `clientes`

LEFT JOIN codigospostales
ON clientes.codigopostal = codigospostales.codigopostal

LEFT JOIN provincias
ON codigospostales.idprovincia = provincias.codigo;