
create database sodimac_BD2
go

use sodimac_BD2
go


CREATE TABLE TB_UBICACION ( -- Conectado con:  TB_CLIENTES y TB_UBiCACION
    id_ubicacion INT NOT NULL PRIMARY KEY,
    provincia VARCHAR(50),
    distrito VARCHAR(50),
    capital_distrito VARCHAR(50),
    centro_poblado_localidad VARCHAR(100),
    codigo_postal VARCHAR(20)
);
insert into TB_UBICACION values(1, 	'Lima', 'Lima', 'Lima', 'Lima', '15001')
insert into TB_UBICACION values(2, 	'Lima', 'Lima', 'Lima', 'Lima', '15003')
insert into TB_UBICACION values(3, 	'Lima', 'Lima', 'Lima', 'Lima', '15004')
-- insert esta al final.
SELECT * FROM TB_UBICACION


CREATE TABLE TB_EMPLEADO(
    id_empleado CHAR(25)NOT NULL PRIMARY KEY,
    estado VARCHAR(12),
	nombre VARCHAR(200) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(50),
    direccion VARCHAR(100),
    fechaNacimiento DATE NOT NULL,
    telefono int
);
INSERT INTO TB_EMPLEADO  VALUES ('EM01', 'Activo', 'Juan', 'Flores Carter', 'jdoe@sodimac', 'Av. Principal 123', '1985-05-20', 987654321),
								('EM02', 'Activo', 'Jose', 'Smith Rens', 'asmith@sodimac', 'Av. Secundaria 456', '1990-07-15', 912345678),
								('EM03', 'Activo', 'Sebas', 'Ruiz Iman', 'asmith@sodimac', 'Av. Tercera 789', '1988-11-30', 932165478);
SELECT * FROM TB_EMPLEADO


CREATE TABLE TB_CLIENTES(
    id_clientes CHAR(25)NOT NULL PRIMARY KEY,
    estado VARCHAR(12),
    nombres VARCHAR(200) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fechaNacimiento DATE NOT NULL,
    telefono VARCHAR(20),
    correo VARCHAR(50),
    direccion1 VARCHAR(150),
    informacion_adicional VARCHAR(250),
    id_empleado CHAR(25),
    id_ubicacion INT,
    FOREIGN KEY (id_empleado) REFERENCES TB_EMPLEADO(id_empleado),
    FOREIGN KEY (id_ubicacion) REFERENCES TB_UBiCACION(id_ubicacion)
);
INSERT INTO TB_CLIENTES  VALUES ('CL001', 'Activo', 'Brando', 'Servero Tapia', '1990-01-01', '912345678', 'brando@gmail.com', 'MC-L 07 VIV ALAMEDA', 'Cerca a makro comas', 'EM01', 1), -- COMAS (126) -> TB_UBICACION
								('CL002', 'Activo', 'Matias', 'Castello Arrequi', '1991-02-02', '923456789', 'matias@gmail.com', 'AV. PRODUCCIÓN NACIONAL 188', 'Pasando produccion de chorrillos', 'EM02', 2), -- Chorrillos (109) -> TB_UBICACION
								('CL003', 'Activo', 'Dani', 'Baena Jacinta', '1992-03-03', '934567890', 'dani@gmail.com', 'JR. VICTOR ANDRES BELAUNDE Nº 976', 'casa de 3 pisos, color amarillo', 'EM03', 3); -- Carabayllo (34) -> TB_UBICACION


CREATE TABLE TB_COMPROBANTE(
    id_comprobante CHAR(25)NOT NULL PRIMARY KEY,
    tipo_comprobante VARCHAR(50) NOT NULL
);
INSERT INTO TB_COMPROBANTE  VALUES ('COM001', 'Factura'),
								   ('COM002', 'Boleta'),
								   ('COM003', 'Nota de crédito')
go

-- EN REVICION: -------------------------------------------------------------
CREATE TABLE TB_TIPO_ENTREGA(
    id_tipoEntrega CHAR(25)NOT NULL PRIMARY KEY,
    descripcion VARCHAR(200) NOT NULL,
    monto FLOAT,
	dias int
);
INSERT INTO TB_TIPO_ENTREGA VALUES ('TE01', 'Retiro en tienda', 0, 1),
								   ('TE02', 'Entrega regular', 10, 5),
								   ('TE03', 'Entrega rápida', 20, 2);


CREATE TABLE TB_ENTIENDA(
    id_enTienda CHAR(25)NOT NULL PRIMARY KEY,
	nombre VARCHAR(200) NOT NULL,
    dirCentral VARCHAR(100) NOT NULL,
    monto FLOAT,
    id_tipoEntrega CHAR(25),
    FOREIGN KEY (id_tipoEntrega) REFERENCES TB_TIPO_ENTREGA(id_tipoEntrega)
);
INSERT INTO TB_ENTIENDA VALUES ('ET01', 'Sodimac Comas', 'Av. Chacra Cerro 121', 0, 'TE01'),
							   ('ET02', 'Sodimac Puente Piedra','Av. San Juan de Dios con Calle 7', 0, 'TE01'),
							   ('ET03', 'Sodimac S. J. Lurigancho', 'Jr. Cajamarquilla, Urb.Zarate', 0, 'TE01'); 

CREATE TABLE TB_DELIVERY(
    id_delivery CHAR(25)NOT NULL PRIMARY KEY,
    id_tipoEntrega CHAR(25),
    id_ubicacion INT,
    FOREIGN KEY (id_tipoEntrega) REFERENCES TB_TIPO_ENTREGA(id_tipoEntrega),
    FOREIGN KEY (id_ubicacion) REFERENCES TB_UBiCACION(id_ubicacion)
);
INSERT INTO TB_DELIVERY VALUES ('DE01', 'TE02', '1'),  
							   ('DE02', 'TE02', '2'),
							   ('DE03', 'TE02', '3');
							   
CREATE TABLE TB_PEDIDO(
    id_pedido CHAR(25)NOT NULL PRIMARY KEY,
    estado VARCHAR(12),
    fecha_entrega DATE,
    fecha_llegada DATE,
    total_pedido FLOAT,
    id_clientes CHAR(25),
    id_comprobante CHAR(25),
    id_empleado CHAR(25),
    id_tipoEntrega CHAR(25),
	id_ubicacion INT,
    FOREIGN KEY (id_clientes) REFERENCES TB_CLIENTES(id_clientes),
    FOREIGN KEY (id_comprobante) REFERENCES TB_COMPROBANTE(id_comprobante),
    FOREIGN KEY (id_empleado) REFERENCES TB_EMPLEADO(id_empleado),
    FOREIGN KEY (id_tipoEntrega) REFERENCES TB_TIPO_ENTREGA(id_tipoEntrega),
	FOREIGN KEY (id_ubicacion) REFERENCES TB_UBiCACION(id_ubicacion)
);
-- RECUERDA LA FECHA con el TIPO DE EMTREGA:
INSERT INTO TB_PEDIDO VALUES ('PE01', 'Disponible', '2015-06-01', '2015-06-02', 100, 'CL001', 'COM001', 'EM01', 'TE01', '1'),
							 ('PE02', 'En proceso', '2015-06-02', '2015-06-07', 200, 'CL002', 'COM002', 'EM02', 'TE02', '2'),
                             ('PE03', 'En proceso', '2015-06-03', '2015-06-04', 300, 'CL003', 'COM003', 'EM03', 'TE03', '3');


-----------------------------------
-- Data misma de la tienda Sodimac:
-----------------------------------

CREATE TABLE TB_CATEGORIA (
    id_categoria CHAR(25)NOT NULL PRIMARY KEY,
	tipo VARCHAR(50),
);
INSERT INTO TB_CATEGORIA  VALUES ('CAT01', 'Muebles'),
								 ('CAT02', 'Dormitorio'),
								 ('CAT03', 'Electrohogar'),
								 ('CAT04', 'Tecnologia'),
								 ('CAT05', 'Terrazas y Jardin'),
								 ('CAT06', 'Baños y Cocina'),
								 ('CAT07', 'Herramientas y Maquinarias'),
								 ('CAT08', 'Limpieza'),
								 ('CAT09', 'Decoracion, Mnaje e Iluminación'),
								 ('CAT010', 'Aire libre y Mascotas'),
								 ('CAT011', 'Pisos y Pinturas');
go


CREATE TABLE TB_PRODUCTO (
    id_producto CHAR(25)NOT NULL PRIMARY KEY,
    estado VARCHAR(15),
    lote VARCHAR(50),
    nombre VARCHAR(150),
    marcha varchar(70),
    precio DECIMAL(38,2),
    id_categoria CHAR(25),
    FOREIGN KEY (id_categoria) REFERENCES TB_CATEGORIA(id_categoria)
); select * from TB_PRODUCTO

