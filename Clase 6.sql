use colegio2409;
-- JOIN
select * from alumnos a
JOIN pagos p ON(a.clave_alu = p.clave_alu)
JOIN cursos c ON(p.id_curso = c.id_curso)
order by 1;
-- DIAGRAMA DE EN MEDIO (0)
select a.clave_alu, ap_paterno, ap_materno, a.nombre,
 pago, fecha_pago, abreviatura curso, p.* , c.*
from alumnos a
JOIN pagos p ON(a.clave_alu = p.clave_alu) 
JOIN cursos c ON(p.id_curso = c.id_curso)
order by 1;
-- DIAGRAMA 1
select a.clave_alu, ap_paterno, ap_materno, a.nombre,
 pago, fecha_pago, abreviatura curso, p.* , c.*
from alumnos a
LEFT JOIN pagos p ON(a.clave_alu = p.clave_alu) 
LEFT JOIN cursos c ON(p.id_curso = c.id_curso)
order by p.clave_alu;
-- DIAGRAMA 0
select a.clave_alu, ap_paterno, ap_materno, a.nombre,
 pago, fecha_pago, abreviatura curso, p.* , c.*
from alumnos a
LEFT JOIN pagos p ON(a.clave_alu = p.clave_alu) 
LEFT JOIN cursos c ON(p.id_curso = c.id_curso)
WHERE p.clave_alu is null
order by p.clave_alu;

select * from salones;
-- DIAGRAMA 0
select * from salones s 
JOIN niveles n ON (s.id_nivel = n.id_nivel);
-- DIAGRAMA 1
select * from salones s 
LEFT JOIN niveles n ON (s.id_nivel = n.id_nivel)
order by n.id_nivel;
-- DIAGRAMA 2
select * from salones s 
LEFT JOIN niveles n ON (s.id_nivel = n.id_nivel)
WHERE n.id_nivel is null
order by n.id_nivel;
-- DIAGRAMA 3
select * from salones s 
RIGHT JOIN niveles n ON (s.id_nivel = n.id_nivel)
order by n.id_nivel;
-- DIAGRAMA 4
select * from salones s 
RIGHT JOIN niveles n ON (s.id_nivel = n.id_nivel)
WHERE s.id_nivel is null
order by n.id_nivel;


select * from salones s 
JOIN niveles n ON (s.id_nivel = n.id_nivel);

select * from salones s 
JOIN niveles n USING(id_nivel);  -- no proyecta la llave foránea, sólo funciona el USING() si las llaves se llaman igual

select * from salones s 
LEFT JOIN niveles n USING(id_nivel);  -- se pueden usar todos los JOIN

select * from salones s 
LEFT JOIN niveles n USING(id_nivel)
where n.id_nivel is null;   -- aunque no se muestre, podemos usar la llave foránea

select * from salones s 
NATURAL JOIN niveles n;  -- igual que el USING, solo funciona si se llaman igual

select * from salones s 
NATURAL LEFT JOIN niveles n  -- Se puede hacer lo mismo, pero se pone el 'NATURAL' antes que el resto de los que cambian al JOIN
where n.id_nivel is null; 

select * from salones s 
NATURAL LEFT JOIN niveles n 
where n.id_nivel is null; 

select * 
from alumnos a
NATURAL LEFT JOIN pagos p    -- Se recomienda usarlo entre solo dos tablas, si se usan más, se confunde y no se sabe de quien es 
NATURAL LEFT JOIN cursos c;    -- la llave
 
 -- Súper consulta que si la entiendes eres chid@
select a.clave_alu, 
if(length(concat_ws(' ', ap_paterno, ap_materno, a.nombre)) > 3,
	concat_ws(' ', ap_paterno, ap_materno, a.nombre) ,
    'SIN DATO' 
    )alumno, 
