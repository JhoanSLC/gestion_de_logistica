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