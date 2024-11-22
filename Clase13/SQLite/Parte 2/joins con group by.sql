-- joins con group by

-- Una librería almacena la información de sus libros para la venta en dos tablas, "libros" y "editoriales".
Borramos las tablas si existen:

drop table if exists libros;
drop table if exists editoriales;
-- Creamos las tablas con las siguientes estructuras:

create table libros(
	codigo integer primary key,
	titulo text,
	autor text, 
	precio real,
	codigoeditorial integer	
);

create table editoriales(
	codigo integer primary key,
	nombre text
);
-- Almacenamos los siguientes datos de prueba:

 insert into editoriales(nombre) values('Planeta');
 insert into editoriales(nombre) values('Emece');
 insert into editoriales(nombre) values('Siglo XXI');

 insert into libros (titulo, autor, codigoeditorial, precio)
  values('El aleph', 'Borges', 2, 34);
 insert into libros (titulo, autor, codigoeditorial, precio)
  values('Antología poética', 'Borges', 1, 39.50);
 insert into libros (titulo, autor, codigoeditorial, precio)
  values('Java en 10 minutos', 'Mario Molina', 1, 50.50);
 insert into libros (titulo, autor, codigoeditorial, precio)
  values('Alicia en el pais de las maravillas', 'Lewis Carroll', 2, 19.90);
 insert into libros (titulo, autor, codigoeditorial, precio)
  values('Martin Fierro', 'Jose Hernandez', 2, 25.90);
 insert into libros (titulo, autor, codigoeditorial, precio)
  values('Martin Fierro', 'Jose Hernandez', 3, 16.80);
-- Contamos la cantidad de libros de cada editorial consultando ambas tablas:

 select nombre as editorial,
  count(*) as cantidad
  from editoriales as e
  join libros as l
  on codigoeditorial=e.codigo
  group by e.nombre;  
-- Buscamos el libro más costoso de cada editorial con un "left join":

 select nombre as editorial,
  max(precio) as mayorprecio
  from editoriales as e
  left join libros as l
  on codigoeditorial=e.codigo
  group by nombre;  