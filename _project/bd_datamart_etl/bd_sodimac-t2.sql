
create database sodimac_BD
go

use sodimac_BD
go

/* -----------------------------------------------------

1. Usuarios de Sistema en SQL SERVER para seguridad:
	A. adminSodimac: 
		. rol: sysadmin
		. user: adminSodimac
		. password: 43_27
	B. userSodimac: 
		. rol: db_datareader
		. user: userSodimac
		. password: 1234

*/ -----------------------------------------------------



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
-- El insert completo de TB_UBICACION esta en la por la linea 640.
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

-- data aleatoria:
INSERT INTO TB_EMPLEADO  VALUES ('EM01', 'Activo', 'Juan', 'Flores Carter', 'jdoe@sodimac', 'Av. Principal 123', '1985-05-20', 987654321),
								('EM02', 'Activo', 'Jose', 'Smith Rens', 'asmith@sodimac', 'Av. Secundaria 456', '1990-07-15', 912345678),
								('EM03', 'Activo', 'Sebas', 'Ruiz Iman', 'asmith@sodimac', 'Av. Tercera 789', '1988-11-30', 932165478),
								('EM04', 'Activo', 'Pedro', 'Sanchez Quispe', 'pesaqui@sodimac', 'Jr 9 De Diciembre 218', '1986-12-12', 945554567),
								('EM05', 'Activo', 'Rodrigo', 'Huaman Lopez', 'rohulo@sodimac', 'Jr 28 De Julio 537 A, Cercado', '1998-09-04', 999873420),
								('EM06', 'Activo', 'Marco', 'Espinoza Diaz', 'maesdi@sodimac', 'Av. 28 de Julio 878', '1989-01-30', 909983498),
								('EM07', 'Activo', 'Enrique', 'Perez Sanchez', 'enpesa@sodimac', 'Los Cedros 209', '1994-11-07', 900988950),
								('EM08', 'Activo', 'Juan', 'Cordova Ruiz', 'jucoru@sodimac', 'Jr. Ucayali N° 388 ', '1986-09-06', 900945321),
								('EM09', 'Activo', 'Maria', 'Quispe Diaz', 'maquidi@sodimac', 'Av Mariscal Caceres 1420', '1999-11-21', 912321870),
								('EM10', 'Activo', 'Sofia', 'Rojas Vazquez', 'soroma@sodimac', 'Jr Tarapaca 595', '2000-01-01', 998767890),
								('EM11', 'Activo', 'Sandro', 'Mamani Rios', 'samari@sodimac', 'Jr Bolivar 123, Cercado', '1999-09-28', 998765980),
								('EM12', 'Activo', 'Patrick', 'Chavez Castillo', 'pachaca@sodimac', 'Jr. Camaná 616 ', '2001-09-09', 905092870),
								('EM13', 'Activo', 'Sebastian', 'Hilario Perez', 'sehipe@sodimac', 'JR Bolivar 156', '1988-10-24', 900983921),
								('EM14', 'Activo', 'Lucero', 'Zamora Zamora', 'luzaza@sodimac', 'Av. Carmen Alto 121', '2002-03-01', 909904592),
								('EM15', 'Activo', 'Maria', 'Ramirez Sanchez', 'marasa@sodimac', 'Av. Leoncio Prado 298', '1997-06-21', 999875673),
								('EM16', 'Activo', 'Maryori', 'Gonzales Quispe', 'magoqui@sodimac', 'Jr Maria Montesori 150', '1989-01-20', 999804539),
								('EM17', 'Activo', 'Piero', 'Hernandez Diaz', 'pihesa@sodimac', 'Av Independencia Cda 06', '1998-06-09', 976754321),
								('EM18', 'Activo', 'Oliver', 'Torres Aguila', 'oltoaguia@sodimac', 'AV De La Poesia 160', '2002-09-02', 987617930),
								('EM19', 'Activo', 'Dayana', 'Gamboa Perez', 'dagape@sodimac', 'AV Las Casuarinas 250', '2003-12-29', 909841093),
								('EM20', 'Activo', 'Kimberly', 'Camarena Mendoza', 'kicame@sodimac', 'Jr Ciro Alegria 435, Las Nazarenas', '2001-02-09', 932092309);

								-- aca 50 cada uno.
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
INSERT INTO TB_CLIENTES  VALUES ('CL001', 'Activo', 'Brando', 'Servero Tapia', '1990-01-01', '912345678', 'brando@gmail.com', 'MC-L 07 VIV ALAMEDA', 'Cerca a makro comas', 'EM01', 126), 
								('CL002', 'Activo', 'Matias', 'Castello Arrequi', '1991-02-02', '923456789', 'matias@gmail.com', 'AV. PRODUCCIÓN NACIONAL 188', 'Pasando produccion de chorrillos', 'EM02', 149), 
								('CL003', 'Activo', 'Dani', 'Baena Jacinta', '1992-03-03', '934567890', 'dani@gmail.com', 'JR. VICTOR ANDRES BELAUNDE Nº 976', 'casa de 3 pisos, color amarillo', 'EM03', 173), 
								('CL004', 'Activo', 'Maria', 'Espinoza Becerra', '1994-03-21', '989076984', 'maria@gmail.com', 'JR. VICTOR ANDRES BELAUNDE Nº 976', 'casa de 3 pisos, color amarillo', 'EM04', 168),
								('CL005', 'Activo', 'Carlos', 'Castillo Fernandez', '1996-01-15', '912345682', 'carlos@gmail.com', 'Av. Javier Prado 1213', 'Frente al centro comercial', 'EM05', 257),
								('CL006', 'Activo', 'Rosa', 'Torres Garcia', '1997-04-27', '912345683', 'rosa@gmail.com', 'Av. Angamos 1415', 'Cerca al mercado', 'EM06', 176),
								('CL007', 'Activo', 'Jorge', 'Flores Sanchez', '1998-07-19', '912345684', 'jorge@gmail.com', 'Av. Brasil 1617', 'Junto a la estación de bomberos', 'EM07', 212),
								('CL008', 'Activo', 'María', 'Santos Chavez', '1999-10-01', '912345685', 'maria@gmail.com', 'Av. Venezuela 1819', 'A dos cuadras del parque', 'EM08', 138),
								('CL009', 'Activo', 'Luis', 'Martinez Ramos', '2000-12-22', '912345686', 'luis@gmail.com', 'Av. Grau 2021', 'Cerca del estadio', 'EM09', 349),
								('CL010', 'Activo', 'Carmen', 'Morales Vargas', '2001-02-11', '912345687', 'carmen@gmail.com', 'Av. Argentina 2223', 'Frente a la iglesia', 'EM10', 188),
								('CL011', 'Activo', 'Miguel', 'Hernandez Gomez', '2002-05-30', '912345688', 'miguel@gmail.com', 'Av. Pardo 2425', 'A una cuadra del colegio caceres', 'EM11', 126),
								('CL012', 'Activo', 'Sara', 'Suarez Diaz', '2003-08-14', '912345689', 'sara@gmail.com', 'Av. Benavides 2627', 'Cerca al parque central', 'EM12', 281),
								('CL013', 'Activo', 'Juan', 'Gutierrez Mendoza', '2004-11-09', '912345690', 'juan@gmail.com', 'Av. Salaverry 2829', 'Al frente del supermercado', 'EM13', 170),
								('CL014', 'Activo', 'Teresa', 'Chavez Ortega', '1993-03-21', '912345691', 'teresa@gmail.com', 'Av. Primavera 3031', 'Cerca a la estación del metro', 'EM14', 14),
								('CL015', 'Activo', 'Raul', 'Paredes Reyes', '1994-06-05', '912345692', 'raul@gmail.com', 'Av. Petit Thouars 3233', 'A lado del parque industrial', 'EM15', 171),
								('CL016', 'Activo', 'Patricia', 'Espinoza Cruz', '1995-09-17', '912345693', 'patricia@gmail.com', 'Av. Túpac Amaru 3435', 'Cerca a la estación del tren', 'EM16', 2),
								('CL017', 'Activo', 'Sergio', 'Velasquez Castro', '1996-12-28', '912345694', 'sergio@gmail.com', 'Av. Alfonso Ugarte 3637', 'Frente al centro de salud', 'EM17', 17),
								('CL018', 'Activo', 'Paula', 'Salinas Ponce', '1997-01-09', '912345695', 'paula@gmail.com', 'Av. Guardia Civil 3839', 'Junto a la biblioteca', 'EM18', 352),
								('CL019', 'Activo', 'Julio', 'Vargas Rojas', '1998-04-23', '912345696', 'julio@gmail.com', 'Av. Prolongación Tacna 4041', 'A dos cuadras del banco', 'EM19', 344),
								('CL020', 'Activo', 'Daniela', 'Ramirez Salvador', '1999-07-15', '912345697', 'daniela@gmail.com', 'Av. Separadora Industrial 4243', 'Cerca del centro deportivo', 'EM20', 201);						
