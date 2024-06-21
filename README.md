# Ejercicio de creación de base de datos y consultas

<p style="text-align:center;">
    <img src="./gestionLogisticaDB.png" />
</p>

<br>
<br>
<br>
<br>

---

## Caso de uso 1: Registrar un Nuevo País

<br>

**Descripción**: Un administrador desea agregar un nuevo país a la base de

```sql
INSERT INTO pais (nombre) VALUES ('colombia');
```

<br>

---

## Caso de uso 2: Registrar una nueva ciudad

<br>

**Descripción**: Un administrador desea agregar una nueva ciudad asociada a un país existente

```sql
INSERT INTO ciudad (nombre,paisId) VALUES ('bucaramanga',2);
```

---

## Caso de uso 3: Registrar una nueva sucursal

<br>

**Descripción**: Un administrador desea agregar una nueva sucursal asociada a una ciudad existente

```sql
INSERT INTO sucursal (nombre,direccion,ciudadId) VALUES ('principal','calle 52 #20-32',3);
```

<br>

---

## Caso de uso 4: Registrar un nuevo cliente

<br>

**Descripción**: Un administrador desea registrar un nuevo cliente en la base de datos.

```sql
INSERT INTO tipoDocumento (tipo) VALUES ('cedula');
INSERT INTO cliente (clienteId,tipoDocumentoId,nombre,email,direccion) VALUES ('1048065293',1,'Jhoan','JhoanSL32@gmail.com','calle 12 #12-42');
```

> **Explicación**: Se inserta primero un tipo de documento en la tabla de tipo de documentos que hará referencia al tipo de DNI con el que se registra al cliente y luego se registra al cliente mandando el id del tipo de documento con el que se registra.

<br>

---

## Caso de uso 5: Registrar un nuevo telefono para un cliente

<br>

**Descripción**: Un administrador desea agregar un número de teléfono para un cliente existene

```sql
// Se inserta primero un tipo de teléfono para luego usarlo en el telefono del cliente
INSERT INTO tipoTelefono (tipo) VALUES ('celular');
INSERT INTO telefonoCliente (tipoTelefonoId,numero,clienteId) VALUES (1,'3054426588','1048065293');
```

<br>
<br>

---

# Casos Multitabla

---

<br>

## Caso de uso 1: Obtener información completa de envíos.

<br>

**Descripción**: Un administrador desea obtener la información completa de todos los envíos incluyendo detalles del cliente, paquete, ruta, conductor Y sucursal.

```sql
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

+---------+-------------+----------------------+-------------------+-------------------------------+---------------------+-----------+---------------------+---------+------+----------+
| envioId | enviado por | tipoDocumento        | nombre            | email                         | direccion           | paqueteId | fechaEnvio          | destino | ruta | sucursal |
+---------+-------------+----------------------+-------------------+-------------------------------+---------------------+-----------+---------------------+---------+------+----------+
|       1 | 789123456   | Cédula               | Roberto Fernández | roberto.fernandez@example.com | Calle Gran Vía, 67  |         1 | 2024-06-20 17:00:04 | Roma    |    3 |        3 |
|       2 | 456789123   | Licencia de conducir | Laura Gutiérrez   | laura.gutierrez@example.com   | Avenida del Mar, 34 |         2 | 2024-06-20 17:00:04 | Pekín   |    4 |        4 |
+---------+-------------+----------------------+-------------------+-------------------------------+---------------------+-----------+---------------------+---------+------+----------+

```

**Explicación**: Para esta consulta se seleccionan las columnas de cliente, tipoDocumento y envio que se van a mostrar y luego se hace uso de un JOIN para decir que de la tabla cliente se agregue la información del cliente que corresponde al clienteId del envio y luego se hace otro JOIN para que de la tabla de tipoDocumento muestre el nombre del tipo de documento del cliente y no muestre solo el id del tipo de documento

<br>

---

