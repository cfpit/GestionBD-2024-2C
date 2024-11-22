-- in

-- Se utiliza "in" para averiguar si el valor de un campo está incluido en una lista de valores especificada.

-- En la siguiente sentencia usamos "in" para averiguar si el valor del campo autor está incluido en la lista de valores especificada (en este caso, 2 cadenas).

-- Hasta ahora, para recuperar los libros cuyo autor sea 'Paenza' o 'Borges' usábamos 2 condiciones:

 select * from libros
  where autor='Borges' or autor='Paenza';
-- Podemos usar "in" y simplificar la consulta:

 select * from libros
  where autor in('Borges','Paenza');
-- Para recuperar los libros cuyo autor no sea 'Paenza' ni 'Borges' usábamos:

 select * from libros
  where autor<>'Borges' and
  autor<>'Paenza';
-- También podemos usar "in" anteponiendo "not":

 select * from libros
  where autor not in ('Borges','Paenza');
-- Empleando "in" averiguamos si el valor del campo está incluido en la lista de valores especificada; con "not" antecediendo la condición, invertimos el resultado, es decir, recuperamos los valores que no se encuentran (coinciden) con la lista de valores.

-- Los valores "null" no se consideran.

-- Problema resuelto
-- Trabajar con la tabla medicamentos.

drop table if exists medicamentos;
-- Cree la tabla con la siguiente estructura:

create table medicamentos(
	codigo integer primary key,
	nombre text,
	laboratorio text,
	precio real,
	cantidad integer
);
-- Ingrese algunos registros:

insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Sertal', 'Roche', 5.2, 1);
insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Buscapina', 'Roche', 4.10, 3);
insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Amoxidal 500', 'Bayer', 15.60, 100);
insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Paracetamol 500', 'Bago', 1.90, 20);
insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Bayaspirina', 'Bayer', 2.10, 150); 
insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Amoxidal jarabe', 'Bayer', 5.10, 250); 
-- Recupere los nombres y precios de los medicamentos cuyo laboratorio sea "Bayer" o "Bago" empleando el operador "in"

select nombre,precio from medicamentos
  where laboratorio in ('Bayer','Bago');  
-- Seleccione los remedios cuya cantidad se encuentre entre 1 y 5 empleando el operador "between" y luego el operador "in".
-- Note que es más conveniente emplear, en este caso, el operador ""between".

 select * from medicamentos
  where cantidad between 1 and 5;  


 select * from medicamentos
  where cantidad in (1,2,3,4,5);
  
  