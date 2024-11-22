-- Subconsultas

-- Una subconsulta (subquery) es una sentencia "select" anidada en otra sentencia "select", "insert", "update" o "delete" (o en otra subconsulta).

-- Las subconsultas se emplean cuando una consulta es muy compleja, entonces se la divide en varios pasos lógicos y se obtiene el resultado con una única instrucción y cuando la consulta depende de los resultados de otra consulta.

-- Generalmente, una subconsulta se puede reemplazar por combinaciones y estas últimas son más eficientes.

-- Las subconsultas se DEBEN incluir entre paréntesis.

-- Puede haber subconsultas dentro de subconsultas.

-- Se pueden emplear subconsultas:

-- - en lugar de una expresión, siempre que devuelvan un solo valor o una lista de valores.

-- - que retornen un conjunto de registros de varios campos en lugar de una tabla o para obtener el mismo resultado que una combinación (join).

-- Hay tres tipos básicos de subconsultas:

-- las que retornan un solo valor escalar que se utiliza con un operador de comparación o en lugar de una expresión.
-- las que retornan una lista de valores, se combinan con "in", o los operadores "any", "some" y "all".
-- los que testean la existencia con "exists".

-- Reglas a tener en cuenta al emplear subconsultas:

-- - la lista de selección de una subconsulta que va luego de un operador de comparación puede incluir sólo una expresión o campo (excepto si se emplea "exists" y "in").

-- - si el "where" de la consulta exterior incluye un campo, este debe ser compatible con el campo en la lista de selección de la subconsulta.

-- - las subconsultas luego de un operador de comparación (que no es seguido por "any" o "all") no pueden incluir cláusulas "group by" ni "having".

-- - "distinct" no puede usarse con subconsultas que incluyan "group by".

-- - una subconsulta puede estar anidada dentro del "where" o "having" de una consulta externa o dentro de otra subconsulta.

-- - si una tabla se nombra solamente en un subconsulta y no en la consulta externa, los campos no serán incluidos en la salida (en la lista de selección de la consulta externa).

-- EJEMPLO: 

-- Trabajamos con la tabla "libros" de una librería.
-- Borramos la tabla si ya existe:

drop table if exists libros;
Creamos la tabla con la siguiente estructura:

create table libros(
	codigo integer primary key,
	titulo text,
	autor text, 
	editorial text,
	precio real
);
-- Almacenamos una serie de filas como ejemplo:

 insert into libros(titulo,autor,editorial,precio)
  values('Uno','Richard Bach','Planeta',10.00);
 insert into libros (titulo, autor, editorial, precio)
  values('El aleph', 'Borges', 'Emece', null);
 insert into libros (titulo, autor, editorial, precio)
  values('Antología poética', 'Borges', 'Planeta', 39.50);
 insert into libros (titulo, autor, editorial, precio)
  values('Java en 10 minutos', 'Mario Molina', 'Planeta', 50.50);
 insert into libros (titulo, autor, editorial, precio)
  values('Alicia en el pais de las maravillas', 'Lewis Carroll', 'Emece', 19.90);
 insert into libros (titulo, autor, editorial, precio)
  values('Martin Fierro', 'Jose Hernandez', 'Emece', 25.90);
 insert into libros (titulo, autor, editorial, precio)
  values('Martin Fierro', 'Jose Hernandez', 'Paidos', 16.80);
 insert into libros (titulo, autor, editorial, precio)
  values('Aprenda PHP', 'Mario Molina', 'Emece', 19.50);
 insert into libros (titulo, autor, editorial, precio)
  values('Cervantes y el quijote','Borges', 'Paidos', 18.40);
-- Obtenemos el título, precio de un libro específico y la diferencia entre su precio y el máximo valor:

 select titulo,precio,
  precio-(select max(precio) from libros) as diferencia
  from libros
  where titulo='Uno';
-- Mostramos el título y precio del libro más costoso:

 select titulo,autor, precio
  from libros
  where precio=(select max(precio) from libros);  
-- Actualizamos el precio del libro con máximo valor:

 update libros set precio=45
  where precio=(select max(precio) from libros);  
-- Eliminamos los libros con precio menor:

 delete from libros
  where precio=(select min(precio) from libros);  
  
  