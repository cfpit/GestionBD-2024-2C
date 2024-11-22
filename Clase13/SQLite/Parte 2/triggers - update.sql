-- triggers - update

-- Una librería almacena los datos de sus libros en una tabla denominada "libros".
Eliminamos la tabla "libros" si existe:

drop table if exists libros;
-- Creamos la tabla "libros" con la siguiente estructura:

 create table libros(
  codigo integer primary key,
  titulo text,
  autor text,
  editorial text,
  precio real, 
  stock integer
 );
-- Almacenamos 4 filas en la tabla "libros":

 insert into libros(titulo, autor, editorial, precio, stock)
  values('Uno','Richard Bach','Planeta',15,100);   
 insert into libros(titulo, autor, editorial, precio, stock)
  values('Ilusiones','Richard Bach','Planeta',18,50);
 insert into libros(titulo, autor, editorial, precio, stock)
  values('El aleph','Borges','Emece',25,200);
 insert into libros(titulo, autor, editorial, precio, stock)
  values('Aprenda PHP','Mario Molina','Emece',45,200); 
-- Modificamos el precio del libro con código 1 con el valor 500:

 update libros set precio=500 where codigo=1;
-- Si imprimimos la tabla "libros" podemos comprobar que el libro con código 1 tiene un nuevo precio:

 select * from libros;
-- Crearemos un trigger que congele los precios de todos los libros, es decir que no se le puedan cambiar su precio:

 create trigger disparador_congelar_precios_libros
   before update on libros
 begin
   select
     case when new.precio<>old.precio THEN
       raise ( ABORT, 'Los precios de los libros estan congelados, no se pueden cambiar')
     end
     from libros where new.codigo=libros.codigo; 
 end;    
-- Intentemos ahora cambiar nuevamente el precio del libro con código 1:

update libros set precio=1000 where codigo=1;
-- Como podemos comprobar ahora se ejecuta el trigger "disparador_congelar_precios_libros" donde se verifica si el nuevo precio es distinto al viejo precio se eleva una excepción y se evitan los cambios en la tabla "libros"

-- Ahora procedamos a eliminar el trigger "disparador_congelar_precios_libros":

 drop trigger disparador_congelar_precios_libros;
-- Ahora si podemos modificar nuevamente los precios de los libros:

 update libros set precio=1000 where codigo=1;

 select * from libros;
 
 