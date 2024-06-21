INSERT INTO estado (descripcion) VALUES
    ('Listo para enviar'),
    ('Enviado'),
    ('En almacén temporal'),
    ('En tránsito internacional'),
    ('Entregado parcialmente'),
    ('En proceso de verificación'),
    ('En espera de documentación'),
    ('En revisión aduanera'),
    ('En retorno al remitente'),
    ('Perdido en tránsito');

INSERT INTO pais (nombre) VALUES
    ('Colombia'),
    ('Canadá'),
    ('Reino Unido'),
    ('Italia'),
    ('China'),
    ('Australia'),
    ('Alemania'),
    ('Estados Unidos'),
    ('Francia'),
    ('Japón'),
    ('Corea del Sur'),
    ('Brasil');


INSERT INTO tipoDocumento (tipo) VALUES
    ('Cédula'),
    ('Carné de identidad'),
    ('Licencia de conducir'),
    ('Carné de residente'),
    ('Carné de estudiante'),
    ('Pasaporte extranjero'),
    ('Carné de salud'),
    ('Registro comercial'),
    ('Tarjeta de crédito'),
    ('Licencia de armas'),
    ('Pasaporte diplomático');



INSERT INTO tipoTelefono (tipo) VALUES
    ('Oficina móvil'),
    ('Personal casa'),
    ('Familiar fijo'),
    ('Trabajo móvil'),
    ('Secundario fijo'),
    ('Oficina fijo'),
    ('Personal móvil'),
    ('Familiar móvil'),
    ('Trabajo fijo'),
    ('Secundario móvil');



INSERT INTO ciudad (nombre, paisId) VALUES
    ('Toronto', 2),
    ('Londres', 3),
    ('Roma', 4),
    ('Pekín', 5),
    ('Sídney', 6),
    ('Berlín', 7),
    ('Nueva York', 8),
    ('París', 9),
    ('Tokio', 10),
    ('Seúl', 11);



INSERT INTO sucursal (nombre, direccion, ciudadId) VALUES
    ('Sucursal Toronto', 'King Street, 123', 1),
    ('Sucursal Londres', 'Oxford Street, 456', 2),
    ('Sucursal Roma', 'Via del Corso, 789', 3),
    ('Sucursal Pekín', 'Changan Avenue, 101', 4),
    ('Sucursal Sídney', 'George Street, 234', 5),
    ('Sucursal Berlín', 'Kurfürstendamm, 321', 6),
    ('Sucursal Nueva York', 'Broadway, 987', 7),
    ('Sucursal París', 'Champs-Élysées, 654', 8),
    ('Sucursal Tokio', 'Shibuya, 321', 9),
    ('Sucursal Seúl', 'Gangnam, 456', 10);



INSERT INTO auxiliar (auxiliarId, tipoDocumentoId, nombre, telefono) VALUES
    ('147258369', 2, 'Verónica Gómez', '667788990'),
    ('258147369', 4, 'Marcos Ruiz', '655443322'),
    ('369258147', 5, 'Lucía Martín', '633221100'),
    ('159753264', 1, 'Pablo Sánchez', '600112233'),
    ('852963741', 3, 'Cristina Fernández', '688776655'),
    ('123456789', 3, 'Ana López', '600112233'),
    ('987654321', 5, 'Marcos Sánchez', '633221100'),
    ('456789123', 1, 'Lucía Gómez', '655443322'),
    ('789123456', 2, 'Pablo Martínez', '677889900');



INSERT INTO marcaVehiculo (nombre) VALUES
    ('Hyundai'),
    ('Kia'),
    ('Volkswagen'),
    ('Audi'),
    ('BMW'),
    ('Toyota'),
    ('Ford'),
    ('Mercedes-Benz'),
    ('Honda'),
    ('Chevrolet');



INSERT INTO tipoVehiculo (marcaId, modelo) VALUES
    (1, 'Elantra'),
    (2, 'Sportage'),
    (3, 'Golf'),
    (4, 'A4'),
    (5, 'X3'),
    (6, 'Corolla'),
    (7, 'Focus'),
    (8, 'Clase C'),
    (9, 'Civic'),
    (10, 'Spark');


