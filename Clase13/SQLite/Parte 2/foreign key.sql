-- foreign key

-- Trabajamos con las tablas "libros" y "editoriales".
-- Eliminamos primero las tablas si ya existen:

drop table if exists libros;
drop table if exists editoriales;
-- Creamos las dos tablas y definimos la restricción "foreign key" en la tabla "libros":

create table editoriales(
	codigo integer primary key,
	nombre text
);

create table libros(
	codigo integer primary key,
	titulo text,
	autor text, 
	precio real,
	codigoeditorial integer	references editoriales(codigo)
);
-- Creamos una restricción "foreign key" para establecer el campo "codigoeditorial" como clave externa que haga referencia al campo "codigo" de "editoriales".

-- Cargamos tres registros en la tabla "editoriales":

 insert into editoriales(nombre) values('Planeta');
 insert into editoriales(nombre) values('Emece');
 insert into editoriales(nombre) values('Siglo XXI');
-- Cargamos una serie de registros en la tabla "libros" respetando la restricción impuesta en el campo "codigoeditorial":

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
-- Las filas se agregan en forma correcta ya que en el campo "codigoeditorial" se ingresan siempre valores comprendidos entre 1 y 3, que son los códigos de editoriales existentes.

-- Intentemos de ingresar una fila con "codigoeditorial" que no exista en la tabla "editoriales":

 insert into libros(titulo, autor, codigoeditorial) 
  values('JSP basico','Tornado Luis',7); 
  
  -- Se produce un error ya que no existe el código 7 en la tabla "editoriales":

-- La restricción "foreign key" actúa en eliminaciones y actualizaciones. Si intentamos eliminar un registro o modificar un valor de clave primaria de una tabla si una clave foránea hace referencia a dicho registro, SQLite no lo permite. Por ejemplo, si intentamos eliminar una editorial a la que se hace referencia en "libros", aparece un mensaje de error y no se produce la eliminación:

delete from editoriales where codigo=1;  
-- Se produce un error ya que en la tabla "libros" hay registros que hacen referencia a dicho código de la tabla "editoriales":

-- Podemos intentar de modificarlo y obtendremos el mismo error:

 update editoriales set codigo=100 where codigo=1;  
-- Si hay uno o más registros en la tabla "libros" luego no podemos borrar la tabla "editoriales" debido a que hemos definido la restricción "foreign key":

 drop table if exists editoriales;
 
 