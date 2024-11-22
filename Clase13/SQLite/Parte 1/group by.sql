-- group by

-- Hemos aprendido que las funciones de agregado permiten realizar varios cálculos operando con conjuntos de registros.

-- Las funciones de agregado solas producen un valor de resumen para todos los registros de un campo. Podemos generar valores de resumen para un solo campo, combinando las funciones de agregado con la cláusula "group by", que agrupa registros para consultas detalladas.

-- Queremos saber la cantidad de libros de cada editorial, podemos tipear la siguiente sentencia:

 select count(*) from libros
  where editorial='Planeta';
-- y repetirla con cada valor de "editorial":

 select count(*) from libros
  where editorial='Emece';
 select count(*) from libros
  where editorial='Paidos';
 -- ...
-- Pero hay otra manera, utilizando la cláusula "group by":

 select editorial, count(*)
  from libros
  group by editorial;
-- La instrucción anterior solicita que muestre el nombre de la editorial y cuente la cantidad agrupando los registros por el campo "editorial". Como resultado aparecen los nombres de las editoriales y la cantidad de registros para cada valor del campo.

-- Los valores nulos se procesan como otro grupo.

-- Entonces, para saber la cantidad de libros que tenemos de cada editorial, utilizamos la función "count()", agregamos "group by" (que agrupa registros) y el campo por el que deseamos que se realice el agrupamiento, también colocamos el nombre del campo a recuperar; la sintaxis básica es la siguiente:

 select CAMPO, FUNCIONDEAGREGADO
  from NOMBRETABLA
  group by CAMPO;
-- También se puede agrupar por más de un campo, en tal caso, luego del "group by" se listan los campos, separados por comas. Todos los campos que se especifican en la cláusula "group by" deben estar en la lista de selección.

 select CAMPO1, CAMPO2, FUNCIONDEAGREGADO
  from NOMBRETABLA
  group by CAMPO1,CAMPO2;
-- Para obtener la cantidad libros con precio no nulo, de cada editorial utilizamos la función "count()" enviándole como argumento el campo "precio", agregamos "group by" y el campo por el que deseamos que se realice el agrupamiento (editorial):

 select editorial, count(precio)
  from libros
  group by editorial;
-- Como resultado aparecen los nombres de las editoriales y la cantidad de registros de cada una, sin contar los que tienen precio nulo.

-- Recuerde la diferencia de los valores que retorna la función "count()" cuando enviamos como argumento un asterisco o el nombre de un campo: en el primer caso cuenta todos los registros incluyendo los que tienen valor nulo, en el segundo, los registros en los cuales el campo especificado es no nulo.

-- Para conocer el total en dinero de los libros agrupados por editorial:

 select editorial, sum(precio)
  from libros
  group by editorial;
-- Para saber el máximo y mínimo valor de los libros agrupados por editorial:

 select editorial,
  max(precio) as mayor,
  min(precio) as menor
  from libros
  group by editorial;
-- Para calcular el promedio del valor de los libros agrupados por editorial:

 select editorial, avg(precio)
  from libros
  group by editorial;
-- Es posible limitar la consulta con "where".

-- Si incluye una cláusula "where", sólo se agrupan los registros que cumplen las condiciones.

-- Vamos a contar y agrupar por editorial considerando solamente los libros cuyo precio sea menor a 30 pesos:

 select editorial, count(*)
  from libros
  where precio<30
  group by editorial;
-- Problema resuelto
-- Una empresa tiene registrados sus clientes en una tabla llamada "clientes".
-- Eliminamos la tabla "clientes", si existe.

drop table if exists clientes;
-- Creamos una tabla con la siguiente estructura:

create table clientes (
  codigo integer primary key,
  nombre text,
  domicilio text,
  ciudad text,
  provincia text,
  telefono text
 );
-- Almacenamos los siguientes registros:

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
-- Obtenemos la cantidad de registros:

select count(*) from clientes;
-- Obtenemos la cantidad de clientes agrupados por ciudad y provincia, ordenados por provincia:

 select ciudad, provincia, count(*) from clientes
  group by ciudad, provincia
  order by provincia; 
  
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
-- Insertamos una serie de registros:

 insert into visitantes(nombre, edad, sexo, domicilio, ciudad, telefono, mail, montocompra)
  values ('Carlos Molina',35,'m','Colon 123','Carlos Paz','32322122',null,59.80);
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
-- Queremos saber la cantidad de visitantes de cada ciudad utilizando la cláusula "group by".

-- Queremos la cantidad visitantes con teléfono no nulo, de cada ciudad.

-- Necesitamos el total del monto de las compras agrupadas por sexo.

-- Se necesita saber el máximo y mínimo valor de compra agrupados por sexo y ciudad.

-- Calcule el promedio del valor de compra agrupados por ciudad.

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
  values ('Carlos Molina',35,'m','Colon 123','Carlos Paz','32322122',null,59.80);
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
  
select ciudad, count(*)
  from visitantes
  group by ciudad;
  
select ciudad, count(telefono)
  from visitantes
  group by ciudad;  

select sexo, sum(montocompra)
  from visitantes
  group by sexo;  
  
select sexo,ciudad,
  max(montocompra) as mayor,
  min(montocompra) as menor
  from visitantes
  group by sexo,ciudad;  
  
select ciudad,
  avg(montocompra) as promediodecompras
  from visitantes
  group by ciudad;  