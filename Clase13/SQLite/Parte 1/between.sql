-- between

-- Hemos aprendido los operadores relacionales:

-- "=" (igual)
-- "<>" (distinto)
-- ">" (mayor)
-- "<" (menor)
-- ">=" (mayor o igual)
-- "<=" (menor o igual)
-- Otro operador relacional es "between", trabaja con intervalos de valores.

-- Hasta ahora, para recuperar de la tabla "libros" los libros con precio mayor o igual a 20 y menor o igual a 40, usamos 2 condiciones unidas por el operador lógico "and":

select * from libros
  where precio>=20 and
        precio<=40;
-- Podemos usar "between" y así simplificar la consulta:

select * from libros
  where precio between 20 and 40;
-- Averiguamos si el valor de un campo dado (precio) está entre los valores mínimo y máximo especificados (20 y 40 respectivamente)

-- "between" significa "entre". Trabaja con intervalo de valores.

-- No tiene en cuenta los valores "null".

-- Si agregamos el operador "not" antes de "between" el resultado se invierte, es decir, se recuperan los registros que están fuera del intervalo especificado. Por ejemplo, recuperamos los libros cuyo precio NO se encuentre entre 20 y 35, es decir, los menores a 15 y mayores a 25:

select * from libros
  where precio not between 20 and 35;
-- Entonces, se puede usar el operador "between" para reducir las condiciones "where".

-- Problema resuelto
-- Trabajar con la tabla autos.

drop table if exists autos;
-- Cree la tabla con la siguiente estructura:

create table autos(
	patente text primary key,
	marca text,
	modelo integer,
	precio real
);
-- Ingrese algunos registros:

 insert into autos
  values('AC123FG','Fiat 128',1970,15000);
 insert into autos
  values('AC234GG','Renault 11',1980,40000);
 insert into autos
  values('CD333QQ','Peugeot 505',1990,80000);
 insert into autos
  values('GD123TY','Renault Clio',1995,70000);
 insert into autos
  values('CC333MG','Renault Megane',1998,95000);
 insert into autos
  values('BV543QE','Fiat 128',1975,20000); 
-- Seleccione todos los autos cuyo modelo se encuentre entre 1970 y 1990 usando el operador "between" y ordénelos por dicho campo

 select * from autos
    where modelo between 1970 and 1990
    order by modelo;
-- Seleccione todos los autos cuyo precio esté entre 50000 y 100000:

 select * from autos
  where precio between 50000 and 100000; 
  
  