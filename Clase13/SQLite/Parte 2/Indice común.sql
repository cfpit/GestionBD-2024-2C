-- Indice común
-- Vamos a trabajar con nuestra tabla "libros".

drop table if exists libros;
-- Creamos la tabla con la siguiente estructura:

create table libros(
	codigo integer primary key,
	titulo text,
	autor text, 
	editorial text,
	precio real
);
-- Creamos un índice común sobre el campo editorial:

 create index I_libros_editorial on libros(editorial);
-- Empleamos el comando create index para la creación, indicando seguidamente el nombre del índice, luego la palabra clave on, el nombre de la tabla y entre paréntesis el o los campos por el que se crea el índice.

-- Insertamos algunos registros:

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
-- Recuperamos todas las filas:

select * from libros;
-- Eliminamos el índice:

drop index I_libros_editorial;
-- Intentamos de eliminar nuevamente el índice:

drop index I_libros_editorial;
-- Se genera un error:

no such index: I_libros_editorial: 
 
drop index I_libros_editorial;
-- Si cambiamos el comando anterior con la sintaxis:

 drop index if exists I_libros_editorial; 