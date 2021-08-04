SELECT SKYDATE();

select database();

select user();

select now(), database(), current_time(), current_date();

select 34*4, 67 +100,500/3;

select year(now()), day(now()), year (now()) * day(now());

select year(now()) as anio, day(now()) dia, year (now()) * day(now()) as 'multiplicar dia por anio';

select 'Hola mundo' saludo;

show tables;

select * from alumnos;

select clave_alu, nombre, ap_paterno paterno, curp
from alumnos;

select nombre from alumnos; 

select DISTINCT nombre from alumnos;

select nombre from alumnos order by nombre;

select DISTINCT nombre from alumnos order by nombre;

select DISTINCT nombre, ap_paterno, ap_materno from alumnos order by nombre;

select DISTINCT sexo from alumnos;

select DISTINCT ciudad from alumnos;

select * from alumnos where sexo ='f';

select DISTINCT nombre 
from alumnos
WHERE sexo = 'f'
order by nombre;

select DISTINCT nombre, ap_paterno, ap_materno
from alumnos
WHERE sexo = 'f' AND ciudad = 'queretaro'
order by nombre;

select DISTINCT nombre, ap_paterno, ap_materno, sexo, ciudad
from alumnos
WHERE sexo = 'f' OR ciudad = 'queretaro' -- AND con uno y otro, OR con uno u otro 
order by nombre;

select sexo 
from alumnos
group by sexo;

select count(*) from alumnos;

select ciudad, sexo, count(*) nalumnos
from alumnos
group by ciudad, sexo
order by ciudad;

select ciudad, sexo, count(*) nalumnos
from alumnos
where ciudad = 'QUERETARO' OR ciudad = 'corregidora'
group by ciudad, sexo
order by ciudad;

select ciudad, count(*) nalumnos
from alumnos
group by ciudad
order by ciudad;

select ciudad, count(*) nalumnos
from alumnos
group by ciudad
order by 2 DESC; -- Por la posicion, segundo campo 

select ciudad, count(*) nalumnos
from alumnos
group by ciudad
having count(*) <= 10 -- Ver las ciudades que tienen menor de 10 o 10 alumnos
order by 2 DESC;

select ciudad, count(*) nalumnos
from alumnos
where sexo = 'f'
group by ciudad
having count(*) <= 10
order by 2 DESC;

select ciudad, count(*) nalumnos
from alumnos
where sexo = 'f'
group by ciudad
having count(*) <= 10
order by 2 DESC
LIMIT 5;

-- 25/06/21 

use colegio2409;

select * from alumnos;
select * from pagos;
select * from pagos where clave_alu = '11030172' order by 1;

select *
from alumnos a, pagos p
where 
a.clave_alu = p.clave_alu
AND a.clave_alu = '11030172' 
order by 1;

select sexo ,count(*) nalu, sum(peso) suma_peso, max(peso) as peso_maximo, min(peso) pesoMinimo, avg(peso) promedioPeso 
from alumnos
where ciudad <> 'QUERETARO'
group by sexo
order by 4 ASC;

select ciudad ,count(*) nalu, sum(peso) suma_peso, max(peso) as peso_maximo, min(peso) pesoMinimo, avg(peso) promedioPeso 
from alumnos
group by ciudad
order by 4 ASC;

select ciudad ,count(*) nalu, sum(peso) suma_peso, max(peso) as peso_maximo, min(peso) pesoMinimo, avg(peso) promedioPeso 
from alumnos
group by ciudad
order by 3 desc, ciudad asc 
limit 20, 10;

select ciudad ,count(*) nalu, sum(peso) suma_peso, max(peso) as peso_maximo, min(peso) pesoMinimo, avg(peso) promedioPeso 
from alumnos
group by ciudad, sexo
order by 3 desc, ciudad asc;

select ciudad ,count(*) nalu, sum(peso) suma_peso, max(peso) as peso_maximo, min(peso) pesoMinimo, avg(peso) promedioPeso 
from alumnos
where sexo <> '' -- Donde el sexo sea diferente de blanco 
group by ciudad, sexo
having avg(peso) > 50.00 -- Funciones de agregacion es con having, campos en la tabla son con where 
order by 3 desc, ciudad asc;

