/*Ejercicios consultas*/
create database empleados;

use empleados;

create table empleado(
idEmpleado int auto_increment primary key,
nombre varchar(30) not null,
edad int not null,
salario float not null,
departamento varchar(20) not null,
fechaIngreso date not null
);

select*from empleado;
truncate empleado;
insert into empleado values('', 'Juan Gómez', 19, 10000, 'Ventas', 20250102);
insert into empleado values('', 'Pablo Bernal', 21, 3000, 'IT', 20220102);
INSERT INTO empleado VALUES (NULL, 'María López', 45, 8000, 'IT', '2018-06-15');
INSERT INTO empleado VALUES (NULL, 'Carlos Pérez', 38, 2500, 'Finanzas', '2019-09-22');
INSERT INTO empleado VALUES (NULL, 'Ana Torres', 50, 5000, 'Marketing', '2017-03-10');
INSERT INTO empleado VALUES (NULL, 'Luis Ramírez', 29, 2000, 'IT', '2021-07-05');
INSERT INTO empleado VALUES (NULL, 'Elena Castro', 42, 3000, 'Recursos Humanos', '2016-11-30');
INSERT INTO empleado VALUES (NULL, 'Sofía Medina', 31, 12500, 'Ventas', '2023-02-18');
INSERT INTO empleado VALUES (NULL, 'Ricardo Álvarez', 47, 15500, 'IT', '2015-08-27');
INSERT INTO empleado VALUES (NULL, 'Gabriel Mendoza', 26, 11800, 'IT', '2022-04-12');
INSERT INTO empleado VALUES (NULL, 'Valeria Ríos', 50, 16000, 'Gerencia', '2014-12-05');
INSERT INTO empleado VALUES (NULL, 'Fernando Ortega', 34, 10500, 'IT', '2019-05-20');

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
select nombre, max(salario) from empleado;