SELECT * FROM TB_CLIENTES

CREATE TABLE TB_COMPROBANTE(
    id_comprobante CHAR(25)NOT NULL PRIMARY KEY,
    tipo_comprobante VARCHAR(50) NOT NULL
);
INSERT INTO TB_COMPROBANTE  VALUES ('COM001', 'Factura'), -- reutilizar en  TB_PEDIDO
								   ('COM002', 'Boleta'),
								   ('COM003', 'Nota de crédito');
go
select * from TB_COMPROBANTE


CREATE TABLE TB_TIPO_ENTREGA(  -- reutilizar en  TB_PEDIDO
    id_tipoEntrega CHAR(25)NOT NULL PRIMARY KEY,
    descripcion VARCHAR(200) NOT NULL,
    monto FLOAT,
	dias int
);
INSERT INTO TB_TIPO_ENTREGA VALUES ('TE01', 'Retiro en tienda', 0, 1),
								   ('TE02', 'Entrega regular', 10, 5),
								   ('TE03', 'Entrega rápida', 20, 2);
select * from TB_TIPO_ENTREGA


CREATE TABLE TB_ENTIENDA(
    id_enTienda CHAR(25)NOT NULL PRIMARY KEY,
	nombre VARCHAR(200) NOT NULL,
    dirCentral VARCHAR(100) NOT NULL,
    --monto FLOAT, elimine porque se gestiona en TB_TIPO_ENTREGA
    id_tipoEntrega CHAR(25),
    FOREIGN KEY (id_tipoEntrega) REFERENCES TB_TIPO_ENTREGA(id_tipoEntrega)
);
INSERT INTO TB_ENTIENDA VALUES 
('ET01', 'Sodimac Comas', 'Av. Chacra Cerro 121', 'TE01'),
('ET02', 'Sodimac Puente Piedra','Av. San Juan de Dios con Calle 7', 'TE01'),
('ET03', 'Sodimac S. J. Lurigancho', 'Jr. Cajamarquilla, Urb.Zarate', 'TE01'),
('ET04', 'Sodimac Surco', 'Av. Caminos del Inca 456', 'TE01'),
('ET05', 'Sodimac La Molina', 'Av. La Fontana 789', 'TE02'),
('ET06', 'Sodimac San Borja', 'Av. San Luis 101', 'TE03'),
('ET07', 'Sodimac Lince', 'Av. Arenales 202', 'TE01'),
('ET08', 'Sodimac Magdalena', 'Av. Brasil 303', 'TE02'),
('ET09', 'Sodimac Barranco', 'Av. Miguel Grau 404', 'TE03'),
('ET10', 'Sodimac Pueblo Libre', 'Av. La Mar 505', 'TE01'),
('ET11', 'Sodimac Jesús María', 'Av. Salaverry 606', 'TE02'),
('ET12', 'Sodimac Rimac', 'Av. Alcazar 707', 'TE03'),
('ET13', 'Sodimac San Miguel', 'Av. La Marina 808', 'TE01'),
('ET14', 'Sodimac Chorrillos', 'Av. Huaylas 909', 'TE02'),
('ET15', 'Sodimac Callao', 'Av. Faucett 111', 'TE03'),
('ET16', 'Sodimac Ate', 'Av. Nicolas Ayllon 222', 'TE01'),
('ET17', 'Sodimac Villa El Salvador', 'Av. El Sol 333', 'TE02'),
('ET18', 'Sodimac Independencia', 'Av. Túpac Amaru 444', 'TE03'),
('ET19', 'Sodimac Los Olivos', 'Av. Universitaria 555', 'TE01'),
('ET20', 'Sodimac Ancon', 'Av. Próceres 666', 'TE02');
SELECT * FROM TB_ENTIENDA