IFNULL(npago,0) npago, -- IFNULL() reemplaza el dato nulo por lo que pongamos
IFNULL(tpago,0) tpago, -- 	en el segundo término (después de la coma)
IFNULL(abreviatura, 'SIN DATO') curso 
FROM 																			
alumnos a
LEFT JOIN (
select clave_alu, id_curso, count(pago) npago, sum(pago) tpago
from pagos
group by clave_alu, id_curso) p ON(a.clave_alu = p.clave_alu)
LEFT JOIN cursos USING(id_curso)
WHERE sexo= 'F';

-- UNION ---------------------------
select * from grados;
select * from niveles; 

select id_grado id, nombre elemento from grados 
UNION 
select * from niveles
order by 2;
-- concat_ws() repite el primer parametro en medio de los demas, concat solo concatena 
-- union, debe tener ambos los mismos campos 
select clave_alu clave, concat_ws(' ',ap_paterno, ap_paterno, nombre) persona, curp, sexo, email  from alumnos
union
select clave_prof, concat_ws(' ', apellido_p, apellido_m, nombres) persona, curp, sexo, email, 'alumno' tipo from profesores;

-- select clave_alu clave, where concat_ws(' ',ap_paterno, ap_paterno, nombre) persona, curp, sexo, email  from alumnos
-- union
-- select clave_prof, where concat_ws(' ', apellido_p, apellido_m, nombres) persona, curp, sexo, email, 'profesor' tipo from profesores order by 2;


select clave_alu clave, concat_ws(' ', ap_paterno, ap_materno, nombre) persona,
curp, sexo, email, 'profesor' tipo
from alumnos
WHERE concat_ws(' ', ap_paterno, ap_materno, nombre) like '%espinosa%'
UNION
select clave_prof,
concat_ws(' ',apellido_p, apellido_m, nombres) persona,
curp, sexo, email, 'alumno' tipo
from profesores
WHERE concat_ws(' ', apellido_p, apellido_m, nombres) like '%espinosa%'
order by 2;

select 
clave_alu, sucursal, ref_numerica, ref_alfanumerica, pago, fecha_pago 
from pagos;

-- aunque no tengan logica los datos se puede usar union, no es correcto hacerlo 
-- podemos tener cualquier cantidad de consultas anidadas 
select clave, persona, curp, email, sexo, 
ifnull(npago, 0) npago, ifnull(tpago,0) tpago
from
(
SELECT clave_alu clave, concat_ws(' ', ap_paterno , ap_materno, nombre) persona , curp , sexo, email ,'alumno' tipo FROM alumnos
UNION
SELECT clave_prof , concat(' ' ,apellido_p, apellido_m , nombres) persona, curp , sexo ,email ,'profesor' tipo FROM profesores
) p
LEFT JOIN (select clave_alu, id_curso, count(pago) npago, sum(pago) tpago
from pagos
group by clave_alu, id_curso) g ON(p.clave = g.clave_alu)
where tpago > 20000
order by 2;


select clave_alu, id_curso, count(pago) npago, sum(pago) tpago
from pagos 
where pago < 6000
group by clave_alu, id_curso
having npago < 5 AND tpago > 20000;
-- having te sirve para filtrar agrupamientos 

show tables;
desc personas; 
CREATE OR REPLACE VIEW personas AS -- crear una vista, una estructura muy parecida a una tabla pero sin datos 
SELECT clave_alu clave, concat_ws(' ', ap_paterno , ap_materno, nombre) persona , curp , sexo, email ,'alumno' tipo FROM alumnos
UNION
SELECT clave_prof , concat(' ' ,apellido_p, apellido_m , nombres) persona, curp , sexo ,email ,'profesor' tipo FROM profesores;

SELECT abreviatura curso, sexo, COUNT(*) as nalu 
FROM 
alumnos a
JOIN alumno_salon sa ON(a.clave_alu = sa.clave_alu)
JOIN cursos c ON(c.id_curso = sa.id_curso)
GROUP BY abreviatura, sexo;