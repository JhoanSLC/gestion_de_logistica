INSERT INTO pais (nombre) VALUES ('colombia');


INSERT INTO ciudad (nombre,paisId) VALUES ('bucaramanga',2);


INSERT INTO sucursal (nombre,direccion,ciudadId) VALUES ('principal','calle 52 #20-32',3);


INSERT INTO tipoDocumento (tipo) VALUES ('cedula');
INSERT INTO cliente (clienteId,tipoDocumentoId,nombre,email,direccion) VALUES ('1048065293',1,'Jhoan','JhoanSL32@gmail.com','calle 12 #12-42');


INSERT INTO tipoTelefono (tipo) VALUES ('celular');
INSERT INTO telefonoCliente (tipoTelefonoId,numero,clienteId) VALUES (1,'3054426588','1048065293');