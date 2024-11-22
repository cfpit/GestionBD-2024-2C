-- having

-- Así como la cláusula "where" permite seleccionar (o rechazar) registros individuales; la cláusula "having" permite seleccionar (o rechazar) un grupo de registros.

-- Si queremos saber la cantidad de libros agrupados por editorial usamos la siguiente instrucción ya aprendida:

 select editorial, count(*)
  from libros
  group by editorial;
-- Si queremos saber la cantidad de libros agrupados por editorial pero considerando sólo algunos grupos, por ejemplo, los que devuelvan un valor mayor a 2, usamos la siguiente instrucción:

  select editorial, count(*) from libros
  group by editorial
  having count(*)>2;
-- Se utiliza "having", seguido de la condición de búsqueda, para seleccionar ciertas filas retornadas por la cláusula "group by".

-- Veamos otros ejemplos. Queremos el promedio de los precios de los libros agrupados por editorial, pero solamente de aquellos grupos cuyo promedio supere los 25 pesos:

 select editorial, avg(precio) from libros
  group by editorial
  having avg(precio)>25;
-- En algunos casos es posible confundir las cláusulas "where" y "having". Queremos contar los registros agrupados por editorial sin tener en cuenta a la editorial "Planeta".
-- Analicemos las siguientes sentencias:

 select editorial, count(*) from libros
  where editorial<>'Planeta'
  group by editorial;

 select editorial, count(*) from libros
  group by editorial
  having editorial<>'Planeta';
-- Ambas devuelven el mismo resultado, pero son diferentes. La primera, selecciona todos los registros rechazando los de editorial "Planeta" y luego los agrupa para contarlos. La segunda, selecciona todos los registros, los agrupa para contarlos y finalmente rechaza fila con la cuenta correspondiente a la editorial "Planeta".

-- No debemos confundir la cláusula "where" con la cláusula "having"; la primera establece condiciones para la selección de registros de un "select"; la segunda establece condiciones para la selección de registros de una salida "group by".

-- Veamos otros ejemplos combinando "where" y "having". Queremos la cantidad de libros, sin considerar los que tienen precio nulo, agrupados por editorial, sin considerar la editorial "Planeta":

 select editorial, count(*) from libros
  where precio is not null
  group by editorial
  having editorial<>'Planeta';
-- Aquí, selecciona los registros rechazando los que no cumplan con la condición dada en "where", luego los agrupa por "editorial" y finalmente rechaza los grupos que no cumplan con la condición dada en el "having".

-- Se emplea la cláusula "having" con funciones de agrupamiento, esto no puede hacerlo la cláusula "where". Por ejemplo queremos el promedio de los precios agrupados por editorial, de aquellas editoriales que tienen más de 2 libros:

 select editorial, avg(precio) from libros
  group by editorial
  having count(*) > 2; 
-- Podemos encontrar el mayor valor de los libros agrupados y ordenados por editorial y seleccionar las filas que tengan un valor menor a 100 y mayor a 30:

 select editorial, max(precio) as mayor
  from libros
  group by editorial
  having min(precio)<100 and
  min(precio)>30
  order by editorial; 
-- Entonces, usamos la cláusula "having" para restringir las filas que devuelve una salida "group by". Va siempre después de la cláusula "group by" y antes de la cláusula "order by" si la hubiere.

-- Problema resuelto
-- Una empresa tiene registrados sus clientes en una tabla llamada "clientes".
-- Elimine la tabla si ya existe.

drop table if exists clientes;
-- Cree la tabla "clientes" con la siguiente estructura:

create table clientes (
  codigo integer primary key,
  nombre text,
  domicilio text,
  ciudad text,
  provincia text,
  telefono text
 );
-- Agregar los siguientes registros:

 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Lopez Marcos', 'Colon 111', 'Cordoba','Cordoba',null);
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Perez Ana', 'San Martin 222', 'Cruz del Eje','Cordoba','4578585');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Garcia Juan', 'Rivadavia 333', 'Villa Maria','Cordoba','4578445');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Perez Luis', 'Sarmiento 444', 'Rosario','Santa Fe',null);
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono) 
  values ('Pereyra Lucas', 'San Martin 555', 'Cruz del Eje','Cordoba','4253685');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Gomez Ines', 'San Martin 666', 'Santa Fe','Santa Fe','0345252525');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Torres Fabiola', 'Alem 777', 'Villa del Rosario','Cordoba','4554455');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Lopez Carlos', 'Irigoyen 888', 'Cruz del Eje','Cordoba',null);
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Ramos Betina', 'San Martin 999', 'Cordoba','Cordoba','4223366');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Lopez Lucas', 'San Martin 1010', 'Posadas','Misiones','0457858745'); 
-- Obtener el total de los registros agrupados por ciudad y provincia

 select ciudad, provincia,
  count(*) as cantidad
  from clientes
  group by ciudad,provincia; 
-- Obtener el total de los registros agrupados por ciudad y provincia sin considerar los que tienen menos de 2 clientes

 select ciudad, provincia,
  count(*) as cantidad
  from clientes
  group by ciudad,provincia
  having count(*)>1;  
-- Problema propuesto
-- Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos datos de las personas que visitan o compran en su stand para luego enviarle publicidad de sus productos.

-- Borrar la tabla "visitantes" si existe