## Caso de uso 2: Obtener Historial de Envíos de un Cliente

<br>

**Descripción**: Un administrador desea obtener el historial completo de envíos de un cliente especifico, incluyendo detalles de los paquetes y los eventos de seguimiento.

```sql
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

+-----------+-------------------+---------+---------------------+---------+-----------+-------------------+------+-------------+------------------------+----------------+--------------+-------------------+---------------+-----------------------------+---------------------+--------------------+
| clienteId | nombreCliente     | envioId | fechaEnvio          | destino | paqueteId | numeroSeguimiento | peso | dimensiones | contenido              | valorDeclarado | tipoServicio | estadoPaquete     | seguimientoId | ubicacion                   | fechaHora           | estadoSeguimiento  |
+-----------+-------------------+---------+---------------------+---------+-----------+-------------------+------+-------------+------------------------+----------------+--------------+-------------------+---------------+-----------------------------+---------------------+--------------------+
| 789123456 | Roberto Fernández |       1 | 2024-06-20 17:00:04 | Roma    |         1 | PKG010            | 4.00 | 16x22x10 cm | Documentos importantes |          70.00 | nacional     | Listo para enviar |             1 | En proceso de clasificación | 2024-06-20 17:00:04 | Listo para enviar  |
+-----------+-------------------+---------+---------------------+---------+-----------+-------------------+------+-------------+------------------------+----------------+--------------+-------------------+---------------+-----------------------------+---------------------+--------------------+
```

**Explicación**: En este caso se hace uso de varios JOIN para agregar la información del paquete, el cliente que lo envía, los seguimientos del paquete (en este caso solo uno).

Luego de los JOIN está el WHERE que es donde se especifica el cliente del que se quiere buscar sus envíos

---

## Caso de uso 3: Listar conductores y sus rutas asignadas

<br>

**Desripción**: Un administrador desea obtener una lista de todos los conductores y las rutas a las que están asignados, incluyendo detalles del vehiculo utilizado y la sucursal correspondiente.

```sql
SELECT
    co.conductorId,
    co.nombre AS nombreConductor,
    r.rutaId,
    r.descripcion AS descripcionRuta,
    v.vehiculoId,
    v.placa,
    v.capacidadCarga,
    tv.modelo AS modeloVehiculo,
    mv.nombre AS marcaVehiculo,
    s.sucursalId,
    s.nombre AS nombreSucursal,
    s.direccion AS direccionSucursal,
    c.nombre AS nombreCiudad,
    p.nombre AS nombrePais
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



+-------------+------------------+--------+----------------------+------------+--------+----------------+-----------------+----------------+------------+------------------+---------------------+---------------+-------------+
| conductorId | nombreConductor  | rutaId | descripcionRuta      | vehiculoId | placa  | capacidadCarga | modeloVehiculo  | marcaVehiculo  | sucursalId | nombreSucursal   | direccionSucursal   | nombreCiudad  | nombrePais  |
+-------------+------------------+--------+----------------------+------------+--------+----------------+-----------------+----------------+------------+------------------+---------------------+---------------+-------------+
| 123654789   | Javier Rodríguez |      1 | Ruta Toronto-Londres |          1 | JKL012 |        1100.00 | Elantra         | Hyundai        |          1 | Sucursal Toronto | King Street, 123    | Toronto       | Canadá      |
| 147852369   | Ana Martínez     |      2 | Ruta Roma-Pekín      |          2 | MNO345 |         850.00 | Sportage        | Kia            |          2 | Sucursal Londres | Oxford Street, 456  | Londres       | Reino Unido |
| 963258741   | Diego López      |      3 | Ruta Sídney-Toronto  |          3 | PQR678 |        1000.00 | Golf            | Volkswagen     |          3 | Sucursal Roma    | Via del Corso, 789  | Roma          | Italia      |
| 987456321   | Eva Ruiz         |      4 | Ruta Londres-Roma    |          4 | STU901 |        1200.00 | A4              | Audi           |          4 | Sucursal Pekín   | Changan Avenue, 101 | Pekín         | China       |
| 456321478   | Mario Gómez      |      5 | Ruta Pekín-Sídney    |          5 | VWX234 |         950.00 | X3              | BMW            |          5 | Sucursal Sídney  | George Street, 234  | Sídney        | Australia   |
+-------------+------------------+--------+----------------------+------------+--------+----------------+-----------------+----------------+------------+------------------+---------------------+---------------+-------------+
```

