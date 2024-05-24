use master
go
create database datamartventa
go

use datamartventa
go
create table dim_cliente
(id_cliente int primary key identity,
pk_cliente char(10),
nombre varchar(200),
pais varchar(50)
)
go



create table dim_producto
(id_producto int primary key identity,
pk_producto int, 
nombre varchar(200),
categoria varchar(15))
go


create table dim_tiempo
(fecha date primary key,
anio smallint,
mes smallint,
diaMes smallint,
diaSemana varchar(15),
trimestre smallint
)
go

create table stg_operacion
(idVenta int primary key,
metodoPago int,
canal int
)
go

create table stg_canal
(
pk_canal int, 
nombreCanal varchar(50))
go

create table stg_metodoPago
(
pk_metodoP int, 
nombreMetodo varchar(50))
go

create table dim_canal
(id_canal int primary key identity,
pk_canal int, 
nombreCanal varchar(50))
go

create table dim_metodoPago
(id_metodoP int primary key identity,
pk_metodoP int, 
nombreMetodo varchar(50))
go


--drop table fac_ventas
create table fac_ventas (
	id_venta int primary key identity,
	id_cliente int references dim_cliente,
	id_producto int references dim_producto,
	id_canal int references dim_canal,
	id_metodoP int references dim_metodoPago,
	fecha date references dim_tiempo,
	cantidad int,
	subTotal money,
	descuento money,
	total money
)
go