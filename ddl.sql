CREATE DATABASE gestionLogistica;
USE gestionLogistica;

CREATE TABLE estado (
	estadoId INT AUTO_INCREMENT,
    descripcion VARCHAR(50) UNIQUE,
    CONSTRAINT PkEstado PRIMARY KEY (estadoId)
);

CREATE TABLE pais (
	paisId INT AUTO_INCREMENT,
    nombre VARCHAR(60),
    CONSTRAINT PkPais PRIMARY KEY (paisId)
);

CREATE TABLE tipoDocumento (
	tipoDocumentoId INT AUTO_INCREMENT,
    tipo VARCHAR(30) UNIQUE,
    CONSTRAINT PkTipoDocumento PRIMARY KEY (tipoDocumentoId)
);

CREATE TABLE tipoTelefono (
	tipoTelefonoId INT AUTO_INCREMENT,
    tipo VARCHAR(30) UNIQUE,
    CONSTRAINT PkTipoTelefono PRIMARY KEY (tipoTelefonoId)
);

CREATE TABLE paquete (
	paqueteId INT AUTO_INCREMENT,
    numeroSeguimiento VARCHAR(50) UNIQUE,
    peso DECIMAL(10,2),
    dimensiones VARCHAR(50),
    contenido TEXT,
    valorDeclarado DECIMAL(10,2),
    tipoServicio ENUM('nacional', 'internacional', 'expres', 'estandar'),
    estadoId INT,
    CONSTRAINT PkPaquete PRIMARY KEY (paqueteId),
    CONSTRAINT FkEstadoPaquete FOREIGN KEY (estadoId) REFERENCES estado(estadoId)
);

CREATE TABLE seguimiento (
	seguimientoId INT AUTO_INCREMENT,
    paqueteId INT,
    ubicacion VARCHAR(200),
    fechaHora TIMESTAMP,
    estadoId INT,
    CONSTRAINT PkSeguimiento PRIMARY KEY (seguimientoId),
    CONSTRAINT FkPaqueteSeguimiento FOREIGN KEY (paqueteId) REFERENCES paquete(paqueteId),
    CONSTRAINT FkEstadoSeguimiento FOREIGN KEY (estadoId) REFERENCES estado(estadoId)
);

CREATE TABLE cliente (
	clienteId VARCHAR(20),
    tipoDocumentoId INT,
    nombre VARCHAR(60),
    email VARCHAR(100),
    direccion VARCHAR(200),
    CONSTRAINT PkCliente PRIMARY KEY (clienteId),
    CONSTRAINT FkClienteTipoDoc FOREIGN KEY (tipoDocumentoId) REFERENCES tipoDocumento(tipoDocumentoId)
);

CREATE TABLE telefonoCliente (
	telefonoClienteId INT AUTO_INCREMENT,
    tipoTelefonoId INT,
    numero VARCHAR(20) UNIQUE,
    clienteId VARCHAR(20),
    CONSTRAINT PkTelefonoCliente PRIMARY KEY (telefonoClienteId),
    CONSTRAINT FkTipoTelefonoCliente FOREIGN KEY (tipoTelefonoId) REFERENCES tipoTelefono(tipoTelefonoId),
    CONSTRAINT FkClienteTelefono FOREIGN KEY (clienteId) REFERENCES cliente(clienteId)
);

CREATE TABLE ciudad (
	ciudadId INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    paisId INT,
    CONSTRAINT PkCiudad PRIMARY KEY (ciudadId),
    CONSTRAINT FkCiudadPais FOREIGN KEY (paisId) REFERENCES pais(paisId)
);

CREATE TABLE sucursal (
	sucursalId INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    direccion VARCHAR(200),
    ciudadId INT,
    CONSTRAINT PkSucursal PRIMARY KEY (sucursalId),
    CONSTRAINT FkSucursalCiudad FOREIGN KEY (ciudadId) REFERENCES ciudad(ciudadId)
);

CREATE TABLE ruta (
	rutaId INT AUTO_INCREMENT,
    descripcion VARCHAR(200),
    sucursalId INT,
    CONSTRAINT PkRuta PRIMARY KEY (rutaId),
    CONSTRAINT FkRutaSucursal FOREIGN KEY (sucursalId) REFERENCES sucursal(sucursalId)
);

CREATE TABLE auxiliar (
	auxiliarId VARCHAR(20),
    tipoDocumentoId INT,
    nombre VARCHAR(60),
    telefono VARCHAR(20),
    CONSTRAINT PkAuxiliar PRIMARY KEY (auxiliarId),
    CONSTRAINT FkAuxiliarTipoDoc FOREIGN KEY (tipoDocumentoId) REFERENCES tipoDocumento(tipoDocumentoId)
);