select ciudad ,count(*) nalu, sum(peso) suma_peso, max(peso) as peso_maximo, min(peso) pesoMinimo, (avg(peso) * 1000) promedioPeso_gr 
from alumnos -- Pusimos ahora el resultado en gramos 
where sexo <> '' 
group by ciudad, sexo
having avg(peso) > 50.00 
order by 3 desc, ciudad asc;

select ciudad ,count(*) nalu, sum(peso) suma_peso, max(peso) as peso_maximo, min(peso) pesoMinimo, format((avg(peso) * 1000),2) promedioPeso_gr 
from alumnos -- FORMAT es para ver los decimales que queremos ver 
where sexo <> '' 
group by ciudad, sexo
having avg(peso) > 50.00 
order by 3 desc, ciudad asc;

select * from alumnos;
desc alumnos;

select * from alumnos 
where fedita >= '2017-01-01 00:00:00' AND 
fedita <= '2017-12-31 23:59:59';

select * from alumnos 
where fedita >= '2017-01-01 00:00:00' AND 
fedita <= '2017-12-31 23:59:59'
and sexo = 'f';

select nombre, ap_paterno, ap_materno, peso, estatura, (peso/ (estatura* estatura)) imc 
from alumnos 
where fedita >= '2017-01-01 00:00:00' AND 
fedita <= '2017-12-31 23:59:59'
and sexo = 'f' AND (peso > 0 and estatura > 0)
order by peso DESC;


-- Filtrar por un campo, where
-- Filtrar por un resultado, funcion de agregacion usamos having 
-- ANA FERNANDA GUTIERREZ VILLANUEVA 
use colegio2409;
SELECT * FROM alumnos;


SELECT * FROM alumnos
where direccion = 'NULL';

SELECT * FROM alumnos
where peso = 'NULL';

SELECT * FROM alumnos
where peso is NULL;

SELECT * FROM alumnos
where peso IS NOT NULL;

SELECT * FROM alumnos
where NOT peso is NULL;

SELECT * FROM alumnos
where NOT sexo= 'F';

SELECT nombre, ap_paterno, ap_materno, peso, estatura 
FROM alumnos
order by peso DESC, estatura DESC;

SELECT nombre, ap_paterno, ap_materno, peso, estatura 
FROM alumnos
order by peso ASC, estatura ASC;


SELECT nombre, ap_paterno, ap_materno, peso, estatura 
FROM alumnos
WHERE peso>=90 AND peso<=100
order by peso DESC, estatura DESC;

SELECT nombre, ap_paterno, ap_materno, peso, estatura 
FROM alumnos
WHERE peso BETWEEN 90 and 100
order by peso DESC, estatura DESC;

SELECT nombre, ap_paterno, ap_materno, peso, estatura 
FROM alumnos
WHERE NOT peso BETWEEN 90 and 100
order by peso DESC, estatura DESC;


SELECT nombre, ap_paterno, ap_materno, peso, estatura 
FROM alumnos
order by nombre;


SELECT nombre, ap_paterno, ap_materno, peso, estatura 
FROM alumnos
where nombre BETWEEN 'OMAR ' AND 'PEDRO'
order by nombre;


SELECT nombre, ap_paterno, ap_materno, peso, estatura 
FROM alumnos
where nombre BETWEEN 'FES' AND 'PATITO23'
order by nombre;

SELECT nombre, ap_paterno, ap_materno, peso, estatura 
FROM alumnos
where NOT nombre BETWEEN 'FES' AND 'PATITO23'
order by nombre;


SELECT nombre, ap_paterno, ap_materno, peso, estatura, fedita 
FROM alumnos
where nombre BETWEEN 'FES' AND 'PATITO23'
order by nombre;

SELECT nombre, ap_paterno, ap_materno, peso, estatura, fedita 
FROM alumnos
where fedita BETWEEN '2016-07-01 00:00:00' AND '2016-12-31 23:59:59'
order by nombre;

