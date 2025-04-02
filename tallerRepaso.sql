/*Taller ingeniería de datos*/

create database votaciones2503816;

use votaciones2503816;

create table genero(
idGenero int primary key auto_increment,
nomGenero varchar(10) not null,
estagoG bool not null
);

create table jornada(
idJornada int primary key auto_increment,
nomJornada varchar(10) not null,
estadoJ bool not null
);

create table tipoDocumento(
idTipoDoc int auto_increment primary key,
nomTipoDoc varchar(20) not null,
estadoTD bool not null
);

create table curso(
idCurso int primary key auto_increment,
nomCurso int not null,
estadoCur bool not null
);

create table concejo(
idConcejo int primary key auto_increment,
nomConcejo varchar(20) not null,
estadoCo bool not null
);

create table cargo(
idCargo int primary key auto_increment,
nomCargo varchar(10) not null,
idConcejoFK int not null,
estacoC bool not null 
);

create table eleccion(
idEleccion int primary key auto_increment,
fechaEleccion date not null,
anioEleccion int not null,
estadoEl bool not null
);

create table tipoMiembro(
idTipoMiembro int auto_increment primary key,
nomTipoMiembro varchar(10),
estadoTM bool not null
);

Create table usuario(
idUsuario int auto_increment primary key,
noDocUsuario int not null,
idTipoDocFK bool not null,
nombreUsuario varchar(10) not null,
apellidoUsuario varchar(10) not null,
idGeneroFK int not null,
fechaNacimientoUsuario date not null,
emailUsuario varchar(30),
passwordUsuario varchar(11) not null,
fotoUsuario blob not null,
idJornadaFK int not null,
idTipoMiembroFK int not null,
idCursoFK int not null,
estadoU bool not null
);

create table votacion(
idVotacion int auto_increment primary key,
horaVotacion time not null,
idUsuarioVotanteFK int not null,
idPostCandidatoFK int not null,
estadoV bool not null
);

create table postulacionCandidato(
idPostCandidato int auto_increment primary key,
idUsuarioFK int not null,
idEleccionFK int not null,
idCargoFK int not null,
propuestas varchar(200) not null,
totalVotos int not null,
estadoCan bool not null
);
