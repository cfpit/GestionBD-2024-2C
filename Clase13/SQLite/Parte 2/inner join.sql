-- inner join

-- Una empresa tiene registrados sus clientes en una tabla llamada "clientes", también tiene una tabla "provincias" donde registra los nombres de las provincias.

-- Eliminar ambas tablas si existen:

drop table if exists provincias;
drop table if exists clientes;
-- Creamos las tablas con las siguientes estructuras:

 create table clientes (
  codigo integer primary key,
  nombre text,
  domicilio text,
  ciudad text,
  codigoprovincia integer
 );

 create table provincias(
  codigo integer primary key,
  nombre text
 );
-- Almacenamos algunos registros en ambas tablas:

 insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');
 
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
   values ('Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
   values ('Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
   values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
   values ('Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
   values ('Pereyra Lucas','San Martin 555','Cruz del Eje',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
   values ('Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
   values ('Torres Fabiola','Alem 777','Ibera',3);
-- Obtener los datos de ambas tablas, usando alias para los nombres de tablas:

 select c.nombre,domicilio,ciudad,p.nombre
  from clientes as c
  join provincias as p on c.codigoprovincia=p.codigo; 
-- Obtener la misma información anterior pero ordenada por nombre de provincia

 select c.nombre,domicilio,ciudad,p.nombre
  from clientes as c
  join provincias as p on c.codigoprovincia=p.codigo
  order by p.nombre; 
-- Recuperar los clientes de la provincia de "Santa Fe"

 select c.nombre,domicilio,ciudad
  from clientes as c
  join provincias as p on c.codigoprovincia=p.codigo
  where p.nombre='Santa Fe';  