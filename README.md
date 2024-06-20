
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

-------


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

**Explicación**: Se inserta primero un tipo de documento en la tabla de tipo de documentos que hará referencia al tipo de DNI con el que se registra al cliente y luego se registra al cliente mandando el id del tipo de documento con el que se registra.

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
    envioId,
    clienteId AS 'enviado por',
    paqueteId,
    fechaEnvio,
    destino,
    rutaId AS 'ruta',
    sucursalId AS 'sucursal' 
FROM envio;

+---------+-------------+-----------+---------------------+---------+------+----------+
| envioId | enviado por | paqueteId | fechaEnvio          | destino | ruta | sucursal |
+---------+-------------+-----------+---------------------+---------+------+----------+
|       3 | 789123456   |         1 | 2024-06-20 12:29:28 | Roma    |    3 |        3 |
|       4 | 456789123   |         2 | 2024-06-20 12:29:28 | Pekín   |    4 |        4 |
+---------+-------------+-----------+---------------------+---------+------+----------+

```

>**Explicación**: Para esta consulta se seleccionan