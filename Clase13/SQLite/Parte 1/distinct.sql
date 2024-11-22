-- distinct

-- Con la cláusula "distinct" se especifica que los registros con ciertos datos duplicados sean obviadas en el resultado. Por ejemplo, queremos conocer todos los autores de los cuales tenemos libros, si utilizamos esta sentencia:

 select autor from libros;
-- Aparecen repetidos. Para obtener la lista de autores sin repetición usamos:

 select distinct autor from libros;
-- También podemos tipear:

 select autor from libros
  group by autor;
-- Note que en los tres casos anteriores aparece "null" como un valor para "autor"· Si sólo queremos la lista de autores conocidos, es decir, no queremos incluir "null" en la lista, podemos utilizar la sentencia siguiente:

 select distinct autor from libros
  where autor is not null;
-- Para contar los distintos autores, sin considerar el valor "null" usamos:

 select count(distinct autor)
  from libros;
-- Note que si contamos los autores sin "distinct", no incluirá los valores "null" pero si los repetidos:

 select count(autor)
  from libros;
-- Esta sentencia cuenta los registros que tienen autor.

-- Podemos combinarla con "where". Por ejemplo, queremos conocer los distintos autores de la editorial "Planeta":

 select distinct autor from libros
  where editorial='Planeta';
-- También puede utilizarse con "group by" para contar los diferentes autores por editorial:

 select editorial, count(distinct autor)
  from libros
  group by editorial;
-- La cláusula "distinct" afecta a todos los campos presentados. Para mostrar los títulos y editoriales de los libros sin repetir títulos ni editoriales, usamos:

 select distinct titulo,editorial
  from libros
  order by titulo;
-- Note que los registros no están duplicados, aparecen títulos iguales pero con editorial diferente, cada registro es diferente.

-- Entonces, "distinct" elimina registros duplicados.

-- Problema resuelto
-- Una empresa tiene registrados sus clientes en una tabla llamada "clientes".
-- Borrar la tabla "clientes" si existe.

drop table if exists clientes;
-- Crear la tabla con la siguiente estructura:

create table clientes (
  codigo integer primary key,
  nombre text,
  domicilio text,
  ciudad text,
  provincia text,
  telefono text
 );
-- Insertar los siguientes registros:

 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Lopez Marcos', 'Colon 111', 'Cordoba','Cordoba',null);
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Perez Ana', 'San Martin 222', 'Cruz del Eje','Cordoba','4578585');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Garcia Juan', 'Rivadavia 333', 'Villa Maria','Cordoba','4578445');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Perez Luis', 'Sarmiento 444', 'Rosario','Santa Fe',null);
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono) 
  values ('Pereyra Lucas', 'San Martin 555', 'Cruz del Eje','Cordoba','4253685');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Gomez Ines', 'San Martin 666', 'Santa Fe','Santa Fe','0345252525');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Torres Fabiola', 'Alem 777', 'Villa del Rosario','Cordoba','4554455');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Lopez Carlos', 'Irigoyen 888', 'Cruz del Eje','Cordoba',null);
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Ramos Betina', 'San Martin 999', 'Cordoba','Cordoba','4223366');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Lopez Lucas', 'San Martin 1010', 'Posadas','Misiones','0457858745'); 
-- Obtener las provincias sin repetir:

 select distinct provincia from clientes;
-- Contar las distintas provincias:

 select count(distinct provincia) as cantidad
  from clientes; 
-- Identificar los nombres de las ciudades sin repetir:

 select distinct ciudad from clientes;
-- Obtener la cantidad de ciudades distintas:

select count(distinct ciudad) from clientes;
-- Combinar con "where" para obtener las distintas ciudades de la provincia de Cordoba:

 select distinct ciudad from clientes
  where provincia='Cordoba';
-- Contar las distintas ciudades de cada provincia empleando "group by"

 select provincia,count(distinct ciudad)
  from clientes
  group by provincia;
-- Problema propuesto
-- Una concesionaria de autos vende autos usados y almacena la información en una tabla llamada "autos".

-- Borrar la tabla "autos" si existe

-- Crear la tabla "autos" con la siguiente estructura:

 create table autos(
	patente text primary key,
	marca text,
	modelo integer,
	precio real
 );
-- Insertar esta lista de datos:

 insert into autos(patente, marca, modelo, precio)
  values('AC123FG', 'Fiat 128', 1970, 15000);
 insert into autos(patente, marca, modelo, precio)
  values('AC234GG', 'Renault 11', 1980, 40000);
 insert into autos(patente, marca, modelo, precio)
  values('CD333QQ', 'Peugeot 505', 1990, 80000);
 insert into autos(patente, marca, modelo, precio)
  values('GD123TY', 'Renault Clio', 1990, 70000);
 insert into autos(patente, marca, modelo, precio)
  values('CC333MG', 'Renault Megane', 1998, 95000);
 insert into autos(patente, marca, modelo, precio)
  values('BV543TR', 'Fiat 128', '1975', 20000); 
-- Muestre las distintas marcas de autos disponibles.

-- Muestre la cantidad de autos por marca, de diferentes modelos.

-- Muestre los distintos modelos de autos disponibles.

drop table if exists autos;

create table autos(
	patente text primary key,
	marca text,
	modelo integer,
	precio real
);

 insert into autos(patente, marca, modelo, precio)
  values('AC123FG', 'Fiat 128', 1970, 15000);
 insert into autos(patente, marca, modelo, precio)
  values('AC234GG', 'Renault 11', 1980, 40000);
 insert into autos(patente, marca, modelo, precio)
  values('CD333QQ', 'Peugeot 505', 1990, 80000);
 insert into autos(patente, marca, modelo, precio)
  values('GD123TY', 'Renault Clio', 1990, 70000);
 insert into autos(patente, marca, modelo, precio)
  values('CC333MG', 'Renault Megane', 1998, 95000);
 insert into autos(patente, marca, modelo, precio)
  values('AB345GH', 'Renault Megane', 1995, 67000);  
 insert into autos(patente, marca, modelo, precio)
  values('BV543TR', 'Fiat 128', '1975', 20000); 
  
select * from autos;  

select distinct marca from autos;

select marca, count(distinct modelo)
  from autos
  group by marca;
  
select distinct modelo from autos;  