---

<br>

## Caso de uso 4: Obtener detalles de rutas y auxiliares asignados

<br>

**Descripción**: Un administrador desea obtener detalles de todas las rutas, incluyendo los auxiliares asignados a cada ruta

```sql
SELECT r.rutaId, r.descripcion AS descripcionRuta, s.nombre AS nombreSucursal,
       a.auxiliarId, a.nombre AS nombre_auxiliar
FROM ruta AS r
LEFT JOIN rutaAuxiliar ra ON r.rutaId = ra.rutaId
LEFT JOIN auxiliar a ON ra.auxiliarId = a.auxiliarId
LEFT JOIN sucursal s ON r.sucursalId = s.sucursalId;


+--------+----------------------+------------------+------------+---------------------+
| rutaId | descripcionRuta      | nombreSucursal   | auxiliarId | nombreAuxiliar      |
+--------+----------------------+------------------+------------+---------------------+
|      1 | Ruta Toronto-Londres | Sucursal Toronto | 258147369  | Marcos Ruiz         |
|      2 | Ruta Roma-Pekín      | Sucursal Roma    | 369258147  | Lucía Martín        |
|      3 | Ruta Sídney-Toronto  | Sucursal Sídney  | 147258369  | Verónica Gómez      |
|      4 | Ruta Londres-Roma    | Sucursal Londres | 159753264  | Pablo Sánchez       |
|      5 | Ruta Pekín-Sídney    | Sucursal Pekín   | 852963741  | Cristina Fernández  |
+--------+----------------------+------------------+------------+---------------------+
```

**Explicación**: Para esta consulta, que nos pidte los detalles de TODAS las rutas incluyendo si tiene asignado auxiliares y cuales son. Se hace uso de un LEFT JOIN para que nos muestre TODOS los datos de la tabla de ruta y se agregue el contenido de auxiliares en caso de que la ruta tenga (En este caso todas tienen una asignación)

---

<br>

## Caso de uso 5: Generar reporte de paquetes por sucursal y estado

<br>

**Descripción**: Un administrador desea generar un reporte de todos los paquetes agrupados por sucursal y estado

```sql
SELECT s.nombre AS sucursal,
       e.descripcion AS estado,
       p.paqueteId AS idPaquete
FROM sucursal AS s
JOIN vehiculo v ON s.sucursalId = v.sucursalId
JOIN rutaConductor rc ON v.vehiculoId = rc.vehiculoId
JOIN ruta AS r ON rc.rutaId = r.rutaId
JOIN envio AS env ON r.rutaId = env.rutaId
JOIN paquete AS p ON env.paqueteId = p.paqueteId
JOIN estado AS e ON p.estadoId = e.estadoId
ORDER BY s.nombre, e.descripcion, p.paqueteId;

+-----------------+-------------------+------------+
| sucursal        | estado            | idPaquete |
+-----------------+-------------------+------------+
| Sucursal Pekín  | Enviado           |          2 |
| Sucursal Roma   | Listo para enviar |          1 |
+-----------------+-------------------+------------+
```

**Explicación**: Para esta consulta que pide ordenar la tabla con un orden especifico se usa ORDER BY para ordear la tabla por nombre, luego descripcion y por último el Id del paquete.

---
<br>

## Caso de uso 6: Obtener información completa de un paquete y su historial de seguimiento

<br>

