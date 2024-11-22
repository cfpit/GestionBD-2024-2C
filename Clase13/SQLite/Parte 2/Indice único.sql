-- Indice único

-- Veamos el otro tipo de índice, único. Un índice único se crea con "create unique index", los valores deben ser únicos y diferentes, aparece un mensaje de error si intentamos agregar un registro con un valor ya existente. Permite valores nulos y pueden definirse varios por tabla. Debemos darle un nombre.

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
-- Creamos un índice único sobre los campos titulo y editorial:

 create unique index I_libros_tituloeditorial on libros(titulo,editorial);
-- Empleamos el comando create unique index para la creación, indicando seguidamente el nombre del índice, luego la palabra clave on, el nombre de la tabla y entre paréntesis el o los campos por el que se crea el índice.

-- Con este tipo de índice no podemos insertar dos filas que contengan en los campos titulo y editorial el mismo valor.

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
-- Intentamos insertar una fila que tienen en los campos título y editorial los mismos valores que otra fila:

 insert into libros (titulo, autor, editorial, precio)
  values('Cervantes y el quijote','Borges', 'Paidos', 18.40);
-- Se genera el error:

UNIQUE constraint failed: libros.titulo, libros.editorial: 
 
 insert into libros (titulo, autor, editorial, precio)
  values('Cervantes y el quijote','Borges', 'Paidos', 18.40);
-- Eliminamos el índice:

drop index I_libros_tituloeditorial;
-- Intentamos de eliminar nuevamente el índice:

drop index I_libros_tituloeditorial;
-- Se genera un error:

no such index: I_libros_tituloeditorial: 
 
 drop index I_libros_tituloeditorial;
-- Si cambiamos el comando anterior con la sintaxis:

 drop index if exists I_libros_tituloeditorial;