INSERT INTO conductor (conductorId, tipoDocumentoId, nombre) VALUES
    ('123654789', 1, 'Javier Rodríguez'),
    ('147852369', 3, 'Ana Martínez'),
    ('963258741', 2, 'Diego López'),
    ('987456321', 4, 'Eva Ruiz'),
    ('456321478', 5, 'Mario Gómez'),
    ('789456123', 1, 'Sandra Pérez'),
    ('654789123', 3, 'Pablo Martínez'),
    ('321654987', 2, 'María Rodríguez'),
    ('987123654', 4, 'Carlos Sánchez'),
    ('456987321', 5, 'Laura Gutiérrez');



INSERT INTO paquete (numeroSeguimiento, peso, dimensiones, contenido, valorDeclarado, tipoServicio, estadoId) VALUES
    ('PKG010', 4.00, '16x22x10 cm', 'Documentos importantes', 70.00, 'nacional', 1),
    ('PKG011', 8.50, '30x40x25 cm', 'Equipos de laboratorio', 250.00, 'internacional', 2),
    ('PKG012', 1.90, '10x15x8 cm', 'Artículos pequeños', 40.00, 'expres', 4),
    ('PKG013', 3.20, '14x20x12 cm', 'Material educativo', 80.00, 'estandar', 3),
    ('PKG014', 6.70, '25x35x20 cm', 'Dispositivos médicos', 150.00, 'nacional', 5),
    ('PKG015', 3.50, '18x25x15 cm', 'Libros', 60.00, 'internacional', 6),
    ('PKG016', 2.10, '12x18x9 cm', 'Ropa', 30.00, 'expres', 7),
    ('PKG017', 5.80, '22x30x18 cm', 'Electrónicos', 120.00, 'estandar', 8),
    ('PKG018', 7.20, '28x38x22 cm', 'Productos perecederos', 200.00, 'nacional', 9),
    ('PKG019', 6.00, '24x32x19 cm', 'Herramientas', 180.00, 'internacional', 10);



INSERT INTO seguimiento (paqueteId, ubicacion, fechaHora, estadoId) VALUES
    (1, 'En proceso de clasificación', NOW(), 1),
    (1, 'En almacén de sucursal', NOW() - INTERVAL 1 DAY, 2),
    (1, 'En ruta de entrega', NOW() - INTERVAL 12 HOUR, 3),

    (2, 'En tránsito a destino final', NOW(), 2),
    (2, 'En almacén internacional', NOW() - INTERVAL 2 DAY, 3),
    (2, 'En aduana de destino', NOW() - INTERVAL 18 HOUR, 4),

    (3, 'En almacén de distribución principal', NOW(), 3),
    (3, 'En proceso de verificación', NOW() - INTERVAL 3 DAY, 4),
    (3, 'Listo para envío', NOW() - INTERVAL 1 DAY, 5),

    (4, 'En ruta de entrega urgente', NOW(), 4),
    (4, 'Entregado parcialmente', NOW() - INTERVAL 4 DAY, 5),
    (4, 'Entregado con confirmación de recepción', NOW() - INTERVAL 2 DAY, 6),

    (5, 'Entregado con confirmación de recepción', NOW(), 5),
    (5, 'En proceso de clasificación', NOW() - INTERVAL 1 DAY, 1);



