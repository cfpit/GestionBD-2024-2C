-- default

-- Podemos establecer valores por defecto para los campos cuando creamos la tabla. Para ello utilizamos "default" al definir el campo. Por ejemplo, queremos que el valor por defecto del campo "autor" de la tabla "libros" sea "desconocido" y el valor por defecto del campo "cantidad" sea "0":

drop table if exists libros;

create table libros(
	codigo integer primary key,
	titulo text,
	autor text not null default 'desconocido', 
	editorial text,
	precio real,
	cantidad integer default 0
 );
-- Si al ingresar un nuevo registro omitimos los valores para el campo "autor" y "cantidad", SQLite insertará los valores por defecto; en "autor" colocará "desconocido" y en cantidad "0".

-- Entonces, si al definir el campo explicitamos un valor mediante la cláusula "default", ése será el valor por defecto.

-- Si ejecutamos el comando:

insert into libros (titulo,precio)
  values ('El gato con botas',100);
-- En el campo autor se almacena la cadena 'desconocido', en el campo cantidad se almacena el valor '0'. En el campo editorial se almacena null ya que no indicamos ningún valor por defecto.

-- Problema resuelto
-- Trabajar con la tabla prestamos

drop table if exists prestamos;
-- Crear la tabla prestamos con la siguiente estructura:

create table prestamos(
	codigo integer primary key,
	deudor text,
        devuelto text not null default 'n'
);
-- Insertar 2 filas en la tabla:

insert into prestamos(deudor) values ('Rodriguez Pablo');
insert into prestamos(deudor) values ('Lopez ana');
-- Verificar los valores insertados en cada fila:

select * from prestamos;
-- Insertar otra fila indicando el valor a cargar en el campo devuelto:

insert into prestamos(deudor,devuelto) values ('Cortez mauro','s'); 
-- Mostrar nuevamente la tabla:

select * from prestamos;

-- Problema propuesto
-- Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos datos de las personas que visitan o compran en su stand para luego enviarle publicidad de sus productos.

-- Borrar la tabla "visitantes" si existe

-- Crear la tabla visitantes con la siguiente estructura:

create table visitantes(
	nombre text,
	edad integer,
	sexo text default 'f',
	domicilio text,
	ciudad text default 'Cordoba',
	telefono text,
	mail text default 'no tiene',
	montocompra real
 );
-- Inserte las siguientes filas.

insert into visitantes (nombre, domicilio, montocompra)
  values ('Susana Molina','Colon 123',59.80);
insert into visitantes (nombre, edad, ciudad, mail)
  values ('Marcos Torres',29,'Carlos Paz','marcostorres@hotmail.com');

-- Imprimir la tabla y controlar los valores por defecto que se insertaron y los campos donde se cargó null.

drop table if exists visitantes;

create table visitantes(
	nombre text,
	edad integer,
	sexo text default 'f',
	domicilio text,
	ciudad text default 'Cordoba',
	telefono text,
	mail text default 'no tiene',
	montocompra real
 );

insert into visitantes (nombre, domicilio, montocompra)
  values ('Susana Molina','Colon 123',59.80);
insert into visitantes (nombre, edad, ciudad, mail)
  values ('Marcos Torres',29,'Carlos Paz','marcostorres@hotmail.com');
  
select * from visitantes;  

