-- foreign key en la misma tabla 

-- Una mutual almacena los datos de sus afiliados en una tabla llamada "afiliados". Algunos afiliados inscriben a sus familiares. La tabla contiene un campo que hace referencia al afiliado que lo incorporó a la mutual, del cual dependen.

-- Eliminamos la tabla si existe:

drop table if exists afiliados;
-- Creamos la tabla y definimos la restricción "foreign key":

 create table afiliados(
  numero integer primary key,
  documento text,
  nombre text,
  afiliadotitular integer references afiliados(numero)
 );
-- En caso que un afiliado no haya sido incorporado a la mutual por otro afiliado, el campo "afiliadotitular" almacenará "null".

-- Luego de aplicar esta restricción, cada vez que se ingrese un valor en el campo "afiliadotitular", SQLite controlará que dicho número exista en la tabla, si no existe, mostrará un mensaje de error.

-- Ingresemos una filas con valores correctos en el campo afiliadotitular:

 insert into afiliados(documento,nombre,afiliadotitular) values('22222222','Perez Juan',null);
 insert into afiliados(documento,nombre,afiliadotitular) values('23333333','Garcia Maria',null);
 insert into afiliados(documento,nombre,afiliadotitular) values('24444444','Lopez Susana',null);
 insert into afiliados(documento,nombre,afiliadotitular) values('30000000','Perez Marcela',1);
 insert into afiliados(documento,nombre,afiliadotitular) values('31111111','Morales Luis',1);
 insert into afiliados(documento,nombre,afiliadotitular) values('32222222','Garcia Maria',2); 
-- Intentemos ahora ingresar un afiliado con valor incorrecto en el campo 'afiliadotitular':

 insert into afiliados(documento,nombre,afiliadotitular) values('77777777','Rodriguez Pablo',100); 
 -- Si intentamos eliminar un afiliado que es titular de otros afiliados, no se podrá hacer:

delete from afiliados where numero=1;