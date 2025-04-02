/*Taller repaso miercoles 02/04/2025*/
create database onlineBD;

use onlineBD;

drop table clientes;
drop table libros;
drop table pedidos;

Create table clientes(
documentoCliente int auto_increment primary key,
nombreCliene varchar(30) not null,
direcciónCliente varchar(10) not null,
estadoUsuario bool not null
);

create table libros(
idLibro int auto_increment primary key,
nombreLibro varchar(20) not null,
categoria varchar(20) not null,
stockTienda int not null,
idEntregasFK int not null
);

create table pedidos(
idPedido int auto_increment primary key,
cantidad int not null,
idClienteFK int not null,
precio float not null,
idEntregasFK int not null
);

create table entregas(
idEntregas int auto_increment primary key,
idClienteFK int not null,
idPedidosFK int not null
);

alter table pedidos add column precio float not null;
alter table pedidos add column idEntregasFK int not null;
alter table libros add column idEntregasFK int not null;


alter table pedidos
add constraint cliPed
foreign key (idClienteFK)
references clientes(documentoCliente);

alter table libros
add constraint pedLib
foreign key (idEntregasFK)
references entregas(idEntregas);

alter table pedidos
add constraint Pedent
foreign key (idEntregasFK)
references entregas(idEntregas);

describe pedidos;
select*from clientes;

insert into clientes values ('', 'juan Gómez', 'calle 1', true);
INSERT INTO clientes VALUES ('', 'María Pérez', 'calle 2', false);
INSERT INTO clientes VALUES ('', 'Carlos Ramírez', 'calle 3', true);
INSERT INTO clientes VALUES ('', 'Ana Torres', 'calle 4', false);
INSERT INTO clientes VALUES ('', 'Luis Fernández', 'calle 5', true);
INSERT INTO clientes VALUES ('', 'Sofía Sánchez', 'calle 6', true);

insert into libros values ('', 'Cien años de soledad', 'Realismo magico', 'Novela', 20,'');

insert into pedidos values('', 1, )




