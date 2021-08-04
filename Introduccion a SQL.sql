-- Intro a SQL 

show databases; -- Mostrar la base de datos. 

CREATE DATABASE test2409; -- Creando una base de datos. 

USE test2409; -- Nos posicionamos en esa base de datos. 

show tables; -- Mostrar tablas. 

show columns from TABLES; -- Mostrar los campos de TABLES 

show columns from VIEWS; -- Mostrar los campos de VIEWS

show tables in information_schema; -- Mostrar tablas de la BD Information_schema 

use information_schema; -- Nos posicionamos en esa BD

show columns from information_schema.VIEWS; -- De esta forma puedo ver la informacion de una BD sin estar posicionada en ella. 

show index from information_schema.VIEWS; -- Index Indices 

show variables; 

select version(); -- Ver la version 

show variables;