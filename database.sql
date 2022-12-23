create database bicicleta;
use bicicleta;
create table persona(
DNI int primary key,
nombres varchar (20),
primero_apellido varchar (20),
segundo_apellido varchar (20),
contraseña varchar(30));

create table persona_telefono(
DNI_persona int,
telefono int,
primary key(DNI_persona,telefono));

create table persona_correo_electronico(
DNI_persona int,
correo_electronico varchar (50),
primary key(DNI_persona,correo_electronico));

create table administrador(
DNI int primary key,
salario int
);

create table usuario(
DNI int primary key,
presuspuesto integer
);

create table no_destacado(
DNI int primary key);

create table destacado(
DNI int primary key,
descuento integer);

create table producto(
id_producto integer primary key,
precio decimal);

create table bicicleta(
id_producto integer primary key,
color varchar (20),
material varchar(20),
foto text);

create table accesorio(
id_producto integer primary key,
nombre varchar(20));

create table administra(
DNI_admin int,
id_producto integer,
primary key (DNI_admin,id_producto));

create table pedido(
id_pedido integer primary key,
precio integer,
DNI_cliente int);

create table almacena(
id_pedido integer,
id_producto integer,
cantidad_productos integer,
fecha_pedido date,
fecha_entrega date);

create table kit_herramientas(
numero integer,
id_producto integer,
primary key(numero,id_producto));

create table bici_urbana(
id_producto integer primary key,
objeto_extra varchar(40));

create table bici_montañera(
id_producto integer primary key,
objeto_extra varchar(40));

create table bici_infantil(
id_producto integer primary key,
objeto_extra varchar(40));

create table bici_freestyle(
id_producto integer primary key);

alter table persona_telefono add foreign key (DNI_persona) references persona(DNI);
alter table persona_correo_electronico add foreign key (DNI_persona) references persona(DNI);

alter table usuario add foreign key (DNI) references persona(DNI);
alter table administrador add foreign key (DNI)references persona(DNI);

alter table destacado add foreign key (DNI) references persona(DNI);
alter table no_destacado add foreign key (DNI) references persona(DNI);

alter table pedido add foreign key (DNI_cliente)references usuario(DNI);


alter table almacena add foreign key (id_pedido)references pedido(id_pedido);
alter table almacena add foreign key (id_producto)references producto(id_producto);

alter table administra add foreign key (DNI_admin)references administrador(DNI);
alter table administra add foreign key (id_producto)references producto(id_producto);

alter table bicicleta add foreign key (id_producto)references producto(id_producto);
alter table accesorio add foreign key (id_producto)references producto(id_producto);

alter table kit_herramientas add foreign key(id_producto) references bicicleta(id_producto);
alter table bici_freestyle add foreign key(id_producto) references bicicleta(id_producto);
alter table bici_infantil add foreign key(id_producto) references bicicleta(id_producto);
alter table bici_montañera add foreign key(id_producto) references bicicleta(id_producto);
alter table bici_urbana add foreign key(id_producto) references bicicleta(id_producto);
