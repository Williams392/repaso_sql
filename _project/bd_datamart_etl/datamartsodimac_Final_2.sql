create database datamartSodimac
go

use datamartSodimac
go

create table dim_cliente(
	id_cliente int primary key identity,
	pk_cliente char(25) NOT NULL,
	nombre varchar(200) NOT NULL,
	apellido VARCHAR(100) NOT NULL,
	distrito VARCHAR(50) NOT NULL,
)
go

create table dim_producto (
	id_producto int primary key identity,
	pk_producto CHAR(25),
	nombre varchar(150),
	categoria varchar(50),
)
go

create table dim_tiempo (
	fecha_pedido date primary key,
	fecha_entrega date,
	diferencia int,
)
go


CREATE TABLE dim_ubicacion (
    id_ubicacion int PRIMARY KEY,
    provincia VARCHAR(50),
    distrito VARCHAR(50),
    capital_distrito VARCHAR(50),
    centro_poblado_localidad VARCHAR(100),
    codigo_postal VARCHAR(20)
);

CREATE TABLE dim_empleado (
    id_empleado int primary key identity,
    pk_empleado CHAR(25)NOT NULL,
	nombre VARCHAR(200) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
	estado VARCHAR(12),
);


create table fac_ventas (
	id_venta int primary key identity,
	id_cliente int references dim_cliente,
	id_empleado int references dim_empleado,
	id_ubicacion int references dim_ubicacion,
	id_producto int references dim_producto,
	fecha_pedido date references dim_tiempo,
	fecha_entrega date,
	diferencia int,
)
go






















--DROP DATABASE datamartSodimac

--CREATE TABLE dim_almacen (
--    id_almacen int primary key identity,
--	pk_almacen char(25),
--    Nombre  VARCHAR(150),
--    estado varchar(20),
--    ubicacion VARCHAR(150),
--);

--create table dim_proveedor (
--	id_proveedor int primary key identity,
--	pk_proveedor CHAR(25), 
--	nombre varchar(250),
--	telefono varchar(15)
--)
--go