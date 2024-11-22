-- is null

-- "null" significa "dato desconocido" o "valor inexistente". No es lo mismo que un valor "0", una cadena vacía o una cadena literal "null".

-- A veces, puede desconocerse o no existir el dato correspondiente a algún campo de un registro. En estos casos decimos que el campo puede contener valores nulos.

-- Por ejemplo, en nuestra tabla de libros, podemos tener valores nulos en el campo "precio" porque es posible que para algunos libros no le hayamos establecido el precio para la venta.

-- En contraposición, tenemos campos que no pueden estar vacíos jamás.

-- Veamos un ejemplo. Tenemos nuestra tabla "libros". El campo "titulo" no debería estar vacío nunca, igualmente el campo "autor". Para ello, al crear la tabla, debemos especificar que dichos campos no admitan valores nulos:

create table libros(
  titulo text not null,
  autor text not null,
  editorial text null,
  precio real
 );
-- Para especificar que un campo no admita valores nulos, debemos colocar "not null" luego de la definición del campo.
-- En el ejemplo anterior, los campos "editorial" y "precio" si admiten valores nulos.
-- Cuando colocamos "null" estamos diciendo que admite valores nulos (caso del campo "editorial"); por defecto, es decir, si no lo aclaramos, los campos permiten valores nulos (caso del campo "precio")
-- Es común no disponer la cláusula null ya que es el valor por defecto para todo campo.

-- Si ingresamos los datos de un libro, para el cual aún no hemos definido el precio podemos colocar "null" para mostrar que no tiene precio:

 insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',null);
-- Note que el valor "null" no es una cadena de caracteres, no se coloca entre comillas.
-- Entonces, si un campo acepta valores nulos, podemos ingresar "null" cuando no conocemos el valor.

-- También podemos colocar "null" en el campo "editorial" si desconocemos el nombre de la editorial a la cual pertenece el libro que vamos a ingresar:

 insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais','Lewis Carroll',null,25);
-- Si intentamos ingresar el valor "null" en campos que no admiten valores nulos (como "titulo" o "autor"), SQLite no lo permite, muestra un mensaje y la inserción no se realiza; por ejemplo:

 insert into libros (titulo,autor,editorial,precio)
  values(null,'Borges','Siglo XXI',25);
-- Para recuperar los registros que contengan el valor "null" en algún campo, no podemos utilizar los operadores relacionales vistos anteriormente: = (igual) y <> (distinto); debemos utilizar los operadores "is null" (es igual a null) y "is not null" (no es null):

 select * from libros
  where precio is null;
-- La sentencia anterior tendrá una salida diferente a la siguiente:

 select * from libros
  where precio=0;
-- Con la primera sentencia veremos los libros cuyo precio es igual a "null" (desconocido); con la segunda, los libros cuyo precio es 0.

-- Igualmente para campos de tipo cadena, las siguientes sentencias "select" no retornan los mismos registros:

 select * from libros where editorial is null;
 select * from libros where editorial='';
-- Con la primera sentencia veremos los libros cuya editorial es igual a "null", con la segunda, los libros cuya editorial guarda una cadena vacía.

-- Entonces, para que un campo no permita valores nulos debemos especificarlo luego de definir el campo, agregando "not null". Por defecto, los campos permiten valores nulos, pero podemos especificarlo igualmente agregando "null".

-- Problema resuelto
-- Trabajamos con la tabla "libros" de una librería.

-- Borramos la tabla libros si existe:

drop table if exists libros;
-- Creamos la tabla especificando que los campos "titulo" y "autor" no admitan valores nulos:

create table libros(
  titulo text not null,
  autor text not null,
  editorial text,
  precio real
 );
-- Agregamos un registro a la tabla con valor nulo para el campo "precio":

 insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',null);
-- Recuerde que el valor "null" no es una cadena de caracteres, por lo tanto no se coloca entre comillas.

-- Ingresamos otro registro, con valor nulo para el campo "editorial", campo que admite valores "null":

 insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais','Lewis Carroll',null,0);
-- Veamos lo que sucede si intentamos ingresar el valor "null" en campos que no lo admiten, como "titulo":

 insert into libros (titulo,autor,editorial,precio)
  values(null,'Borges','Siglo XXI',25)
