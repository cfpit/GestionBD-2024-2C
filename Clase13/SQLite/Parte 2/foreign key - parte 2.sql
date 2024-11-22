-- foreign key - parte 2

-- Si intentamos eliminar un registro de la tabla referenciada por una restricción "foreign key" cuyo valor de clave primaria existe referenciada en la tabla que tiene dicha restricción, la acción no se ejecuta y aparece un mensaje de error. Esto sucede porque, por defecto, para eliminaciones, la opción de la restricción "foreign key" es "no action". Lo mismo sucede si intentamos actualizar un valor de clave primaria de una tabla referenciada por una "foreign key" existente en la tabla principal.

-- La restricción "foreign key" tiene las cláusulas "on delete" y "on update" que son opcionales.

-- Estas cláusulas especifican cómo debe actuar SQLite frente a eliminaciones y modificaciones de las tablas referenciadas en la restricción.

-- Las opciones para estas cláusulas son las siguientes:

-- "no action": indica que si intentamos eliminar o actualizar un valor de la clave primaria de la tabla referenciada (TABLA2) que tengan referencia en la tabla principal (TABLA1), se genere un error y la acción no se realice; es la opción predeterminada.
-- "cascade": indica que si eliminamos o actualizamos un valor de la clave primaria en la tabla referenciada (TABLA2), los registros coincidentes en la tabla principal (TABLA1), también se eliminen o modifiquen; es decir, si eliminamos o modificamos un valor de campo definido con una restricción "primary key" o "unique", dicho cambio se extiende al valor de clave externa de la otra tabla (integridad referencial en cascada).
"set null": Establece con el valor null en el campo de la clave foránea.
"set default": Establece el valor por defecto en el campo de la clave foránea.
-- "restrict": La acción "restrict" significa que la aplicación tiene prohibido eliminar (para ON DELETE RESTRICT) o modificar (para ON UPDATE RESTRICT) una clave principal cuando existe una o más claves secundarias asignadas a ella.

-- Trabajamos con las tablas "libros" y "editoriales".
-- Las borramos si existen:

drop table if exists libros;
drop table if exists editoriales;
create table editoriales(
	codigo integer primary key,
	nombre text
);

create table libros(
	codigo integer primary key,
	titulo text,
	autor text, 
	codigoeditorial integer	references editoriales(codigo) on delete cascade on update cascade
);
-- Definimos para las acciones on delete y on update la acción "cascade".

-- Insertamos las siguientes filas en las tablas:

 insert into editoriales(nombre) values('Emece');
 insert into editoriales(nombre) values('Planeta');
 insert into editoriales(nombre) values('Siglo XXI');

 insert into libros(titulo,autor,codigoeditorial) values('El aleph','Borges',1);
 insert into libros(titulo,autor,codigoeditorial) values('Martin Fierro','Jose Hernandez',2);
 insert into libros(titulo,autor,codigoeditorial) values('Aprenda PHP','Mario Molina',2);
-- Si actualizamos un valor de código de "editoriales", la modificación se extiende a todos los registros de la tabla "libros" que hacen referencia a ella en "codigoeditorial":

update editoriales set codigo=10 where codigo=1;

select * from libros;
-- Podemos comprobar que se ha modificado la tabla "libros"

-- Si eliminamos una editorial, se borra tal editorial de "editoriales" y todos los registros de "libros" de dicha editorial:

 delete from editoriales where codigo=2; 
-- Luego de esto se ha eliminado una fila en la tabla "editoriales" y 2 filas en la tabla "libros".