-------------------------------------------

CREATE TABLE TB_DELIVERY( -- LA UBICACION LA RELACION CON EL CLIENTE
    id_delivery CHAR(25)NOT NULL PRIMARY KEY,
    id_tipoEntrega CHAR(25),
    id_ubicacion INT,
    FOREIGN KEY (id_tipoEntrega) REFERENCES TB_TIPO_ENTREGA(id_tipoEntrega),
    FOREIGN KEY (id_ubicacion) REFERENCES TB_UBiCACION(id_ubicacion)
);
INSERT INTO TB_DELIVERY VALUES ('DE01', 'TE02', 126),
							   ('DE02', 'TE02', 149),
							   ('DE03', 'TE03', 173), 
							   ('DE04', 'TE02', 168),
							   ('DE05', 'TE02', 257),
							   ('DE06', 'TE03', 176),
							   ('DE07', 'TE02', 212), 
							   ('DE08', 'TE02', 138),
							   ('DE09', 'TE03', 349),
							   ('DE10', 'TE02', 188),
							   ('DE11', 'TE02', 126),
							   ('DE12', 'TE03', 281),
							   ('DE13', 'TE02', 170), 
							   ('DE14', 'TE02', 14),
							   ('DE15', 'TE03', 171),
							   ('DE16', 'TE02', 2),
							   ('DE17', 'TE02', 17),
							   ('DE18', 'TE03', 352),
							   ('DE19', 'TE02', 344), 
							   ('DE20', 'TE02', 201);
SELECT * FROM TB_DELIVERY
							   
