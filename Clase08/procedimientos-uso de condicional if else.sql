-- Creamos un procedimiento almacenado que muestre el mayor de 2 enteros que le pasamos como parámetro:
create database procedimientos;

use procedimientos;


drop procedure if exists pa_mayor;

delimiter //
create procedure pa_mayor
	(in valor1 int,in valor2 int)
begin
  if valor1>valor2 then
    select valor1;
  else
    select valor2;
  end if;
end //
delimiter ;

call pa_mayor(20, 400);

-- Podemos utilizar operadores lógicos en una condición de un if, crearemos un nuevo procedimiento
-- almacenado que muestre el mayor de 3 enteros:

drop procedure if exists pa_mayor3;

delimiter //
create procedure pa_mayor3
(
  in valor1 int,
  in valor2 int,
  in valor3 int
)
begin
  if valor1>valor2 and valor1>valor3 then
    select valor1;
  elseif valor2>valor3 then
    select valor2;
  else
    select valor3;
  end if;
end //
delimiter ;

call pa_mayor3(200, 40, 4000);


-- Ejercicio: 

-- Borramos las tablas si existen y procedemos a crearlas:

 drop table if exists clientes;
 drop table if exists provincias;

 create table clientes (
  codigo int unsigned auto_increment,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint unsigned,
  telefono varchar(11),
  primary key(codigo)
 );

 create table provincias(
  codigo tinyint unsigned auto_increment,
  nombre varchar(20),
  primary key (codigo)
 );

-- Cargamos una serie de registros en las tablas:

 insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');
 insert into provincias (nombre) values('Misiones');
 insert into provincias (nombre) values('Salta');
 insert into provincias (nombre) values('Buenos Aires');
 insert into provincias (nombre) values('Neuquen');

 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Lopez Marcos', 'Colon 111', 'Córdoba',1,'null');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Perez Ana', 'San Martin 222', 'Cruz del Eje',1,'4578585');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Garcia Juan', 'Rivadavia 333', 'Villa Maria',1,'4578445');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Perez Luis', 'Sarmiento 444', 'Rosario',2,null);
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Pereyra Lucas', 'San Martin 555', 'Cruz del Eje',1,'4253685');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Gomez Ines', 'San Martin 666', 'Santa Fe',2,'0345252525');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Torres Fabiola', 'Alem 777', 'Villa del Rosario',1,'4554455');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Lopez Carlos', 'Irigoyen 888', 'Cruz del Eje',1,null);
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Ramos Betina', 'San Martin 999', 'Cordoba',1,'4223366');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Lopez Lucas', 'San Martin 1010', 'Posadas',4,'0457858745');

select * from clientes;
select * from provincias;


-- Crearemos un procedimiento almacenado que le enviemos como parámetro los nombres de dos 
-- provincias y genere como resultado el nombre de la provincia que tiene más clientes y su 
-- cantidad, en caso de tener la misma cantidad mostrar las dos provincias y la cantidad:

drop procedure if exists pa_mas_clientes_provincias;

delimiter //
 create procedure pa_mas_clientes_provincias(
   in provincia1 varchar(20),
   in provincia2 varchar(20))
 begin
   declare canti1 int;
   declare canti2 int;
   select count(*) into canti1 from clientes as cli
     join provincias as pro 
     on pro.codigo=cli.codigoprovincia
     where pro.nombre=provincia1;
   select count(*) into canti2 from clientes as cli
     join provincias as pro 
     on pro.codigo=cli.codigoprovincia
     where pro.nombre=provincia2;     
   if canti1>canti2 then
     select provincia1,canti1;
   elseif canti2>canti1 then
     select provincia2,canti2;
   else
     select provincia1,provincia2,canti1;
   end if;  
 end //
 delimiter ;
 

-- Llamamos luego al procedimiento almacenado pasando dos provincias:

 call pa_mas_clientes_provincias('Cordoba','Santa Fe');