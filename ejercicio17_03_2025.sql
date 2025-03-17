#Bases de datos#
#consultas#
create database ejercicioClase;
use ejercicioClase;

create table cliente(
codigoCliente int auto_increment primary key,
nombreCliente varchar(30) not null,
domicilioCliente varchar(20) not null,
ciudadCliente varchar(15) not null,
provinciaCliente varchar(15) not null,
telefonoCliente varchar(15) not null
);
insert into cliente values('', 'Juan Gomez', 'calle 1', 'Bogotá', 'usaquen', '310');
insert into cliente values('', 'Pablo Bernal', 'calle 2', 'Bogotá', 'usaquen', '311');
insert into cliente values('', 'Ana Triviño', 'calle 3', 'Bogotá', 'usaquen', '312');
insert into cliente values('', 'Maria Monje', 'calle 4', 'Bogotá', 'usaquen', '313');
insert into cliente values('', 'Andres Avila', 'calle 5', 'Bogotá', 'usaquen', '314');

#consulta general select#
select*from cliente;

#concultas especificas select nombrecolumna form tabla#
select codigoCliente from cliente;

#clausula when con operadores logicos or and not o aritmeticos +- multi divi modulo% comparacion == = <> diferente < > <= >= #

select codigoCliente from cliente where nombreCliente='Juan Gomez';
select codigoCliente from cliente where nombreCliente<>'Juan Gomez';

#alias select campo1as 'nombre que se desea mostrar' #

select nombreCliente as 'Nombre Cliente', domicilioCliente as 'Dirección cliente' from cliente;

#ordenar order by asc desc* select camposConsultar form nombre tabla order by campoOrdenar tipoorden*#
select*from cliente order by telefono asc;
select*from cliente order by telefono desc;

select nombreCliente as 'Nombre Cliente', domicilioCliente, ciudadCliente, telefonoCliente from cliente where nombreCliente='Juan Gomez' order by telefonoCliente asc;

#consultar agrupando group by select camposAConsultar from nombreTabla condicion grup by campoAgrupar orden#

select nombreCliente as 'Nombre Cliente', domicilioCliente, ciudadCliente, telefonoCliente from cliente where ciudadCliente='Bogotá' group by telefonoCliente asc;

#like not like consultar por caracteres#

select*from cliente where nombreCliente like '%b%';