-- CASO MULTITABLAS --

-- CASO 1 --

SELECT 
    envio.envioId,
    envio.clienteId AS 'enviado por',
    tipoDocumento.tipo AS 'tipoDocumento',
	cliente.nombre,
    cliente.email,
    cliente.direccion,
    envio.paqueteId,
    envio.fechaEnvio,
    envio.destino,
    envio.rutaId AS 'ruta',
    envio.sucursalId AS 'sucursal'
FROM 
    envio
JOIN 
    cliente ON envio.clienteId = cliente.clienteId
JOIN
	tipoDocumento ON envio.clienteId = cliente.clienteId AND cliente.tipoDocumentoId = tipoDocumento.tipoDocumentoId;


-- Caso 2 --

SELECT
    c.clienteId,
    c.nombre AS nombreCliente,
    e.envioId,
    e.fechaEnvio,
    e.destino,
    p.paqueteId,
    p.numeroSeguimiento,
    p.peso,
    p.dimensiones,
    p.contenido,
    p.valorDeclarado,
    p.tipoServicio,
    es.descripcion AS estadoPaquete,
    s.seguimientoId,
    s.ubicacion,
    s.fechaHora,
    es2.descripcion AS estadoSeguimiento
FROM
    cliente AS c
JOIN
    envio AS e ON c.clienteId = e.clienteId
JOIN
    paquete AS p ON e.paqueteId = p.paqueteId
JOIN
    estado AS es ON p.estadoId = es.estadoId
JOIN
    seguimiento AS s ON p.paqueteId = s.paqueteId
JOIN
    estado AS es2 ON s.estadoId = es2.estadoId
WHERE
    c.clienteId = '789123456'; -- Acá se coloca el id del cliente que se quiere buscar --


-- Caso 3 -- 

SELECT
    co.conductorId,
    co.nombre AS nombre_conductor,
    r.rutaId,
    r.descripcion AS descripcion_ruta,
    v.vehiculoId,
    v.placa,
    v.capacidadCarga,
    tv.modelo AS modelo_vehiculo,
    mv.nombre AS marca_vehiculo,
    s.sucursalId,
    s.nombre AS nombre_sucursal,
    s.direccion AS direccion_sucursal,
    c.nombre AS nombre_ciudad,
    p.nombre AS nombre_pais
FROM
    conductor co
JOIN
    rutaConductor rc ON co.conductorId = rc.conductorId
JOIN
    ruta r ON rc.rutaId = r.rutaId
JOIN
    vehiculo v ON rc.vehiculoId = v.vehiculoId
JOIN
    tipoVehiculo tv ON v.tipoVehiculoId = tv.tipoVehiculoId
JOIN
    marcaVehiculo mv ON tv.marcaId = mv.marcaVehiculoId
JOIN
    sucursal s ON rc.sucursalId = s.sucursalId
JOIN
    ciudad c ON s.ciudadId = c.ciudadId
JOIN
    pais p ON c.paisId = p.paisId;

-- Caso de uso 4 --

