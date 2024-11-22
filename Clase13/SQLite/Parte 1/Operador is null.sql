-- Operador is null

-- Hemos aprendido los operadores relacionales:

-- "=" (igual)
-- "<>" (distinto)
-- ">" (mayor)
-- "<" (menor)
-- ">=" (mayor o igual)
-- "<=" (menor o igual)
-- Existen otro operador que podemos utilizar en una condición: "is null".

-- Se emplea el operador "is null" para recuperar los registros en los cuales esté almacenado el valor "null" en un campo específico:

 select * from libros
  where editorial is null;
-- Para obtener los registros que no contiene "null", se puede emplear "is not null", esto mostrará los registros con valores conocidos:

select * from libros where precio is not null;  
-- Problema resuelto
-- Trabajar con la tabla "libros".

drop table if exists libros;
-- Creamos la tabla:

create table libros(
	codigo integer primary key,
	titulo text,
	autor text, 
	editorial text,
	precio real
);
-- Ingresamos algunos registros:

 insert into libros (titulo, autor, editorial, precio)
  values('El aleph', 'Borges', 'Emece', null);
 insert into libros (titulo, autor, editorial, precio)
  values('Antología poética', 'Borges', 'Planeta', 39.50);
 insert into libros (titulo, autor, editorial, precio)
  values('Java en 10 minutos', 'Mario Molina', 'Planeta', 50.50);
 insert into libros (titulo, autor, editorial, precio)
  values('Alicia en el pais de las maravillas', 'Lewis Carroll', 'Emece', 19.90);
 insert into libros (titulo, autor, editorial, precio)
  values('Martin Fierro', 'Jose Hernandez', 'Emece', 25.90);
 insert into libros (titulo, autor, editorial, precio)
  values('Martin Fierro', 'Jose Hernandez', 'Paidos', 16.80);
 insert into libros (titulo, autor, editorial, precio)
  values('Aprenda PHP', 'Mario Molina', 'Emece', 19.50);
 insert into libros (titulo, autor, editorial, precio)
  values('Cervantes y el quijote','Borges', 'Paidos', 18.40);
-- Recuperamos los registros en los cuales esté almacenado el valor "null" en el campo "precio":

select * from libros where precio is null;  

-- Seleccionamos los libros que no contiene "null" en "precio":

select * from libros where precio is not null;  
-- Problema propuesto
-- Trabajamos con la tabla "peliculas".

-- Borrar la tabla "peliculas" si existe

-- Crear la tabla peliculas con la siguiente estructura:

create table peliculas (
	codigo integer primary key,
	titulo text,
	actor text,
	duracion integer
);
-- Ingrese algunos registros:

 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la piedra filosofal','Daniel R.',null);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la camara secreta','Daniel R.',190);
 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible 2','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('Mujer bonita',null,120);
 insert into peliculas (titulo,actor,duracion)
  values('Tootsie','D. Hoffman',90);
 insert into peliculas (titulo)
  values('Un oso rojo');
-- Recupere las películas cuyo actor sea nulo.

-- Cambie la duración a 0, de las películas que tengan duración igual a "null"

-- Borre todas las películas donde el actor sea "null" y cuya duración sea 0.

drop table if exists peliculas;
 
create table peliculas (
	codigo integer primary key,
	titulo text,
	actor text,
	duracion integer
);

 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la piedra filosofal','Daniel R.',null);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la camara secreta','Daniel R.',190);
 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible 2','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('Mujer bonita',null,120);
 insert into peliculas (titulo,actor,duracion)
  values('Tootsie','D. Hoffman',90);
 insert into peliculas (titulo)
  values('Un oso rojo');  
  
 select * from peliculas
  where actor is null;  
  
 update peliculas set duracion=0
  where duracion is null;  
  
 delete from peliculas
  where actor is null and
  duracion=0;  
  
 select * from peliculas;