-- Vistas

-- Una empresa almacena la información de sus empleados en dos tablas llamadas "empleados" y "secciones".

-- Eliminaremos las dos tablas si ya existen:

 drop table if exists secciones;
 drop table if exists empleados;
-- Creamos las dos tablas con las siguientes estructuras:

 create table secciones(
  codigo integer primary key,
  nombre text,
  sueldo real
 );

 create table empleados(
  legajo integer primary key,
  documento text,
  sexo text,
  apellido text,
  nombre text,
  domicilio text,
  seccion integer,
  cantidadhijos integer,
  estadocivil text
 );
-- Almacenamos una serie de filas en cada tabla:

 insert into secciones(nombre,sueldo) values('Administracion',300);
 insert into secciones(nombre,sueldo) values('Contaduría',400);
 insert into secciones(nombre,sueldo) values('Sistemas',500);

 insert into empleados
(documento,sexo,apellido,nombre,domicilio,seccion,cantidadhijos,estadocivil)
 values('22222222','f','Lopez','Ana','Colon 123',1,2,'casado');
 insert into empleados
(documento,sexo,apellido,nombre,domicilio,seccion,cantidadhijos,estadocivil)
 values('23333333','m','Lopez','Luis','Sucre 235',1,0,'soltero');
 insert into empleados
(documento,sexo,apellido,nombre,domicilio,seccion,cantidadhijos,estadocivil) 
values('24444444','m','Garcia','Marcos','Sarmiento 1234',2,3,'divorciado');
 insert into empleados
(documento,sexo,apellido,nombre,domicilio,seccion,cantidadhijos,estadocivil) 
values('25555555','m','Gomez','Pablo','Bulnes 321',3,2,'casado');
 insert into empleados
(documento,sexo,apellido,nombre,domicilio,seccion,cantidadhijos,estadocivil) 
values('26666666','f','Perez','Laura','Peru 1254',3,3,'casado'); 
-- Eliminamos la vista "vista_empleados" si ya existe:

 drop view if exists vista_empleados;
-- Este proceso de borrar la vista la hacemos ya que si intentamos crear una nueva vista con el mismo nombre se produce un error.

-- Creamos la vista "vista_empleados":

 create view vista_empleados as
  select (apellido||' '||e.nombre) as nombre,sexo,
   s.nombre as seccion, cantidadhijos
   from empleados as e
   join secciones as s
   on codigo=seccion;
-- Vemos la información de la vista:

select * from vista_empleados;   
-- Realizamos una consulta a la vista como si se tratara de una tabla:

select seccion,count(*) as cantidad
  from vista_empleados
  group by seccion;
-- Insertamos una nueva fila en la tabla "empleados":

 insert into empleados
(documento,sexo,apellido,nombre,domicilio,seccion,cantidadhijos,estadocivil) 
values('27777777','f','Rodriguez','Pablo','Colon 33',3,3,'casado'); 
-- Si mostramos nuevamente la vista aparece el nuevo empleado ingresado:

select * from vista_empleados;   