**Descripción**: Un administrador desea obtener la información completa de un paquete especifico y su historial de seguimiento

```sql
SELECT
    p.paqueteId,
    p.numeroSeguimiento,
    p.peso,
    p.dimensiones,
    p.contenido,
    p.valorDeclarado,
    p.tipoServicio,
    e.descripcion AS estadoActual,
    s.ubicacion,
    s.fechaHora
FROM paquete AS p
JOIN seguimiento AS s ON p.paqueteId = s.paqueteId
JOIN estado AS e ON s.estadoId = e.estadoId
WHERE p.paqueteId = 1; -- Id del paquete a buscar --
```

---

<br>

# Casos de uso Between, In y Not In

---

<br>

## Caso de uso 1: Obtener paquetes enviados dentro de un rango de fechas

<br>

**Descripción** Un administrador desea obtener todos los paquetes que fueron enviados dentro de un rango de fecha específico

```sql
SELECT 
    p.numeroSeguimiento AS 'Número de Seguimiento',
    p.peso AS 'Peso',
    p.dimensiones AS 'Dimensiones',
    p.contenido AS 'Contenido',
    p.valorDeclarado AS 'Valor Declarado',
    p.tipoServicio AS 'Tipo de Servicio',
    e.descripcion AS 'Estado',
    DATE_FORMAT(ev.fechaHora, '%Y-%m-%d %H:%i:%s') AS 'Fecha y Hora de Evento'
FROM 
    paquete AS p
JOIN 
    seguimiento AS ev ON p.paqueteId = ev.paqueteId
JOIN 
    estado AS e ON ev.estadoId = e.estadoId
WHERE 
    ev.fechaHora BETWEEN '2024-01-01 00:00:00' AND '2024-06-22 23:59:59';
```

---

<br>

## Caso de uso 2: Obtener paquetes con ciertos estados

<br>

**Descripción**: Un administrador desea obtener todos los paquetes que tienen ciertso estados específicos (por ejemplo, 'en tánsito' o 'entregado').

```sql
SELECT 
    p.numeroSeguimiento AS 'Número de Seguimiento',
    p.peso AS 'Peso',
    p.dimensiones AS 'Dimensiones',
    p.contenido AS 'Contenido',
    p.valorDeclarado AS 'Valor Declarado',
    p.tipoServicio AS 'Tipo de Servicio',
    e.descripcion AS 'Estado'
FROM 
    paquete AS p
JOIN 
    estado AS e ON p.estadoId = e.estadoId
WHERE 
    e.descripcion IN ('En tránsito internacional', 'Entregado parcialmente');
```

---

<br>

## Caso de uso 3: Obtener paquetes excluyendo ciertos estados

<br>

**Descripción**: Un administrador desea obtener todos los paquetes excluyendo aquellos que tienen ciertos estados específicos (por ejemplo, 'recibido' o 'retenido en aduana')

```sql
SELECT 
    p.numeroSeguimiento AS 'Número de Seguimiento',
    p.peso AS 'Peso',
    p.dimensiones AS 'Dimensiones',
    p.contenido AS 'Contenido',
    p.valorDeclarado AS 'Valor Declarado',
    p.tipoServicio AS 'Tipo de Servicio',
    e.descripcion AS 'Estado'
FROM 
    paquete AS p
JOIN 
    estado AS e ON p.estadoId = e.estadoId
WHERE 
    e.descripcion NOT IN ('Recibido', 'Retenido');
```

---

<br>

## Caso de uso 4: Obtener clientes con envíos realizados dentro de un rango de fechas

<br> 

**Descripción** Un administrador desea obtener todos los clientes que realizaron envíos dentro de un rango de fechas específico

```sql
SELECT DISTINCT 
    c.clienteId, 
    c.nombre, 
    c.email, 
    c.direccion
FROM cliente AS c
INNER JOIN envio AS e ON c.clienteId = e.clienteId
INNER JOIN paquete AS p ON e.paqueteId = p.paqueteId
WHERE e.fechaEnvio BETWEEN '2024-01-01' AND '2024-06-30';
```

