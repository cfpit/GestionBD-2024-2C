-- Unión

-- Trabajamos con las tablas "alumnos" y "profesores".
-- Eliminamos ambas tablas si existen:

drop table if exists alumnos;
drop table if exists profesores;
-- Creamos las dos tablas:

create table alumnos(
  documento text primary key,
  nombre text,
  domicilio text
 );
 
 create table profesores(
  documento text primary key,
  nombre text,
  domicilio text
 );
-- Almacenamos algunos registros de prueba:

 insert into alumnos (documento,nombre,domicilio)
   values('30000000','Juan Perez','Colon 123');
 insert into alumnos (documento,nombre,domicilio)
  values('30111111','Marta Morales','Caseros 222');
 insert into alumnos (documento,nombre,domicilio)
  values('30222222','Laura Torres','San Martin 987');
 insert into alumnos (documento,nombre,domicilio)
  values('30333333','Mariano Juarez','Avellaneda 34');
 insert into alumnos (documento,nombre,domicilio)
  values('23333333','Federico Lopez','Colon 987');
 
 insert into profesores (documento,nombre,domicilio)
  values('22222222','Susana Molina','Sucre 345');
 insert into profesores (documento,nombre,domicilio)
  values('23333333','Federico Lopez','Colon 987'); 
-- La academia necesita el nombre y domicilio de profesores y alumnos para enviarles una tarjeta de invitación. Empleamos el operador "union" para obtener dicha información de ambas tablas:

 select nombre, domicilio from alumnos
  union
 select nombre, domicilio from profesores; 
-- Note que existe un profesor que también está presente en la tabla "alumnos"; dicho registro aparece una sola vez en el resultado de "union". Si queremos que las filas duplicadas aparezcan, debemos emplear "all":

 select nombre, domicilio from alumnos
  union all
 select nombre, domicilio from profesores; 
-- Ordenamos por domicilio:

 select nombre, domicilio from alumnos
  union
 select nombre, domicilio from profesores
  order by domicilio; 
-- Podemos agregar una columna extra a la consulta con el encabezado "condicion" en la que aparezca el literal "profesor" o "alumno" según si la persona es uno u otro:

 select nombre, domicilio, 'alumno' as condicion from alumnos
  union
 select nombre, domicilio,'profesor' from profesores
  order by condicion;  
  
  