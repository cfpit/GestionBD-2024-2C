-- triggers - delete

-- Una librería almacena los datos de sus libros en una tabla denominada "libros" y en otra tabla llamada "ventas", las ventas de los mismos.
-- Eliminamos las tablas si existen:

drop table if exists ventas;
drop table if exists libros;
-- Creamos las dos tablas con las siguientes estructuras:

 create table libros(
  codigo integer primary key,
  titulo text,
  autor text,
  editorial text,
  precio real, 
  stock integer
 );

 create table ventas(
  numero integer primary key,
  codigolibro integer,
  precio real,
  cantidad integer
 );
-- Insertamos algunos registros en la tabla "libros":

 insert into libros(titulo, autor, editorial, precio, stock)
  values('Uno','Richard Bach','Planeta',15,100);   
 insert into libros(titulo, autor, editorial, precio, stock)
  values('Ilusiones','Richard Bach','Planeta',18,50);
 insert into libros(titulo, autor, editorial, precio, stock)
  values('El aleph','Borges','Emece',25,200);
 insert into libros(titulo, autor, editorial, precio, stock)
  values('Aprenda PHP','Mario Molina','Emece',45,200); 
-- Del concepto anterior creamos nuevamente el disparador cuando se produce una venta para disminuir el stock de libros:

 drop trigger if exists disparador_ventas_borrar;
 
 create trigger disparador_ventas_borrar
   before insert on ventas
 begin
   select
     case when new.cantidad>libros.stock THEN
       raise ( ABORT, 'No hay stock suficiente de ese libro')
     end
     from libros where new.codigolibro=libros.codigo; 
   update libros set stock=libros.stock-new.cantidad
     where new.codigolibro=libros.codigo; 
 end; 
-- Creamos un nuevo disparador para actualizar el campo "stock" de la tabla "libros" cuando se elimina un registro de la tabla "ventas" (por ejemplo, si el comprador devuelve los libros comprados):

 drop trigger if exists disparador_devolucion_libro; 
 
 create trigger disparador_devolucion_libro
   before delete on ventas
 begin
   update libros set stock=libros.stock+old.cantidad
     where old.codigolibro=libros.codigo; 
 end; 
-- Podemos comprobar que este disparados se ejecuta para el comando "delete" de la tabla "ventas":

   before delete on ventas
-- Efectuemos primero una venta:

 insert into ventas(codigolibro, precio, cantidad) values(1, 15, 1);
-- Podemos comprobar que disminuye el stock en 1

-- Ahora eliminaremos la venta mediante la ejecución del comando 'delete' en la tabla "ventas":

delete from ventas where numero=1;
-- Si ahora vemos el contenido de la tabla "libros" podremos comprobar que se ha incrementado en 1 el stock