---

<br>

## Caso de uso 5: Obtener conductores disponibles que no están asignados a ciertas rutas

<br> 

**Descripción**: Un administrador desea obtener todos los conductores que no están asignados a ciertas rutas específicas.

```sql
SELECT 
    c.conductorId, 
    c.nombre
FROM conductor AS c
LEFT JOIN rutaConductor AS rc ON c.conductorId = rc.conductorId AND rc.rutaId IN (1, 3, 5)
WHERE rc.conductorId IS NULL;

```
---

<br>

## Caso de uso 6: Obtener información de paquetes con valor declarado dentro de un rango específico

<br>

**Descripción**: Un administrador desea obtener todos los paquetes cuyo valor declarado está dentro de un rango específico.

```sql
SELECT 
    paqueteId, 
    numeroSeguimiento, 
    peso, 
    dimensiones, 
    contenido, 
    valorDeclarado, 
    tipoServicio, 
    estadoId
FROM paquete
WHERE valorDeclarado BETWEEN 50.00 AND 150.00;

```

---

<br>

## Caso de uso 7: Obtener auxiliares asignados a rutas específicas

<br>

**Descripción** Un administrador desea obtener todos los auxiliares de reparto que están asignados a ciertas rutas específicas

```sql
SELECT 
    a.auxiliarId, 
    a.nombre, 
    a.telefono, 
    r.descripcion AS ruta_asignada
FROM auxiliar a
JOIN rutaAuxiliar ra ON a.auxiliarId = ra.auxiliarId
JOIN ruta r ON ra.rutaId = r.rutaId
WHERE r.descripcion IN ('Ruta Toronto-Londres', 'Ruta Roma-Pekín', 'Ruta Sídney-Toronto');

```

---

<br>

## Caso de uso 8: Obtener envíos a destinos excluyendo ciertas ciudades

<br>

**Descripción**: Un administrador desea obtener todos los envíos cuyos destinos no están en ciertas ciudades específicas.

```sql
SELECT 
    e.envioId, 
    e.clienteId, 
    e.paqueteId,
    e.fechaEnvio, 
    e.destino, 
    r.descripcion AS ruta_asignada
FROM envio e
JOIN ruta r ON e.rutaId = r.rutaId
JOIN ciudad c ON e.destino = c.nombre
WHERE c.nombre NOT IN ('Toronto', 'Londres', 'Sídney');

```

---

<br>

## Caso de uso 9: Obtener seguimientos de paquetes en un rango de fechas

<br>

**Descripción**: Un administrador desea obtener todos los eventos de seguimiento de paquetes que ocurrieron dentro de un rango de fechas específico.

```sql
SELECT 
    s.seguimientoId, 
    s.paqueteId, 
    s.ubicacion, 
    s.fechaHora, 
    e.descripcion AS estado
FROM seguimiento s
JOIN estado e ON s.estadoId = e.estadoId
WHERE s.fechaHora BETWEEN '2024-01-01 00:00:00' AND '2024-6-21 23:59:59';

```

---

<br>

## Caso de uso 10: Obtener clientes que tienen ciertos tipos de paquetes

<br>

**Descripción** Un administrador desea obtener todos los clientes que tienen paquetes de ciertos tipos específicos (por ejemplo, 'nacional' o 'internacional')

```sql
SELECT DISTINCT 
    c.clienteId, 
    c.nombre, 
    c.email,
     c.direccion
FROM cliente c
JOIN envio e ON c.clienteId = e.clienteId
JOIN paquete p ON e.paqueteId = p.paqueteId
WHERE p.tipoServicio IN ('nacional', 'internacional');

```

-----

<p style="text-align:center;">
    <h1> FIN DEL EJERCICIO DE BASE DE DATOS </h1>
</p>

