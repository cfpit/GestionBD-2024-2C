-- triggers

-- Un "trigger" (disparador o desencadenador) es un bloque de algoritmo que se ejecuta cuando se intenta modificar los datos de una tabla.

-- Se definen para una tabla específica.

-- Se crean para conservar la integridad referencial y la coherencia entre los datos entre distintas tablas.

-- Si se intenta modificar (agregar, actualizar o eliminar) datos de una tabla en la que se definió un disparador para alguna de estas acciones (inserción, actualización y eliminación), el disparador se ejecuta (se dispara) en forma automática.

-- Un trigger se asocia a un evento (insert, update o delete) sobre una tabla.

-- Las palabras claves que pueden intervenir en la definición de un trigger son:

create trigger [if not exists] nombre-del-trigger
   [before o after o instead of] [insert o delete o update] 
   on nombre-de-la-tabla
   [when condición]
begin
 instrucciones-sql;
end;




-- Partes de un trigger (disparador)
-- Mediante las palabras claves before (antes), after (después) e instead of (en lugar de) indicamos en que momento se ejecutará el bloque del trigger.

-- Luego indicamos para cual comando SQL se invocará el trigger, pudiendo ser cualquiera de los tres comandos SQL: INSERT, UPDATEo DELETE.

-- Después de la palabra clave 'on' indicamos el nombre de la tabla a la que se asocia el trigger.

-- La cláusula 'when' es opcional y nos permite que el trigger se ejecute solo cuando la condición es verdadera. En caso de que omita la cláusula 'when', el desencadenador se ejecuta para todas las filas.

-- Finalmente, colocamos la lógica del trigger dentro del bloque 'begin' 'end', podemos utilizar uno o más comandos SQL válidos.


-- EJERCICIO


-- Necesitamos almacenar en una tabla llamada "usuarios" los datos de los usuarios de un sitio web. Cada vez que el usuario cambia su clave se debe almacenar en otra tabla llamada "clavesanteriores" el dato de la clave vieja.

-- Borramos las dos tablas si existen:

drop table if exists usuarios;
drop table if exists clavesanteriores;
Creamos ambas tablas con las siguientes estructuras:

create table usuarios(
 nombre text primary key,
 clave text
);

create table clavesanteriores(
  nombre text,
  clave text
);
-- Si existe el trigger 'disparador_claves_anteriores' procedemos a borrarlo:

drop trigger if exists disparador_claves_anteriores;
-- Creamos el trigger 'disparador_claves_anteriores':

create trigger disparador_claves_anteriores
   before update
   on usuarios
begin
   insert into clavesanteriores(nombre, clave) values (old.nombre, old.clave); 
end;
-- Este trigger se ejecutará cada vez que ejecutemos el comando SQL 'update' con la tabla 'usuarios':

   -- before update
   -- on usuarios
-- El bloque del disparador se encuentra encerrado entre las palabras claves 'begin' y 'end'. Nuestro algoritmo es ejecutar un comando SQL insert en la tabla 'clavesanteriores' insertando el nombre de usuario y clave previo a ser cambiado por el comando 'update' en la tabla 'usuarios'.

-- Mediante las palabras claves 'old' y 'new' podemos acceder a los valores actuales de la fila y los valores que se actualizarán en la tabla 'usuarios':

-- old.nombre y old.clave
-- new.nombre y new.clave
-- Ejecutemos ahora un insert en la tabla 'usuarios':

insert into usuarios(nombre,clave) values ('marcos','123abc');
-- El trigger no se ejecuta ya que solo hemos definido que se dispare para el comando 'update'.

-- Ahora procedamos a modificar la clave del usuario mediante el comando 'update':

update usuarios set clave='323aass' where nombre='marcos';
-- Cuando se ejecuta el 'update' además de actualizarse la clave del usuario en la tabla 'usuarios' se dispara el trigger donde se efectúa la inserción de una fila en la tabla 'clavesanteriores'.

-- Listemos la tabla 'clavesanteriores'

select * from clavesanteriores;
-- Podemos comprobar que tenemos ahora una fila que contiene los datos:

-- nombre: marcos
-- clave: 123abc
-- Si volvemos a cambiar la clave del usuario 'marcos':

update usuarios set clave='123456' where nombre='marcos';
-- Listamos nuevamente la tabla 'clavesanteriores':

select * from clavesanteriores;
-- Podemos comprobar que tenemos ahora dos filas que contiene los datos:

-- nombre: marcos
-- clave: 123abc
-- nombre: marcos
-- clave: 323aass
-- Con el trigger logramos tener el historial de todas las claves empleadas por los usuarios. Tener en cuenta que la última clave elegida por el usuario se encuentra en la tabla 'usuarios':

select * from usuarios;