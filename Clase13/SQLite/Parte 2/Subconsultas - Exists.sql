-- Subconsultas - Exists

-- Los operadores "exists" y "not exists" se emplean para determinar si hay o no datos en una lista de valores.

-- Estos operadores pueden emplearse con subconsultas correlacionadas para restringir el resultado de una consulta exterior a los registros que cumplen la subconsulta (consulta interior). Estos operadores retornan "true" (si las subconsultas retornan registros) o "false" (si las subconsultas no retornan registros).

-- Cuando se coloca en una subconsulta el operador "exists", SQLite analiza si hay datos que coinciden con la subconsulta, no se devuelve ningún registro, es como un test de existencia; SQLite termina la recuperación de registros cuando por lo menos un registro cumple la condición "where" de la subconsulta.

-- Un comercio que vende artículos de librería y papelería almacena la información de sus ventas en una tabla llamada "facturas" y otra "detalles".

-- Eliminamos las tablas si existen:

 drop table if exists facturas;
 drop table if exists detalles;
-- Creamos las dos tablas con la siguiente estructura:

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
-- Almacenamos algunas filas para pruebas:

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
-- Empleamos una subconsulta correlacionada con un operador "exists" en la cláusula "where" para devolver la lista de clientes que compraron el artículo "lapiz":

 select cliente,numero
  from facturas as f
  where exists
   (select *from detalles as d
     where f.numero=d.numerofactura
     and d.articulo='lapiz'); 
-- Buscamos los clientes que NO han comprado el artículo "lapiz":

 select cliente,numero
  from facturas as f
  where not exists
   (select *from detalles as d
     where f.numero=d.numerofactura
     and d.articulo='lapiz');