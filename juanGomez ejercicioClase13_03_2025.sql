#crar base de datos#
create database viajesUrosario;

create database tienda;
#Habilitar o usar base de datos use nombre BD#
use tienda;

create table cliente(
idCliente int auto_increment PRIMARY KEY,
documentoCliente varchar(50) not null,
nombreCliente varchar(50) not null,
emailCliente varchar(50) not null,
telefonoCliente varchar(50) not null,
direccionCliente text,
fechaRegistro timestamp default current_timestamp
);

create table pedido(
idPedido int auto_increment primary key,
idClienteFK int not null,
idProductoFK int not null,
fechaPedido date not null,
totalPedido decimal(10,2) not null,
estado enum('Pendiente', 'Enviado', 'Entregado', 'cancelado') default 'Pendiente',
fechaRegistro timestamp default current_timestamp
);

create table product(
idProducto int auto_increment primary key,
codigoProducto varchar(50) not null,
nombreProducto varchar(50) not null,
precioProducto decimal(10,2) not null,
stock int default 0,
fechaCreacion timestamp default current_timestamp
);
drop database viajesurosario;
truncate table pedido;
alter table pedido add constraint FKclientPed
foreign key (idClienteFK) references cliente (idCliente);

#consultar estructura de las tablas#
describe product;


#insertar clientes#
insert into cliente values ('',1234,'Juan Gomez', 'juan@gmail', 310,'Calle 9', '');
insert into cliente values ('',1235,'Pablo Bernal', 'pablo@gmail', 311,'Calle 8', '');
insert into cliente values ('',1236,'Annie Grimaldos', 'annie@gmail', 312,'Calle 7', '');
insert into cliente values ('',1237,'Valentina candanoza', 'valentina@gmail', 313,'Calle 6', '');
insert into cliente values ('',1238,'Carlos Griber', 'carlos@gmail', 314,'Calle 5', '');
select*from cliente;

#insertar producto#
insert into product values('','5', 'balon','30000', '1','');
insert into product values('','6', 'medias','10000', '1','');
insert into product values('','7', 'camiseta','50000', '1','');
insert into product values('','8', 'botilito','20000', '1','');
insert into product values('','9', 'gorra','40000', '1','');
select*from product;