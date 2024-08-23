-- listar el nombre de las editoriales y el nombre
-- de los libros publicados
use pubs;

select 		pub_name as editorial,
			title as titulo
from		publishers p
inner join	titles t
on			p.pub_id = t.pub_id;

-- Listar el nombre y apellido de los autores que
-- han escrito libros de cocina. indicar cuando se 
-- publicaron dichos libros.
select		concat(a.au_fname,' ',a.au_lname) as autor,
			title as titulo,
			type as categoria,
			pubdate as 'Fecha de Publicacion'
from		authors a
inner join	titleauthor ta on a.au_id = ta.au_id
inner join	titles t on ta.title_id = t.title_id
where		t.type like '%cook%';

-- listar los titulos que nunca se vendieron
-- tabla ppal: titles
select		t.title as titulo
			-- , s.*
from		sales s  
right join 	titles t
on			s.title_id = t.title_id
where		s.stor_id is null;













