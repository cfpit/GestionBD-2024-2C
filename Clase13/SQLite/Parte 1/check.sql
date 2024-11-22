-- check

-- La restricción "check" especifica los valores que acepta un campo, evitando que se ingresen valores inapropiados cuando ejecutamos un comando insert o update.

-- Definimos la restricción "check" cuando creamos la tabla:

create table libros(
	codigo integer primary key,
	titulo text,
	autor text, 
	editorial text,
	precio real check(precio >= 0)
);
-- Definimos la restricción para el campo precio indicando que el valor a almacenar no puede ser negativo:

	-- precio real check(precio >= 0)
-- Luego si efectuamos un insert y tratamos de insertar un valor negativo para el campo precio:

insert into libros (titulo, autor, editorial, precio)
  values('El aleph', 'Borges', 'Emece', -100);
-- CHECK constraint failed: libros: 

 insert into libros (titulo, autor, editorial, precio)
  values('El aleph', 'Borges', 'Emece', -100);
-- La inserción no se efectúa ya que no se cumple la restricción para el campo precio.

-- Si tenemos la tabla "visitantes" y queremos restringir el campo "sexo" para permitir ingresar solo los caractes "m" o "f" luego podemos definir la siguiente restricción:

create table visitantes(
	codigo integer primary key,
	nombre text,
	edad integer,
	sexo text check(sexo in ('m','f')),
	domicilio text,
	ciudad text,
	telefono text,
	mail text,
	montocompra real
);  
-- Si intentamos ingresar un valor no válido para el campo "sexo" luego se genera un error y no se produce la carga:

 insert into visitantes(nombre, edad, sexo, domicilio, ciudad, telefono, mail, montocompra)
  values ('Marcos Molina',35,'x','Colon 123','Carlos Paz','32322122',null,59.80);
-- Tenemos como resultado:

CHECK constraint failed: visitantes:   

 insert into visitantes(nombre, edad, sexo, domicilio, ciudad, telefono, mail, montocompra)
  values ('Marcos Molina',35,'x','Colon 123','Carlos Paz','32322122',null,59.80);
-- Si se permite que se ingrese el valor null:

 insert into visitantes(nombre, edad, sexo, domicilio, ciudad, telefono, mail, montocompra)
  values ('Marcos Molina',35,null,'Colon 123','Carlos Paz','32322122',null,59.80);
-- A menor que definamos el campo de tipo not null:

create table visitantes(
	codigo integer primary key,
	nombre text,
	edad integer,
	sexo text not null check(sexo in ('m','f')),
	domicilio text,
	ciudad text,
	telefono text,
	mail text,
	montocompra real
);  
-- NOT NULL constraint failed: visitantes.sexo:   

 insert into visitantes(nombre, edad, sexo, domicilio, ciudad, telefono, mail, montocompra)
  values ('Marcos Molina',35,null,'Colon 123','Carlos Paz','32322122',null,59.80);
-- Problema resuelto
-- Trabajar con la tabla "autos" y definir restricciones para los campos "patente", "modelo" y "precio".

-- Eliminamos la tabla "autos" si existe:

drop table if exists autos;
Creamos la tabla "autos" con las restricciones respectivas:

 create table autos(
	patente text primary key check(patente regexp '^[A-Z]{2}[0-9]{3}[A-Z]{2}$'),
	marca text,
	modelo integer check(modelo>1900),
	precio real check(precio>0)
 );
-- Definimos una expresión regular para el campo patente obligando la carga de dos letras, 3 números y finalmente 2 letras.

-- Intentemos de cargar una patente incorrecta:

 insert into autos(patente, marca, modelo, precio)
  values('123', 'Fiat 128', 1970, 15000);
-- Luego no se efectúa el insert:

-- CHECK constraint failed: autos: 

 insert into autos(patente, marca, modelo, precio)
  values('123', 'Fiat 128', 1970, 15000);
-- Ahora si carguemos una patente válida:

 insert into autos(patente, marca, modelo, precio)
  values('AC123FG', 'Fiat 128', 1970, 15000);
-- Ahora sí obtenemos un resultado positivo:

-- Consulta ejecutada con éxito: insert into autos(patente, marca, modelo, precio)
  -- values('AC123FG', 'Fiat 128', 1970, 15000); (tardó 0ms, 1 líneas afectadas)
-- Carguemos un valor incorrecto para el modelo:

 insert into autos(patente, marca, modelo, precio)
  values('AC123FG', 'Fiat 128', 1500, 15000);
-- Se obtiene como resultado:

-- CHECK constraint failed: autos: 

 insert into autos(patente, marca, modelo, precio)
  values('AC123FG', 'Fiat 128', 1500, 15000);