-- MUEBLES:
INSERT INTO TB_PRODUCTO  VALUES ('PR01', 'Disponible', 'LI121362796', 'Mesa de TV 65 Funes', 'JUST HOME COLLECTION', 699.90, 'CAT01 '),
								('PR02', 'Disponible', 'LI131382792', 'Mesa de Centro Beijing Negro', 'TUHOME', 269.00, 'CAT01 '),
								('PR03', 'Disponible', 'LI141302797', 'Sofá Cama Venecia', 'BONNO', 1799.00, 'CAT01 ');
-- DORMITORIO:
INSERT INTO TB_PRODUCTO VALUES ('PR04', 'Disponible', 'LI151392798', 'Cama Queen Size', 'TUHOME', 1299.90, 'CAT02'),
                               ('PR05', 'Disponible', 'LI161402793', 'Ropero 6 Puertas 2 Cajones', 'JUST HOME COLLECTION', 599.00, 'CAT02'),
                               ('PR06', 'Disponible', 'LI171312799', 'Colchón Queen Size', 'PARAISO', 899.00, 'CAT02');
-- ELECTROHOGAR:
INSERT INTO TB_PRODUCTO VALUES ('PR07', 'Disponible', 'LI181422794', 'Refrigeradora No Frost 278L', 'MABE', 1399.00, 'CAT03'),
                               ('PR08', 'Disponible', 'LI191432790', 'Lavadora 8Kg', 'LG', 1099.00, 'CAT03'),
                               ('PR09', 'Disponible', 'LI201342795', 'Microondas 25L', 'MIRAY', 299.00, 'CAT03');
-- TECNOLOGIA:
INSERT INTO TB_PRODUCTO VALUES ('PR10', 'Disponible', 'LI211452791', 'Smart TV 55" 4K UHD', 'SAMSUNG', 2299.00, 'CAT04'),
                               ('PR11', 'Disponible', 'LI221462796', 'Laptop 15.6" Core i5 8GB RAM 1TB HDD', 'HP', 2599.00, 'CAT04'),
                               ('PR12', 'Disponible', 'LI231372792', 'Celular 6.5" 4GB RAM 128GB', 'XIAOMI', 899.00, 'CAT04');
-- FALTA PONER LAS DEMAS CATEGORIAS -  RECUERDAS LOS PK.
GO


CREATE TABLE TB_PROVEEDORES (
    id_proveedor CHAR(25)NOT NULL PRIMARY KEY,
	nombre varchar (250),
    estado VARCHAR(11),
    correo VARCHAR(50),
    nombre_contacto VARCHAR(50),
    ruc VARCHAR(20),
    telefono VARCHAR(15)
);
select * from TB_PROVEEDORES -- Estoy usando LOS PROVEEDORES de la misma marca de TB_PROUCTO:
INSERT INTO TB_PROVEEDORES (id_proveedor, nombre, estado, correo, nombre_contacto, ruc, telefono) VALUES
('LI12136', 'Just Home Collection', 'Activo', 'contacto@justhomecollection.com', 'Representante Just Home', '20550235563', '01 555 1234'),
('LI13138', 'TuHome', 'Activo', 'servicio@tuhome.com', 'Servicio al Cliente TuHome', '20550325564', '01 555 5678'),
('LI14130', 'Bonno', 'Activo', 'info@bonno.com', 'Atención al Cliente Bonno', '20550435565', '01 555 9012'),
('LI15139', 'TuHome', 'Activo', 'contacto@tuhome.com', 'Representante TuHome', '20550325564', '01 555 3456'),
('LI16140', 'Just Home Collection', 'Activo', 'ventas@justhomecollection.com', 'Ventas Just Home', '20550235563', '01 555 7890'),
('LI17131', 'Paraíso', 'Activo', 'postventa@paraiso.com', 'Postventa Paraíso', '20550545566', '01 555 6789'),
('LI18142', 'Mabe', 'Activo', 'atencioncliente@mabe.com', 'Atención al Cliente Mabe', '20550655567', '01 555 4321'),
('LI19143', 'LG', 'Activo', 'soporte@lg.com', 'Soporte Técnico LG', '20550765568', '01 555 8765'),
('LI20134', 'Miray', 'Activo', 'contacto@miray.com', 'Contacto Miray', '20550875569', '01 555 4320'),
('LI21145', 'Samsung', 'Activo', 'servicio@samsung.com', 'Servicio al Cliente Samsung', '20550985570', '01 555 8760'),
('LI22146', 'HP', 'Activo', 'soporte@hp.com', 'Soporte Técnico HP', '20551095571', '01 555 4329'),
('LI23137', 'Xiaomi', 'Activo', 'ventas@xiaomi.com', 'Ventas Xiaomi', '20551105572', '01 555 8769');
GO


CREATE TABLE TB_ALMACEN (
    id_almacen CHAR(25)NOT NULL PRIMARY KEY,
	Nombre  VARCHAR(150),
    estado varchar(20),
    ubicacion VARCHAR(150),
    razon_social varchar(50),
    tefono varchar(20),
    ruc varchar(30),
    capacidad DECIMAL(38,2),
    telefono VARCHAR(20)
);
INSERT INTO TB_ALMACEN  VALUES -- creo q  solo hay 1 un almacen.
('ALM01', 'Centro de distribución Sodimac', 'Activo', 'P5JF+23P, Unnamed Road, Lurín 15823', 'Sodimac Perú', '01 456 7890', '20389230724', 1000.50, '01 419-2000');


CREATE TABLE TB_COMPRAS (
    id_compra CHAR(25)NOT NULL PRIMARY KEY,
    cantidad DECIMAL(38,2),
    fecha_compra DATE,
    id_producto CHAR(25),
    id_proveedor CHAR(25),
    id_almacen CHAR(25),
    FOREIGN KEY (id_producto) REFERENCES TB_PRODUCTO(id_producto),
    FOREIGN KEY (id_proveedor) REFERENCES TB_PROVEEDORES(id_proveedor),
    FOREIGN KEY (id_almacen) REFERENCES TB_ALMACEN(id_almacen)
);
INSERT INTO TB_COMPRAS VALUES
('C01', 10.00, '2023-01-01', 'PR01', 'LI12136', 'ALM01'),
('C02', 20.00, '2023-01-02', 'PR02', 'LI13138', 'ALM01'),
('C03', 15.00, '2023-01-03', 'PR03', 'LI14130', 'ALM01'),
('C04', 25.00, '2023-01-04', 'PR04', 'LI15139', 'ALM01'),
('C05', 30.00, '2023-01-05', 'PR05', 'LI16140', 'ALM01'),
('C06', 18.00, '2023-01-06', 'PR06', 'LI17131', 'ALM01'),
('C07', 12.00, '2023-01-07', 'PR07', 'LI18142', 'ALM01'),
('C08', 22.00, '2023-01-08', 'PR08', 'LI19143', 'ALM01'),
('C09', 28.00, '2023-01-09', 'PR09', 'LI20134', 'ALM01'),
('C10', 10.00, '2023-01-10', 'PR10', 'LI21145', 'ALM01'),
('C11', 15.00, '2023-01-11', 'PR11', 'LI22146', 'ALM01'),
('C12', 20.00, '2023-01-12', 'PR12', 'LI23137', 'ALM01');


CREATE TABLE TB_INVENTARIO (
    id_inventario CHAR(25)NOT NULL PRIMARY KEY,
    cantidad DECIMAL(38,2),
    fecha date,
    id_producto CHAR(25),
    id_almacen CHAR(25),
    FOREIGN KEY (id_producto) REFERENCES TB_PRODUCTO(id_producto),
    FOREIGN KEY (id_almacen) REFERENCES TB_ALMACEN(id_almacen)
);
INSERT INTO TB_INVENTARIO VALUES
('I01', 100.00, '2023-01-01', 'PR01', 'ALM01'),
('I02', 200.00, '2023-01-02', 'PR02', 'ALM01'),
('I03', 150.00, '2023-01-03', 'PR03', 'ALM01'),
('I04', 250.00, '2023-01-04', 'PR04', 'ALM01'),
('I05', 300.00, '2023-01-05', 'PR05', 'ALM01'),
('I06', 180.00, '2023-01-06', 'PR06', 'ALM01'),
('I07', 120.00, '2023-01-07', 'PR07', 'ALM01'),
('I08', 220.00, '2023-01-08', 'PR08', 'ALM01'),
('I09', 280.00, '2023-01-09', 'PR09', 'ALM01'),
('I10', 100.00, '2023-01-10', 'PR10', 'ALM01'),
('I11', 150.00, '2023-01-11', 'PR11', 'ALM01'),
('I12', 200.00, '2023-01-12', 'PR12', 'ALM01');


