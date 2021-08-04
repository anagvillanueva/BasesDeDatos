-- 18/06/2021 Ana F Gutierrez Villanueva
use test2409;

-- DML Nos permite crear estados 
select * from escritor; 
select * from libro;
desc escritor;

-- INSERT inserta nuevos valores en la tabla
 INSERT INTO escritor VALUES
 (
 NULL, -- Porque tenemos autoincremental, entonces no vamos a pasar dato 
'CARLOS','MONSIVAIS','CDMX','monsi' -- Los datos van en comilla sencilla, alfanumerico y fechas 
 );
 
 INSERT INTO escritor VALUES
 ( NULL, 'CARLOS','MONSIVAIS','CDMX','');
 
  INSERT INTO escritor VALUES
 ( 2, 'GABRIEL','GARCIA MARQUEZ', NULL,NULL);
 
  INSERT INTO escritor VALUES
 ( 100, 'GABRIELA','MISTRAL','CDMX','Mistral');
 
 INSERT INTO escritor VALUES
 ( NULL, 'OCTAVIO','PAZ','CDMX','Paz');
 
 desc libro;
 select * from libro;
 select * from escritor;
 
 insert into libro values 
 (null, 1, 'Confrontaciones',NULL),
 (null, 2, '100 años de soledad', NULL),
 (null, 2, 'El amor en tiempos de colera', 'texto');
 
 insert into libro values
 (null, 101, 'el laberinto', ''); 
 
 insert into libro values
 (null, 101, 'el mono gramatico', ''); 
 -- No podemos agregar campos si no tienen un "padre" y tampoco si nos hacen faltaa campos
 
 delete from escritor where nombre = 'CARLOS';
 delete from libro where titulo = 'el laberinto';
 delete from libro where titulo = '100 años de soledad';
 delete from libro where titulo = 'el amor en tiempos de colera';
 
 select * from libro;
 select * from escritor;
 
 insert into libro values
 (null, 101, 'el laberinto', ''); 
 
 insert into libro values
 (null, 101, 'el mono gramatico ', ''); 
 
 insert into libro values
 (null, 2, 'el amor en tiempos de colera', 'texto'); 
 
  insert into libro values
 (null, 2, '100 años de soledad', 'texto'); 
 
 update escritor set id_escritor = 2000 where id_escritor = 101; 
 
 INSERT INTO escritor VALUES
 (NULL, 'CARLOS', 'FUENTES','CDMX', 'fuentes');
 
 create table escritor_tmp like escritor;
 
 insert into escritor_tmp
 select * from escritor;
 
 select * from escritor_tmp;
 
 delete from escritor_tmp;
 
 update escritor_tmp set nombre = 'PATITO 23';
 drop table escritor_tmp;
 
 desc libro;
 desc escritor;
 
 use test2409;
 select * from libro;
 select * from escritor;
 delete from escritor where nombre = "juan";
 
 -- Clase 21 06 2021 --
 select * from escritor;
 
 show index from escritor;
 alter table escritor drop key uq_alias; 
 
 insert into escritor (id_escritor, nombre, apellidos) values
 (null, 'JUAN', 'RULFO'),
 (null, 'INES', 'CRUZ');
 
 INSERT INTO escritor (nombre, apellidos)
VALUES
("MARIANO", "AZUELA"), ('ELENA', 'Poniatowska');
 
 -- En este no puedo insertar varios -- 
 insert into escritor set
 nombre = 'MANUEL',
 apellidos = 'ACUÑA',
 direccion = 'MC',
 alias = 'macuña';
 
 LOAD DATA LOCAL INFILE
 'C:\\Users\\ANAFERNANDAGUTIERREZ\\Documents\\Ingenieria en Computacion\\Cuarto Semestre\\Bases de Datos\\escritores.csv'
 INTO TABLE escritor
 FIELDS TERMINATED BY ','
 ENCLOSED BY ''
 LINES TERMINATED BY '\r\n';
 
 show variables like '%local%';
 set global local_infile = 1;
 
 select * from escritor;
 
 UPDATE escritor SET
 nombre = 'ISAAC', apellidos = 'ASIMOV', direccion = 'NA', 
 alias = 'YoRobot' 
 WHERE id_escritor= '206';
 
 UPDATE escritor SET alias = 'SIN DATO' where alias != 'NA';
 
 UPDATE escritor SET direccion = 'MEX'
where id_escritor >= 204;

update escritor SET alias = 'NO SE', direccion = 'AMERICA'
where id_escritor >= 200 AND id_escritor <= 205;

SELECT * FROM escritor WHERE alias = 'SIN DATO';
DELETE FROM escritor WHERE alias = 'SIN DATO';

Select * from libro;
select * from escritor; 