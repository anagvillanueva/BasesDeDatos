DELIMITER // 
DROP TRIGGER IF EXISTS bi_curso //
CREATE TRIGGER bi_curso 
BEFORE INSERT ON cursos
FOR EACH ROW
BEGIN 
	if(LEFT(NEW.nombre, 5) <> 'curso') then 
		set NEW.nombre = concat('CURSO ', NEW.nombre);
    end if;
    set NEW.nombre = upper(NEW.nombre);
    set NEW.abreviatura = upper(NEW.abreviatura);
END//
DELIMITER ; 
-- ANA FERNANDA GUTIERREZ VILLANUEVA
select trigger_name, event_manipulation, event_object_table, action_statement, trigger_schema
from information_schema.triggers
where trigger_schema = 'colegio2409';

insert into cursos values 
('C100','escolar 2019-2020','ce 19-20','2019-07-31 00:00:00','2000-07-30 00:00:00'),
('C200','escolar 2019-2021','ce 19-21','2020-07-31 00:00:00','2000-07-30 00:00:00');

select * from cursos;

-- v2 del trigger 
DELIMITER // 
DROP TRIGGER IF EXISTS bi_curso //
CREATE TRIGGER bi_curso 
BEFORE INSERT ON cursos
FOR EACH ROW
BEGIN 
	if(LEFT(NEW.nombre, 5) <> 'curso') then 
		set NEW.nombre = concat('CURSO ', NEW.nombre);
    end if;
    set NEW.nombre = upper(NEW.nombre);
    set NEW.abreviatura = upper(NEW.abreviatura);
    
    if(DATEDIFF(NEW.ffin, NEW.finicio) <240) then
    signal sqlstate'45000'
    set message_text = 'Fecha final fuera de rango';
    end if;
END//
DELIMITER ; 

delete from cursos where id_curso in('C300','C400');

select * from cursos; -- ANA FERNANDA GUTIERREZ VILLANUEVA
insert into cursos values 
('C300','escolar 2019-2022','ce 19-22','2021-07-31 00:00:00','2000-07-30 00:00:00'),
('C400','escolar 2019-2023','ce 19-23','2022-07-31 00:00:00','2000-07-30 00:00:00');

insert into cursos values 
('C300','escolar 2019-2022','ce 21-22','2021-07-31 00:00:00','2022-07-30 00:00:00'),
('C400','escolar 2019-2023','ce 22-23','2022-07-31 00:00:00','2023-07-30 00:00:00');

SELECT c.*, datediff(ffin, finicio) from cursos c;
-- Ana Fernanda Gutierrez Villanueva 
drop table if exists bitacora;
create table bitacora(
	id int not null auto_increment primary key,
    fecha datetime not null,
    usuario varchar(50) not null,
    tabla varchar(50) not null,
    accion text null
);

select * from bitacora;

DELIMITER // 
DROP TRIGGER IF EXISTS ad_curso //
CREATE TRIGGER ad_curso 
AFTER DELETE ON cursos
FOR EACH ROW
BEGIN 
	INSERT INTO bitacora VALUES (null, sysdate(), user(), 'cursos',
    CONCAT_WS('|', 'ELIMINACION DE CURSO', OLD.id_curso, OLD.nombre, 
    OLD.abreviatura, OLD.finicio, OLD.ffin)
    );
END//
DELIMITER ; 

DELETE FROM cursos WHERE id_curso >= 'C100';
-- ANA FERNANDA GUTIERREZ VILLANUEVA 
select * from cursos;
Select * from bitacora;