-- funciones de agrupamiento

-- Hemos visto que SQLite tiene una función que nos permite contar registros.

-- Existe además de la función count las funciones sum, min, max y avg. Todas estas funciones retornan "null" si ningún registro cumple con la condición del "where", excepto "count" que en tal caso retorna cero.

-- El tipo de dato del campo determina las funciones que se pueden emplear con ellas.

-- Las relaciones entre las funciones de agrupamiento y los tipos de datos es la siguiente:

-- - count: se puede emplear con cualquier tipo de dato.

-- - min y max: con cualquier tipo de dato.

-- - sum y avg: sólo en campos de tipo numérico.

-- La función "sum()" retorna la suma de los valores que contiene el campo especificado. Si queremos saber la cantidad total de libros que tenemos disponibles para la venta, debemos sumar todos los valores del campo "cantidad":

 select sum(cantidad)
  from libros;
-- Para averiguar el valor máximo o mínimo de un campo usamos las funciones "max()" y "min()" respectivamente.
-- Queremos saber cuál es el mayor precio de todos los libros:

 select max(precio)
  from libros;
-- Entonces, dentro del paréntesis de la función colocamos el nombre del campo del cuál queremos el máximo valor.

-- La función "avg()" retorna el valor promedio de los valores del campo especificado. Queremos saber el promedio del precio de los libros referentes a "PHP":

 select avg(precio)
  from libros
  where titulo like '%PHP%';
-- Ahora podemos entender porque estas funciones se denominan "funciones de agrupamiento", porque operan sobre conjuntos de registros, no con datos individuales.

-- Tratamiento de los valores nulos:

-- Si realiza una consulta con la función "count" de un campo que contiene 18 registros, 2 de los cuales contienen valor nulo, el resultado devuelve un total de 16 filas porque no considera aquellos con valor nulo.

-- Todas las funciones de agregado, excepto "count(*)", excluye los valores nulos de los campos. "count(*)" cuenta todos los registros, incluidos los que contienen "null".

-- Problema resuelto
-- Trabajar con la tabla "peliculas".

drop table if exists peliculas;
-- Crear la tabla "peliculas" con la siguiente estructura:

create table peliculas (
	codigo integer primary key,
	titulo text,
	actor text,
	duracion integer
);
-- Ingresar los siguientes registros:

 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la piedra filosofal','Daniel R.',180);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la camara secreta','Daniel R.',190);
 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible 2','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('Mujer bonita','Richard Gere',120);
 insert into peliculas (titulo,actor,duracion)
  values('Tootsie','D. Hoffman',90);
 insert into peliculas (titulo,actor,duracion)
  values('Un oso rojo','Julio Chavez',100);
 insert into peliculas (titulo,actor,duracion)
  values('Elsa y Fred','China Zorrilla',110);  
 insert into peliculas (titulo,actor,duracion)
  values('Mrs. Johns','Richard Gere',180);
-- Mostrar el valor de duración más grande:

select max(duracion) from peliculas;
-- Mostrar el promedio de duración de las películas:

select avg(duracion) from peliculas;
-- Contar la cantidad de películas que comiencen con la cadena "Harry Potter":

select count(*)
  from peliculas
  where titulo like 'Harry Potter%'; 
-- Un socio alquiló todas las películas en las cuales trabaja "Richard Gere", quiere saber el total de minutos que duran todas sus películas:

select sum(duracion)
  from peliculas
  where actor='Richard Gere';  
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

-- Ingrese los siguientes registros:

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
-- Muestre el valor del auto más caro y más barato.

-- Muestre el valor del auto más caro de 1990.

-- Muestre el promedio de los precios de los autos "Fiat 128".

-- Calcule el valor en dinero de todos los autos marca "Renault" con modelos menores a "1995".

-- Intente calcular el precio mayor de los autos con modelo 1800.

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
  values('BV543TR', 'Fiat 128', '1975', 20000); 
  
 select max(precio), min(precio)
  from autos;  

 select max(precio)
  from autos
  where modelo='1990';
  
 select avg(precio)
  from autos
  where marca='Fiat 128';  

select sum(precio)  
  from autos
  where marca like '%Renault%' and
  modelo<1995;  
  
 select max(precio)
  from autos
  where modelo='1800';