CREATE TABLE TB_detallePEDIDO(
    id_detallePedido CHAR(25)NOT NULL PRIMARY KEY,
    cantidad_objetiva DECIMAL(38,2),
    cantidad_obtenida DECIMAL(38,2),
    total_detalle FLOAT,
    id_pedido CHAR(25),
    id_producto CHAR(25),
    FOREIGN KEY (id_pedido) REFERENCES TB_PEDIDO(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES TB_PRODUCTO(id_producto)
);
INSERT INTO TB_detallePEDIDO VALUES
('DP01', 5.00, 5.00, 3499.50, 'PE01', 'PR01'),
('DP02', 3.00, 3.00, 807.00, 'PE01', 'PR02'),
('DP03', 2.00, 2.00, 3598.00, 'PE01', 'PR03'),
('DP04', 1.00, 1.00, 1299.90, 'PE02', 'PR04'),
('DP05', 4.00, 4.00, 2396.00, 'PE02', 'PR05'),
('DP06', 2.00, 2.00, 1798.00, 'PE02', 'PR06'),
('DP07', 1.00, 1.00, 1399.00, 'PE03', 'PR07'),
('DP08', 2.00, 2.00, 2198.00, 'PE03', 'PR08'),
('DP09', 1.00, 1.00, 299.00, 'PE03', 'PR09'),
('DP10', 1.00, 1.00, 2299.00, 'PE03', 'PR10'),
('DP11', 1.00, 1.00, 2599.00, 'PE03', 'PR11'),
('DP12', 2.00, 2.00, 1798.00, 'PE03', 'PR12');



/* ----------------------------------------------------------------------

1. Tabla TB_ALMACEN:
	La tabla TB_ALMACEN se centra exclusivamente en la información del almacén, 
	como ubicación y capacidad. Esto evita la dependencia directa con otras entidades 
	como proveedores o compras, lo cual simplifica la gestión y evita redundancias.

    1.1. Conectar la tabla TB_ALMACEN con otras tablas relevantes:

	TB_PRODUCTO para rastrear el inventario de productos en los almacenes.


2. tabla TB_INVENTARIO:
	La tabla TB_INVENTARIO relaciona productos con almacenes, lo que facilita el 
	seguimiento de las existencias en cada ubicación de almacenamiento. Esto es 
	crucial para el control de inventario y la gestión eficiente de entregas.

*/ ----------------------------------------------------------------------



/* ----------------------------------------------------------------
	MTC - CODIGO POSTAL PERU:
	https://www.datosabiertos.gob.pe/dataset/mtc-codigo-postal-peru
*/ ----------------------------------------------------------------

insert into TB_UBICACION values(1, 	'Lima', 'Lima', 'Lima', 'Lima', '15001')
insert into TB_UBICACION values(2, 	'Lima', 'Lima', 'Lima', 'Lima', '15003')
insert into TB_UBICACION values(3, 	'Lima', 'Lima', 'Lima', 'Lima', '15004')
-- se ecejuto desde 3 - EJECUTAR DESDE ACA ABAJO, EL 4:
insert into TB_UBICACION values(4, 	'Lima', 'Lima', 'Lima', 'Lima', '15006')
insert into TB_UBICACION values(5, 	'Lima', 'Lima', 'Lima', 'Lima', '15018')
insert into TB_UBICACION values(6, 	'Lima', 'Lima', 'Lima', 'Lima', '15019')
insert into TB_UBICACION values(7, 	'Lima', 'Lima', 'Lima', 'Lima', '15046')
insert into TB_UBICACION values(8, 	'Lima', 'Lima', 'Lima', 'Lima', '15072')
insert into TB_UBICACION values(9, 	'Lima', 'Lima', 'Lima', 'Lima', '15079')
insert into TB_UBICACION values(10, 	'Lima', 'Lima', 'Lima', 'Lima', '15081')
insert into TB_UBICACION values(11, 	'Lima', 'Lima', 'Lima', 'Lima', '15082')
insert into TB_UBICACION values(12, 	'Lima', 'Lima', 'Lima', 'Lima', '15083')
insert into TB_UBICACION values(13, 	'Lima', 'Lima', 'Lima', 'Lima', '15088')
insert into TB_UBICACION values(14, 	'Lima', 'Ancón', 'Ancon', 'Ancon', '15123')
insert into TB_UBICACION values(15, 	'Lima', 'Ate', 'Vitarte', 'Vitarte', '15004')
insert into TB_UBICACION values(16, 	'Lima', 'Ate', 'Vitarte', 'Vitarte', '15011')
insert into TB_UBICACION values(17, 	'Lima', 'Ate', 'Vitarte', 'Vitarte', '15012')
insert into TB_UBICACION values(18, 	'Lima', 'Ate', 'Vitarte', 'Vitarte', '15019')
insert into TB_UBICACION values(19, 	'Lima', 'Ate', 'Vitarte', 'Vitarte', '15022')
insert into TB_UBICACION values(20, 	'Lima', 'Ate', 'Vitarte', 'Vitarte', '15023')
insert into TB_UBICACION values(21, 	'Lima', 'Ate', 'Vitarte', 'Vitarte', '15026')
insert into TB_UBICACION values(22, 	'Lima', 'Ate', 'Vitarte', 'Vitarte', '15476')
insert into TB_UBICACION values(23, 	'Lima', 'Ate', 'Vitarte', 'Vitarte', '15479')
insert into TB_UBICACION values(24, 	'Lima', 'Ate', 'Vitarte', 'Vitarte', '15483')
insert into TB_UBICACION values(25, 	'Lima', 'Ate', 'Vitarte', 'Vitarte', '15487')
insert into TB_UBICACION values(26, 	'Lima', 'Ate', 'Vitarte', 'Vitarte', '15491')
insert into TB_UBICACION values(27, 	'Lima', 'Ate', 'Vitarte', 'Vitarte', '15494')
insert into TB_UBICACION values(28, 	'Lima', 'Ate', 'Vitarte', 'Vitarte', '15498')
insert into TB_UBICACION values(29, 	'Lima', 'Barranco', 'Barranco', 'Barranco', '15047')
insert into TB_UBICACION values(30, 	'Lima', 'Barranco', 'Barranco', 'Barranco', '15049')
insert into TB_UBICACION values(31, 	'Lima', 'Barranco', 'Barranco', 'Barranco', '15063')
insert into TB_UBICACION values(32, 	'Lima', 'Breña', 'Breña', 'Breña', '15082')
insert into TB_UBICACION values(33, 	'Lima', 'Breña', 'Breña', 'Breña', '15083')
insert into TB_UBICACION values(34, 	'Lima', 'Carabayllo', 'Carabayllo', 'Carabayllo', '15121')
insert into TB_UBICACION values(35, 	'Lima', 'Carabayllo', 'Carabayllo', 'Carabayllo', '15122')
insert into TB_UBICACION values(36, 	'Lima', 'Carabayllo', 'Carabayllo', 'Carabayllo', '15313')
insert into TB_UBICACION values(37, 	'Lima', 'Carabayllo', 'Carabayllo', 'Carabayllo', '15316')
insert into TB_UBICACION values(38, 	'Lima', 'Carabayllo', 'Carabayllo', 'Carabayllo', '15318')
insert into TB_UBICACION values(39, 	'Lima', 'Carabayllo', 'Carabayllo', 'Carabayllo', '15319')
insert into TB_UBICACION values(40, 	'Lima', 'Carabayllo', 'Carabayllo', 'Carabayllo', '15320')
insert into TB_UBICACION values(41, 	'Lima', 'Carabayllo', 'Carabayllo', 'Carabayllo', '15321')
insert into TB_UBICACION values(42, 	'Lima', 'Carabayllo', 'Carabayllo', 'Carabayllo', '15324')
insert into TB_UBICACION values(43, 	'Lima', 'Carabayllo', 'Carabayllo', 'Huatocay', '15320')
insert into TB_UBICACION values(44, 	'Lima', 'Carabayllo', 'Carabayllo', 'Buenavista', '15320')
insert into TB_UBICACION values(45, 	'Lima', 'Carabayllo', 'Carabayllo', 'Chocas Alto', '15320')
insert into TB_UBICACION values(46, 	'Lima', 'Carabayllo', 'Carabayllo', 'Chocas Bajo', '15320')
insert into TB_UBICACION values(47, 	'Lima', 'Carabayllo', 'Carabayllo', 'Casinelli', '15320')
insert into TB_UBICACION values(48, 	'Lima', 'Carabayllo', 'Carabayllo', 'Caballero', '15320')
insert into TB_UBICACION values(49, 	'Lima', 'Carabayllo', 'Carabayllo', 'Huarangal', '15121')
insert into TB_UBICACION values(50, 	'Lima', 'Carabayllo', 'Carabayllo', 'Fray Martin', '15320')
insert into TB_UBICACION values(51, 	'Lima', 'Carabayllo', 'Carabayllo', 'Santa Rosa de Puquio', '15320')
insert into TB_UBICACION values(52, 	'Lima', 'Carabayllo', 'Carabayllo', 'Cuchicorral', '15121')
insert into TB_UBICACION values(53, 	'Lima', 'Carabayllo', 'Carabayllo', 'Santiago de Punchauca', '15320')
insert into TB_UBICACION values(54, 	'Lima', 'Carabayllo', 'Carabayllo', 'La Cruz (11 Amigos)', '15320')
insert into TB_UBICACION values(55, 	'Lima', 'Carabayllo', 'Carabayllo', 'Cerro Cañon', '15121')
insert into TB_UBICACION values(56, 	'Lima', 'Carabayllo', 'Carabayllo', 'Cabaña Suche', '15121')
insert into TB_UBICACION values(57, 	'Lima', 'Carabayllo', 'Carabayllo', 'San Lorenzo', '15122')
insert into TB_UBICACION values(58, 	'Lima', 'Carabayllo', 'Carabayllo', 'Jose Carlos Mariategui', '15122')
insert into TB_UBICACION values(59, 	'Lima', 'Carabayllo', 'Carabayllo', 'Pascal', '15121')
insert into TB_UBICACION values(60, 	'Lima', 'Carabayllo', 'Carabayllo', 'La Esperanza', '15121')
insert into TB_UBICACION values(61, 	'Lima', 'Carabayllo', 'Carabayllo', 'Fundo Pancha Paula', '15121')
insert into TB_UBICACION values(62, 	'Lima', 'Carabayllo', 'Carabayllo', 'Olfa', '15320')
insert into TB_UBICACION values(63, 	'Lima', 'Carabayllo', 'Carabayllo', 'Rio Seco', '15320')
insert into TB_UBICACION values(64, 	'Lima', 'Carabayllo', 'Carabayllo', 'Paraiso', '15320')
insert into TB_UBICACION values(65, 	'Lima', 'Carabayllo', 'Carabayllo', 'El Rosario', '15320')
insert into TB_UBICACION values(66, 	'Lima', 'Carabayllo', 'Carabayllo', 'Cerro Puquio', '15320')
insert into TB_UBICACION values(67, 	'Lima', 'Carabayllo', 'Carabayllo', 'La Campana', '15320')
insert into TB_UBICACION values(68, 	'Lima', 'Carabayllo', 'Carabayllo', 'Las Animas', '15121')
insert into TB_UBICACION values(69, 	'Lima', 'Carabayllo', 'Carabayllo', 'Vetancio', '15121')
insert into TB_UBICACION values(70, 	'Lima', 'Carabayllo', 'Carabayllo', 'Roma Alta', '15121')
insert into TB_UBICACION values(71, 	'Lima', 'Carabayllo', 'Carabayllo', 'San Jose', '15320')
insert into TB_UBICACION values(72, 	'Lima', 'Carabayllo', 'Carabayllo', 'San Pedro de Carabayllo', '15121')
insert into TB_UBICACION values(73, 	'Lima', 'Carabayllo', 'Carabayllo', 'Huacoy', '15319')
insert into TB_UBICACION values(74, 	'Lima', 'Carabayllo', 'Carabayllo', 'Fundo Pampa Libre', '15121')
insert into TB_UBICACION values(75, 	'Lima', 'Carabayllo', 'Carabayllo', 'Ex Fundo Santa Ines', '15121')
insert into TB_UBICACION values(76, 	'Lima', 'Carabayllo', 'Carabayllo', 'Reposo', '15121')
insert into TB_UBICACION values(77, 	'Lima', 'Carabayllo', 'Carabayllo', 'Carmelito', '15320')
insert into TB_UBICACION values(78, 	'Lima', 'Carabayllo', 'Carabayllo', 'Santa Elena', '15320')
insert into TB_UBICACION values(79, 	'Lima', 'Carabayllo', 'Carabayllo', 'Don Luis', '15320')
insert into TB_UBICACION values(80, 	'Lima', 'Carabayllo', 'Carabayllo', 'Santa Ines Parcela', '15121')
insert into TB_UBICACION values(81, 	'Lima', 'Carabayllo', 'Carabayllo', 'Asociacion Santa Ines', '15121')
insert into TB_UBICACION values(82, 	'Lima', 'Carabayllo', 'Carabayllo', 'Roma Baja', '15121')
insert into TB_UBICACION values(83, 	'Lima', 'Carabayllo', 'Carabayllo', 'Residencial Santa Lucia', '15121')
insert into TB_UBICACION values(84, 	'Lima', 'Carabayllo', 'Carabayllo', 'San Francisco', '15320')
insert into TB_UBICACION values(85, 	'Lima', 'Carabayllo', 'Carabayllo', 'Santa Margarita - Molinos', '15320')
insert into TB_UBICACION values(86, 	'Lima', 'Carabayllo', 'Carabayllo', 'Sipan Peru', '15320')
insert into TB_UBICACION values(87, 	'Lima', 'Carabayllo', 'Carabayllo', 'Fundo Cuadros', '15122')
insert into TB_UBICACION values(88, 	'Lima', 'Carabayllo', 'Carabayllo', 'Bello Horizonte', '15122')
insert into TB_UBICACION values(89, 	'Lima', 'Carabayllo', 'Carabayllo', 'El Hueco', '15122')
insert into TB_UBICACION values(90, 	'Lima', 'Carabayllo', 'Carabayllo', 'Ex Fundo Mariategui', '15122')
insert into TB_UBICACION values(91, 	'Lima', 'Carabayllo', 'Carabayllo', 'Naranjito', '15122')
insert into TB_UBICACION values(92, 	'Lima', 'Carabayllo', 'Carabayllo', 'Vista Hermosa', '15122')
insert into TB_UBICACION values(93, 	'Lima', 'Carabayllo', 'Carabayllo', 'El Sabroso de Jose Carlos Mariategui', '15122')
insert into TB_UBICACION values(94, 	'Lima', 'Carabayllo', 'Carabayllo', 'Granja Carabayllo', '15122')
insert into TB_UBICACION values(95, 	'Lima', 'Carabayllo', 'Carabayllo', 'Agropecuario Valle el Chillon', '15121')
insert into TB_UBICACION values(96, 	'Lima', 'Carabayllo', 'Carabayllo', 'Camino Real', '15121')
insert into TB_UBICACION values(97, 	'Lima', 'Carabayllo', 'Carabayllo', 'Copacabana', '15122')
insert into TB_UBICACION values(98, 	'Lima', 'Carabayllo', 'Carabayllo', 'El Trebol', '15122')
insert into TB_UBICACION values(99, 	'Lima', 'Carabayllo', 'Carabayllo', 'Tablada la Virgen', '15121')
insert into TB_UBICACION values(100, 	'Lima', 'Carabayllo', 'Carabayllo', 'San Fernando de Carabayllo', '15121')
insert into TB_UBICACION values(101, 	'Lima', 'Carabayllo', 'Carabayllo', 'San Fernando de Copacabana', '15122')
insert into TB_UBICACION values(102, 	'Lima', 'Carabayllo', 'Carabayllo', 'La Manzana', '15122')
insert into TB_UBICACION values(103, 	'Lima', 'Carabayllo', 'Carabayllo', 'Chacra Grande', '15121')
insert into TB_UBICACION values(104, 	'Lima', 'Carabayllo', 'Carabayllo', 'Torres de Copacabana', '15122')
insert into TB_UBICACION values(105, 	'Lima', 'Carabayllo', 'Carabayllo', 'San Pedro de Carabayllo', '15122')
insert into TB_UBICACION values(106, 	'Lima', 'Carabayllo', 'Carabayllo', 'San Lorenzo', '15122')
insert into TB_UBICACION values(107, 	'Lima', 'Chaclacayo', 'Chaclacayo', 'Chaclacayo', '15472')
insert into TB_UBICACION values(108, 	'Lima', 'Chaclacayo', 'Chaclacayo', 'Chaclacayo', '15476')
insert into TB_UBICACION values(109, 	'Lima', 'Chorrillos', 'Chorrillos', 'Chorrillos', '15054')
insert into TB_UBICACION values(110, 	'Lima', 'Chorrillos', 'Chorrillos', 'Chorrillos', '15056')
insert into TB_UBICACION values(111, 	'Lima', 'Chorrillos', 'Chorrillos', 'Chorrillos', '15057')
insert into TB_UBICACION values(112, 	'Lima', 'Chorrillos', 'Chorrillos', 'Chorrillos', '15058')
insert into TB_UBICACION values(113, 	'Lima', 'Chorrillos', 'Chorrillos', 'Chorrillos', '15063')
insert into TB_UBICACION values(114, 	'Lima', 'Chorrillos', 'Chorrillos', 'Chorrillos', '15064')
insert into TB_UBICACION values(115, 	'Lima', 'Chorrillos', 'Chorrillos', 'Chorrillos', '15066')
insert into TB_UBICACION values(116, 	'Lima', 'Chorrillos', 'Chorrillos', 'Chorrillos', '15067')
insert into TB_UBICACION values(117, 	'Lima', 'Cieneguilla', 'Cieneguilla', 'Cieneguilla', '15593')
insert into TB_UBICACION values(118, 	'Lima', 'Cieneguilla', 'Cieneguilla', 'Cieneguilla', '15594')
insert into TB_UBICACION values(119, 	'Lima', 'Cieneguilla', 'Cieneguilla', 'Lindero', '15593')
insert into TB_UBICACION values(120, 	'Lima', 'Cieneguilla', 'Cieneguilla', 'Pichicato', '15593')
insert into TB_UBICACION values(121, 	'Lima', 'Cieneguilla', 'Cieneguilla', 'San Isidro', '15593')
insert into TB_UBICACION values(122, 	'Lima', 'Cieneguilla', 'Cieneguilla', 'San Vicente', '15593')
insert into TB_UBICACION values(123, 	'Lima', 'Cieneguilla', 'Cieneguilla', 'Piedra Liza', '15593')
insert into TB_UBICACION values(124, 	'Lima', 'Cieneguilla', 'Cieneguilla', 'San Francisco', '15593')
insert into TB_UBICACION values(125, 	'Lima', 'Cieneguilla', 'Cieneguilla', 'Santa Rosa de Chontay (Chontay)', '15593')
insert into TB_UBICACION values(126, 	'Lima', 'Comas', 'La Libertad', 'La Libertad', '15311')
insert into TB_UBICACION values(127, 	'Lima', 'Comas', 'La Libertad', 'La Libertad', '15312')
insert into TB_UBICACION values(128, 	'Lima', 'Comas', 'La Libertad', 'La Libertad', '15313')
insert into TB_UBICACION values(129, 	'Lima', 'Comas', 'La Libertad', 'La Libertad', '15314')
insert into TB_UBICACION values(130, 	'Lima', 'Comas', 'La Libertad', 'La Libertad', '15316')
insert into TB_UBICACION values(131, 	'Lima', 'Comas', 'La Libertad', 'La Libertad', '15324')
insert into TB_UBICACION values(132, 	'Lima', 'Comas', 'La Libertad', 'La Libertad', '15326')
insert into TB_UBICACION values(133, 	'Lima', 'Comas', 'La Libertad', 'La Libertad', '15327')
insert into TB_UBICACION values(134, 	'Lima', 'Comas', 'La Libertad', 'La Libertad', '15328')
insert into TB_UBICACION values(135, 	'Lima', 'Comas', 'La Libertad', 'La Libertad', '15332')
insert into TB_UBICACION values(136, 	'Lima', 'El Agustino', 'El Agustino', 'El Agustino', '15003')
insert into TB_UBICACION values(137, 	'Lima', 'El Agustino', 'El Agustino', 'El Agustino', '15004')
insert into TB_UBICACION values(138, 	'Lima', 'El Agustino', 'El Agustino', 'El Agustino', '15006')
insert into TB_UBICACION values(139, 	'Lima', 'El Agustino', 'El Agustino', 'El Agustino', '15007')
insert into TB_UBICACION values(140, 	'Lima', 'El Agustino', 'El Agustino', 'El Agustino', '15008')
insert into TB_UBICACION values(141, 	'Lima', 'El Agustino', 'El Agustino', 'El Agustino', '15009')
insert into TB_UBICACION values(142, 	'Lima', 'El Agustino', 'El Agustino', 'El Agustino', '15011')
insert into TB_UBICACION values(143, 	'Lima', 'El Agustino', 'El Agustino', 'El Agustino', '15018')
insert into TB_UBICACION values(144, 	'Lima', 'El Agustino', 'El Agustino', 'El Agustino', '15022')
insert into TB_UBICACION values(145, 	'Lima', 'Independencia', 'Independencia', 'Independencia', '15311')
insert into TB_UBICACION values(146, 	'Lima', 'Independencia', 'Independencia', 'Independencia', '15328')
insert into TB_UBICACION values(147, 	'Lima', 'Independencia', 'Independencia', 'Independencia', '15331')
insert into TB_UBICACION values(148, 	'Lima', 'Independencia', 'Independencia', 'Independencia', '15332')
insert into TB_UBICACION values(149, 	'Lima', 'Independencia', 'Independencia', 'Independencia', '15333')
insert into TB_UBICACION values(150, 	'Lima', 'Jesús María', 'Jesus Maria', 'Jesus Maria', '15046')
insert into TB_UBICACION values(151, 	'Lima', 'Jesús María', 'Jesus Maria', 'Jesus Maria', '15072')
insert into TB_UBICACION values(152, 	'Lima', 'Jesús María', 'Jesus Maria', 'Jesus Maria', '15073')
insert into TB_UBICACION values(153, 	'Lima', 'Jesús María', 'Jesus Maria', 'Jesus Maria', '15076')
insert into TB_UBICACION values(154, 	'Lima', 'Jesús María', 'Jesus Maria', 'Jesus Maria', '15083')
insert into TB_UBICACION values(155, 	'Lima', 'Jesús María', 'Jesus Maria', 'Jesus Maria', '15084')
insert into TB_UBICACION values(156, 	'Lima', 'La Molina', 'La Molina', 'La Molina', '15012')
insert into TB_UBICACION values(157, 	'Lima', 'La Molina', 'La Molina', 'La Molina', '15023')
insert into TB_UBICACION values(158, 	'Lima', 'La Molina', 'La Molina', 'La Molina', '15024')
insert into TB_UBICACION values(159, 	'Lima', 'La Molina', 'La Molina', 'La Molina', '15026')
insert into TB_UBICACION values(160, 	'Lima', 'La Victoria', 'La Victoria', 'La Victoria', '15018')
insert into TB_UBICACION values(161, 	'Lima', 'La Victoria', 'La Victoria', 'La Victoria', '15019')
insert into TB_UBICACION values(162, 	'Lima', 'La Victoria', 'La Victoria', 'La Victoria', '15033')
insert into TB_UBICACION values(163, 	'Lima', 'La Victoria', 'La Victoria', 'La Victoria', '15034')
insert into TB_UBICACION values(164, 	'Lima', 'Lince', 'Lince', 'Lince', '15046')
insert into TB_UBICACION values(165, 	'Lima', 'Lince', 'Lince', 'Lince', '15072')
insert into TB_UBICACION values(166, 	'Lima', 'Lince', 'Lince', 'Lince', '15073')
insert into TB_UBICACION values(167, 	'Lima', 'Lince', 'Lince', 'Lince', '15076')
insert into TB_UBICACION values(168, 	'Lima', 'Los Olivos', 'Las Palmeras', 'Las Palmeras', '15113')
insert into TB_UBICACION values(169, 	'Lima', 'Los Olivos', 'Las Palmeras', 'Las Palmeras', '15301')
insert into TB_UBICACION values(170, 	'Lima', 'Los Olivos', 'Las Palmeras', 'Las Palmeras', '15302')
insert into TB_UBICACION values(171, 	'Lima', 'Los Olivos', 'Las Palmeras', 'Las Palmeras', '15304')
insert into TB_UBICACION values(172, 	'Lima', 'Los Olivos', 'Las Palmeras', 'Las Palmeras', '15306')
insert into TB_UBICACION values(173, 	'Lima', 'Los Olivos', 'Las Palmeras', 'Las Palmeras', '15307')
insert into TB_UBICACION values(174, 	'Lima', 'Los Olivos', 'Las Palmeras', 'Las Palmeras', '15311')
insert into TB_UBICACION values(175, 	'Lima', 'Los Olivos', 'Las Palmeras', 'Las Palmeras', '15314')
insert into TB_UBICACION values(176, 	'Lima', 'Lurigancho', 'Chosica', 'Chosica', '15457')
insert into TB_UBICACION values(177, 	'Lima', 'Lurigancho', 'Chosica', 'Chosica', '15461')
insert into TB_UBICACION values(178, 	'Lima', 'Lurigancho', 'Chosica', 'Chosica', '15464')
insert into TB_UBICACION values(179, 	'Lima', 'Lurigancho', 'Chosica', 'Chosica', '15468')
insert into TB_UBICACION values(180, 	'Lima', 'Lurigancho', 'Chosica', 'Chosica', '15472')
insert into TB_UBICACION values(181, 	'Lima', 'Lurín', 'Lurin', 'Lurin', '15822')
insert into TB_UBICACION values(182, 	'Lima', 'Lurín', 'Lurin', 'Lurin', '15823')
insert into TB_UBICACION values(183, 	'Lima', 'Lurín', 'Lurin', 'Lurin', '15841')
insert into TB_UBICACION values(184, 	'Lima', 'Lurín', 'Lurin', 'Lurin', '15842')
insert into TB_UBICACION values(185, 	'Lima', 'Lurín', 'Lurin', 'Lurin', '15846')
insert into TB_UBICACION values(186, 	'Lima', 'Lurín', 'Lurin', 'Los Almacigos', '15822')
insert into TB_UBICACION values(187, 	'Lima', 'Lurín', 'Lurin', 'Rinconada del Puruhuay', '15823')
insert into TB_UBICACION values(188, 	'Lima', 'Lurín', 'Lurin', 'Fundo Santa Genoveva', '15823')
insert into TB_UBICACION values(189, 	'Lima', 'Lurín', 'Lurin', 'Los Maderos', '15823')
insert into TB_UBICACION values(190, 	'Lima', 'Lurín', 'Lurin', 'Casco Viejo', '15823')
insert into TB_UBICACION values(191, 	'Lima', 'Lurín', 'Lurin', 'Vista Alegre', '15823')
insert into TB_UBICACION values(192, 	'Lima', 'Lurín', 'Lurin', 'Buena Vista Alta', '15823')
insert into TB_UBICACION values(193, 	'Lima', 'Lurín', 'Lurin', 'Lomas Pucara', '15823')
insert into TB_UBICACION values(194, 	'Lima', 'Lurín', 'Lurin', 'Fundo la Querencia', '15823')
insert into TB_UBICACION values(195, 	'Lima', 'Magdalena del Mar', 'Magdalena del Mar', 'Magdalena del Mar', '15076')
insert into TB_UBICACION values(196, 	'Lima', 'Magdalena del Mar', 'Magdalena del Mar', 'Magdalena del Mar', '15086')
insert into TB_UBICACION values(197, 	'Lima', 'Magdalena Vieja', 'Pueblo Libre', 'Pueblo Libre', '15083')
insert into TB_UBICACION values(198, 	'Lima', 'Magdalena Vieja', 'Pueblo Libre', 'Pueblo Libre', '15084')
insert into TB_UBICACION values(199, 	'Lima', 'Magdalena Vieja', 'Pueblo Libre', 'Pueblo Libre', '15086')
insert into TB_UBICACION values(200, 	'Lima', 'Magdalena Vieja', 'Pueblo Libre', 'Pueblo Libre', '15088')
insert into TB_UBICACION values(201, 	'Lima', 'Miraflores', 'Miraflores', 'Miraflores', '15046')
insert into TB_UBICACION values(202, 	'Lima', 'Miraflores', 'Miraflores', 'Miraflores', '15047')
insert into TB_UBICACION values(203, 	'Lima', 'Miraflores', 'Miraflores', 'Miraflores', '15048')
insert into TB_UBICACION values(204, 	'Lima', 'Miraflores', 'Miraflores', 'Miraflores', '15073')
insert into TB_UBICACION values(205, 	'Lima', 'Miraflores', 'Miraflores', 'Miraflores', '15074')
insert into TB_UBICACION values(206, 	'Lima', 'Miraflores', 'Miraflores', 'Miraflores', '15076')
insert into TB_UBICACION values(207, 	'Lima', 'Pachacamac', 'Pachacamac', 'Pachacamac', '15593')
insert into TB_UBICACION values(208, 	'Lima', 'Pachacamac', 'Pachacamac', 'Pachacamac', '15594')
insert into TB_UBICACION values(209, 	'Lima', 'Pachacamac', 'Pachacamac', 'Pachacamac', '15823')
insert into TB_UBICACION values(210, 	'Lima', 'Pachacamac', 'Pachacamac', 'Puente Manchay', '15593')
insert into TB_UBICACION values(211, 	'Lima', 'Pachacamac', 'Pachacamac', 'Tambo Inga', '15593')
insert into TB_UBICACION values(212, 	'Lima', 'Pachacamac', 'Pachacamac', 'Pampa Flores', '15593')
insert into TB_UBICACION values(213, 	'Lima', 'Pachacamac', 'Pachacamac', 'Manchay Alto Lote B', '15593')
insert into TB_UBICACION values(214, 	'Lima', 'Pachacamac', 'Pachacamac', 'Invasion Cementerio', '15593')
insert into TB_UBICACION values(215, 	'Lima', 'Pachacamac', 'Pachacamac', 'Manchay Bajo', '15593')
insert into TB_UBICACION values(216, 	'Lima', 'Pachacamac', 'Pachacamac', 'Santa Rosa de Mal Paso', '15593')
insert into TB_UBICACION values(217, 	'Lima', 'Pachacamac', 'Pachacamac', 'Cardal', '15823')
insert into TB_UBICACION values(218, 	'Lima', 'Pachacamac', 'Pachacamac', 'Jatosisa', '15823')
insert into TB_UBICACION values(219, 	'Lima', 'Pachacamac', 'Pachacamac', 'Tomina', '15823')
insert into TB_UBICACION values(220, 	'Lima', 'Pucusana', 'Pucusana', 'Pucusana', '15866')
insert into TB_UBICACION values(221, 	'Lima', 'Pucusana', 'Pucusana', 'Honda', '15865')
insert into TB_UBICACION values(222, 	'Lima', 'Pucusana', 'Pucusana', 'Quipa', '15865')
insert into TB_UBICACION values(223, 	'Lima', 'Pucusana', 'Pucusana', 'Los Pelicanos', '15865')
insert into TB_UBICACION values(224, 	'Lima', 'Pucusana', 'Pucusana', 'Playa Puerto Bello', '15865')
insert into TB_UBICACION values(225, 	'Lima', 'Pucusana', 'Pucusana', 'Ñaves', '15866')
insert into TB_UBICACION values(226, 	'Lima', 'Pucusana', 'Pucusana', 'Granja Santa Elena', '15865')
insert into TB_UBICACION values(227, 	'Lima', 'Pucusana', 'Pucusana', 'Alvatroz II', '15865')
insert into TB_UBICACION values(228, 	'Lima', 'Pucusana', 'Pucusana', 'Poseidon - Lobo Varado', '15865')
insert into TB_UBICACION values(229, 	'Lima', 'Pucusana', 'Pucusana', 'Playa Minka Mar', '15865')
insert into TB_UBICACION values(230, 	'Lima', 'Pucusana', 'Pucusana', 'Playa Acantilado', '15865')
insert into TB_UBICACION values(231, 	'Lima', 'Puente Piedra', 'Puente Piedra', 'Puente Piedra', '15113')
insert into TB_UBICACION values(232, 	'Lima', 'Puente Piedra', 'Puente Piedra', 'Puente Piedra', '15116')
insert into TB_UBICACION values(233, 	'Lima', 'Puente Piedra', 'Puente Piedra', 'Puente Piedra', '15117')
insert into TB_UBICACION values(234, 	'Lima', 'Puente Piedra', 'Puente Piedra', 'Puente Piedra', '15118')
insert into TB_UBICACION values(235, 	'Lima', 'Puente Piedra', 'Puente Piedra', 'Puente Piedra', '15121')
insert into TB_UBICACION values(236, 	'Lima', 'Puente Piedra', 'Puente Piedra', 'Puente Piedra', '15122')
insert into TB_UBICACION values(237, 	'Lima', 'Punta Hermosa', 'Punta Hermosa', 'Punta Hermosa', '15846')
insert into TB_UBICACION values(238, 	'Lima', 'Punta Hermosa', 'Punta Hermosa', 'Capilla Lucumo', '15845')
insert into TB_UBICACION values(239, 	'Lima', 'Punta Hermosa', 'Punta Hermosa', 'Cucuya', '15845')
insert into TB_UBICACION values(240, 	'Lima', 'Punta Hermosa', 'Punta Hermosa', 'Pampapacta', '15845')
insert into TB_UBICACION values(241, 	'Lima', 'Punta Hermosa', 'Punta Hermosa', 'Avicola San Cirilo de Loma Negra - 03', '15845')
insert into TB_UBICACION values(242, 	'Lima', 'Punta Hermosa', 'Punta Hermosa', 'Avicola San Cirilo de Loma Negra - 02', '15845')
insert into TB_UBICACION values(243, 	'Lima', 'Punta Hermosa', 'Punta Hermosa', 'Avicola San Cirilo de Loma Negra - 01', '15845')
insert into TB_UBICACION values(244, 	'Lima', 'Punta Hermosa', 'Punta Hermosa', 'Pampa Mamay', '15845')
insert into TB_UBICACION values(245, 	'Lima', 'Punta Hermosa', 'Punta Hermosa', 'Cerro Botija', '15846')
insert into TB_UBICACION values(246, 	'Lima', 'Punta Hermosa', 'Punta Hermosa', 'Agricultores y Ganaderos', '15845')
insert into TB_UBICACION values(247, 	'Lima', 'Punta Hermosa', 'Punta Hermosa', 'Pampa Malanche Avicola Puma', '15845')
insert into TB_UBICACION values(248, 	'Lima', 'Punta Negra', 'Punta Negra', 'Punta Negra', '15851')
insert into TB_UBICACION values(249, 	'Lima', 'Punta Negra', 'Punta Negra', 'Chancheria', '15850')
insert into TB_UBICACION values(250, 	'Lima', 'Rimac', 'Rimac', 'Rimac', '15093')
insert into TB_UBICACION values(251, 	'Lima', 'Rimac', 'Rimac', 'Rimac', '15094')
insert into TB_UBICACION values(252, 	'Lima', 'Rimac', 'Rimac', 'Rimac', '15096')
insert into TB_UBICACION values(253, 	'Lima', 'Rimac', 'Rimac', 'Rimac', '15333')
insert into TB_UBICACION values(254, 	'Lima', 'San Bartolo', 'San Bartolo', 'San Bartolo', '15856')
insert into TB_UBICACION values(255, 	'Lima', 'San Bartolo', 'San Bartolo', 'Plantel 41', '15855')
insert into TB_UBICACION values(256, 	'Lima', 'San Bartolo', 'San Bartolo', 'Granja 4', '15855')
insert into TB_UBICACION values(257, 	'Lima', 'San Bartolo', 'San Bartolo', 'Granja 5', '15855')
insert into TB_UBICACION values(258, 	'Lima', 'San Bartolo', 'San Bartolo', 'Granja 07', '15855')
insert into TB_UBICACION values(259, 	'Lima', 'San Bartolo', 'San Bartolo', 'Granja 44', '15855')
insert into TB_UBICACION values(260, 	'Lima', 'San Bartolo', 'San Bartolo', 'Granja 47', '15855')
insert into TB_UBICACION values(261, 	'Lima', 'San Bartolo', 'San Bartolo', 'Santa Maria I', '15855')
insert into TB_UBICACION values(262, 	'Lima', 'San Bartolo', 'San Bartolo', 'Las Torres Santa Fe', '15855')
insert into TB_UBICACION values(263, 	'Lima', 'San Borja', 'San Francisco de Borja', 'San Francisco de Borja', '15021')
insert into TB_UBICACION values(264, 	'Lima', 'San Borja', 'San Francisco de Borja', 'San Francisco de Borja', '15034')
insert into TB_UBICACION values(265, 	'Lima', 'San Borja', 'San Francisco de Borja', 'San Francisco de Borja', '15036')
insert into TB_UBICACION values(266, 	'Lima', 'San Borja', 'San Francisco de Borja', 'San Francisco de Borja', '15037')
insert into TB_UBICACION values(267, 	'Lima', 'San Isidro', 'San Isidro', 'San Isidro', '15036')
insert into TB_UBICACION values(268, 	'Lima', 'San Isidro', 'San Isidro', 'San Isidro', '15046')
insert into TB_UBICACION values(269, 	'Lima', 'San Isidro', 'San Isidro', 'San Isidro', '15047')
insert into TB_UBICACION values(270, 	'Lima', 'San Isidro', 'San Isidro', 'San Isidro', '15072')
insert into TB_UBICACION values(271, 	'Lima', 'San Isidro', 'San Isidro', 'San Isidro', '15073')
insert into TB_UBICACION values(272, 	'Lima', 'San Isidro', 'San Isidro', 'San Isidro', '15074')
insert into TB_UBICACION values(273, 	'Lima', 'San Isidro', 'San Isidro', 'San Isidro', '15076')
insert into TB_UBICACION values(274, 	'Lima', 'San Juan de Lurigancho', 'San Juan de Lurigancho', 'San Juan de Lurigancho', '15401')
insert into TB_UBICACION values(275, 	'Lima', 'San Juan de Lurigancho', 'San Juan de Lurigancho', 'San Juan de Lurigancho', '15404')
insert into TB_UBICACION values(276, 	'Lima', 'San Juan de Lurigancho', 'San Juan de Lurigancho', 'San Juan de Lurigancho', '15408')
insert into TB_UBICACION values(277, 	'Lima', 'San Juan de Lurigancho', 'San Juan de Lurigancho', 'San Juan de Lurigancho', '15412')
insert into TB_UBICACION values(278, 	'Lima', 'San Juan de Lurigancho', 'San Juan de Lurigancho', 'San Juan de Lurigancho', '15416')
insert into TB_UBICACION values(279, 	'Lima', 'San Juan de Lurigancho', 'San Juan de Lurigancho', 'San Juan de Lurigancho', '15419')
insert into TB_UBICACION values(280, 	'Lima', 'San Juan de Lurigancho', 'San Juan de Lurigancho', 'San Juan de Lurigancho', '15423')
insert into TB_UBICACION values(281, 	'Lima', 'San Juan de Lurigancho', 'San Juan de Lurigancho', 'San Juan de Lurigancho', '15427')
insert into TB_UBICACION values(282, 	'Lima', 'San Juan de Lurigancho', 'San Juan de Lurigancho', 'San Juan de Lurigancho', '15431')
insert into TB_UBICACION values(283, 	'Lima', 'San Juan de Lurigancho', 'San Juan de Lurigancho', 'San Juan de Lurigancho', '15434')
insert into TB_UBICACION values(284, 	'Lima', 'San Juan de Lurigancho', 'San Juan de Lurigancho', 'San Juan de Lurigancho', '15438')
insert into TB_UBICACION values(285, 	'Lima', 'San Juan de Lurigancho', 'San Juan de Lurigancho', 'San Juan de Lurigancho', '15442')
insert into TB_UBICACION values(286, 	'Lima', 'San Juan de Lurigancho', 'San Juan de Lurigancho', 'San Juan de Lurigancho', '15446')
insert into TB_UBICACION values(287, 	'Lima', 'San Juan de Lurigancho', 'San Juan de Lurigancho', 'San Juan de Lurigancho', '15449')
insert into TB_UBICACION values(288, 	'Lima', 'San Juan de Lurigancho', 'San Juan de Lurigancho', 'San Juan de Lurigancho', '15453')
insert into TB_UBICACION values(289, 	'Lima', 'San Juan de Lurigancho', 'San Juan de Lurigancho', 'San Juan de Lurigancho', '15457')
insert into TB_UBICACION values(290, 	'Lima', 'San Juan de Miraflores', 'Ciudad de Dios', 'Ciudad de Dios', '15056')
insert into TB_UBICACION values(291, 	'Lima', 'San Juan de Miraflores', 'Ciudad de Dios', 'Ciudad de Dios', '15058')
insert into TB_UBICACION values(292, 	'Lima', 'San Juan de Miraflores', 'Ciudad de Dios', 'Ciudad de Dios', '15801')
insert into TB_UBICACION values(293, 	'Lima', 'San Juan de Miraflores', 'Ciudad de Dios', 'Ciudad de Dios', '15803')
insert into TB_UBICACION values(294, 	'Lima', 'San Juan de Miraflores', 'Ciudad de Dios', 'Ciudad de Dios', '15804')
insert into TB_UBICACION values(295, 	'Lima', 'San Juan de Miraflores', 'Ciudad de Dios', 'Ciudad de Dios', '15806')
insert into TB_UBICACION values(296, 	'Lima', 'San Juan de Miraflores', 'Ciudad de Dios', 'Ciudad de Dios', '15809')
insert into TB_UBICACION values(297, 	'Lima', 'San Juan de Miraflores', 'Ciudad de Dios', 'Ciudad de Dios', '15824')
insert into TB_UBICACION values(298, 	'Lima', 'San Juan de Miraflores', 'Ciudad de Dios', 'Ciudad de Dios', '15828')
insert into TB_UBICACION values(299, 	'Lima', 'San Juan de Miraflores', 'Ciudad de Dios', 'Ciudad de Dios', '15829')
insert into TB_UBICACION values(300, 	'Lima', 'San Juan de Miraflores', 'Ciudad de Dios', 'Ciudad de Dios', '15842')
insert into TB_UBICACION values(301, 	'Lima', 'San Luis', 'San Luis', 'San Luis', '15004')
insert into TB_UBICACION values(302, 	'Lima', 'San Luis', 'San Luis', 'San Luis', '15019')
insert into TB_UBICACION values(303, 	'Lima', 'San Luis', 'San Luis', 'San Luis', '15021')
insert into TB_UBICACION values(304, 	'Lima', 'San Luis', 'San Luis', 'San Luis', '15022')
insert into TB_UBICACION values(305, 	'Lima', 'San Martin de Porres', 'Barrio Obrero Industrial', 'Barrio Obrero Industrial', '15101')
insert into TB_UBICACION values(306, 	'Lima', 'San Martin de Porres', 'Barrio Obrero Industrial', 'Barrio Obrero Industrial', '15102')
insert into TB_UBICACION values(307, 	'Lima', 'San Martin de Porres', 'Barrio Obrero Industrial', 'Barrio Obrero Industrial', '15103')
insert into TB_UBICACION values(308, 	'Lima', 'San Martin de Porres', 'Barrio Obrero Industrial', 'Barrio Obrero Industrial', '15106')
insert into TB_UBICACION values(309, 	'Lima', 'San Martin de Porres', 'Barrio Obrero Industrial', 'Barrio Obrero Industrial', '15107')
insert into TB_UBICACION values(310, 	'Lima', 'San Martin de Porres', 'Barrio Obrero Industrial', 'Barrio Obrero Industrial', '15108')
insert into TB_UBICACION values(311, 	'Lima', 'San Martin de Porres', 'Barrio Obrero Industrial', 'Barrio Obrero Industrial', '15109')
insert into TB_UBICACION values(312, 	'Lima', 'San Martin de Porres', 'Barrio Obrero Industrial', 'Barrio Obrero Industrial', '15112')
insert into TB_UBICACION values(313, 	'Lima', 'San Martin de Porres', 'Barrio Obrero Industrial', 'Barrio Obrero Industrial', '15113')
insert into TB_UBICACION values(314, 	'Lima', 'San Miguel', 'San Miguel', 'San Miguel', '15084')
insert into TB_UBICACION values(315, 	'Lima', 'San Miguel', 'San Miguel', 'San Miguel', '15086')
insert into TB_UBICACION values(316, 	'Lima', 'San Miguel', 'San Miguel', 'San Miguel', '15087')
insert into TB_UBICACION values(317, 	'Lima', 'San Miguel', 'San Miguel', 'San Miguel', '15088')
insert into TB_UBICACION values(318, 	'Lima', 'Santa Anita', 'Santa Anita - los Ficus', 'Santa Anita - los Ficus', '15007')
insert into TB_UBICACION values(319, 	'Lima', 'Santa Anita', 'Santa Anita - los Ficus', 'Santa Anita - los Ficus', '15008')
insert into TB_UBICACION values(320, 	'Lima', 'Santa Anita', 'Santa Anita - los Ficus', 'Santa Anita - los Ficus', '15009')
insert into TB_UBICACION values(321, 	'Lima', 'Santa Anita', 'Santa Anita - los Ficus', 'Santa Anita - los Ficus', '15011')
insert into TB_UBICACION values(322, 	'Lima', 'Santa Anita', 'Santa Anita - los Ficus', 'Santa Anita - los Ficus', '15498')
insert into TB_UBICACION values(323, 	'Lima', 'Santa Maria del Mar', 'Santa Maria del Mar', 'Santa Maria del Mar', '15861')
insert into TB_UBICACION values(324, 	'Lima', 'Santa Maria del Mar', 'Santa Maria del Mar', 'Don Bruno', '15861')
insert into TB_UBICACION values(325, 	'Lima', 'Santa Rosa', 'Santa Rosa', 'Santa Rosa', '15123')
insert into TB_UBICACION values(326, 	'Lima', 'Santiago de Surco', 'Santiago de Surco', 'Santiago de Surco', '15023')
insert into TB_UBICACION values(327, 	'Lima', 'Santiago de Surco', 'Santiago de Surco', 'Santiago de Surco', '15024')
insert into TB_UBICACION values(328, 	'Lima', 'Santiago de Surco', 'Santiago de Surco', 'Santiago de Surco', '15037')
insert into TB_UBICACION values(329, 	'Lima', 'Santiago de Surco', 'Santiago de Surco', 'Santiago de Surco', '15038')
insert into TB_UBICACION values(330, 	'Lima', 'Santiago de Surco', 'Santiago de Surco', 'Santiago de Surco', '15039')
insert into TB_UBICACION values(331, 	'Lima', 'Santiago de Surco', 'Santiago de Surco', 'Santiago de Surco', '15047')
insert into TB_UBICACION values(332, 	'Lima', 'Santiago de Surco', 'Santiago de Surco', 'Santiago de Surco', '15048')
insert into TB_UBICACION values(333, 	'Lima', 'Santiago de Surco', 'Santiago de Surco', 'Santiago de Surco', '15049')
insert into TB_UBICACION values(334, 	'Lima', 'Santiago de Surco', 'Santiago de Surco', 'Santiago de Surco', '15054')
insert into TB_UBICACION values(335, 	'Lima', 'Santiago de Surco', 'Santiago de Surco', 'Santiago de Surco', '15056')
insert into TB_UBICACION values(336, 	'Lima', 'Santiago de Surco', 'Santiago de Surco', 'Santiago de Surco', '15063')
insert into TB_UBICACION values(337, 	'Lima', 'Santiago de Surco', 'Santiago de Surco', 'Santiago de Surco', '15064')
insert into TB_UBICACION values(338, 	'Lima', 'Santiago de Surco', 'Santiago de Surco', 'Santiago de Surco', '15803')
insert into TB_UBICACION values(339, 	'Lima', 'Surquillo', 'Surquillo', 'Surquillo', '15036')
insert into TB_UBICACION values(340, 	'Lima', 'Surquillo', 'Surquillo', 'Surquillo', '15037')
insert into TB_UBICACION values(341, 	'Lima', 'Surquillo', 'Surquillo', 'Surquillo', '15038')
insert into TB_UBICACION values(342, 	'Lima', 'Surquillo', 'Surquillo', 'Surquillo', '15047')
insert into TB_UBICACION values(343, 	'Lima', 'Surquillo', 'Surquillo', 'Surquillo', '15048')
insert into TB_UBICACION values(344, 	'Lima', 'Villa el Salvador', 'Villa el Salvador', 'Villa el Salvador', '15816')
insert into TB_UBICACION values(345, 	'Lima', 'Villa el Salvador', 'Villa el Salvador', 'Villa el Salvador', '15828')
insert into TB_UBICACION values(346, 	'Lima', 'Villa el Salvador', 'Villa el Salvador', 'Villa el Salvador', '15829')
insert into TB_UBICACION values(347, 	'Lima', 'Villa el Salvador', 'Villa el Salvador', 'Villa el Salvador', '15831')
insert into TB_UBICACION values(348, 	'Lima', 'Villa el Salvador', 'Villa el Salvador', 'Villa el Salvador', '15834')
insert into TB_UBICACION values(349, 	'Lima', 'Villa el Salvador', 'Villa el Salvador', 'Villa el Salvador', '15836')
insert into TB_UBICACION values(350, 	'Lima', 'Villa el Salvador', 'Villa el Salvador', 'Villa el Salvador', '15837')
insert into TB_UBICACION values(351, 	'Lima', 'Villa el Salvador', 'Villa el Salvador', 'Villa el Salvador', '15841')
insert into TB_UBICACION values(352, 	'Lima', 'Villa el Salvador', 'Villa el Salvador', 'Villa el Salvador', '15842')
insert into TB_UBICACION values(353, 	'Lima', 'Villa Maria del Triunfo', 'Villa Maria del Triunfo', 'Villa Maria del Triunfo', '15803')
insert into TB_UBICACION values(354, 	'Lima', 'Villa Maria del Triunfo', 'Villa Maria del Triunfo', 'Villa Maria del Triunfo', '15804')
insert into TB_UBICACION values(355, 	'Lima', 'Villa Maria del Triunfo', 'Villa Maria del Triunfo', 'Villa Maria del Triunfo', '15809')
insert into TB_UBICACION values(356, 	'Lima', 'Villa Maria del Triunfo', 'Villa Maria del Triunfo', 'Villa Maria del Triunfo', '15811')
insert into TB_UBICACION values(357, 	'Lima', 'Villa Maria del Triunfo', 'Villa Maria del Triunfo', 'Villa Maria del Triunfo', '15812')
insert into TB_UBICACION values(358, 	'Lima', 'Villa Maria del Triunfo', 'Villa Maria del Triunfo', 'Villa Maria del Triunfo', '15816')
insert into TB_UBICACION values(359, 	'Lima', 'Villa Maria del Triunfo', 'Villa Maria del Triunfo', 'Villa Maria del Triunfo', '15817')
insert into TB_UBICACION values(360, 	'Lima', 'Villa Maria del Triunfo', 'Villa Maria del Triunfo', 'Villa Maria del Triunfo', '15818')
insert into TB_UBICACION values(361, 	'Lima', 'Villa Maria del Triunfo', 'Villa Maria del Triunfo', 'Villa Maria del Triunfo', '15822')
insert into TB_UBICACION values(362, 	'Lima', 'Villa Maria del Triunfo', 'Villa Maria del Triunfo', 'Villa Maria del Triunfo', '15824')
insert into TB_UBICACION values(363, 	'Lima', 'Villa Maria del Triunfo', 'Villa Maria del Triunfo', 'Villa Maria del Triunfo', '15828')


-- 1. Consulta para verificar el inventario disponible:
SELECT
    P.id_producto,
    P.nombre AS nombre_producto,
    I.cantidad AS cantidad_disponible,
    A.Nombre AS nombre_almacen
FROM
    TB_INVENTARIO I
JOIN
    TB_PRODUCTO P ON I.id_producto = P.id_producto
JOIN
    TB_ALMACEN A ON I.id_almacen = A.id_almacen;


-- 2. Consulta para verificar las compras de un proveedor:
SELECT
    C.id_compra,
    C.fecha_compra,
    C.cantidad,
    P.nombre AS nombre_producto,
    PR.nombre AS nombre_proveedor
FROM
    TB_COMPRAS C
JOIN
    TB_PRODUCTO P ON C.id_producto = P.id_producto
JOIN
    TB_PROVEEDORES PR ON C.id_proveedor = PR.id_proveedor;
