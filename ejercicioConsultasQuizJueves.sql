/*Ejercicios consultas*/
create database empleados;

use empleados;

create table empleado(
idEmpleado int auto_increment primary key,
nombre varchar(30) not null,
edad int not null,
salario float not null,
fechaIngreso date not null,
idDeptoFK int not null,
idCargoFK varchar(20) not null
);

create table departamento(
idDepto int auto_increment primary key,
departamento varchar(20) not null
);

create table cargo(
idCargo varchar(20) primary key,
nombre varchar(20) not null,
rango varchar(20) not null,
descripcion varchar(20) not null
);
alter table cargo
drop column nombre;
alter table cargo
add column nombreCar varchar(20) not null;
alter table cargo
drop column idDeptoFK;
alter table empleado
drop column departamento;
alter table empleado
add column idDeptoFK int not null;
alter table empleado
add column idCargoFK varchar(20) not null;

alter table empleado
add constraint FKD
  FOREIGN KEY(idDeptoFK)
  REFERENCES departamento(idDepto);
  
  alter table empleado
  add constraint FKC
  FOREIGN KEY(idCargoFK)
  REFERENCES cargo(idCargo);


select nombre, nombreDepto from empleado inner join empleado on empleado.idDeptoFK=departamento.idDepto;
#un cargo puede tener 1 o muchos empleados#


select*from empleado;
truncate empleado;

insert into empleado values('', 'Juan Gómez', 19, 10000.0, 20250102, 1, 'V1');
insert into empleado values('', 'Pablo Bernal', 21, 3000, 20220102, 2 , 'AD1');
INSERT INTO empleado VALUES ('', 'María López', 45, 8000, '2018-06-15', 2, 'DB1');
INSERT INTO empleado VALUES ('', 'Carlos Pérez', 38, 2500, '2019-09-22', 3, 'F1');
INSERT INTO empleado VALUES ('', 'Ana Torres', 50, 5000, '2017-03-10', 4, 'M1');
INSERT INTO empleado VALUES ('', 'Luis Ramírez', 29, 2000, '2021-07-05', 2, 'DF1');
describe empleado;
insert into departamento values ('', 'ventas');
insert into departamento values ('', 'IT');
insert into departamento values ('', 'finanzas');
insert into departamento values ('', 'marketing');
select*from departamento;
insert into cargo values ('DB1', 'desarrollador back', 'junior', 'python');
insert into cargo values ('DF1', 'Desarrollador front', 'senior', 'python');
insert into cargo values ('AD1', 'Analista de datos', 'senior', 'python');
insert into cargo values ('V1', 'Vendedor', 'Experimentado', 'tienda');
insert into cargo values ('F1', 'Contador', 'General', 'General');
insert into cargo values ('M1', 'Publicidad', 'Digital', 'Marketing');
select*from cargo;
describe empleado;
describe departamento;
describe cargo;
/*QUIZ*/
#hacer una consulta de todos lo cargos que tengan un rango especifico#
select nombre, departamento from empleado inner join departamento on empleado.idDeptoFK=departamento.idDepto;
#Mostrar en pantalla los empleados que tengan un cargo especifico#
select nombre, idcargo from empleado join cargo on empleado.idCargoFK=cargo.idCargo;
#mostrar empleados que tengan mas de 3 años, a que departamento pertenecen, mostrar el salario y cargo que tienen#
select nombre, timestampdiff(year, fechaIngreso, curdate()), departamento, salario, idCargo from empleado
inner join departamento on empleado.idDeptoFK=departamento.idDepto inner join cargo on empleado.idCargoFK=cargo.idCargo;
#mostrar toda la información de un empleado, nombre, fecha de ingreso, departamento, años de antiguedad en la empresa, cargo, rango#
select nombre, fecha ingreso, departamento, timestampdiff(year, fechaIngreso, curdate()), cargo, rango 
from empleado join departamento on empleado.idDeptoFK=departamento.idDepto join cargo on empleado.idCargoFK=cargo.idCargo
join cargo on empleado.idCargoFK=cargo.rango;
#mostrar todos los departamentos que no tengan empleados asignados#
select departamento, nombre from empleado inner join departamento on empleado.idDeptoFK=departamento.idDepto;
#mostrar todos los cargos no tengan empleados asignados#




#1. Obtén los nombres, edades y salarios de todos los empleados de TechCorp.#
Select nombre, edad, salario from empleado;

#2. ¿Quiénes son los empleados que ganan más de $4,000?#
select salario,nombre from empleado where salario >=4000;

#3. Extrae la lista de empleados que trabajan en el departamento de Ventas.#
Select nombre, departamento from empleado where departamento = 'Ventas';

#4. Encuentra a los empleados que tienen entre 30 y 40 años.#
select edad, nombre,idEmpleado from empleado where edad >30 and edad<40; 

#5. ¿Quiénes han sido contratados después del año 2020?#
select fechaIngreso,nombre from empleado where fechaIngreso > 20200000; 

#6. ¿Cuántos empleados hay en cada departamento?#
select count(*),departamento from empleado where departamento like '%Ventas%';
select count(*),departamento from empleado where departamento like '%IT%';
select count(*),departamento from empleado where departamento like '%Finanzas%';
select count(*),departamento from empleado where departamento like '%Marketing%';
select count(*),departamento from empleado where departamento like '%Recursos humanos%';
select count(*),departamento from empleado where departamento like '%Gerencia%';

#7. ¿Cuál es el salario promedio en la empresa?#
select AVG(salario) from empleado;

#8.  Muestra los empleados cuyos nombres comienzan con "A" o "C".#
select nombre from empleado where nombre like 'a%' or 'c%';

#9. Encuentra a los empleados que no pertenecen al departamento de IT.#
select departamento, nombre from empleado where departamento <> 'IT';

#10. ¿Quién es el empleado con el salario más alto?#
select nombre, salario from empleado where salario=(select max(salario) from empleado);

Select*from empleado where departamento in ('ventas','IT');

select*from empleado order by salario desc;

select*from empleado where departamento is null;

select fechaIngreso, nombre, timestampdiff(day, fechaIngreso, curdate()) from empleado;

select nombre, salario from empleado order by salario desc limit 3;

select nombre, salario*0.1+salario as 'salario+bono',salario from empleado where (timestampdiff(day, fechaIngreso, curdate()))/365 >5;

select count(*), salario,nombre from empleado where salario>(select avg(salario) from empleado);

select departamento,(select count(*) from empleados) from empleado order by (select count(*) from empleados) desc;

select  nombre, salario, timestampdiff(year, fechaIngreso, curdate()) as 'años en la empresa' from empleado where salario > 10000 and timestampdiff(year, fechaIngreso, curdate()) > 5;