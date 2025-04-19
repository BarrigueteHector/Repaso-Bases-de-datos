-- ********** CREATE TABLE **********
-- Crear una tabla con el nombre 'Prueba'
CREATE TABLE Prueba(
	-- Nombre de la columna, tipo y tamaño (opcinal)
	nombre varchar(5), -- limitado a 5 caracteres
	apellido varchar(10), -- limitado a 10 caracteres
	edad int,
	estatura float,
	genero char,
	fecha date
);

-- Consulta de la tabla, resultado: no debe mostrarse ningun registro
-- * = todas las columnas
SELECT * FROM Prueba;

-- ********** INSERT **********
-- Inserción de registros a la tabla
INSERT INTO Prueba (nombre, apellido, edad, estatura, genero, fecha) VALUES ('Alex', 'Ramirez', 19, 1.60, 'F', '2025-04-18');

-- Nombre esta limitado a 5 caracteres, no se agregara, se tienen que quitar los caracteres extra
-- INSERT INTO Prueba (nombre, apellido, edad, estatura, genero, fecha) VALUES ('Fernanda', 'Fernandez', 30, 1.79, 'F', '2025-04-18');
INSERT INTO Prueba (nombre, apellido, edad, estatura, genero, fecha) VALUES ('Fer', 'Fernandez', 30, 1.79, 'F', '2025-04-18');

-- Se puede omitir la insercion de un dato, en este caso se omite el campo genero
INSERT INTO Prueba (nombre, apellido, edad, estatura, fecha) VALUES ('Jess', 'Ochoa', 1, 0.7, '2025-04-18'); 

-- Apellido esta limitado a 10 caracteres, no se agregara, se tienen que quitar los caracteres extra
-- INSERT INTO Prueba (nombre, apellido, edad, estatura, genero, fecha) VALUES ('Carlo', 'Vasconcelos', 15, 1.74, 'M', '2025-02-05'); 
INSERT INTO Prueba (nombre, apellido, edad, estatura, genero, fecha) VALUES ('Carlo', 'Vasconcelo', 15, 1.74, 'M', '2025-02-05'); 

-- edad y estatura no tienen un limite
INSERT INTO Prueba (nombre, apellido, edad, estatura, genero, fecha) VALUES ('Javi', 'Badillo', 100, 1.9987, 'N', '2025-04-8');

-- Si se omite un campo en la lista de columnas (apellido), pero se intenta agregar, esto mandara un error y no se podra agregar a la tabla
--INSERT INTO Prueba (nombre, edad, estatura, genero, fecha) VALUES ('Luis', 'Ramirez', 23, 1.89, 'H', '2025-01-12'); 
-- Solo se pueden agregar los datos que esten colocados en la lista de columnas
INSERT INTO Prueba (nombre, edad, estatura, genero, fecha) VALUES ('Luis', 23, 1.89, 'M', '2025-01-12'); 

-- ********** SELECT **********
-- Consulta de la tabla, resultado: se deben mostrar los 6 registros con todos sus campos
SELECT * FROM Prueba;

-- Se pueden hacer distintas consultas:
-- Muestra solo el nombre
SELECT nombre FROM Prueba;

-- Muestra solo el nombre y la edad
SELECT nombre, edad FROM Prueba;

-- Y se puede agrega una restriccion para limitar los resultados
-- Muestra todos los registros
SELECT * FROM Prueba
-- donde la edad sea mayor a 0 y menor a 18
WHERE edad > 0 AND edad < 18;

-- Muestra todos los registros
SELECT * FROM Prueba
-- donde en la columna genero tenga una M
WHERE genero = 'M';

-- Muestra todos los registros
SELECT * FROM Prueba
-- Que sean antes del 18 de abril de 2025
WHERE fecha < '2025-04-18';

-- Muestra todos los registros 
SELECT * FROM Prueba
-- Que sean despues del primero de abril de 2025
WHERE fecha > '2025-04-01';

-- Muestra todos los registros 
SELECT * FROM Prueba
-- Que sean del 18 de abril de 2025
WHERE fecha = '2025-04-18';

-- Hay registros que tienen campos vacios o nulos (NULL), para encontrarlos ...
-- Muestra todos los registros
SELECT * FROM Prueba
-- donde el apellido sea NULL
WHERE apellido is NULL;

-- Muestra todos los registros
SELECT * FROM Prueba
-- que alguno de sus campos sea NULL
WHERE nombre is NULL OR apellido is NULL OR edad is NULL OR estatura is NULL OR genero is NULL OR fecha is NULL;

-- Muestra el registro que tiene el valor maximo en edad
SELECT MAX(edad) FROM Prueba;

-- Muestra el registo que tiene el valor minimo en edad
SELECT MIN(edad) FROM Prueba;

-- ********** UPDATE **********
-- Se puede actualizar un registro, si es un registro en especifico la instruccion debe llevar un WHERE, de no ser asi todos los registros se actualizarian
UPDATE Prueba SET apellido = 'Calvillo'
WHERE nombre = 'Luis';
-- Se recomienda que la condicion sea con la llave primaria (aunque aqui no la hay) si se va a actualizar un registro en especifico

-- Ahora todos los registros tienen un apellido
SELECT nombre, apellido FROM Prueba;

-- La siguiente instruccion actualizara el campo genero de todos los registros porque no tiene una condicion
UPDATE Prueba SET genero = 'F';

-- Ahora todos los registros tienen una 'F' en genero
SELECT genero FROM Prueba;

-- ********** DELETE **********
-- Para eliminar registros, al igual que con UPDATE, se utiliza WHERE para eliminar registros en especifico, si no se usa se eliminaran todos los registros
-- Se eliminaran los registros que en el campo edad tengan un valor menor a 18
DELETE FROM Prueba
WHERE edad < 18;

-- Ahora solo hay registros que en edad tienen un valor mayor o igual a 18
SELECT * FROM Prueba;

-- Elimina todos los registros
DELETE FROM Prueba;

-- La tabla ya no tiene registros
SELECT * FROM Prueba;

-- ********** DROP TABLE **********
-- Eliminar la tabla
DROP TABLE Prueba;
