-- Subconsultas correlacionadas

-- Un almacén almacena la información de sus ventas en una tabla llamada "facturas" en la cual guarda el número de factura y el nombre del cliente y una tabla denominada "detalles" en la cual se almacenan los distintos items correspondientes a cada factura: el nombre del artículo, el precio (unitario) y la cantidad.
-- Se necesita una lista de todas las facturas que incluya el número, el cliente, la cantidad de artículos comprados y el total:

select f.*,
  (select count(d.numeroitem)
    from Detalles as d
    where f.numero=d.numerofactura) as cantidad,
  (select sum(d.preciounitario*cantidad)
    from Detalles as d
    where f.numero=d.numerofactura) as total
from facturas as f;
-- El segundo "select" retorna una lista de valores de una sola columna con la cantidad de items por factura (el número de factura lo toma del "select" exterior); el tercer "select" retorna una lista de valores de una sola columna con el total por factura (el número de factura lo toma del "select" exterior); el primer "select" (externo) devuelve todos los datos de cada factura.

-- A este tipo de subconsulta se la denomina consulta correlacionada. La consulta interna se evalúa tantas veces como registros tiene la consulta externa, se realiza la subconsulta para cada registro de la consulta externa. El campo de la tabla dentro de la subconsulta (f.numero) se compara con el campo de la tabla externa.

-- En este caso, específicamente, la consulta externa pasa un valor de "numero" a la consulta interna. La consulta interna toma ese valor y determina si existe en "detalles", si existe, la consulta interna devuelve la suma. El proceso se repite para el registro de la consulta externa, la consulta externa pasa otro "numero" a la consulta interna y SQLite repite la evaluación.



-- EJEMPLO:

-- Un almacén almacena la información de sus ventas en una tabla llamada "facturas" en la cual guarda el número de factura y el nombre del cliente y una tabla denominada "detalles" en la cual se almacenan los distintos items correspondientes a cada factura: el nombre del artículo, el precio (unitario) y la cantidad.

-- Borrar las dos tablas si existen:

 drop table if exists facturas;
 drop table if exists detalles;
-- Creamos las dos tablas con las siguientes estructuras:

 create table facturas(
  numero integer primary key,
  cliente text
 );

 create table detalles(
  numerofactura integer not null,
  numeroitem integer not null, 
  articulo text,
  precio real,
  cantidad integer,
  primary key(numerofactura,numeroitem)
 );
-- Almacenamos algunas filas en cada tabla:

 insert into facturas(numero,cliente) values(1200,'Juan Lopez');
 insert into facturas(numero,cliente) values(1201,'Luis Torres');
 insert into facturas(numero,cliente) values(1202,'Ana Garcia');
 insert into facturas(numero,cliente) values(1300,'Juan Lopez');

 insert into detalles(numerofactura,numeroitem,articulo,precio,cantidad) values(1200,1,'lapiz',1,100);
 insert into detalles(numerofactura,numeroitem,articulo,precio,cantidad)  values(1200,2,'goma',0.5,150);
 insert into detalles(numerofactura,numeroitem,articulo,precio,cantidad)  values(1201,1,'regla',1.5,80);
 insert into detalles(numerofactura,numeroitem,articulo,precio,cantidad)  values(1201,2,'goma',0.5,200);
 insert into detalles(numerofactura,numeroitem,articulo,precio,cantidad)  values(1201,3,'cuaderno',4,90);
 insert into detalles(numerofactura,numeroitem,articulo,precio,cantidad)  values(1202,1,'lapiz',1,200);
 insert into detalles(numerofactura,numeroitem,articulo,precio,cantidad)  values(1202,2,'escuadra',2,100);
 insert into detalles(numerofactura,numeroitem,articulo,precio,cantidad)  values(1300,1,'lapiz',1,300); 
-- Se necesita una lista de todas las facturas que incluya el número, el cliente, la cantidad de artículos comprados y el total:

 select f.*,
  (select count(d.numeroitem)
    from detalles as d
    where f.numero=d.numerofactura) as cantidad,
  (select sum(d.precio*cantidad)
    from detalles as d
    where f.numero=d.numerofactura) as total
 from facturas as f; 