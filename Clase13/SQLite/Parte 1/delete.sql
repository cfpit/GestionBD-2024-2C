-- delete

-- Para eliminar los registros de una tabla usamos el comando "delete":

 delete from usuarios;
-- Si no queremos eliminar todos los registros, sino solamente algunos, debemos indicar cuál o cuáles, para ello utilizamos el comando "delete" junto con la clausula "where" con la cual establecemos la condición que deben cumplir los registros a borrar.

-- Por ejemplo, queremos eliminar aquel registro cuyo nombre de usuario es "Marcelo":

 delete from usuarios where nombre='Marcelo';
-- Si solicitamos el borrado de un registro que no existe, es decir, ningún registro cumple con la condición especificada, ningún registro será eliminado.

-- Tenga en cuenta que si no colocamos una condición, se eliminan todos los registros de la tabla nombrada.

-- Problema resuelto
-- Eliminar la tabla "usuarios" si ya existe:

drop table if exists usuarios
-- Crear la tabla "usuarios" con la siguiente estructura:

create table usuarios(
	nombre text,
	clave text
);
-- Agregamos registros a la tabla:

insert into usuarios (nombre,clave)
  values ('Marcelo','River');
insert into usuarios (nombre,clave)
  values ('Susana','chapita');
insert into usuarios (nombre,clave)
  values ('CarlosFuentes','Boca');
insert into usuarios (nombre,clave)
  values ('FedericoLopez','Boca');
-- Seleccionamos todos los registros:

select * from usuarios;
-- Vamos a eliminar el registro cuyo nombre de usuario es "Marcelo":

delete from usuarios
 where nombre='Marcelo';  
-- Veamos el contenido de la tabla:

select * from usuarios;
-- Intentamos eliminarlo nuevamente:

delete from usuarios
 where nombre='Marcelo'; 
-- Veamos el contenido de la tabla:

select * from usuarios;
-- Como ningún registro cumple con la condición no se borran registros.

-- Eliminamos todos los registros cuya clave es 'Boca':

delete from usuarios
  where clave='Boca'; 
-- Veamos el contenido de la tabla

select * from usuarios;
-- Eliminemos todos los registros:

delete from usuarios;
-- Veamos el contenido de la tabla:

select * from usuarios;

-- Problema propuesto
-- Un comercio que vende artículos de computación registra los datos de sus artículos en una tabla con ese nombre.

-- Borrar la tabla "articulos" si existe

-- Crear la tabla artículos con la siguiente estructura:

create table articulos (
	codigo integer,
	nombre text,
	descripcion text,
	precio real,
	cantidad integer
);
-- Ingrese algunos registros:

insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (1,'impresora', 'MULTIFUNCION HP 2135', 1800, 10);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (2,'impresora', 'MULTIFUNCION EPSON EXPRESSION XP241 WI-FI', 2500, 30);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (3,'monitor', 'Samsung 23', 1200, 10);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (4,'teclado', 'ingles Biswal', 100, 50);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (5,'teclado', 'español Biswal', 90, 50);
-- Elimine los artículos cuyo precio sea mayor o igual a 500

-- Elimine todas las impresoras

-- Elimine todos los artículos cuyo código sea diferente a 4

-- Mostrar la tabla después que se borran registros

drop table if exists articulos;

create table articulos (
	codigo integer,
	nombre text,
	descripcion text,
	precio real,
	cantidad integer
);

insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (1,'impresora', 'MULTIFUNCION HP 2135', 180, 10);
insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (2,'impresora', 'MULTIFUNCION EPSON EXPRESSION XP241 WI-FI', 2500, 30);
insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (3,'monitor', 'Samsung 23', 1200, 10);
insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (4,'teclado', 'ingles Biswal', 100, 50);
insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (5,'teclado', 'español Biswal', 90, 50);  

delete from articulos
  where precio>=500;

select * from articulos;

delete from articulos
  where nombre='impresora';

select * from articulos;

delete from articulos
  where codigo<>4;

select * from articulos;  

