use colegio2409;

select * from salones;
-- 191
select * from cursos;
-- 4
select * from grados;
-- 17
select * from niveles;
-- 7 
select * from salones, cursos, grados, niveles order by 1; 	-- Producto cartesiano = 191 * 4 * 17 * 7= 90916

select * from salones, cursos order by 1; 	-- Producto cartesiano = 191 * 4 = 764

select * from salones s, cursos c
WHERE s.id_curso =c.id_curso
order by 1;

select  s.id_salon, observaciones as salon, tipo_grupo, 
abreviatura curso 
from salones s, cursos c
WHERE s.id_curso =c.id_curso
AND abreviatura = '2017-2018'
order by 1;

select  s.id_salon, observaciones as salon, tipo_grupo, 
abreviatura curso, g.nombre grado
from salones s, cursos c , grados g 
WHERE s.id_curso =c.id_curso
AND s.id_grado = g.id_grado
-- AND abreviatura = '2017-2018'
-- AND g.nombre = '3o'
order by 1;

select  s.id_salon, observaciones as salon, tipo_grupo, 
abreviatura curso, g.nombre grado, n.nombre nivel 
from salones s, cursos c, grados g, niveles n
WHERE s.id_curso = c.id_curso
AND s.id_grado = g.id_grado
AND s.id_nivel = n.id_nivel
AND abreviatura = '2017-2018'
AND g.nombre = '3o'
AND n.nombre = 'BACHILLERATO'
order by 1;

 -- Si hay un renglon que no hace match con los renglones de la tabla, hay dos salones que no estan en la lista por eso salen menos 
 -- WHERE NOT negarlo para ver las listas que no estan en los niveles validos
 
select * from salones 
WHERE id_salon IN(Select id_nivel from niveles); -- Consulta anidada

select * from salones 
WHERE id_nivel NOT IN(Select id_nivel from niveles); -- Consulta para ver los niveles que no son validos 

select count(*) from alumnos;
select count(*) from pagos; 
select * from pagos; 
select count(*) from alumnos, pagos; -- producto cartesiano, multiplicacion sin where, con count para no listar 

select * from alumnos a, pagos p, cursos c -- producto cartesiano 
WHERE a.clave_alu = p.clave_alu 
AND p.id_curso = c.id_curso; -- join 

select a.clave_alu, ap_paterno, ap_materno, a.nombre, pago, fecha_pago, 
abreviatura curso 

select a.clave_alu, ap_paterno, ap_materno, a.nombre, pago, fecha_pago, abreviatura curso 
from alumnos a, pagos p, cursos c
WHERE a.clave_alu = p.clave_alu
AND p.id_curso = c.id_curso
AND sexo = 'F'
order by 2,3,4;

select a.clave_alu, ap_paterno, ap_materno, a.nombre, pago, fecha_pago, abreviatura curso 
from 
(SELECT * FROM alumnos WHERE sexo= 'f')a, pagos p, cursos c
WHERE a.clave_alu = p.clave_alu
AND p.id_curso = c.id_curso
AND sexo = 'F'
order by 2,3,4;