CREATE TABLE rutaAuxiliar (
	rutaAuxiliarId INT AUTO_INCREMENT,
    rutaId INT,
    auxiliarId VARCHAR(20),
    CONSTRAINT PkRutaAuxiliar PRIMARY KEY (rutaAuxiliarId),
    CONSTRAINT FkRutaAuxRuta FOREIGN KEY (rutaId) REFERENCES ruta(rutaId),
    CONSTRAINT FkRutaAuxAuxiliar FOREIGN KEY (auxiliarId) REFERENCES auxiliar(auxiliarId)
);

CREATE TABLE marcaVehiculo (
	marcaVehiculoId INT AUTO_INCREMENT,
	nombre VARCHAR(30),
	CONSTRAINT PkMarcaVehiculo PRIMARY KEY (marcaVehiculoId)
);

CREATE TABLE tipoVehiculo (
	tipoVehiculoId INT AUTO_INCREMENT,
	marcaId INT,
	modelo VARCHAR(50),
	CONSTRAINT PkTipoVehiculo PRIMARY KEY (tipoVehiculoId),
	CONSTRAINT FkTipoMarca FOREIGN KEY (marcaId) REFERENCES marcaVehiculo(marcaVehiculoId)
	
);

CREATE TABLE vehiculo (
vehiculoId INT AUTO_INCREMENT,
    placa VARCHAR(20),
    tipoVehiculoId INT,
    capacidadCarga DECIMAL(10,2),
    sucursalId INT,
    CONSTRAINT PkVehiculo PRIMARY KEY (vehiculoId),
    CONSTRAINT FkVehiculoSucursal FOREIGN KEY (sucursalId) REFERENCES sucursal(sucursalId),
	CONSTRAINT FkVehiculoTipo FOREIGN KEY (tipoVehiculoId) REFERENCES tipoVehiculo(tipoVehiculoId)
);

CREATE TABLE conductor (
	conductorId VARCHAR(20),
    tipoDocumentoId INT,
    nombre VARCHAR(60),
    CONSTRAINT PkConductor PRIMARY KEY (conductorId),
    CONSTRAINT FkConductorTipoDoc FOREIGN KEY (tipoDocumentoId) REFERENCES tipoDocumento(tipoDocumentoId)
);

CREATE TABLE telefonoConductor (
	telefonoConductorId INT AUTO_INCREMENT,
    tipoTelefonoId INT,
    numero VARCHAR(20) UNIQUE,
    conductorId VARCHAR(20),
    CONSTRAINT PkTelefonoConductor PRIMARY KEY (telefonoConductorId),
    CONSTRAINT FkTipoTelefConductor FOREIGN KEY (tipoTelefonoId) REFERENCES tipoTelefono(tipoTelefonoId),
    CONSTRAINT FkConductorIdTelefono FOREIGN KEY (conductorId) REFERENCES conductor(conductorId)
);

CREATE TABLE rutaConductor (
	rutaConductorId INT AUTO_INCREMENT,
    conductorId VARCHAR(20),
    vehiculoId INT,
    sucursalId INT,
    rutaId INT,
    CONSTRAINT PkRutaConductor PRIMARY KEY (rutaConductorId),
    CONSTRAINT FkConductorIdRuta FOREIGN KEY (conductorId) REFERENCES conductor(conductorId),
    CONSTRAINT FkRutaConductorVehiculo FOREIGN KEY (vehiculoId) REFERENCES vehiculo(vehiculoId),
    CONSTRAINT FkRutaConductorSucursal FOREIGN KEY (sucursalId) REFERENCES sucursal(sucursalId),
    CONSTRAINT FkRutaIdConductor FOREIGN KEY (rutaId) REFERENCES ruta(rutaId)
);

CREATE TABLE envio (
	envioId INT AUTO_INCREMENT,
    clienteId VARCHAR(20),
    paqueteId INT,
    fechaEnvio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    destino VARCHAR(200),
    rutaId INT,
    sucursalId INT,
    CONSTRAINT PkEnvio PRIMARY KEY (envioId),
    CONSTRAINT FkClienteEnvio FOREIGN KEY (clienteId) REFERENCES cliente(clienteId),
    CONSTRAINT FkPaqueteEnvio FOREIGN KEY (paqueteId) REFERENCES paquete(paqueteId),
    CONSTRAINT FkRutaEnvio FOREIGN KEY (rutaId) REFERENCES ruta(rutaId),
    CONSTRAINT FkSucursalEnvio FOREIGN KEY (sucursalId) REFERENCES sucursal(sucursalId)
);




