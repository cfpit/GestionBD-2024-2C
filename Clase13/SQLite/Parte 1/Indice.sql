-- Indice de una tabla

-- Para facilitar la obtención de información de una tabla se utilizan índices.

-- El indice de una tabla desempeña la misma función que el índice de un libro: permite encontrar datos rápidamente; en el caso de las tablas, localiza registros.

-- Una tabla se indexa por un campo (o varios).

-- El índice es un tipo de archivo con 2 entradas: un dato (un valor de algún campo de la tabla) y un puntero.

-- Un índice posibilita el acceso directo y rápido haciendo más eficiente las búsquedas. Sin índice, se debe recorrer secuencialmente toda la tabla para encontrar un registro.

-- El objetivo de un indice es acelerar la recuperación de información, es decir tiene sentido en tablas con muchos registros.

-- La desventaja es que consume espacio en el disco y las inserciones y borrados de registros son más lentas.

-- La indexación es una técnica que optimiza el acceso a los datos, mejora el rendimiento acelerando las consultas y otras operaciones. Es útil cuando la tabla contiene miles de registros.

-- Los índices se usan para varias operaciones:

-- - para buscar registros rápidamente.

-- - para recuperar registros de otras tablas empleando "join".

-- Es importante identificar el o los campos por los que sería útil crear un indice, aquellos campos por los cuales se realizan operaciones de búsqueda con frecuencia.

-- Hay distintos tipos de índices, a saber:

-- 1) "primary key": es el que definimos como clave primaria. Los valores indexados deben ser únicos. Una tabla solamente puede tener una clave primaria.

-- 2) "index": crea un indice común, los valores no necesariamente son únicos y aceptan valores "null". "key" es sinónimo de "index". Puede haber varios por tabla.

-- 3) "unique": crea un indice para los cuales los valores deben ser únicos y diferentes, aparece un mensaje de error si intentamos agregar un registro con un valor ya existente. Permite valores nulos y pueden definirse varios por tabla.

-- Todos los índices pueden ser multicolumna, es decir, pueden estar formados por más de 1 campo.

-- En las siguientes lecciones aprenderemos sobre cada uno de ellos.

-- Los nombres de índices aceptan todos los caracteres.

-- Una tabla puede ser indexada por campos de tipo numérico o de tipo caracter. También se puede indexar por un campo que contenga valores NULL, excepto los PRIMARY.

-- Indice único

-- Veamos el otro tipo de índice, único. Un índice único se crea con "create unique index", los valores deben ser únicos y diferentes, aparece un mensaje de error si intentamos agregar un registro con un valor ya existente. Permite valores nulos y pueden definirse varios por tabla. Debemos darle un nombre.

-- Problema resuelto
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

-- no such index: I_libros_tituloeditorial: 
 
 drop index I_libros_tituloeditorial;
-- Si cambiamos el comando anterior con la sintaxis:

 drop index if exists I_libros_tituloeditorial;
-- No se genera error ya que no existe el índice.



