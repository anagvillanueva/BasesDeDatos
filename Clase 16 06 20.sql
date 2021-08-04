-- DLL Data Definition Languaje 
-- Ana Fernanda Gutierrez Villanueva 

create database test2409; -- si la volvemos a crear es un error 
create database if not exists test2409; -- Si no existe, manda un warning

use test2409;

-- Tabla escritor, con 5 campos y llave primaria. 
-- 6 constraints 
CREATE TABLE escritor (
id_escritor INT NOT NULL auto_increment, 
nombre VARCHAR(30) NOT NULL, 
apellidos VARCHAR(40) NOT NULL,
direccion VARCHAR (100) NULL,
alias VARCHAR(30) NULL DEFAULT 'NA',
 PRIMARY KEY(id_escritor)
) ENGINE=InnoDB; -- MOTOR POR DEFAULT PARA GUARDAR EN SQL, ENGINE ES UNA ESTRUCTURA DE MYSQL 
-- Ana Fernanda Gutierrez Villanueva 
show tables; 

CREATE TABLE libro (
	id_libro  INT NOT NULL auto_increment PRIMARY KEY,
    id_escritor INT NOT NULL,
    titulo VARCHAR(100),
    contenido TEXT NULL,
    FOREIGN KEY(id_escritor) REFERENCES escritor(id_escritor) 
    ON DELETE CASCADE ON UPDATE CASCADE
); -- Cardinalidad de 1 a muchos, un escritor, muchos libros.

show index from libro; 
show columns from escritor;
desc escritor; 
describe escritor; -- desc y  describe, pueden usarse ambas 

show create table escritor; -- Mostrar la sentencia con la que fue creada una tabla.
-- Ana Fernanda Gutierrez Villanueva 
 -- Copy field unq
CREATE TABLE `escritor` (
  `id_escritor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `alias` varchar(30) DEFAULT 'NA',
  PRIMARY KEY (`id_escritor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE escritor2 like escritor; 
show tables; 
desc escritor2;
CREATE TEMPORARY TABLE escritor3 like escritor; -- Crea tablas temporales, que cuando cerramos sesion desaparecen 
select * from escritor3;

-- Ana Fernanda Gutierrez Villanueva 
-- 16 JUNIO --
show index from escritor; 
desc escritor; 
CREATE UNIQUE INDEX uq_alias ON escritor(alias); -- Crear un indice unico sobre la tabla escritor 
ALTER TABLE escritor ADD INDEX in_nombre (nombre, apellidos); -- Nos sirve para modificar ALTER, aqui agregamos indice 
ALTER TABLE escritor DROP INDEX in_nombre; -- Aqui borramos indice 
desc escritor2;
ALTER TABLE escritor2 MODIFY id_escritor INT NOT NULL; -- Modifica el campo, en este caso deja de ser auto incremental y es entero no nulo
ALTER TABLE escritor2 DROP PRIMARY KEY; 
ALTER TABLE escritor2 MODIFY id_escritor INT NOT NULL auto_increment,
ADD PRIMARY KEY (id_escritor);

desc escritor2;

ALTER TABLE escritor2 ADD CIUDAD varchar(30) NOT NULL; -- Agregamos un elemento (ciudad)
ALTER TABLE escritor2 CHANGE CIUDAD ciudad varchar(30) NOT NULL; -- Cambio el nombre, de mayuscula a minuscula 

ALTER TABLE escritor2 CHANGE apellidos apellido_paterno varchar(50) NOT NULL;
ALTER TABLE escritor2 ADD apellido_materno varchar(50) NOT NULL AFTER apellido_paterno; -- AFTER despues de que campo se va posicionar 
ALTER TABLE escritor2 ADD cd varchar(30) NOT NULL FIRST;

ALTER TABLE escritor2 MODIFY ciudad VARCHAR(50) NOT NULL;
ALTER TABLE escritor2 DROP cd;
ALTER TABLE escritor2 MODIFY ciudad VARCHAR(50) NOT NULL AFTER direccion;

show index from libro;

SELECT
  TABLE_NAME,
  COLUMN_NAME,
  CONSTRAINT_NAME,   
  REFERENCED_TABLE_NAME,
  REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
  REFERENCED_TABLE_SCHEMA = 'test2409'
	AND REFERENCED_TABLE_NAME = 'escritor';
    
RENAME TABLE escritor2 TO escritor_dos;
show tables;
-- Ana Fernanda Gutierrez Villanueva--
CREATE DATABASE test1606;
RENAME TABLE test2409.escritor_dos TO test1606.escritor_dos; -- Movimos una tabla a otra base de datos 
show tables from test1606;
CREATE TABLE escritor_dos LIKE test1606.escritor_dos; -- Crear una tabla que se llame "" igual a la de "" -- LIKE copiamos la estructura, no datos
desc escritor_dos;
DROP TABLE test1606.escritor_dos;
DROP DATABASE test1606;