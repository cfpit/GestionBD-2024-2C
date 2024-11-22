-- update

-- Decimos que actualizamos un registro cuando modificamos alguno de sus valores.

-- Para modificar uno o varios datos de uno o varios registros utilizamos el comando "update" (actualizar).

-- Por ejemplo, en nuestra tabla "usuarios", queremos cambiar los valores de todas las claves por la cadena "RealMadrid":

 update usuarios set clave='RealMadrid';
-- Utilizamos "update" junto al nombre de la tabla y "set" junto con el campo a modificar y su nuevo valor.

-- El cambio afectará a todos los registros.

-- Podemos modificar algunos registros, para ello debemos establecer condiciones de selección con la cláusula "where".
-- Por ejemplo, queremos cambiar el valor correspondiente a la clave de nuestro usuario llamado "Federicolopez", queremos como nueva clave "Boca", necesitamos una condición "where" que afecte solamente a este registro:

 update usuarios set clave='Boca'
  where nombre='Federicolopez';
-- Si SQLite no encuentra registros que cumplan con la condición del "where", no se modifica ninguno.

-- Las condiciones no son obligatorias, pero si omitimos la cláusula "where", la actualización afectará a todos los registros.

-- También podemos actualizar varios campos en una sola instrucción:

 update usuarios set nombre='Marceloduarte', clave='Marce'
  where nombre='Marcelo';
-- Para ello colocamos "update", el nombre de la tabla, "set" junto al nombre del campo y el nuevo valor y separado por coma, el otro nombre del campo con su nuevo valor.

-- Problema resuelto
-- Borramos la tabla usuarios si existe:

drop table if exists usuarios;
-- Creamos la tabla con la siguiente estructura:

create table usuarios(
	nombre text,
	clave text
);
-- Ingresamos algunos registros:

 insert into usuarios (nombre,clave)
  values ('Marcelo','River');
 insert into usuarios (nombre,clave)
  values ('Susana','chapita');
 insert into usuarios (nombre,clave)
  values ('Carlosfuentes','Boca');
 insert into usuarios (nombre,clave)
  values ('Federicolopez','Boca');
-- Cambiaremos los valores de todas las claves, por la cadena "RealMadrid":

update usuarios set clave='RealMadrid';
-- El cambio afectó a todos los registros, veámoslo mediante un select:

select * from usuarios;
-- Necesitamos cambiar el valor de la clave del usuario llamado "Federicolopez" por "Boca":

 update usuarios set clave='Boca'
  where nombre='Federicolopez';
-- Verifiquemos que la actualización se realizó:

select * from usuarios;
-- Si SQLite no encuentra registros que cumplan con la condición no se modifican registros:

 update usuarios set clave='payaso'
  where nombre='JuanaJuarez';
-- Si vemos la tabla veremos que no a cambiado:

select * from usuarios;
-- Para actualizar varios campos en una sola instrucción empleamos:

 update usuarios set nombre='Marceloduarte', clave='Marce'
  where nombre='Marcelo';
-- Si vemos la tabla:

select * from usuarios;
-- Problema propuesto
-- Trabaje con la tabla "libros" de una librería.

-- Borrar la tabla "libros" si existe

Crear la tabla libros con la siguiente estructura:

create table libros (
	titulo text,
	autor text,
	editorial text,
	precio real
);
-- Ingrese los siguientes registros:

insert into libros (titulo, autor, editorial, precio)
  values ('El aleph','Borges','Emece',25.00);
insert into libros (titulo, autor, editorial, precio)
  values ('Martin Fierro','Jose Hernandez','Planeta',35.50);
insert into libros (titulo, autor, editorial, precio)
  values ('Aprenda PHP','Mario Molina','Emece',45.50);
insert into libros (titulo, autor, editorial, precio)
  values ('Cervantes y el quijote','Borges','Emece',25);
insert into libros (titulo, autor, editorial, precio)
  values ('Matematica estas ahi','Paenza','Siglo XXI',15);
-- Muestre todos los registros.

-- Modifique los registros cuyo autor sea igual a "Paenza", por "Adrian Paenza".

-- Nuevamente, modifique los registros cuyo autor sea igual a "Paenza", por "Adrian Paenza"

-- Actualice el precio del libro de "Mario Molina" a 27 pesos.

-- Actualice el valor del campo "editorial" por "Emece S.A.", para todos los registros cuya editorial sea igual a "Emece".

-- Luego de cada actualización ejecute un select que muestre todos los registros de la tabla

drop table if exists libros;

create table libros (
	titulo text,
	autor text,
	editorial text,
	precio real
);

insert into libros (titulo, autor, editorial, precio)
  values ('El aleph','Borges','Emece',25.00);
insert into libros (titulo, autor, editorial, precio)
  values ('Martin Fierro','Jose Hernandez','Planeta',35.50);
insert into libros (titulo, autor, editorial, precio)
  values ('Aprenda PHP','Mario Molina','Emece',45.50);
insert into libros (titulo, autor, editorial, precio)
  values ('Cervantes y el quijote','Borges','Emece',25);
insert into libros (titulo, autor, editorial, precio)
  values ('Matematica estas ahi','Paenza','Siglo XXI',15);
  
select * from libros;

update libros set autor='Adrian Paenza'
  where autor='Paenza';

select * from libros;  
 
update libros set autor='Adrian Paenza'
  where autor='Paenza';

select * from libros; 
 
update libros set precio=27
 where autor='Mario Molina';

select * from libros; 
 

update libros set editorial='Emece S.A.'
  where editorial='Emece';

select * from libros; 