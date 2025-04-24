# Explicación del código

## Herramientas utilizadas

SQL Server 

## Código de ejemplo

[Código](https://github.com/BarrigueteHector/Repaso-Bases-de-datos/blob/main/Apuntes%20%231/SQLQuery1.sql) 📄

## Instrucciones de Definición de Datos (DDL)

### Crear tabla

```
CREATE TABLE nombreTabla(
  columnaUno tipoDato,
  columnaDos tipoDato,
  ...
  columnaN tipoDato
);
```

### Eliminar tabla

```
DROP TABLE nombreTabla;
```

### Actualizar tabla (agregar una columna)
```
ALTER TABLE nombreTabla ADD nuevaColumna tipoDato;
```


### Actualizar tabla (eliminar una columna)

```
ALTER TABLE nombreTabla DROP COLUMN nombreColumna;
```

### Actualizar tabla (cambiar nombre a una columna)

```
EXEC sp_rename 'nombreTabla.nombreColumna', 'nuevoNombre', 'COLUMN';
```

### Actualizar tabla (cambiar tipo de dato a una columna)

```
ALTER TABLE nombreTabla ALTER COLUMN nombreColumna nuevoTipo;
```

### Caracteristicas de la tabla (muestra información de la estructura de la tabla)

```
EXEC sp_help 'Prueba';
```

## Instrucciones de Manipulación de Datos (DML)

### Insertar datos a la tabla

```
INSERT INTO nomnbreTabla (columnaUno, columnaDos, ... , columnaN) VALUES (datoUno, datoDos, ... , datoN);
```

### Consultar el contenido de una tabla

Solo ver ciertas columnas:
```
SELECT columnaUno, columnaDos, ..., columnaN FROM nombreTabla;
```

Ver todas las columnas:
```
SELECT * FROM nombreTabla;
```

Ver solo ciertos registros:
```
SELECT columnaUno, columnaDos, ..., columnaN FROM nombreTabla
WHERE condicion;
```
> La condición puede ser que una columna tenga un valor en especifico o esté en un rango de valores para mostrar el registro

### Actualizar registros
Actualizar todos los registros:
```
UPDATE nombreTabla SET columna = NuevoDato;
```

Actualizar solo ciertos registros:
```
UPDATE nombreTabla SET columna = NuevoDato
WHERE condición;
```
> La condición puede ser que una columna tenga un valor en especifico o esté en un rango de valores para actualizar el registro

### Eliminar registros
Eliminar todos los registros:
```
DELETE FROM nombreTabla;
```

Eliminar solo ciertos registros:
```
DELETE FROM nombreTabla
WHERE condicion;
```
> La condición puede ser que una columna tenga un valor en especifico o esté en un rango de valores para eliminar el registro

## Instrucciones de Control de Transacciones

Permite guardar todas las acciones realizadas sobre una base de datos (DDL y DML)
```
COMMIT;
```