-- MARIANA, GABRIELA, PAMELA, CAROLINA 
SELECT nombre, ap_paterno, ap_materno, peso, estatura, fedita 
FROM alumnos
where nombre = 'Mariana' or nombre = 'Gabriela' or nombre = 'Pamela' or nombre = 'Carolina' or nombre = 'Lucia'
order by nombre;

SELECT nombre, ap_paterno, ap_materno, peso, estatura, fedita 
FROM alumnos
where NOT nombre IN ('Mariana','Gabriela','Pamela','Carolina','Lucia')
order by nombre;

SELECT nombre, ap_paterno, ap_materno, peso, estatura, fedita 
FROM alumnos
where NOT nombre IN ('Mariana','Gabriela','Pamela','Carolina','Lucia')
and SEXO = 'f'
and fedita between '2016-09-01 00:00:00' AND 
'2016-09-30 23:59:59'
AND peso > 0 
order by nombre, fedita;

SELECT nombre, ap_paterno, ap_materno, peso, estatura, fedita 
FROM alumnos
where nombre like '%Aldo%'; -- Buscando sucadena por eso nos da 9 OSWALDO

SELECT nombre, ap_paterno, ap_materno, peso, estatura, fedita 
FROM alumnos
where nombre like 'Aldo'; -- Aqui solo la cadena ALDO 

SELECT nombre, ap_paterno, ap_materno, peso, estatura, fedita 
FROM alumnos
where nombre like 'Aldo%'; -- Aqui que comiencen con ALDO

SELECT nombre, ap_paterno, ap_materno, peso, estatura, fedita 
FROM alumnos
where nombre like '%Aldo'; -- Que terminen con la cadena ALDO 

SELECT nombre, ap_paterno, ap_materno, peso, estatura, fedita 
FROM alumnos
where nombre like 'B%'; -- Que empiecen con B 

SELECT nombre, ap_paterno, ap_materno, peso, estatura, fedita 
FROM alumnos
where nombre like '%B'; -- Que termine con B 

SELECT nombre, ap_paterno, ap_materno, peso, estatura, fedita 
FROM alumnos
where nombre like '%B%'; -- Que contenga una B en la subcadena 

SELECT nombre, ap_paterno, ap_materno, peso, estatura, fedita 
FROM alumnos
where nombre like 'G%B%A'; -- Empiece con G tenga B y termine con A 

SELECT nombre, ap_paterno, ap_materno, peso, estatura, fedita 
FROM alumnos
where ciudad like '%QUER%' OR ciudad like '%QRO%';

SELECT nombre, ap_paterno, ap_materno, peso, estatura, fedita 
FROM alumnos
where ciudad like '% %'
order by nombre;

SELECT nombre, ap_paterno, ap_materno, peso, estatura, fedita 
FROM alumnos
where nombre like '____' -- representa una posicion, que su nombre sean 4 caracteres 
order by nombre;

SELECT nombre, ap_paterno, ap_materno, peso, estatura, fedita 
FROM alumnos
where nombre like '_A__' 
order by nombre;

SELECT nombre, ap_paterno, ap_materno, peso, estatura, fedita 
FROM alumnos
where nombre like '_A%' 
order by nombre;

SELECT nombre, ap_paterno, ap_materno, peso, estatura, fedita 
FROM alumnos
where fedita like '2016%' -- en el año 2016 
order by nombre;

SELECT nombre, ap_paterno, ap_materno, peso, estatura, fedita 
FROM alumnos
where fedita like '_____09%' -- en el mes 09 
order by fedita;

SELECT nombre, ap_paterno, ap_materno, peso, estatura, curp, email, fedita  
FROM alumnos
where email not like '%@'
order by fedita;

SELECT nombre, ap_paterno, ap_materno, peso, estatura, curp, email, fedita  
FROM alumnos
where email like '%@gmail'
order by fedita;

SELECT nombre, ap_paterno, ap_materno, peso, estatura, curp, email, fedita  
FROM alumnos
where nombre like '%@g%'
order by fedita;

SELECT nombre, ap_paterno, ap_materno, peso, estatura, curp, email, fedita  
FROM alumnos
where binary nombre = 'ALDO' -- Binary para distinguir entre mayusculas y minusculas 
order by nombre;
