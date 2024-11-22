-- count

-- Existen en SQLite funciones que nos permiten contar registros, calcular sumas, promedios, obtener valores máximos y mínimos. Estas funciones se denominan funciones de agregado y operan sobre un conjunto de valores (registros), no con datos individuales y devuelven un único valor.

-- Imaginemos que nuestra tabla "libros" contiene muchos registros. Para averiguar la cantidad sin necesidad de contarlos manualmente usamos la función "count()":

 select count(*)
  from libros;
-- La función "count()" cuenta la cantidad de registros de una tabla, incluyendo los que tienen valor nulo.

-- También podemos utilizar esta función junto con la cláusula "where" para una consulta más específica. Queremos saber la cantidad de libros de la editorial "Planeta":

 select count(*)
  from libros
  where editorial='Planeta';
-- Para contar los registros que tienen precio (sin tener en cuenta los que tienen valor nulo), usamos la función "count()" y en los paréntesis colocamos el nombre del campo que necesitamos contar:

 select count(precio)
  from libros;
-- Note que "count(*)" retorna la cantidad de registros de una tabla (incluyendo los que tienen valor "null") mientras que "count(precio)" retorna la cantidad de registros en los cuales el campo "precio" no es nulo. No es lo mismo. "count(*)" cuenta registros, si en lugar de un asterisco colocamos como argumento el nombre de un campo, se contabilizan los registros cuyo valor en ese campo NO es nulo.

-- Problema resuelto
-- Trabajamos con la tabla "medicamentos".

drop table if exists medicamentos;
-- Creamos la tabla con la siguiente estructura:

create table medicamentos(
	codigo integer primary key,
	nombre text,
	laboratorio text,
	precio real,
	cantidad integer
);
-- Ingresamos algunos registros:

insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Sertal', null, null, 100);
insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Buscapina', null, 4.10, null);
insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Amoxidal 500', 'Bayer', 15.60, 100);
insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Paracetamol 500', 'Bago', 1.90, 200);
insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Bayaspirina', 'Bayer', 2.10, 150); 
insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Amoxidal jarabe', 'Bayer', 5.10, 250); 
insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Sertal compuesto', 'Bayer', 5.10, 130); 
insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Paracetamol 1000', 'Bago', 2.90, 90);
insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Amoxinil', 'Roche', 17.80, 230); 
-- Muestre la cantidad de registros empleando la función "count(*)"

select count(*)
  from medicamentos;
-- Retorna que hay 9 registros en la tabla.

-- Contamos la cantidad de medicamentos que tienen laboratorio conocido

select count(laboratorio)
   from medicamentos;  
-- Retorna 7 registros.

-- Contar la cantidad de medicamentos que tienen precio distinto a "null" y que tienen cantidad distinto a "null", disponer alias para las columnas

select count(precio) as conprecio,
  count(cantidad) as concantidad
  from medicamentos;   
-- Contar la cantidad de remedios con precio conocido, cuyo laboratorio comience con "B"

select count(precio)
  from medicamentos
  where laboratorio like 'B%';  
-- Problema propuesto
-- Trabaje con la tabla "agenda" que registra la información referente a sus amigos.

-- Borrar la tabla "agenda" si existe

-- Crear la tabla "agenda" con la siguiente estructura:

create table agenda(
	apellido text,
	nombre text,
	domicilio text,
	telefono text,
	mail text
);

-- Ingrese los siguientes registros:

insert into agenda(apellido,nombre,domicilio,telefono,mail)
 values('Perez','Juan','Sarmiento 345','4334455','juancito@gmail.com');
insert into agenda(apellido,nombre,domicilio,telefono,mail)
 values('Garcia','Ana','Urquiza 367','4226677','anamariagarcia@hotmail.com');
insert into agenda(apellido,nombre,domicilio,telefono,mail)
 values('Lopez','Juan','Avellaneda 900',null,'juancitoLopez@gmail.com');
insert into agenda(apellido,nombre,domicilio,telefono,mail)
 values('Juarez','Mariana','Sucre 123','0525657687','marianaJuarez2@gmail.com');
insert into agenda(apellido,nombre,domicilio,telefono,mail)
 values('Molinari','Lucia','Peru 1254','4590987','molinarilucia@hotmail.com');
insert into agenda(apellido,nombre,domicilio,telefono,mail)
 values('Ferreyra','Patricia','Colon 1534','4585858',null);
insert into agenda(apellido,nombre,domicilio,telefono,mail)
 values('Perez','Susana','San Martin 333',null,null);
insert into agenda(apellido,nombre,domicilio,telefono,mail)
 values('Perez','Luis','Urquiza 444','0354545256','perezluisalberto@hotmail.com');
insert into agenda(apellido,nombre,domicilio,telefono,mail)
 values('Lopez','Maria','Salta 314',null,'lopezmariayo@gmail.com');
-- Cuente cuántos de sus amigos tienen mail.

-- Cuente cuántos de sus amigos tienen teléfono.

-- Cuente cuántos se apellidan "Perez".

drop table if exists agenda;
 
create table agenda(
	apellido text,
	nombre text,
	domicilio text,
	telefono text,
	mail text
);

insert into agenda(apellido,nombre,domicilio,telefono,mail)
 values('Perez','Juan','Sarmiento 345','4334455','juancito@gmail.com');
insert into agenda(apellido,nombre,domicilio,telefono,mail)
 values('Garcia','Ana','Urquiza 367','4226677','anamariagarcia@hotmail.com');
insert into agenda(apellido,nombre,domicilio,telefono,mail)
 values('Lopez','Juan','Avellaneda 900',null,'juancitoLopez@gmail.com');
insert into agenda(apellido,nombre,domicilio,telefono,mail)
 values('Juarez','Mariana','Sucre 123','0525657687','marianaJuarez2@gmail.com');
insert into agenda(apellido,nombre,domicilio,telefono,mail)
 values('Molinari','Lucia','Peru 1254','4590987','molinarilucia@hotmail.com');
insert into agenda(apellido,nombre,domicilio,telefono,mail)
 values('Ferreyra','Patricia','Colon 1534','4585858',null);
insert into agenda(apellido,nombre,domicilio,telefono,mail)
 values('Perez','Susana','San Martin 333',null,null);
insert into agenda(apellido,nombre,domicilio,telefono,mail)
 values('Perez','Luis','Urquiza 444','0354545256','perezluisalberto@hotmail.com');
insert into agenda(apellido,nombre,domicilio,telefono,mail)
 values('Lopez','Maria','Salta 314',null,'lopezmariayo@gmail.com');
 
select count(mail)
  from agenda; 
  
select count(telefono)
  from agenda;  
  
select count(*)
  from agenda
  where apellido like '%Perez%';  