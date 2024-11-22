-- left join

-- Trabajamos con las tablas "clientes" y "provincias".

-- Eliminamos las tablas si existen:

drop table if exists clientes;
drop table if exists provincias;
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
-- Almacenamos los siguientes registros:

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
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values ('Garcia Luis','Sucre 475','Santa Rosa',5);
-- Mostramos los datos de todos los clientes junto con la provincia a la que pertenece:

select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  join provincias as p
  on codigoprovincia = p.codigo;
-- Podemos observar que utilizando solo 'join' no aparece el cliente 'Garcia Luis' ya que su codigoprovincia no existe en la tabla 'provincias'.

-- Mostramos ahora todos los clientes, inclusive aquellos que tienen un código de provincia inexistente:

select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo;
  
  -- Realizamos la misma consulta anterior pero alterando el orden de las tablas:

 select c.nombre,domicilio,ciudad, p.nombre
  from provincias as p
  left join clientes as c
  on codigoprovincia = p.codigo;  
No aparece el cliente ''Garcia Luis.

-- Mostraremos todos los clientes cuyo código de provincia NO existe en "provincias" ordenados por nombre del cliente:

select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo
  where p.codigo is null
  order by c.nombre;  
-- Se debe mostrar solo 'Garcia Luis'.

-- Obtenemos ahora todos los datos de los clientes de "Cordoba":

 select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo
  where p.nombre='Cordoba';  
  
  