CREATE TABLE TB_PEDIDO( -- IMPORTANTE REPETAR LA TABLA id_tipoEntrega con las fechas por que hay 3 tipos de pedidos.
    id_pedido CHAR(25)NOT NULL PRIMARY KEY,
    estado VARCHAR(12),
    fecha_pedido DATE,
    fecha_entrega DATE,
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
-- RECUERDA LA FECHA con el TIPO DE EMTREGA - 
INSERT INTO TB_PEDIDO VALUES ('PE01', 'Disponible', '2023-06-01', '2023-06-02', 100, 'CL001', 'COM001', 'EM01', 'TE01', 126),
							 ('PE02', 'En proceso', '2023-06-02', '2023-06-07', 200, 'CL002', 'COM002', 'EM02', 'TE02', 149), -- 5 dias
                             ('PE03', 'En proceso', '2023-06-03', '2023-06-04', 300, 'CL003', 'COM003', 'EM03', 'TE03', 173), -- 2 dias
							 ('PE04', 'En Proceso', '2023-09-30', '2023-10-02', 450, 'CL004', 'COM001', 'EM04', 'TE01', 168),  -- Si es del 2015 las compras tambien.
							 ('PE05', 'Disponible', '2023-10-15', '2023-10-20', 100, 'CL005', 'COM002', 'EM05', 'TE02', 257), -- 5 dias
							 ('PE06', 'En Proceso', '2023-11-21', '2023-11-24', 200, 'CL006', 'COM003', 'EM06', 'TE03', 176), -- 2 dias
							 ('PE07', 'Disponible', '2023-12-05', '2023-12-06', 350, 'CL007', 'COM001', 'EM07', 'TE01', 212), 
							 ('PE08', 'En Proceso', '2023-05-13', '2023-05-18', 500, 'CL008', 'COM002', 'EM08', 'TE02', 138), -- 5 dias
							 ('PE09', 'Disponible', '2023-04-18', '2023-04-20', 180, 'CL009', 'COM003', 'EM09', 'TE03', 349), -- 2 dias
							 ('PE10', 'En Proceso', '2023-03-22', '2023-03-23', 230, 'CL010', 'COM001', 'EM10', 'TE01', 188),
							 ('PE11', 'Disponible', '2023-04-25', '2023-05-30', 120, 'CL011', 'COM002', 'EM11', 'TE02', 126), -- 5 dias
							 ('PE12', 'En Proceso', '2023-05-05', '2023-05-07', 400, 'CL012', 'COM003', 'EM12', 'TE03', 281), -- 2 dias
							 ('PE13', 'Disponible', '2023-06-10', '2023-06-11', 320, 'CL013', 'COM001', 'EM13', 'TE01', 170),
							 ('PE14', 'En Proceso', '2023-07-20', '2023-07-25', 110, 'CL014', 'COM002', 'EM14', 'TE02', 14), -- 5 dias
							 ('PE15', 'Disponible', '2023-08-14', '2023-08-16', 280, 'CL015', 'COM003', 'EM15', 'TE03', 171), -- 2 dias
							 ('PE16', 'En Proceso', '2023-09-19', '2023-09-20', 340, 'CL016', 'COM001', 'EM16', 'TE01', 2),
							 ('PE17', 'Disponible', '2023-10-25', '2023-10-30', 170, 'CL017', 'COM002', 'EM17', 'TE02', 17), -- 5 dias
							 ('PE18', 'En Proceso', '2023-11-20', '2023-12-22', 220, 'CL018', 'COM003', 'EM18', 'TE03', 352), -- 2 dias
							 ('PE19', 'Disponible', '2023-12-17', '2023-12-18', 130, 'CL019', 'COM001', 'EM19', 'TE01', 344),
							 ('PE20', 'En Proceso', '2023-07-06', '2023-07-11', 370, 'CL020', 'COM002', 'EM20', 'TE02', 201);-- 5 dias
-- Cambios:
-- 1. se arreglado en fecha de salida:
-- 2. recuerda que manejamos stock del todo el año 2023
SELECT * FROM TB_PEDIDO

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------
-- Data misma de la tienda Sodimac:
---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------

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

SELECT * FROM TB_CATEGORIA

CREATE TABLE TB_PRODUCTO (
    id_producto CHAR(25)NOT NULL PRIMARY KEY,
    estado VARCHAR(15),
    lote VARCHAR(50),
    nombre VARCHAR(150),
    marcha varchar(70),
    precio DECIMAL(38,2),
    id_categoria CHAR(25),
    FOREIGN KEY (id_categoria) REFERENCES TB_CATEGORIA(id_categoria)
)

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

-- FALTA AGREGAR A TB_INVENTARIO:

--Terrazas y Jardin
INSERT INTO TB_PRODUCTO VALUES ('PR13', 'Disponible', 'LI211456797', 'Terraza estilo nordico', 'HOUE', 3000.00, 'CAT05')
INSERT INTO TB_PRODUCTO VALUES ('PR14', 'Disponible', 'LI211982798', 'Jardin de eden', 'FERMOB', 5000.00, 'CAT05')
INSERT INTO TB_PRODUCTO VALUES ('PR15', 'Disponible', 'LI211402790', 'Jardin El caracter moderno', 'EMU', 5600.00, 'CAT05')

--Baños y Cocina
INSERT INTO TB_PRODUCTO VALUES ('PR16', 'Disponible', 'LI211455767', 'Cocina moderna', 'MABE', 245.00, 'CAT06')
INSERT INTO TB_PRODUCTO VALUES ('PR17', 'Disponible', 'LI211980098', 'Baño ceramico', 'ROCA', 987.00, 'CAT06')
INSERT INTO TB_PRODUCTO VALUES ('PR18', 'Disponible', 'LI211403232', 'Baño gasfiteries', 'PFISTER', 965.00, 'CAT06')

--Herramientas y Maquinarias----
INSERT INTO TB_PRODUCTO VALUES ('PR19', 'Disponible', 'LI211009767', 'Martillo Neumático', 'Bosch GSH 16-30', 5000.00, 'CAT07')
INSERT INTO TB_PRODUCTO VALUES ('PR20', 'Disponible', 'LI211998998', 'Cortadora de Metal', 'DeWalt DW872', 3000.00, 'CAT07')
INSERT INTO TB_PRODUCTO VALUES ('PR21', 'Disponible', 'LI211097132', 'Taladro Percutor', 'Makita HR2475', 2400.00, 'CAT07')
INSERT INTO TB_PRODUCTO VALUES ('PR22', 'Disponible', 'LI211112367', 'Excavadora Hidráulica', 'Caterpillar 320D', 2450.00, 'CAT07')
INSERT INTO TB_PRODUCTO VALUES ('PR23', 'Disponible', 'LI211911128', 'Bulldozer', 'Komatsu D65EX-17', 900.00, 'CAT07')
INSERT INTO TB_PRODUCTO VALUES ('PR24', 'Disponible', 'LI211403011', 'Grúa Móvil', 'Liebherr LTM 1090-4.1', 9687.00, 'CAT07')

----Limpieza
INSERT INTO TB_PRODUCTO VALUES ('PR25', 'Disponible', 'LI286759767', 'Lejía Clorox', 'Clorox', 500.00, 'CAT08')
INSERT INTO TB_PRODUCTO VALUES ('PR26', 'Disponible', 'LI211090098', 'Spray Desinfectante Lysol', 'Lysol', 678.00, 'CAT08')
INSERT INTO TB_PRODUCTO VALUES ('PR27', 'Disponible', 'LI211097132', 'Limpiador Multiusos Mr. Clean', 'Mr. Clean', 345.00, 'CAT08')
INSERT INTO TB_PRODUCTO VALUES ('PR28', 'Disponible', 'LI211222367', 'Esponjas Abrasivas Scotch-Brite', 'Scotch-Brite', 234.00, 'CAT08')
INSERT INTO TB_PRODUCTO VALUES ('PR29', 'Disponible', 'LI211121128', 'Limpiador para Exteriores Windex', 'Windex', 122.00, 'CAT08')
INSERT INTO TB_PRODUCTO VALUES ('PR30', 'Disponible', 'LI211194411', 'Pulidor de Muebles Pledge', 'Pledge', 178.00, 'CAT08')

----------Decoracion, Mnaje e Iluminación----
INSERT INTO TB_PRODUCTO VALUES ('PR31', 'Disponible', 'LI295679767', 'Sofá', 'IKEA', 455.00, 'CAT08')
INSERT INTO TB_PRODUCTO VALUES ('PR32', 'Disponible', 'LI211001298', 'Estantería', 'West Elm', 111.00, 'CAT09')
INSERT INTO TB_PRODUCTO VALUES ('PR33', 'Disponible', 'L2223497132', 'Isla de Cocina Belmont', 'Crate & Barrel', 321.00, 'CAT09')
INSERT INTO TB_PRODUCTO VALUES ('PR34', 'Disponible', 'LI211122367', 'Bombilla', 'Philips Hue', 908.00, 'CAT09')
INSERT INTO TB_PRODUCTO VALUES ('PR35', 'Disponible', 'LI211166128', 'Bombilla con Altavoz LED', 'GE Lighting', 99.00, 'CAT09')
INSERT INTO TB_PRODUCTO VALUES ('PR36', 'Disponible', 'LI211190011', 'Atenuador Inalámbrico Caseta', 'Lutron', 431.00, 'CAT09')

-----Aire libre y Mascotas
INSERT INTO TB_PRODUCTO VALUES ('PR37', 'Disponible', 'LI295679098', 'Ahumador', 'Weber', 6000.00, 'CAT010')
INSERT INTO TB_PRODUCTO VALUES ('PR38', 'Disponible', 'LI211001345', ' Motosierra', 'Husqvarna', 5000.00, 'CAT010')
INSERT INTO TB_PRODUCTO VALUES ('PR39', 'Disponible', 'L2223497123', 'Cortacésped Eléctrico', 'Black+Decker', 4500.00, 'CAT010')
INSERT INTO TB_PRODUCTO VALUES ('PR40', 'Disponible', 'LI211645645', 'Alimento para Perros', 'Purina', 3400.00, 'CAT010')
INSERT INTO TB_PRODUCTO VALUES ('PR41', 'Disponible', 'LI211234567', 'Juguete para Gatos', 'KONG', 9900.00, 'CAT010')
INSERT INTO TB_PRODUCTO VALUES ('PR42', 'Disponible', 'LI211190673', 'Atenuador Inalámbrico Caseta', 'Tetra', 4000.00, 'CAT010')

----Pisos y Pinturas---
INSERT INTO TB_PRODUCTO VALUES ('PR43', 'Disponible', 'LI295679656', 'Piso Laminado', 'Pergo', 987.00, 'CAT011')
INSERT INTO TB_PRODUCTO VALUES ('PR44', 'Disponible', 'LI211007650', ' Piso de Vinilo de Lujo', 'Armstrong Flooring', 321.00, 'CAT011')
INSERT INTO TB_PRODUCTO VALUES ('PR45', 'Disponible', 'L2223493454', 'Alfombra', 'Shaw Floors', 765.00, 'CAT011')
INSERT INTO TB_PRODUCTO VALUES ('PR46', 'Disponible', 'LI211641231', 'Pintura Interior', 'Purina', 908.00, 'CAT011')
INSERT INTO TB_PRODUCTO VALUES ('PR47', 'Disponible', 'LI211234342', 'Pintura Interior', 'Behr', 654.00, 'CAT011')
INSERT INTO TB_PRODUCTO VALUES ('PR48', 'Disponible', 'LI211190443', 'Pintura Exterio', 'Benjamin Moore', 408.00, 'CAT011')
GO

select * from TB_PRODUCTO

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------

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
('LI23137', 'Xiaomi', 'Activo', 'ventas@xiaomi.com', 'Ventas Xiaomi', '20551105572', '01 555 8769'),
('LI23198', 'HOUSE', 'Activo', 'ventas@house.com', 'Ventas HOUSE', '20551109808', '01 555 8732'),
('LI23190', 'FERMOB', 'Activo', 'atencion@fermob.com', 'Ventas FERMOB', '20551106754', '01 555 8765'),
('LI23176', 'EMU', 'Activo', 'soporte@emu.com', 'Ventas EMU', '20551105532', '01 555 8709'),
('LI23987', 'MABE', 'Activo', 'soporte@mabe.com', 'Ventas MABE', '20551107654', '01 555 1121'),
('LI23090', 'ROCA', 'Activo', 'atencion@roca.com', 'Ventas ROCA', '20551105009', '01 555 0009'),
('LI23762', 'PFISTER', 'Activo', 'cliente@pfister.com', 'Ventas PFISTER', '20551100091', '01 555 0987'),
('LI23009', 'Bosch GSH 16-30', 'Activo', 'cliente@bBoschGSH16-30.com', 'Ventas Bosch GSH 16-30', '20551144345', '01 555 0234'),
('LI23333', 'DeWalt DW872', 'Activo', 'cliente@deWaltDW872.com', 'Ventas DeWalt DW872', '20551105465', '01 555 0001'),
('LI23454', 'Makita HR2475', 'Activo', 'cliente@makitaHR2475.com', 'Ventas Makita HR2475', '205511009822', '01 555 1124'),
('LI23221', 'Caterpillar 320D', 'Activo', 'cliente@caterpillar 320D.com', 'Ventas Caterpillar 320D', '20551122123', '01 555 0092'),
('LI23222', 'Komatsu D65EX-17', 'Activo', 'cliente@komatsuD65EX-17.com', 'VentasKomatsu D65EX-17', '20551122123', '01 555 0912'),
('LI23000', 'Liebherr LTM 1090-4.1', 'Activo', 'cliente@liebherrLTM1090-4.1.com', 'Ventas Liebherr LTM 1090-4.1', '20551234445', '01 555 0934'),
('LI23980', 'Clorox', 'Activo', 'atencion@Clorox.com', 'Ventas Clorox', '20551222212', '01 555 5621'),
('LI23999', 'Lysol', 'Activo', 'soporte@Lysol.com', 'Ventas Lysol', '20551220098', '01 555 1451'),
('LI23765', 'Mr. Clean', 'Activo', 'postventa@Mr. Clean.com', 'Ventas Mr. Clean', '20551222369', '01 555 9098'),
('LI23456', 'Scotch-Brite', 'Activo', 'cliente@Scotch-Brite.com', 'Ventas Scotch-Brite', '20551222129', '01 555 0909'),
('LI23325', 'Windex', 'Activo', 'ventas@Windex.com', 'Ventas Windex', '20551222176', '01 555 1232'),
('LI23223', 'Liebherr LTM 1090-4.1', 'Activo', 'atencion@Pledge.com', 'Ventas Pledge', '28783452341', '01 555 0092'),
('LI41256', 'IKEA', 'Activo', 'postventa@iKEA.com', 'Ventas IKEA', '20551220012', '01 555 3421'),
('LI42267', 'West Elm', 'Activo', 'soporte@West Elm.com', 'Ventas West Elm', '20541200011', '01 555 6578'),
('LI43200', 'Crate & Barrel', 'Activo', 'atencion@crate & Barrel.com', 'Ventas Crate & Barrel', '20541200000', '01 555 0932'),
('LI44223', 'Philips Hue', 'Activo', 'venta@philips Hue.com', 'Ventas Philips Hue', '20751221112', '01 555 9854'),
('LI45234', 'GE Lighting', 'Activo', 'venta@gE Lighting.com', 'Ventas GE Lighting', '20551222345', '01 555 0021'),
('LI46231', 'Lutron', 'Activo', 'cñiente@Lutron.com', 'Ventas Lutron', '20541200123', '01 555 0935'),
('LI47278', 'Weber', 'Activo', 'cliente@Weber.com', 'Ventas Weber', '20541222345', '01 555 2222'),
('LI48234', 'Husqvarna', 'Activo', 'soporte@Husqvarna.com', 'Ventas Husqvarna', '20523222123', '01 555 1134'),
('LI49232', 'Black+Decker', 'Activo', 'posventa@v.com', 'Ventas Black+Decker', '20545621234', '01 555 4352'),
('LI50431', 'Purina', 'Activo', 'venta@Purina.com', 'Ventas Purina', '20534222888', '01 555 1123'),
('LI51324', 'KONG', 'Activo', 'servicio@KONG.com', 'Ventas KONG', '20541222327', '01 555 0122'),
('LI52112', 'Tetra', 'Activo', 'atencion@Tetra.com', 'Ventas Tetra', '20555546789', '01 555 2315'),
('LI53556', 'Pergo', 'Activo', 'atencion@Pergo.com', 'Ventas Pergo', '20987654567', '01 555 1232'),
('LI54453', 'Armstrong Flooring', 'Activo', 'soporte@Armstrong Flooring.com', 'Ventas Armstrong Flooring', '20555598765', '01 555 2134'),
('LI55094', 'Shaw Floors', 'Activo', 'ventas@Shaw Floors.com', 'Ventas Shaw Floors', '20555540432', '01 555 3245'),
('LI56529', 'Purina', 'Activo', 'postventa@Purina.com', 'Ventas Purina', '20555544542', '01 555 7876'),
('LI57654', 'Behr', 'Activo', 'cliente@Behr.com', 'Ventas Behr', '20555546932', '01 555 3241'),
('LI58097', 'Benjamin Moore', 'Activo', 'soporte@Benjamin Moore.com', 'Ventas Benjamin Moore', '20555546123', '01 555 0954');
go
select *from TB_PROVEEDORES
--update TB_PROVEEDORES
--set nombre = 'Pledge'
--where id_proveedor ='LI23223'
--GO


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
INSERT INTO TB_COMPRAS VALUES --> fecha de entreda se gestiona con TB_COMPRAS y decha de salida
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
('C12', 20.00, '2023-01-12', 'PR12', 'LI23137', 'ALM01'), --
('C13', 45.00, '2023-01-09', 'PR13', 'LI23198', 'ALM01'),
('C14', 45.00, '2023-01-10', 'PR14', 'LI23190', 'ALM01'),
('C15', 89.00, '2023-01-21', 'PR15', 'LI23176', 'ALM01'),
('C16', 45.00, '2023-01-11', 'PR16', 'LI23987', 'ALM01'),
('C17', 56.00, '2023-01-23', 'PR17', 'LI23090', 'ALM01'),

('C18', 76.00, '2023-01-27', 'PR18', 'LI23762', 'ALM01'),
('C19', 12.00, '2023-01-11', 'PR19', 'LI23009', 'ALM01'),
('C20', 21.00, '2023-01-01', 'PR20', 'LI23333', 'ALM01'),
('C21', 16.00, '2023-01-04', 'PR21', 'LI23454', 'ALM01'),
('C22', 20.00, '2023-01-06', 'PR22', 'LI23221', 'ALM01'),
('C23', 24.00, '2023-01-09', 'PR23', 'LI23222', 'ALM01'),
('C24', 21.00, '2023-01-02', 'PR24', 'LI23000', 'ALM01'),
('C25', 53.00, '2023-01-19', 'PR25', 'LI23980', 'ALM01'),
('C26', 78.00, '2023-01-10', 'PR26', 'LI23999', 'ALM01'),
('C27', 21.00, '2023-01-21', 'PR27', 'LI23765', 'ALM01'),
('C28', 11.00, '2023-01-11', 'PR28', 'LI23456', 'ALM01'),
('C29', 10.00, '2023-01-23', 'PR29', 'LI23325', 'ALM01'),

('C30', 90.00, '2023-01-27', 'PR30', 'LI23223', 'ALM01'),
('C31', 34.00, '2023-01-11', 'PR31', 'LI41256', 'ALM01'),
('C32', 67.00, '2023-01-01', 'PR32', 'LI42267', 'ALM01'),
('C33', 44.00, '2023-01-04', 'PR33', 'LI43200', 'ALM01'),
('C34', 43.00, '2023-01-06', 'PR34', 'LI44223', 'ALM01'),
('C35', 22.00, '2023-01-09', 'PR35', 'LI45234', 'ALM01'),
('C36', 29.00, '2023-01-02', 'PR36', 'LI46231', 'ALM01'),
('C37', 59.00, '2023-01-19', 'PR37', 'LI47278', 'ALM01'),
('C38', 78.00, '2023-02-21', 'PR38', 'LI48234', 'ALM01'),
('C39', 21.00, '2023-02-09', 'PR39', 'LI49232', 'ALM01'),
('C40', 11.00, '2023-02-05', 'PR40', 'LI50431', 'ALM01'),
('C41', 10.00, '2023-02-01', 'PR41', 'LI51324', 'ALM01'),
('C42', 90.00, '2023-02-28', 'PR42', 'LI52112', 'ALM01'),
('C43', 34.00, '2023-02-14', 'PR43', 'LI53556', 'ALM01'),
('C44', 67.00, '2023-02-16', 'PR44', 'LI54453', 'ALM01'),
('C45', 44.00, '2023-02-19', 'PR45', 'LI55094', 'ALM01'),
('C46', 43.00, '2023-01-29', 'PR46', 'LI56529', 'ALM01'),
('C47', 22.00, '2023-01-01', 'PR47', 'LI57654', 'ALM01'),
('C48', 29.00, '2023-02-02', 'PR48', 'LI58097', 'ALM01');
go
select * from TB_COMPRAS;


---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------

/* ---------------------------------------------------------------- 
1. FECHA DE SALIDA: 
	debe de ir relacionado con la TB_COMPRAS, para estabablecer una fecha de salida.
	_ Tamien en la tabla de TB_TIPO_ENTREGA esta el rango que se va demorar en la entrega del producto.
*/ ----------------------------------------------------------------

-- 1. Inventario actualizado
CREATE TABLE TB_INVENTARIO (
    id_inventario CHAR(25)NOT NULL PRIMARY KEY,  ---> IMPORTANTE REGISTRAR EL PEDIDO DE SALIDA DEL PRODUCTO CON EL PEDIDO DEL CLIENTE <---
    cantidad DECIMAL(38,2),
    fecha_entrada DATE, 
    fecha_salida DATE, -- se gestiona con la fecha de llegada de fecha_llegada de la tabla TB_PEDIDO.
    id_producto CHAR(25),
    id_almacen CHAR(25),
	id_compra CHAR(25),
    FOREIGN KEY (id_producto) REFERENCES TB_PRODUCTO(id_producto),
    FOREIGN KEY (id_almacen) REFERENCES TB_ALMACEN(id_almacen),
	FOREIGN KEY (id_compra) REFERENCES TB_COMPRAS(id_compra)
);
INSERT INTO TB_INVENTARIO (id_inventario, cantidad, fecha_entrada, fecha_salida, id_producto, id_almacen, id_compra) VALUES
('I01', 100.00, '2023-01-01', '2023-06-02', 'PR01', 'ALM01', 'C01'),
('I02', 200.00, '2023-01-02', '2023-06-07', 'PR02', 'ALM01', 'C02'),
('I03', 150.00, '2023-01-03', '2023-06-04', 'PR03', 'ALM01', 'C03'),
('I04', 250.00, '2023-01-04', NULL, 'PR04', 'ALM01', 'C04'),
('I05', 300.00, '2023-01-05', NULL, 'PR05', 'ALM01', 'C05'),
('I06', 180.00, '2023-01-06', NULL, 'PR06', 'ALM01', 'C06'),
('I07', 120.00, '2023-01-07', '2023-10-20', 'PR07', 'ALM01', 'C07'),
('I08', 220.00, '2023-01-08', '2023-11-24', 'PR08', 'ALM01', 'C08'),
('I09', 280.00, '2023-01-09', '2023-12-06', 'PR09', 'ALM01', 'C09'),
('I10', 100.00, '2023-01-10', '2023-10-02', 'PR10', 'ALM01', 'C10'),
('I11', 150.00, '2023-01-11', NULL, 'PR11', 'ALM01', 'C11'),
('I12', 200.00, '2023-01-12', '2023-01-18', 'PR12', 'ALM01', 'C12'),
('I13', 45.00, '2023-01-09', '2023-01-06', 'PR13', 'ALM01', 'C13'),
('I14', 45.00, '2023-01-10', '2023-01-11', 'PR14', 'ALM01', 'C14'),
('I15', 89.00, '2023-01-21', NULL, 'PR15', 'ALM01', 'C15'),
('I16', 45.00, '2023-01-11', '2023-01-23', 'PR16', 'ALM01', 'C16'),
('I17', 56.00, '2023-01-23', NULL, 'PR17', 'ALM01', 'C17'),
('I18', 76.00, '2023-01-27', '2023-02-28', 'PR18', 'ALM01', 'C18'),
('I19', 12.00, '2023-01-11', NULL, 'PR19', 'ALM01', 'C19'),
('I20', 21.00, '2023-01-01', '2023-02-05', 'PR20', 'ALM01', 'C20'),
('I21', 16.00, '2023-01-04', '2023-01-14', 'PR21', 'ALM01', 'C21'),
('I22', 20.00, '2023-01-06', NULL, 'PR22', 'ALM01', 'C22'),
('I23', 24.00, '2023-01-09', '2023-01-19', 'PR23', 'ALM01', 'C23'),
('I24', 21.00, '2023-01-02', NULL, 'PR24', 'ALM01', 'C24'),
('I25', 53.00, '2023-01-19', NULL, 'PR25', 'ALM01', 'C25'),
('I26', 78.00, '2023-01-10', '2023-01-30', 'PR26', 'ALM01', 'C26'),
('I27', 21.00, '2023-01-21', '2023-02-01', 'PR27', 'ALM01', 'C27'),
('I28', 11.00, '2023-01-11', '2023-01-25', 'PR28', 'ALM01', 'C28'),
('I29', 10.00, '2023-01-23', '2023-02-20', 'PR29', 'ALM01', 'C29'),
('I30', 90.00, '2023-01-27', '2023-02-22', 'PR30', 'ALM01', 'C30'),
('I31', 34.00, '2023-01-11', '2023-05-30', 'PR31', 'ALM01', 'C31'),
('I32', 67.00, '2023-01-01', '2023-01-15', 'PR32', 'ALM01', 'C32'),
('I33', 44.00, '2023-01-04', '2023-01-27', 'PR33', 'ALM01', 'C33'),
('I34', 43.00, '2023-01-06', '2023-02-09', 'PR34', 'ALM01', 'C34'),
('I35', 22.00, '2023-01-09', '2023-01-30', 'PR35', 'ALM01', 'C35'),
('I36', 29.00, '2023-01-02', NULL, 'PR36', 'ALM01', 'C36'),
('I37', 59.00, '2023-01-19', NULL, 'PR37', 'ALM01', 'C37'),
('I38', 78.00, '2023-02-21', NULL, 'PR38', 'ALM01', 'C38'),
('I39', 21.00, '2023-02-09', NULL, 'PR39', 'ALM01', 'C39'),
('I40', 11.00, '2023-02-05', NULL, 'PR40', 'ALM01', 'C40'),
('I41', 10.00, '2023-02-01', NULL, 'PR41', 'ALM01', 'C41'),
('I42', 90.00, '2023-02-28', NULL, 'PR42', 'ALM01', 'C42'),
('I43', 34.00, '2023-02-14', NULL, 'PR43', 'ALM01', 'C43'),
('I44', 67.00, '2023-02-16', NULL, 'PR44', 'ALM01', 'C44'),
('I45', 44.00, '2023-02-19', NULL, 'PR45', 'ALM01', 'C45'),
('I46', 43.00, '2023-01-29', NULL, 'PR46', 'ALM01', 'C46'),
('I47', 22.00, '2023-01-01', NULL, 'PR47', 'ALM01', 'C47'),
('I48', 29.00, '2023-02-02', NULL, 'PR48', 'ALM01', 'C48');
select * from TB_INVENTARIO


CREATE TABLE TB_detallePEDIDO(  -- ARREGLAR - FALTA COMPLETAR 4 PEDIDOS MAS de la tabla
    id_detallePedido CHAR(25)NOT NULL PRIMARY KEY,
    cantidad_objetiva DECIMAL(38,2),
    cantidad_obtenida DECIMAL(38,2),
    total_detalle FLOAT,
    id_pedido CHAR(25),
    id_producto CHAR(25),
    FOREIGN KEY (id_pedido) REFERENCES TB_PEDIDO(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES TB_PRODUCTO(id_producto)
);
INSERT INTO TB_detallePEDIDO (id_detallePedido, cantidad_objetiva, cantidad_obtenida, total_detalle, id_pedido, id_producto) VALUES
('DP01', 1, 1, 699.90, 'PE01', 'PR01'),
('DP02', 2, 2, 538.00, 'PE01', 'PR02'),
('DP03', 1, 1, 1799.00, 'PE01', 'PR03'),
('DP04', 1, 1, 1299.90, 'PE02', 'PR04'),
('DP05', 1, 1, 599.00, 'PE02', 'PR05'),
('DP06', 1, 1, 899.00, 'PE02', 'PR06'),
('DP07', 1, 1, 1399.00, 'PE03', 'PR07'),
('DP08', 1, 1, 1099.00, 'PE03', 'PR08'),
('DP09', 1, 1, 299.00, 'PE03', 'PR09'),
('DP10', 1, 1, 2299.00, 'PE04', 'PR10'),
('DP11', 1, 1, 2599.00, 'PE04', 'PR11'),
('DP12', 1, 1, 899.00, 'PE04', 'PR12'),
('DP13', 1, 1, 3000.00, 'PE05', 'PR13'),
('DP14', 1, 1, 5000.00, 'PE05', 'PR14'),
('DP15', 1, 1, 5600.00, 'PE05', 'PR15'),
('DP16', 1, 1, 245.00, 'PE06', 'PR16'),
('DP17', 1, 1, 987.00, 'PE06', 'PR17'),
('DP18', 1, 1, 965.00, 'PE06', 'PR18'),
('DP19', 1, 1, 5000.00, 'PE07', 'PR19'),
('DP20', 1, 1, 3000.00, 'PE07', 'PR20'),
('DP21', 1, 1, 2400.00, 'PE07', 'PR21'),
('DP22', 1, 1, 2450.00, 'PE08', 'PR22'),
('DP23', 1, 1, 900.00, 'PE08', 'PR23'),
('DP24', 1, 1, 9687.00, 'PE08', 'PR24'),
('DP25', 1, 1, 500.00, 'PE09', 'PR25'),
('DP26', 1, 1, 678.00, 'PE09', 'PR26'),
('DP27', 1, 1, 345.00, 'PE09', 'PR27'),
('DP28', 1, 1, 234.00, 'PE10', 'PR28'),
('DP29', 1, 1, 122.00, 'PE10', 'PR29'),
('DP30', 1, 1, 178.00, 'PE10', 'PR30'),
('DP31', 1, 1, 455.00, 'PE11', 'PR31'),
('DP32', 1, 1, 111.00, 'PE11', 'PR32'),
('DP33', 1, 1, 321.00, 'PE11', 'PR33'),
('DP34', 1, 1, 908.00, 'PE12', 'PR34'),
('DP35', 1, 1, 99.00, 'PE12', 'PR35'),
('DP36', 1, 1, 431.00, 'PE12', 'PR36'),
('DP37', 1, 1, 6000.00, 'PE13', 'PR37'),
('DP38', 1, 1, 5000.00, 'PE13', 'PR38'),
('DP39', 1, 1, 4500.00, 'PE13', 'PR39'),
('DP40', 1, 1, 3400.00, 'PE14', 'PR40'),
('DP41', 1, 1, 9900.00, 'PE14', 'PR41'),
('DP42', 1, 1, 4000.00, 'PE14', 'PR42'),
('DP43', 1, 1, 987.00, 'PE15', 'PR43'),
('DP44', 1, 1, 321.00, 'PE15', 'PR44'),
('DP45', 1, 1, 765.00, 'PE15', 'PR45'),
('DP46', 1, 1, 908.00, 'PE16', 'PR46'),
('DP47', 1, 1, 654.00, 'PE16', 'PR47'),
('DP48', 1, 1, 408.00, 'PE16', 'PR48');
select * from TB_detallePEDIDO


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