-- Crear la tabla "visitantes" con la siguiente estructura:

create table visitantes(
	codigo integer primary key,
	nombre text,
	edad integer,
	sexo text,
	domicilio text,
	ciudad text,
	telefono text,
	mail text,
	montocompra real
);
-- Insertar una serie de registros:

 insert into visitantes(nombre, edad, sexo, domicilio, ciudad, telefono, mail, montocompra)
  values ('Marcos Molina',35,'m','Colon 123','Carlos Paz','32322122',null,59.80);
 insert into visitantes(nombre, edad, sexo, domicilio, ciudad, telefono, mail, montocompra)
  values ('Marina Molina',35,'f','Colon 33','Carlos Paz','6322322',null,3459.80); 
 insert into visitantes(nombre, edad, sexo, domicilio, ciudad, telefono, mail, montocompra)
  values ('Marcos Torres',29,'m','Belgrano 1002','Carlos Paz','4576556','marcostorres@hotmail.com',150.50);
 insert into visitantes(nombre, edad, sexo, domicilio, ciudad, telefono, mail, montocompra)
  values ('Mariana Juarez',45,'f','La prida 333','Carlos Paz','233223',null,23.90);
 insert into visitantes(nombre, edad, sexo, domicilio, ciudad, telefono, mail, montocompra)
  values ('Fabian Perez',36,'m','Olmos 23','Marco Juarez','4556677','fabianperez@xaxamail.com',null);
 insert into visitantes(nombre, edad, sexo, domicilio, ciudad, telefono, mail, montocompra)
  values ('Alejandra Gonzalez',45,'f','La Rioja 343','La Falda',null,null,280.50);
 insert into visitantes(nombre, edad, sexo, domicilio, ciudad, telefono, mail, montocompra)
  values ('Gaston Perez',29,'m','Colon 333','Carlos Paz','2332423','gastonperez1@gmail.com',95.40);
 insert into visitantes(nombre, edad, sexo, domicilio, ciudad, telefono, mail, montocompra)
  values ('Liliana Torres',40,'f','Sarmiento 876','Cordoba','233232',null,85);
 insert into visitantes(nombre, edad, sexo, domicilio, ciudad, telefono, mail, montocompra)
  values ('Gabriela Duarte',21,'f','Dean Funes','Rio Tercero',null,'gabrielaltorres@hotmail.com',321.50);
-- Obtenga el total de las compras agrupados por ciudad y sexo de aquellas filas que devuelvan un valor superior a 50

-- Agrupe por ciudad y sexo, muestre para cada grupo el total de visitantes, la suma de sus compras y el promedio de compras, ordenado por la suma total y considerando las filas con promedio superior a 30

drop table if exists visitantes;

create table visitantes(
	codigo integer primary key,
	nombre text,
	edad integer,
	sexo text,
	domicilio text,
	ciudad text,
	telefono text,
	mail text,
	montocompra real
);

 insert into visitantes(nombre, edad, sexo, domicilio, ciudad, telefono, mail, montocompra)
  values ('Marcos Molina',35,'m','Colon 123','Carlos Paz','32322122',null,59.80);
 insert into visitantes(nombre, edad, sexo, domicilio, ciudad, telefono, mail, montocompra)
  values ('Marina Molina',35,'f','Colon 33','Carlos Paz','6322322',null,3459.80); 
 insert into visitantes(nombre, edad, sexo, domicilio, ciudad, telefono, mail, montocompra)
  values ('Marcos Torres',29,'m','Belgrano 1002','Carlos Paz','4576556','marcostorres@hotmail.com',150.50);
 insert into visitantes(nombre, edad, sexo, domicilio, ciudad, telefono, mail, montocompra)
  values ('Mariana Juarez',45,'f','La prida 333','Carlos Paz','233223',null,23.90);
 insert into visitantes(nombre, edad, sexo, domicilio, ciudad, telefono, mail, montocompra)
  values ('Fabian Perez',36,'m','Olmos 23','Marco Juarez','4556677','fabianperez@xaxamail.com',null);
 insert into visitantes(nombre, edad, sexo, domicilio, ciudad, telefono, mail, montocompra)
  values ('Alejandra Gonzalez',45,'f','La Rioja 343','La Falda',null,null,280.50);
 insert into visitantes(nombre, edad, sexo, domicilio, ciudad, telefono, mail, montocompra)
  values ('Gaston Perez',29,'m','Colon 333','Carlos Paz','2332423','gastonperez1@gmail.com',95.40);
 insert into visitantes(nombre, edad, sexo, domicilio, ciudad, telefono, mail, montocompra)
  values ('Liliana Torres',40,'f','Sarmiento 876','Cordoba','233232',null,85);
 insert into visitantes(nombre, edad, sexo, domicilio, ciudad, telefono, mail, montocompra)
  values ('Gabriela Duarte',21,'f','Dean Funes','Rio Tercero',null,'gabrielaltorres@hotmail.com',321.50);
  
 select * from visitantes;  
 
 select ciudad,sexo,
  sum(montocompra) as Total
  from visitantes
  group by ciudad,sexo
  having sum(montocompra)>50; 
  
 select ciudad,sexo, count(*) as cantidad,
  sum(montocompra) as total,
  avg(montocompra) as promedio
  from visitantes
  group by ciudad,sexo
  having avg(montocompra)>30
  order by total;  