-- Subconsulta que devuelve valor de tipo tabla

-- Un comercio que vende artículos de librería y papelería almacena la información de sus ventas en una tabla llamada "facturas", otra "detalles" y otra "clientes".

-- Eliminamos las tablas si ya existen:

 drop table if exists clientes;
 drop table if exists facturas;
 drop table if exists detalles; 
-- Creamos las tablas con las siguientes estructuras:

 create table clientes(
  codigo integer primary key,
  nombre text,
  domicilio text
 );

 create table facturas(
  numero integer primary key,
  codigocliente integer
 );

 create table detalles(
  numerofactura integer,
  numeroitem integer, 
  articulo text,
  precio real,
  cantidad integer,
  primary key(numerofactura,numeroitem)
 );
-- Almacenamos algunos datos de prueba:

 insert into clientes(nombre,domicilio) values('Juan Lopez','Colon 123');
 insert into clientes(nombre,domicilio) values('Luis Torres','Sucre 987');
 insert into clientes(nombre,domicilio) values('Ana Garcia','Sarmiento 576');

 insert into facturas values(1200,1);
 insert into facturas values(1201,2);
 insert into facturas values(1202,3);
 insert into facturas values(1300,1);

 insert into detalles values(1200,1,'lapiz',1,100);
 insert into detalles values(1200,2,'goma',0.5,150);
 insert into detalles values(1201,1,'regla',1.5,80);
 insert into detalles values(1201,2,'goma',0.5,200);
 insert into detalles values(1201,3,'cuaderno',4,90);
 insert into detalles values(1202,1,'lapiz',1,200);
 insert into detalles values(1202,2,'escuadra',2,100);
 insert into detalles values(1300,1,'lapiz',1,300);
-- Vamos a realizar un "select" para recuperar el número de factura, el código de cliente y la suma total de todas las facturas:

 select f.*,
  (select sum(d.precio*cantidad)
    from detalles as d
    where f.numero=d.numerofactura) as total
 from facturas as f;
-- Esta consulta contiene una subconsulta correlacionada.

-- Ahora utilizaremos el resultado de la consulta anterior como una tabla derivada que emplearemos en lugar de una tabla para realizar un "join" y recuperar el número de factura, el nombre del cliente y el monto total por factura:

 select td.numero,c.nombre,td.total
  from clientes as c
  join (select f.*,
   (select sum(d.precio*cantidad)
    from detalles as d
    where f.numero=d.numerofactura) as total
  from facturas as f) as td
  on td.codigocliente=c.codigo;
-- Note que para referenciar la tabla derivada debimos colocar un alias a la consulta.