-- cross join

-- Un pequeño restaurante tiene almacenados los nombres y precios de sus comidas en una tabla llamada "comidas" y en una tabla denominada "postres" los mismos datos de sus postres.

-- Eliminamos ambas tablas si existen:

 drop table if exists comidas;
 drop table if exists postres;
-- Creamos las tablas con las siguientes estructuras:

 create table comidas(
  codigo integer primary key,
  nombre text,
  precio real
 );

 create table postres(
  codigo integer primary key,
  nombre text,
  precio real
 );
-- Insertamos una serie de filas en cada tabla:

 insert into comidas values(1,'milanesa y fritas',3.4);
 insert into comidas values(2,'arroz primavera',2.5);
 insert into comidas values(3,'pollo',2.8);

 insert into postres values(1,'flan',1);
 insert into postres values(2,'porcion de torta',2.1);
 insert into postres values(3,'gelatina',0.9);
-- El restaurante quiere combinar los registros de ambas tablas para mostrar los distintos menúes que ofrece. Lo hacemos usando un "cross join":

  select c.nombre as platoprincipal,
         p.nombre as postre,
         c.precio+p.precio as total
   from comidas as c
   cross join postres as p;
   
   -- Veamos un ejemplo. Un pequeño restaurante almacena los nombres y precios de sus comidas en una tabla llamada "comidas" y en una tabla denominada "postres" los mismos datos de sus postres.

-- Si necesitamos conocer todas las combinaciones posibles para un menú, cada comida con cada postre, empleamos un "cross join":

 select c.nombre as platoprincipal, p.nombre as postre
  from comidas as c
  cross join postres as p;
-- La salida muestra cada plato combinado con cada uno de los postres.

-- Como cualquier tipo de "join", puede emplearse una cláusula "where" que condicione la salida.