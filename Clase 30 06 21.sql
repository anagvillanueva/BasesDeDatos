use colegio2409;
select nombre, length (nombre)
from alumnos
where length(nombre) = 7 -- length longitud de cadena 
order by 1;

select nombre, locate ('A', nombre) -- locate, que quiero encontrar y en donde 
from alumnos; 

select nombre, locate ('A', nombre) 
from alumnos
where locate ('A', nombre)= 0; -- nombres que no tengan A 

select nombre, locate('A', nombre), locate('A', nombre, 5) 
from alumnos;

select nombre, locate('A', nombre), locate('A', nombre, 5),
locate('A', nombre, locate('A', nombre)+1)
from alumnos;

select nombre, locate('Maria', nombre)
from alumnos;

select nombre, locate('Maria', nombre)
from alumnos
where locate('Maria', nombre) > 0;

select nombre, left(nombre, 4), right(nombre, 4), mid(nombre, 4),
mid(nombre, 4, 4), substr(nombre, 3, 4)
from alumnos;

select nombre, left(nombre, locate(' ', nombre)) primer_nombre,
right(nombre, locate(' ', nombre) + 1 )
from alumnos;

select nombre, sexo, if(sexo = 'f', 'mujer', 'no mujer')
from alumnos;

select nombre, sexo, if(sexo = 'm', 'hombre', 'sin dato') 
from alumnos;

select nombre, 
if(locate(' ', nombre) = 0,
nombre,
left(nombre, locate(' ', nombre))) primer_nombre, 
if(locate(' ', nombre) >0,
mid(nombre, locate(' ', nombre) +1), 
'')segundo_nombre
from alumnos;

select nombre, replace(nombre, 'A', '4') -- solo vista para cambiar A por 4, select es vista temporal 
from alumnos;

update alumnos set nombre = replace(nombre, 'A', '4'); -- aqui si lo cambiamos, no solo es vista

select * from alumnos where nombre like '%A%'; 

update alumnos set nombre = replace(nombre, '4', 'A');

select nombre, lower(nombre), upper(nombre), lcase(nombre), ucase(nombre)
from alumnos; -- minusculas, mayusculas, minusculas, mayusculas 

select nombre, ap_paterno, ap_materno, 
concat(nombre, ' ', ap_paterno, ' ', ap_materno) nombre_completo -- concatenacion
from alumnos;

select nombre, ap_paterno, ap_materno, 
concat(nombre, ' ', ap_paterno, ' ', ap_materno) nombre_completo,
length(concat(nombre, ' ', ap_paterno, ' ', ap_materno))largo
from alumnos
order by 5 desc;

select nombre, email
from alumnos
where locate ('@', email) = 0;

select nombre, left(md5(concat(nombre, sysdate())),8) pass
from alumnos;


select nombre, ap_paterno,
lower(concat(left(nombre,1), replace(ap_paterno,' ',''),
 if(sexo='f','@patito23.com','@patito24.com'))) email,
left(md5(concat(nombre, sysdate())),8) pass
from alumnos
where locate('@', email)=0;

-- concat_ws