-- aparece un mensaje y la sentencia no se ejecuta.

-- Dijimos que el valor "null" no es lo mismo que una cadena vacía. Vamos a ingresar un registro con cadena vacía para el campo "editorial":

 insert into libros (titulo,autor,editorial,precio)
  values('Uno','Richard Bach','',18.50);
-- Ingresamos otro registro, ahora cargamos una cadena vacía en el campo "titulo":

 insert into libros (titulo,autor,editorial,precio)
  values('','Richard Bach','Planeta',22);
-- Veamos todos los registros ingresados:

select * from libros;
-- Recuperemos los registros que contengan el valor "null" en el campo "precio":

 select * from libros
  where precio is null;
-- La sentencia anterior tendrá una salida diferente a la siguiente:

 select * from libros
  where precio=0;
-- Con la primera sentencia veremos los libros cuyo precio es igual a "null" (desconocido); con la segunda, los libros cuyo precio es 0.

-- Recuperemos los libros cuyo nombre de editorial es "null":

 select * from libros
  where editorial is null;
-- Ahora veamos los libros cuya editorial almacena una cadena vacía:

 select * from libros
  where editorial=''; 
-- Para recuperar los libros cuyo precio no sea nulo tipeamos:

 select * from libros
  where precio is not null;
-- Problema propuesto
-- Una farmacia guarda información referente a sus medicamentos en una tabla llamada "medicamentos".

-- Borrar la tabla "medicamentos" si existe

drop table if exists medicamentos;
-- Crear la tabla ""medicamentos" con la siguiente estructura:

create table medicamentos (
	codigo integer not null,
	nombre text not null,
	laboratorio text,
	precio real,
	cantidad integer not null	
);
-- Ingrese algunos registros con valores "null" para los campos que lo admitan:

insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(1,'Sertal gotas',null,null,100); 
insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(2,'Sertal compuesto',null,8.90,150);
insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(3,'Buscapina','Roche',null,200);
-- Vea todos los registros.

-- Ingrese un registro con valor "0" para el precio y cadena vacía para el laboratorio.

-- Ingrese un registro con valor "0" para el código y cantidad y cadena vacía para el nombre.

-- Muestre todos los registros.

-- Intente ingresar un registro con valor nulo para un campo que no lo admite (aparece un mensaje de error)

-- Recupere los registros que contengan valor "null" en el campo "laboratorio", luego los que tengan una cadena vacía en el mismo campo. Note que el resultado es diferente.

-- Recupere los registros que contengan valor "null" en el campo "precio", luego los que tengan el valor 0 en el mismo campo. Note que el resultado es distinto.

-- Recupere los registros cuyo laboratorio no contenga una cadena vacía, luego los que sean distintos de "null".
-- Note que la salida de la primera sentencia no muestra los registros con cadenas vacías y tampoco los que tienen valor nulo; el resultado de la segunda sentencia muestra los registros con valor para el campo laboratorio (incluso cadena vacía).

-- Recupere los registros cuyo precio sea distinto de 0, luego los que sean distintos de "null".
-- Note que la salida de la primera sentencia no muestra los registros con valor 0 y tampoco los que tienen valor nulo; el resultado de la segunda sentencia muestra los registros con valor para el campo precio (incluso el valor 0).

drop table if exists medicamentos;

create table medicamentos (
	codigo integer not null,
	nombre text not null,
	laboratorio text,
	precio real,
	cantidad integer not null	
);

insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(1,'Sertal gotas',null,null,100); 
insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(2,'Sertal compuesto',null,8.90,150);
insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(3,'Buscapina','Roche',null,200);
  
select * from medicamentos;  

insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad)
  values(4,'Bayaspirina','',0,150);
  
insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(0,'','Bayer',15.60,0);  

select * from medicamentos;  
  
--insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
--  values(null,'Amoxidal jarabe','Bayer',25,120);  

select * from medicamentos
  where laboratorio is null;

select * from medicamentos
  where laboratorio='';
  
select * from medicamentos
  where precio is null;

select * from medicamentos
 where precio=0;  
 
select * from medicamentos
  where laboratorio<>'';

select * from medicamentos
  where laboratorio is not null; 
  
select * from medicamentos
  where precio<>0;

select * from medicamentos
  where precio is not null;  