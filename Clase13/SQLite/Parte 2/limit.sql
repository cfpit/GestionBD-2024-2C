-- limit

-- Las cláusulas "limit" y "offset" se usan para restringir los registros que se retornan en una consulta "select".

-- La cláusula limit recibe un argumento numérico positivo que indica el número máximo de registros a retornar; la cláusula offset indica el número del primer registro a retornar. El número de registro inicial es 0 (no 1).

-- Si el limit supera la cantidad de registros de la tabla, se limita hasta el último registro.

-- Ejemplo:

 select * from libros limit 4 offset 0;
-- Muestra los primeros 4 registros, 0,1,2 y 3.

-- Si tipeamos:

 select * from libros limit 4 offset 5;
-- recuperamos 4 registros, desde el 5 al 8.

-- Si se coloca solo la cláusula limit retorna tantos registros como el valor indicado, comenzando desde 0. Ejemplo:

 select * from libros limit 8;
-- Muestra los primeros 8 registros.

-- Es conveniente utilizar la cláusula order by cuando utilizamos limit y offset, por ejemplo:

 select * from libros order by codigo limit 8;
 
 -- Trabajar con la tabla "peliculas".

drop table if exists peliculas;
-- Crear la tabla con la siguiente estructura:

create table peliculas (
	codigo integer primary key,
	titulo text,
	actor text,
	duracion integer
);
-- Insertar estos registros:

 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la piedra filosofal','Daniel R.',180);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la camara secreta','Daniel R.',190);
 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible 2','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('Mujer bonita','Richard Gere',120);
 insert into peliculas (titulo,actor,duracion)
  values('Tootsie','D. Hoffman',90);
 insert into peliculas (titulo,actor,duracion)
  values('Un oso rojo','Julio Chavez',100);
 insert into peliculas (titulo,actor,duracion)
  values('Elsa y Fred','China Zorrilla',110);  
-- Realizar una consulta limitando la salida a sólo 5 registros:

 select * from peliculas limit 5;  
-- Mostrar los primeros 3 registros ordenado por el título:

 select * from peliculas order by titulo limit 3;
-- Mostrar los primeros 4 registros ordenado por el título a partir del segundo:

 select * from peliculas order by titulo limit 4 offset 1; 
 
 