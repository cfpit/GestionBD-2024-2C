-- selecciono la base x defecto
use pubs;

-- mostrar las tablas de la base
show tables;

-- veo la estructura de la tabla titles
describe titles;

-- funciones de agrupacion
select max(price) 'libro mas caro' from titles;
select min(hire_date) 'ingreso del 1er empleado' from employee;
select avg(job_lvl) 'promedio de horas' from employee;
select sum(price) 'sumatoria de precio' from titles;
select count(emp_id) 'cantidad de empleados' from employee;

-- Agrupaciones
-- listar la cantidad de libros agrupados por categoria
select		type as categoria,
			count(title_id) cantidad
from		titles
group by	type;













