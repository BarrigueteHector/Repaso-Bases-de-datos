# Explicación del código

## CREAR UNA TABLA

Para crear una tabla se utiliza la instrucción ``CREATE TABLE Nombre``, sustituyendo **Nombre** por el nombre que tendrá la tabla, seguido de todas las columnas que van a componer a la tabla. 

```
CREATE TABLE NombreTabla(
  nombreColumna tipoDato -- Debe agregarse una coma al final de la linea si hay más de una columna
);
```

Las columnas pueden ser de tipo:
- Varchar (string), se debe indicar el tamaño maximo que va a tener el columna, es posible modificarlo después de la creación de la tabla.
- char
- int
- Date

Hay más tipos de datos, pero los principales y más basicos son esos. 

A continuación un ejemplo de como se construye una tabla:

```
CREATE TABLE TablaEjemplo(
  columnaUno varchar(5), -- Solo almacenará strings de 5 o menos caracteres
  columnaDos char,
  columnaTres int,
  columnaCuatro Date
);
```
> Esta tabla se usará para explicar las siguientes instrucciones

Como se mencionó anteriormente, para una columna de tipo ``varchar`` se debe especificar el tamaño que tendrá. Esto es importante ya que si se ingresa un dato que supera dicho tamaño puede afectar nuestra trabajo, puede ocurrir uno de dos escenaros:
1. Se rechaza el registro que se iba a insertar (**Esto ocurrio en el archivo ``.sql``**)
2. Se inserta el registro, pero el dato ingresado se recorta al tamaño de la columna

Aunque se puede modificar el tamaño de la columna después de que se creó la tabla, es preferible asignar un tamaño adecuado para evitar este tipo de problemas.

## INSERTAR REGISTROS

Para insertar registros en una tabla se usa la instrucción ``INSERT``, indicando la tabla, columna de la tabla y los valores que serán asignados.

Una instrucción ``INSERT`` tiene la siguiente estructura:

```
--          NombreTabla  (            columnasDeLaTabla             )        (      datosParaIngresar      )
INSERT INTO TablaEjemplo (columnaUno, columnaDos, columnaTres, columnaCuatro) VALUES ('dato', 'a', 12, '2025-04-18');
```

Se puede omitr una columna siempre y cuando tambien se omita de los datos para ingresar, por ejemplo si quisieramos omitir ``columnaUno``:
> Se puede omitir un columna si cuando se creó la tabla se indicó que dicho columna no es obligatorio, esto se explicará en los siguientes apuntes

```
INSERT INTO TablaEjemplo (columnaDos, columnaTres, columnaCuatro) VALUES ('a', 15, '2025-05-19');
```

Cuando hagamos una consulta, el dato de la columna aparecerá como ``NULL`` debido a que no tiene un valor asignado cuando se hizo el ``INSERT``.

Para explicar la parte de **Consultas** agregaremos más registros, los cuales serán los siguientes:

```
INSERT INTO TablaEjemplo (columnaUno, columnaDos, columnaTres, columnaCuatro) VALUES ('dato3', 'b', 99, '2025-02-18');
INSERT INTO TablaEjemplo (columnaUno, columnaDos, columnaTres, columnaCuatro) VALUES ('dato4', 'a', 1, '2025-03-18');
INSERT INTO TablaEjemplo (columnaUno, columnaDos, columnaTres, columnaCuatro) VALUES ('dato5', 'c', 10, '2025-04-18');
INSERT INTO TablaEjemplo (columnaUno, columnaDos, columnaTres, columnaCuatro) VALUES ('dato6', 21, '2025-01-18');
```


## CONSULTAS

Para revisar el contenido de una tabla se utiliza la instrucción ``SELECT``, la cual tiene la siguiente estructura:

``SELECT columnas FROM tabla``

Sustituyendo **Columnas** por las columnas que deseamos ver y **Tabla** por la tabla que contiene dichas columnas. Si quisieramos ver todas las columnas de la tabla, únicamente sustituimos **Columnas** por un asterisco (*).

Siguiendo con el ejemplo:

Si querremos ver ``columnaUno`` y ``columnaDos`` la instrucción debe ser:

```
SELECT columnaUno, columnaDos FROM TablaEjemplo;
```

Obteniendo como resultado:

| columnaUno | columnaDos |
|----------|----------|
| dato     | a        |
| NULL     | a        |
| dato3    | b        |
| dato4    | a        |
| dato5    | c        |
| dato6    | NULL     |

Si quisieramos ver todos los registros entonces la instrucción sería:

```
SELECT * FROM TablaEjemplo;
```

| columnaUno | columnaDos | columnaTres | columnaCuatro |
|----------|----------|-----------|-------------|
| dato     | a        | 12        | 2025-04-18  |
| NULL     | a        | 15        | 2025-05-19  |
| dato3    | b        | 99        | 2025-02-18  |
| dato4    | a        | 1         | 2025-03-19  |
| dato5    | c        | 10        | 2025-04-18  |
| dato6    | NULL     | 21        | 2025-01-19  |

