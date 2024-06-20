
# Ejercicio de creación de base de datos y consultas

<p style="text-align:center;">
    <img src="./gestionLogisticaDB.png" />
</p>

<br>
<br>
<br>
<br>

---

# Caso de uso 1: Registrar un Nuevo País

<br>

**Descripción**: Un administrador desea agregar un nuevo país a la base de 

```sql

INSERT INTO pais (nombre) VALUES ('colombia');

```

<br>
<br>

-------


# Caso de uso 2: Registrar una nueva ciudad

<br>

**Descripción**: Un administrador desea agregar una nueva ciudad asociada a un país existente

```sql

INSERT INTO ciudad (nombre,paisId) VALUES ('bucaramanga',2);

```

---

# Caso de uso 3: Registrar una nueva sucursal

<br>

**Descripción**: Un administrador desea agregar una nueva sucursal asociada a una ciudad existente

```sql

INSERT INTO sucursal (nombre,direccion,ciudadId) VALUES ('principal','calle 52 #20-32',3);


```
