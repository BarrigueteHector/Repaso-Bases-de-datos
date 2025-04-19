# Explicación del código

## CREAR UNA TABLA

Para crear una tabla se utiliza la instrucción ``CREATE TABLE Nombre``, sustituyendo **Nombre** por el nombre que tendrá la tabla, seguido de todos los campos/columnas que van a componer a la tabla. Estos campos pueden ser de tipo:
- Varchar (string), en este tipo de debe indicar el tamaño maximo que va a tener el campo, es posible modificarlo.
- char
- int
- Date

Hay más tipos de datos, pero los principales y más basicos son esos.

A continuación un ejemplo de como se construye una tabla:

```
CREATE TABLE TablaEjemplo(
  campoUno varchar(tamaño)
  campoDos chat,
  campoTres int,
  campoCuatro Date
);
```
> Esta tabla se usará para explicar las siguientes instrucciones en este documento

Se pueden tener tantos campos se requieran y de todos los tipos.

Como se mencionó anteriormente, para un campo de tipo ``varchar`` se debe especificar el tamaño que tendrá. Esto es importante ya que si se ingresa un dato que supera dicho tamaño puede afectar nuestra trabajo, puede ocurrir uno de dos escenaros:
1. Se rechaza el registro que se iba a insertar (**Esto ocurrio en el ejemplo**)
2. Se inserta el registro, pero el dato ingresado se recorta al tamaño del campo

Aunque se puede modificar el tamaño de un campo después de que se creó la tabla, es preferible asignar un tamaño adecuado para evitar este tipo de problemas.

## INSERTAR REGISTROS

Para insertar registros en una tabla se usa la instrucción ``INSERT INTO``, indicando la tabla, campos de la tabla y los valos que serán asignados.

Una instrucción ``INSERT`` tiene la siguiente estructura:

``INSERT INTO TablaEjemplo (campoUno, campoDos, campoTres, campoCuatro) VALUES ('dato', 'a', 12, '2025-04-18')``

Se puede omitr un campo siempre y cuando tambien se omita de la lista de valores, por ejemplo si quisieramos omitir ``campoUno``:
> Se puede omitir un campo siempre y cuando se haya indicado en la tabla que no es obligatorio, esto se explicará en los siguientes apuntes

``INSERT INTO TablaEjemplo (campoDos, campoTres, campoCuatro) VALUES ('b', 15, '2025-05-19')``

El campo que no recibió ningun valor aparecerá como ``NULL``.

Para explicar la parte de **Consultas** de mejor manera agregaremos más registros, los cuales serán los siguientes:

``INSERT INTO TablaEjemplo (campoUno, campoDos, campoTres, campoCuatro) VALUES ('dato3', 'c', 99, '2025-02-18')``
``INSERT INTO TablaEjemplo (campoUno, campoDos, campoTres, campoCuatro) VALUES ('dato4', 'd', 1, '2025-03-18')``
``INSERT INTO TablaEjemplo (campoUno, campoDos, campoTres, campoCuatro) VALUES ('dato5', 'e', 10, '2025-04-18')``
``INSERT INTO TablaEjemplo (campoUno, campoDos, campoTres, campoCuatro) VALUES ('dato6', 21, '2025-01-18')``


## CONSULTAS

Para revisar el contenido de una tabla se utiliza la instrucción ``SELECT``, la cual tiene la siguiente estructura:

``SELECT Campos FROM Tabla``

Sustituyendo **Campos** por los campos que deseamos ver y **Tabla** por la tabla que contiene dichos campos. Si quisieramos ver todas las columnas de la tabla, únicamente sustituimos **Campos** por un asterisco (*)

Siguiendo con el ejemplo:

Si querremos ver ``CampoUno`` y ``CampoDos`` la instrucción debe ser:

```
SELECT CampoUno, CampoDos FROM TablaEjemplo;
```

Obteniendo como resultado:

| CampoUno | CampoDos |
|----------|----------|
| dato     | a        |
| NULL     | b        |
| dato3    | c        |
| dato4    | d        |
| dato5    | e        |
| dato6    | NULL     |

Si quisieramos ver todos los registros entonces la instrucción sería:

```
SELECT * FROM TablaEjemplo
```

| CampoUno | CampoDos | CampoTres | CampoCuatro |
|----------|----------|-----------|-------------|
| dato     | a        | 12        | 2025-04-18  |
| NULL     | b        | 15        | 2025-05-19  |
| dato3    | c        | 99        | 2025-02-18  |
| dato4    | d        | 1         | 2025-03-19  |
| dato5    | e        | 10        | 2025-04-18  |
| dato6    | NULL     | 21        | 2025-01-19  |


