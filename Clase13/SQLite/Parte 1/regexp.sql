-- regexp

-- Los operadores "regexp" y "not regexp" busca patrones de modo similar a "like" y "not like".

-- Una expresión regular es una técnica que nos permite identificar si un string coincide con un patrón determinado.

-- Un ejemplo clásico es determinar si un email está correctamente almacenado(sabemos que comienza con uno o más caracteres alfanuméricos, luego el carácter @ seguido de uno o más caracteres alfanuméricos, luego el carácter '.' y finalmente otros caracteres alfabéticos)

-- Existe toda una serie de reglas para crear las expresiones regulares que iremos viendo.

-- Problema resuelto
-- Trabajar con la tabla "libros".

drop table if exists libros;
-- Crear la tabla con la siguiente estructura:

create table libros(
	codigo integer primary key,
	titulo text,
	autor text, 
	editorial text,
	precio real
);
-- Insertar los siguientes registros:

 insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Planeta',15.50);
 insert into libros (titulo,autor,editorial,precio)
  values('Martin Fierro','Jose Hernandez','Emece',22.90);
 insert into libros (titulo,autor,editorial,precio)
  values('Antologia poetica','J.L. Borges','Planeta',39);
 insert into libros (titulo,autor,editorial,precio)
  values('Aprenda PHP','Mario Molina','Emece',19.50);
 insert into libros (titulo,autor,editorial,precio)
  values('Cervantes y el quijote','Bioy Casare- J.L. Borges','Paidos',35.40);
 insert into libros (titulo,autor,editorial,precio)
  values('El Manual de PHP', 'J.C. Paez', 'Paidos',19);
 insert into libros (titulo,autor,editorial,precio)
  values('Harry Potter y la piedra filosofal','J.K. Rowling','Paidos',45.00);
 insert into libros (titulo,autor,editorial,precio)
  values('Harry Potter y la camara secreta','J.K. Rowling','Paidos',46.00);
 insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',36.00);  
-- Para buscar los títulos de los libros que contengan la cadena "Ma" en cualquier parte usamos:

 select titulo from libros
  where titulo regexp 'Ma';
-- Los libros que contienen esta subcadena son:

-- Martin Fierro
-- El Manual de PHP
-- Para buscar los autores que tienen al menos una "H" o una "k" o una "w" tipeamos:

 select titulo,autor from libros
  where autor regexp '[Hkw]';  
-- Los autores que cumplen esta expresión regular son:

-- Jose Hernandez
-- J.K. Rowling
-- J.K. Rowling
-- Lewis Carroll
-- Es sensible a mayúsculas y minúsculas.

-- Para buscar los autores que no tienen ni "H" o una "k" o una "w" tipeamos:

 select autor from libros
  where autor not regexp '[Hkw]';  
-- Para buscar los autores que tienen por lo menos una de las letras de la "a" hasta la "d", es decir, "a,b,c,d", usamos:

 select autor from libros
  where autor regexp '[a-d]';  
-- Para ver los títulos que comienzan con "A" tipeamos:

 select titulo from libros
  where titulo regexp '^A';  
-- Para ver los títulos que terminan en "HP" usamos:

select titulo from libros
  where titulo regexp 'HP$';  
-- Para buscar títulos que contengan una "a" luego un caracter cualquiera y luego una "e" utilizamos la siguiente sentencia:

 select titulo from libros
  where titulo regexp 'a.e';
-- El punto (.) identifica cualquier caracter.

-- Podemos mostrar los títulos que contienen una "a" seguida de 2 caracteres y luego una "e":

select titulo from libros
  where titulo regexp 'a..e';  
-- Para buscar autores que tengan 6 caracteres exactamente usamos:

 select autor from libros
  where autor regexp '^......$';
-- Para buscar autores que tengan al menos 6 caracteres usamos:

 select autor from libros
  where autor regexp '......';
-- Cuando tenemos que buscar en el string alguno de los caracteres que tienen un significado especial en las expresiones regulares '^ $. * +? =! : | \ / () [] {} ' debemos escaparlos dentro de los corchetes.

 insert into libros (titulo,autor,editorial,precio)
  values('Como ganar $ en esta vida','Rodriguez Pablo','Paidos',25.00);  
 select titulo from libros
  where titulo regexp '\$'; 
-- Si queremos buscar el caracter $ debemos anteceder el caracter de escape \

-- Ahora veremos que podemos inicializar luego que indicamos entre corchetes el patrón a buscar la cantidad de veces que puede repetirse este patrón.
-- Son útiles para controlar la cantidad de repeticiones del patrón definido.

-- Se especifican luego del corchete donde definimos los caracteres permitidos. Verificar si el precio del libro tiene entre 3 y 6 dígitos:

 insert into libros (titulo,autor,editorial,precio)
  values('Python','Charles Dierbach','Wiley',100.24);    
 select titulo, precio from libros
  where precio regexp '[0-9]{3,6}'; 
-- Este último registro insertado cumple que el precio tiene entre 3 y 6 dígitos la parte entera.