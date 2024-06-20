-- Inserts para Casos de uso de registros --

INSERT INTO pais (nombre) VALUES ('colombia');


INSERT INTO ciudad (nombre,paisId) VALUES ('bucaramanga',2);


INSERT INTO sucursal (nombre,direccion,ciudadId) VALUES ('principal','calle 52 #20-32',3);


INSERT INTO tipoDocumento (tipo) VALUES ('cedula');
INSERT INTO cliente (clienteId,tipoDocumentoId,nombre,email,direccion) VALUES ('1048065293',1,'Jhoan','JhoanSL32@gmail.com','calle 12 #12-42');


INSERT INTO tipoTelefono (tipo) VALUES ('celular');
INSERT INTO telefonoCliente (tipoTelefonoId,numero,clienteId) VALUES (1,'3054426588','1048065293');





-- INSERTS PARA LLENAR TODAS LAS TABLAS --

INSERT INTO estado (descripcion) VALUES
	('Listo para enviar'),
	('Enviado'),
	('En almacén temporal'),
	('En tránsito internacional'),
	('Entregado parcialmente'),
	('En proceso de verificación'),
	('En espera de documentación');


INSERT INTO pais (nombre) VALUES
	('Colombia'),
	('Canadá'),
	('Reino Unido'),
	('Italia'),
	('China'),
	('Australia');


INSERT INTO tipoDocumento (tipo) VALUES
	('Cédula'),
	('Carné de identidad'),
	('Licencia de conducir'),
	('Carné de residente'),
	('Carné de estudiante'),
	('Pasaporte extranjero');


INSERT INTO tipoTelefono (tipo) VALUES
	('Oficina móvil'),
	('Personal casa'),
	('Familiar fijo'),
	('Trabajo móvil'),
	('Secundario fijo');


INSERT INTO ciudad (nombre, paisId) VALUES
	('Toronto', 2),
	('Londres', 3),
	('Roma', 4),
	('Pekín', 5),
	('Sídney', 6);


INSERT INTO sucursal (nombre, direccion, ciudadId) VALUES
	('Sucursal Toronto', 'King Street, 123', 1),
	('Sucursal Londres', 'Oxford Street, 456', 2),
	('Sucursal Roma', 'Via del Corso, 789', 3),
	('Sucursal Pekín', 'Changan Avenue, 101', 4),
	('Sucursal Sídney', 'George Street, 234', 5);


INSERT INTO auxiliar (auxiliarId, tipoDocumentoId, nombre, telefono) VALUES
	('147258369', 2, 'Verónica Gómez', '667788990'),
	('258147369', 4, 'Marcos Ruiz', '655443322'),
	('369258147', 5, 'Lucía Martín', '633221100'),
	('159753264', 1, 'Pablo Sánchez', '600112233'),
	('852963741', 3, 'Cristina Fernández', '688776655');


INSERT INTO marcaVehiculo (nombre) VALUES
	('Hyundai'),
	('Kia'),
	('Volkswagen'),
	('Audi'),
	('BMW');


INSERT INTO tipoVehiculo (marcaId, modelo) VALUES
	(1, 'Elantra'),
	(2, 'Sportage'),
	(3, 'Golf'),
	(4, 'A4'),
	(5, 'X3');


INSERT INTO conductor (conductorId, tipoDocumentoId, nombre) VALUES
	('123654789', 1, 'Javier Rodríguez'),
	('147852369', 3, 'Ana Martínez'),
	('963258741', 2, 'Diego López'),
	('987456321', 4, 'Eva Ruiz'),
	('456321478', 5, 'Mario Gómez');


INSERT INTO paquete (numeroSeguimiento, peso, dimensiones, contenido, valorDeclarado, tipoServicio, estadoId) VALUES
	('PKG010', 4.00, '16x22x10 cm', 'Documentos importantes', 70.00, 'nacional', 1),
	('PKG011', 8.50, '30x40x25 cm', 'Equipos de laboratorio', 250.00, 'internacional', 2),
	('PKG012', 1.90, '10x15x8 cm', 'Artículos pequeños', 40.00, 'expres', 4),
	('PKG013', 3.20, '14x20x12 cm', 'Material educativo', 80.00, 'estandar', 3),
	('PKG014', 6.70, '25x35x20 cm', 'Dispositivos médicos', 150.00, 'nacional', 5);


INSERT INTO seguimiento (paqueteId, ubicacion, fechaHora, estadoId) VALUES
	(1, 'En proceso de clasificación', NOW(), 1),
	(2, 'En tránsito a destino final', NOW(), 2),
	(3, 'En almacén de distribución principal', NOW(), 3),
	(4, 'En ruta de entrega urgente', NOW(), 4),
	(5, 'Entregado con confirmación de recepción', NOW(), 5);


INSERT INTO cliente (clienteId, tipoDocumentoId, nombre, email, direccion) VALUES
	('789123456', 1, 'Roberto Fernández', 'roberto.fernandez@example.com', 'Calle Gran Vía, 67'),
	('456789123', 3, 'Laura Gutiérrez', 'laura.gutierrez@example.com', 'Avenida del Mar, 34'),
	('987654321', 2, 'Carlos Sánchez', 'carlos.sanchez@example.com', 'Plaza Mayor, 56'),
	('654321987', 4, 'Sofía López', 'sofia.lopez@example.com', 'Avenida Primavera, 78'),
	('321987654', 5, 'Luisa Martínez', 'luisa.martinez@example.com', 'Paseo del Sol, 90');


INSERT INTO telefonoCliente (tipoTelefonoId, numero, clienteId) VALUES
	(3, '655443322', '789123456'),
	(4, '688776655', '456789123'),
	(5, '633221100', '987654321'),
	(3, '644556677', '654321987'),
	(4, '677889900', '321987654');


INSERT INTO ruta (descripcion, sucursalId) VALUES
	('Ruta Toronto-Londres', 1),
	('Ruta Roma-Pekín', 2),
	('Ruta Sídney-Toronto', 3),
	('Ruta Londres-Roma', 4),
	('Ruta Pekín-Sídney', 5);


INSERT INTO rutaAuxiliar (rutaId, auxiliarId) VALUES
	(3, '147258369'),
	(1, '258147369'),
	(2, '369258147'),
	(4, '159753264'),
	(5, '852963741');


INSERT INTO vehiculo (placa, tipoVehiculoId, capacidadCarga, sucursalId) VALUES
	('JKL012', 1, 1100.00, 1),
	('MNO345', 2, 850.00, 2),
	('PQR678', 3, 1000.00, 3),
	('STU901', 4, 1200.00, 4),
	('VWX234', 5, 950.00, 5);


INSERT INTO telefonoConductor (tipoTelefonoId, numero, conductorId) VALUES
	(1, '677889900', '123654789'),
	(2, '699002211', '147852369'),
	(1, '633445566', '963258741'),
	(2, '655112233', '987456321'),
	(1, '688334455', '456321478');


INSERT INTO rutaConductor (conductorId, vehiculoId, sucursalId, rutaId) VALUES
	('123654789', 1, 1, 1),
	('147852369', 2, 2, 2),
	('963258741', 3, 3, 3),
	('987456321', 4, 4, 4),
	('456321478', 5, 5, 5);


INSERT INTO envio (clienteId, paqueteId, destino, rutaId, sucursalId) VALUES
	('789123456', 1, 'Roma', 3, 3),
	('456789123', 2, 'Pekín', 4, 4)