INSERT INTO cliente (clienteId, tipoDocumentoId, nombre, email, direccion) VALUES
    ('789123456', 1, 'Roberto Fernández', 'roberto.fernandez@example.com', 'Calle Gran Vía, 67'),
    ('456789123', 3, 'Laura Gutiérrez', 'laura.gutierrez@example.com', 'Avenida del Mar, 34'),
    ('987654321', 2, 'Carlos Sánchez', 'carlos.sanchez@example.com', 'Plaza Mayor, 56'),
    ('654321987', 4, 'Sofía López', 'sofia.lopez@example.com', 'Avenida Primavera, 78'),
    ('321987654', 5, 'Luisa Martínez', 'luisa.martinez@example.com', 'Paseo del Sol, 90'),
    ('159753486', 1, 'Ana Pérez', 'ana.perez@example.com', 'Calle Mayor, 45'),
    ('852369741', 3, 'Pedro Gómez', 'pedro.gomez@example.com', 'Avenida Central, 23'),
    ('741852963', 2, 'María Rodríguez', 'maria.rodriguez@example.com', 'Calle Real, 12'),
    ('369147258', 4, 'Juan Sánchez', 'juan.sanchez@example.com', 'Avenida Libertad, 56'),
    ('258369147', 5, 'Elena Martínez', 'elena.martinez@example.com', 'Calle Pública, 78');


INSERT INTO telefonoCliente (tipoTelefonoId, numero, clienteId) VALUES
    (3, '655443322', '789123456'),
    (4, '688776655', '456789123'),
    (5, '633221100', '987654321'),
    (3, '644556677', '654321987'),
    (4, '677889900', '321987654'),
    (5, '600112233', '159753486'),
    (3, '633445566', '852369741'),
    (4, '655112233', '741852963'),
    (5, '688334455', '369147258'),
    (3, '677778899', '258369147');



INSERT INTO ruta (descripcion, sucursalId) VALUES
    ('Ruta Toronto-Londres', 1),
    ('Ruta Roma-Pekín', 3),
    ('Ruta Sídney-Toronto', 5),
    ('Ruta Londres-Roma', 2),
    ('Ruta Pekín-Sídney', 4),
    ('Ruta Berlín-Nueva York', 6),
    ('Ruta París-Tokio', 8),
    ('Ruta Seúl-Berlín', 10),
    ('Ruta Nueva York-París', 7),
    ('Ruta Tokio-Seúl', 9);



INSERT INTO rutaAuxiliar (rutaId, auxiliarId) VALUES
    (3, '147258369'),
    (1, '258147369'),
    (2, '369258147'),
    (4, '159753264'),
    (5, '852963741'),
    (6, '123456789'),
    (7, '987654321'),
    (8, '456789123'),
    (9, '789123456'),
    (10, '147258369');



INSERT INTO vehiculo (placa, tipoVehiculoId, capacidadCarga, sucursalId) VALUES
    ('JKL012', 1, 1100.00, 1),
    ('MNO345', 2, 850.00, 2),
    ('PQR678', 3, 1000.00, 3),
    ('STU901', 4, 1200.00, 4),
    ('VWX234', 5, 950.00, 5),
    ('YZA567', 6, 1100.00, 6),
    ('BCD890', 7, 850.00, 7),
    ('EFG123', 8, 1000.00, 8),
    ('HIJ456', 9, 1200.00, 9);
  



INSERT INTO telefonoConductor (tipoTelefonoId, numero, conductorId) VALUES
	(1, '677889900', '123654789'),
	(2, '699002211', '147852369'),
	(1, '633445566', '963258741'),
	(2, '655112233', '987456321'),
	(1, '688334455', '456321478'),
	(3, '644112233', '123654789'),
    (4, '655443322', '147852369'),
    (3, '622334455', '963258741'),
    (3, '688776655', '456321478');



INSERT INTO rutaConductor (conductorId, vehiculoId, sucursalId, rutaId) VALUES
	('123654789', 1, 1, 1),
	('147852369', 2, 2, 2),
	('963258741', 3, 3, 3),
	('987456321', 4, 4, 4),
	('456321478', 5, 5, 5);


INSERT INTO envio (clienteId, paqueteId, destino, rutaId, sucursalId) VALUES
    ('789123456', 1, 'Roma', 3, 3),
    ('456789123', 2, 'Pekín', 4, 4),
    ('987654321', 3, 'Londres', 2, 2),
    ('654321987', 4, 'Sídney', 5, 5),
    ('321987654', 5, 'Toronto', 1, 1);