Podemos limitar el número de consultas que deseamos obtener, esto se logra añadiendo un ``WHERE`` al final del ``SELECT``:

```
SELECT columnas FROM tabla;
WHERE condicion;
```

Con esto podemos obtener aquellos registros que cumplen ciertas características. Por ejemplo:

Si queremos ver todos los registros que tienen una ``a`` en ``columnaDos``, la consulta debe ser:

```
SELECT * FROM TablaEjemplo
WHERE columnaDos='a';
```

Teniendo como resultado:

| columnaUno | columnaDos | columnaTres | columnaCuatro |
|----------|----------|-----------|-------------|
| dato     | a        | 12        | 2025-04-18  |
| NULL     | a        | 15        | 2025-05-19  |
| dato4    | a        | 1         | 2025-03-19  |

Si queremos ver los registros que en ``columnaTres`` tienen un valor mayor a 20:

```
SELECT * FROM TablaEjemplo
WHERE columnaTres > 20;
```

| columnaUno | columnaDos | columnaTres | columnaCuatro |
|----------|----------|-----------|-------------|
| dato3    | b        | 99        | 2025-02-18  |
| dato6    | NULL     | 21        | 2025-01-19  |

Si queremos ver los registros que son antes del primero de abril:

```
SELECT * FROM TablaEjemplo
WHERE columnaCuatro < 2025-04-01;
```

| columnaUno | columnaDos | columnaTres | columnaCuatro |
|----------|----------|-----------|-------------|
| dato3    | b        | 99        | 2025-02-18  |
| dato4    | a        | 1         | 2025-03-19  |
| dato6    | NULL     | 21        | 2025-01-19  |

En caso de que queramos los que son despues del primero de abril:

```
SELECT * FROM TablaEjemplo
WHERE columnaCuatro > 2025-04-01;
```

| columnaUno | columnaDos | columnaTres | columnaCuatro |
|----------|----------|-----------|-------------|
| dato     | a        | 12        | 2025-04-18  |
| NULL     | a        | 15        | 2025-05-19  |
| dato5    | c        | 10        | 2025-04-18  |

Si quisieramos los del 18 de abril:

```
SELECT * FROM TablaEjemplo
WHERE columnaCuatro = 2025-04-18;
```

| columnaUno | columnaDos | columnaTres | columnaCuatro |
|----------|----------|-----------|-------------|
| dato     | a        | 12        | 2025-04-18  |
| dato5    | c        | 10        | 2025-04-18  |

También podemos obtener el máximo y el mínimo de una columna:

```
SELECT MAX(columnaTres) FROM TablaEjemplo;
```

``99``

```
SELECT MIN(columnaTres) FROM TablaEjemplo;
```

``1``

## Actualización de registros

Si queremos actualizar un registro debemos utilizar la instrucción ``UPDATE``:

```
UPDATE NombreTabla SET columna = NuevoDato
WHERE condición;
```

Al igual que en las consultas, se le puede agregar un ```WHERE``, pero primero hay que entender como funciona esta instrucción:

- Si no agregamos el ``WHERE`` entonces actualizará todos los registros
- Si agregamos el ``WHERE`` solo actualizará aquellos registros que cumplan con la condición

Por ejemplo, si queremos actualizar todos los registros en ``columnaDos`` para que tengan el valor ``x``:

```
UPDATE TablaEjemplo SET columnaDos = 'x';
```

Revisamos la tabla y vemos que ahora todos los registros tienen una ``x`` en ``columnaDos``:

| columnaUno | columnaDos | columnaTres | columnaCuatro |
|----------|----------|-----------|-------------|
| dato     | x        | 12        | 2025-04-18  |
| NULL     | x        | 15        | 2025-05-19  |
| dato3    | x        | 99        | 2025-02-18  |
| dato4    | x        | 1         | 2025-03-19  |
| dato5    | x        | 10        | 2025-04-18  |
| dato6    | x        | 21        | 2025-01-19  |

Ahora vamos a cambiarlos a ``o``, pero solo para aquellos que en ``columnaTres`` tengan un valor mayor a 20.

```
UPDATE TablaEjemplo SET columnaDos = 'o'
WHERE columnaTres > 20;
```

Revisamos la tabla y vemos que ahora solo aquellos registros con un valor mayor a 20 en ``columnaTres`` tienen una ``o`` en ``columnaDos``:

| columnaUno | columnaDos | columnaTres | columnaCuatro |
|----------|----------|-----------|-------------|
| dato     | x        | 12        | 2025-04-18  |
| NULL     | x        | 15        | 2025-05-19  |
| dato3    | o        | 99        | 2025-02-18  |
| dato4    | x        | 1         | 2025-03-19  |
| dato5    | x        | 10        | 2025-04-18  |
| dato6    | o        | 21        | 2025-01-19  |
