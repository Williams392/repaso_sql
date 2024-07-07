
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

*/ -------------------------------------------------------------------------------------------------------------

/* ----------------------------------------------------------------
	MTC - CODIGO POSTAL PERU:
	https://www.datosabiertos.gob.pe/dataset/mtc-codigo-postal-peru
*/ ----------------------------------------------------------------

CREATE TABLE TB_UBICACION ( -- Conectado con:  TB_CLIENTES y TB_UBiCACION
    id_ubicacion INT PRIMARY KEY,
    provincia VARCHAR(50) NOT NULL,
    distrito VARCHAR(50) NOT NULL,
    capital_distrito VARCHAR(50),
    centro_poblado_localidad VARCHAR(100),
    codigo_postal VARCHAR(20)
);

-- 43 DISTRITOS:

insert into TB_UBICACION values(1, 	'Lima', 'Lima', 'Lima', 'Lima', '15001')
insert into TB_UBICACION values(2, 	'Lima', 'Ancón', 'Ancon', 'Ancon', '15123')
insert into TB_UBICACION values(3, 	'Lima', 'Ate', 'Vitarte', 'Vitarte', '15004')
insert into TB_UBICACION values(4, 	'Lima', 'Barranco', 'Barranco', 'Barranco', '15047')
insert into TB_UBICACION values(5, 	'Lima', 'Breña', 'Breña', 'Breña', '15082')
insert into TB_UBICACION values(6, 	'Lima', 'Carabayllo', 'Carabayllo', 'Carabayllo', '15121')
insert into TB_UBICACION values(7, 	'Lima', 'Chaclacayo', 'Chaclacayo', 'Chaclacayo', '15472')
insert into TB_UBICACION values(8, 	'Lima', 'Chorrillos', 'Chorrillos', 'Chorrillos', '15054')
insert into TB_UBICACION values(9, 	'Lima', 'Cieneguilla', 'Cieneguilla', 'Cieneguilla', '15593')
insert into TB_UBICACION values(10, 	'Lima', 'Comas', 'La Libertad', 'La Libertad', '15311')
insert into TB_UBICACION values(11, 	'Lima', 'El Agustino', 'El Agustino', 'El Agustino', '15003')
insert into TB_UBICACION values(12, 	'Lima', 'Independencia', 'Independencia', 'Independencia', '15333')
insert into TB_UBICACION values(13, 	'Lima', 'Jesús María', 'Jesus Maria', 'Jesus Maria', '15046')
insert into TB_UBICACION values(14, 	'Lima', 'La Molina', 'La Molina', 'La Molina', '15012')
insert into TB_UBICACION values(15, 	'Lima', 'La Victoria', 'La Victoria', 'La Victoria', '15018')
insert into TB_UBICACION values(16, 	'Lima', 'Lince', 'Lince', 'Lince', '15076')
insert into TB_UBICACION values(17, 	'Lima', 'Los Olivos', 'Las Palmeras', 'Las Palmeras', '15314')
insert into TB_UBICACION values(18, 	'Lima', 'Lurigancho', 'Chosica', 'Chosica', '15472')
insert into TB_UBICACION values(19, 	'Lima', 'Lurín', 'Lurin', 'Lurin', '15846')
insert into TB_UBICACION values(20, 	'Lima', 'Lurín', 'Lurin', 'Lomas Pucara', '15823')
insert into TB_UBICACION values(21, 	'Lima', 'Magdalena Vieja', 'Pueblo Libre', 'Pueblo Libre', '15088')
insert into TB_UBICACION values(22, 	'Lima', 'Miraflores', 'Miraflores', 'Miraflores', '15076')
insert into TB_UBICACION values(23, 	'Lima', 'Pachacamac', 'Pachacamac', 'Tomina', '15823')
insert into TB_UBICACION values(24, 	'Lima', 'Pucusana', 'Pucusana', 'Playa Acantilado', '15865')
insert into TB_UBICACION values(25, 	'Lima', 'Puente Piedra', 'Puente Piedra', 'Puente Piedra', '15113')
insert into TB_UBICACION values(26, 	'Lima', 'Punta Hermosa', 'Punta Hermosa', 'Cucuya', '15845')
insert into TB_UBICACION values(27, 	'Lima', 'Punta Negra', 'Punta Negra', 'Punta Negra', '15851')
insert into TB_UBICACION values(28, 	'Lima', 'Rimac', 'Rimac', 'Rimac', '15333')
insert into TB_UBICACION values(29, 	'Lima', 'San Bartolo', 'San Bartolo', 'Granja 4', '15855')
insert into TB_UBICACION values(30, 	'Lima', 'San Borja', 'San Francisco de Borja', 'San Francisco de Borja', '15037')
insert into TB_UBICACION values(31, 	'Lima', 'San Isidro', 'San Isidro', 'San Isidro', '15076')
insert into TB_UBICACION values(32, 	'Lima', 'San Juan de Lurigancho', 'San Juan de Lurigancho', 'San Juan de Lurigancho', '15457')
insert into TB_UBICACION values(33, 	'Lima', 'San Juan de Miraflores', 'Ciudad de Dios', 'Ciudad de Dios', '15842')
insert into TB_UBICACION values(34, 	'Lima', 'San Luis', 'San Luis', 'San Luis', '15004')
insert into TB_UBICACION values(35, 	'Lima', 'San Martin de Porres', 'Barrio Obrero Industrial', 'Barrio Obrero Industrial', '15101')
insert into TB_UBICACION values(36, 	'Lima', 'San Miguel', 'San Miguel', 'San Miguel', '15088')
insert into TB_UBICACION values(37, 	'Lima', 'Santa Anita', 'Santa Anita - los Ficus', 'Santa Anita - los Ficus', '15498')
insert into TB_UBICACION values(38, 	'Lima', 'Santa Maria del Mar', 'Santa Maria del Mar', 'Don Bruno', '15861')
insert into TB_UBICACION values(39, 	'Lima', 'Santa Rosa', 'Santa Rosa', 'Santa Rosa', '15123')
insert into TB_UBICACION values(40, 	'Lima', 'Santiago de Surco', 'Santiago de Surco', 'Santiago de Surco', '15023')
insert into TB_UBICACION values(41, 	'Lima', 'Surquillo', 'Surquillo', 'Surquillo', '15036')
insert into TB_UBICACION values(42, 	'Lima', 'Villa el Salvador', 'Villa el Salvador', 'Villa el Salvador', '15816')
insert into TB_UBICACION values(43, 	'Lima', 'Villa Maria del Triunfo', 'Villa Maria del Triunfo', 'Villa Maria del Triunfo', '15828')
SELECT * FROM TB_UBICACION
GO
-- -------------------------------------------------------------------------------------------------------------


CREATE TABLE TB_EMPLEADO(
    id_empleado CHAR(25)NOT NULL PRIMARY KEY,
    estado VARCHAR(12) NOT NULL,
	nombre VARCHAR(200) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    fechaNacimiento DATE NOT NULL,
    telefono VARCHAR(20) -- se cambio de un int
);

-- data aleatoria:
INSERT INTO TB_EMPLEADO  VALUES 
('EM01', 'Activo', 'Juan', 'Flores Carter', 'jdoe@sodimac', 'Av. Principal 123', '1985-05-20', '987654321'),
('EM02', 'Activo', 'Jose', 'Smith Rens', 'asmith@sodimac', 'Av. Secundaria 456', '1990-07-15', '912345678'),
('EM03', 'Activo', 'Sebas', 'Ruiz Iman', 'asmith@sodimac', 'Av. Tercera 789', '1988-11-30', '912345678'),
('EM04', 'Activo', 'Pedro', 'Sanchez Quispe', 'pesaqui@sodimac', 'Jr 9 De Diciembre 218', '1986-12-12', '945554567'),
('EM05', 'Activo', 'Rodrigo', 'Huaman Lopez', 'rohulo@sodimac', 'Jr 28 De Julio 537 A, Cercado', '1998-09-04', '999873420'),
('EM06', 'Activo', 'Marco', 'Espinoza Diaz', 'maesdi@sodimac', 'Av. 28 de Julio 878', '1989-01-30', '909983498'),
('EM07', 'Activo', 'Enrique', 'Perez Sanchez', 'enpesa@sodimac', 'Los Cedros 209', '1994-11-07', '900988950'),
('EM08', 'Activo', 'Juan', 'Cordova Ruiz', 'jucoru@sodimac', 'Jr. Ucayali N° 388 ', '1986-09-06', '900945321'),
('EM09', 'Activo', 'Maria', 'Quispe Diaz', 'maquidi@sodimac', 'Av Mariscal Caceres 1420', '1999-11-21','912321870'),
('EM10', 'Activo', 'Sofia', 'Rojas Vazquez', 'soroma@sodimac', 'Jr Tarapaca 595', '2000-01-01', '998767890'),
('EM11', 'Activo', 'Sandro', 'Mamani Rios', 'samari@sodimac', 'Jr Bolivar 123, Cercado', '1999-09-28', '998765980'),
('EM12', 'Activo', 'Patrick', 'Chavez Castillo', 'pachaca@sodimac', 'Jr. Camaná 616 ', '2001-09-09', '905092870'),
('EM13', 'Activo', 'Sebastian', 'Hilario Perez', 'sehipe@sodimac', 'JR Bolivar 156', '1988-10-24', '900983921'),
('EM14', 'Activo', 'Lucero', 'Zamora Zamora', 'luzaza@sodimac', 'Av. Carmen Alto 121', '2002-03-01', '909904592'),
('EM15', 'Activo', 'Maria', 'Ramirez Sanchez', 'marasa@sodimac', 'Av. Leoncio Prado 298', '1997-06-21', '999875673'),
('EM16', 'Activo', 'Maryori', 'Gonzales Quispe', 'magoqui@sodimac', 'Jr Maria Montesori 150', '1989-01-20', '999804539'),
('EM17', 'Activo', 'Piero', 'Hernandez Diaz', 'pihesa@sodimac', 'Av Independencia Cda 06', '1998-06-09', '976754321'),
('EM18', 'Activo', 'Oliver', 'Torres Aguila', 'oltoaguia@sodimac', 'AV De La Poesia 160', '2002-09-02', '987617930'),
('EM19', 'Activo', 'Dayana', 'Gamboa Perez', 'dagape@sodimac', 'AV Las Casuarinas 250', '2003-12-29', '909841093'),
('EM20', 'Activo', 'Kimberly', 'Camarena Mendoza', 'kicame@sodimac', 'Jr Ciro Alegria 435, Las Nazarenas', '2001-02-09', '932092309');
SELECT * FROM TB_EMPLEADO;
go

CREATE TABLE TB_CLIENTES(
    id_clientes INT PRIMARY KEY,
    estado VARCHAR(12) NOT NULL,
    nombres VARCHAR(200) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fechaNacimiento DATE NOT NULL,
    telefono VARCHAR(20),
    correo VARCHAR(50),
    direccion VARCHAR(150),

    --informacion_adicional VARCHAR(250),

    id_empleado CHAR(25),
    id_ubicacion INT,
    FOREIGN KEY (id_empleado) REFERENCES TB_EMPLEADO(id_empleado),
    FOREIGN KEY (id_ubicacion) REFERENCES TB_UBiCACION(id_ubicacion)
);
INSERT INTO TB_CLIENTES  VALUES 
(1, 'Activo', 'Brando', 'Servero Tapia', '1990-01-01', '912345678', 'brando@gmail.com', 'MC-L 07 VIV ALAMEDA', 'EM01', 1), 
(2, 'Activo', 'Matias', 'Castello Arrequi', '1991-02-02', '923456789', 'matias@gmail.com', 'AV. PRODUCCIÓN NACIONAL 188', 'EM02', 2), 
(3, 'Activo', 'Dani', 'Baena Jacinta', '1992-03-03', '934567890', 'dani@gmail.com', 'JR. VICTOR ANDRES BELAUNDE Nº 976', 'EM03', 3), 
(4, 'Activo', 'Maria', 'Espinoza Becerra', '1994-03-21', '989076984', 'maria@gmail.com', 'JR. VICTOR ANDRES BELAUNDE Nº 976', 'EM04', 4),
(5, 'Activo', 'Carlos', 'Castillo Fernandez', '1996-01-15', '912345682', 'carlos@gmail.com', 'Av. Javier Prado 1213', 'EM05', 5),
(6, 'Activo', 'Rosa', 'Torres Garcia', '1997-04-27', '912345683', 'rosa@gmail.com', 'Av. Angamos 1415', 'EM06', 5),
(7, 'Activo', 'Jorge', 'Flores Sanchez', '1998-07-19', '912345684', 'jorge@gmail.com', 'Av. Brasil 1617', 'EM07', 6),
(8, 'Activo', 'María', 'Santos Chavez', '1999-10-01', '912345685', 'maria@gmail.com', 'Av. Venezuela 1819', 'EM08', 7),
(9, 'Activo', 'Luis', 'Martinez Ramos', '2000-12-22', '912345686', 'luis@gmail.com', 'Av. Grau 2021', 'EM09', 34),
(10, 'Activo', 'Carmen', 'Morales Vargas', '2001-02-11', '912345687', 'carmen@gmail.com', 'Av. Argentina 2223', 'EM10', 7),
(11, 'Activo', 'Miguel', 'Hernandez Gomez', '2002-05-30', '912345688', 'miguel@gmail.com', 'Av. Pardo 2425', 'EM11', 8),
(12, 'Activo', 'Sara', 'Suarez Diaz', '2003-08-14', '912345689', 'sara@gmail.com', 'Av. Benavides 2627', 'EM12', 8),
(13, 'Activo', 'Juan', 'Gutierrez Mendoza', '2004-11-09', '912345690', 'juan@gmail.com', 'Av. Salaverry 2829', 'EM13', 18),
(14, 'Activo', 'Teresa', 'Chavez Ortega', '1993-03-21', '912345691', 'teresa@gmail.com', 'Av. Primavera 3031', 'EM14', 18),
(15, 'Activo', 'Raul', 'Paredes Reyes', '1994-06-05', '912345692', 'raul@gmail.com', 'Av. Petit Thouars 3233', 'EM15', 18),
(16, 'Activo', 'Patricia', 'Espinoza Cruz', '1995-09-17', '912345693', 'patricia@gmail.com', 'Av. Túpac Amaru 3435', 'EM16', 18),
(17, 'Activo', 'Sergio', 'Velasquez Castro', '1996-12-28', '912345694', 'sergio@gmail.com', 'Av. Alfonso Ugarte 3637', 'EM17', 18),
(18, 'Activo', 'Paula', 'Salinas Ponce', '1997-01-09', '912345695', 'paula@gmail.com', 'Av. Guardia Civil 3839', 'EM18', 18),
(19, 'Activo', 'Julio', 'Vargas Rojas', '1998-04-23', '912345696', 'julio@gmail.com', 'Av. Prolongación Tacna 4041', 'EM19', 18),
(20, 'Activo', 'Daniela', 'Ramirez Salvador', '1999-07-15', '912345697', 'daniela@gmail.com', 'Av. Separadora Industrial 4243', 'EM20', 18),
(21, 'Activo', 'Manuel', 'Cordova Reyes', '1990-05-15', '912345678', 'manuel@gmail.com', 'JR. LOS BOMBEROS 125', 'EM01', 11), 
(22, 'Activo', 'Laura', 'Torres Sánchez', '1992-08-22', '923456789', 'laura@gmail.com', 'AV. PRODUCCIÓN NACIONAL 188', 'EM02', 11), 
(23, 'Activo', 'Carlos', 'Luna Espinoza', '1988-03-18', '934567890', 'carlos@gmail.com', 'JR. VICTOR ANDRES BELAUNDE Nº 976', 'EM03', 11), 
(24, 'Activo', 'María', 'García Huamaní', '1991-06-25', '989076984', 'maria@gmail.com', 'AV. SAN MIGUEL 360', 'EM04', 12),
(25, 'Activo', 'Luis', 'Martínez López', '1993-09-10', '912345678', 'luis@gmail.com', 'JR. LOS GAVILANES 225', 'EM05', 12),
(26, 'Activo', 'Fabiola', 'Soto Torres', '1995-02-28', '923456789', 'fabiola@gmail.com', 'AV. NICOLAS AYLLON 180', 'EM06', 12),
(27, 'Activo', 'Jorge', 'Vega Ramírez', '1994-11-17', '934567890', 'jorge@gmail.com', 'JR. LAS ACACIAS 550', 'EM07', 12),
(28, 'Activo', 'Ana', 'Fernández Gómez', '1990-04-05', '989076984', 'ana@gmail.com', 'AV. BRASIL 710', 'EM08', 12),
(29, 'Activo', 'Pedro', 'Torres Valdez', '1989-07-12', '912345678', 'pedro@gmail.com', 'JR. LOS GERANIOS 320', 'EM09', 12),
(30, 'Activo', 'Verónica', 'López Flores', '1993-10-30', '923456789', 'veronica@gmail.com', 'AV. INDUSTRIAL 990', 'EM10', 12),
(31, 'Activo', 'Martín', 'García Silva', '1991-09-15', '934567890', 'martin@gmail.com', 'JR. LAS GAVIOTAS 420', 'EM11', 35),
(32, 'Activo', 'Rosa', 'Mendoza Ramos', '1992-12-03', '989076984', 'rosa@gmail.com', 'AV. LAS PALMERAS 680', 'EM12', 36),
(33, 'Activo', 'Miguel', 'Castillo Herrera', '1988-08-20', '912345678', 'miguel@gmail.com', 'JR. LAS ACACIAS 880', 'EM13', 12),
(34, 'Activo', 'Carmen', 'Paredes Torres', '1990-11-08', '923456789', 'carmen@gmail.com', 'AV. LOS SAUCES 540', 'EM14', 37),
(35, 'Activo', 'Diego', 'Sánchez Flores', '1994-03-16', '934567890', 'diego@gmail.com', 'JR. LAS ROSAS 760', 'EM15', 12),
(36, 'Activo', 'Patricia', 'Gómez Gonzales', '1993-01-25', '989076984', 'patricia@gmail.com', 'AV. LAS ORQUÍDEAS 920', 'EM16', 12),
(37, 'Activo', 'Javier', 'Flores Salazar', '1989-06-10', '912345678', 'javier@gmail.com', 'JR. LOS GIRASOLES 630', 'EM17', 13),
(38, 'Activo', 'Lucía', 'Torres Díaz', '1991-04-05', '923456789', 'lucia@gmail.com', 'AV. LAS VIOLETAS 780', 'EM18', 13),
(39, 'Activo', 'Gabriel', 'Mendoza Flores', '1988-12-12', '934567890', 'gabriel@gmail.com', 'JR. LAS FLORES 440', 'EM19', 15),
(40, 'Activo', 'Sofía', 'García Sánchez', '1992-10-28', '989076984', 'sofia@gmail.com', 'AV. LOS JAZMINES 690', 'EM20', 16),
(41, 'Activo', 'Juan', 'Díaz Rodríguez', '1993-07-15', '912345678', 'juan@gmail.com', 'JR. LAS AMÉRICAS 580', 'EM11', 17),
(42, 'Activo', 'Martha', 'Paredes Silva', '1990-05-22', '923456789', 'martha@gmail.com', 'AV. LOS CEDROS 820','EM10', 18),
(43, 'Activo', 'Raúl', 'Torres Pérez', '1989-02-18', '934567890', 'raul@gmail.com', 'JR. LOS ROBLES 470', 'EM13', 23),
(44, 'Activo', 'Andrea', 'Flores Gutiérrez', '1994-11-25', '989076984', 'andrea@gmail.com', 'AV. LAS PALMERAS 930', 'EM17', 23),
(45, 'Activo', 'Pablo', 'Mendoza Gonzales', '1991-08-14', '912345678', 'pablo@gmail.com', 'JR. LOS GIRASOLES 620', 'EM20', 23),
(46, 'Activo', 'Camila', 'López Torres', '1993-03-30', '923456789', 'camila@gmail.com', 'AV. LAS VIOLETAS 770', 'EM16', 9),
(47, 'Activo', 'Martín', 'Castillo Ramírez', '1988-10-20', '934567890', 'martin@gmail.com', 'JR. LAS FLORES 420', 'EM05', 10),
(48, 'Activo', 'Valeria', 'Sánchez Díaz', '1990-12-08', '989076984', 'valeria@gmail.com', 'AV. LAS ORQUÍDEAS 910', 'EM10', 11),
(49, 'Activo', 'Pedro', 'Gómez Flores', '1989-09-05', '912345678', 'pedro@gmail.com', 'JR. LOS GIRASOLES 600', 'EM13', 12),
(50, 'Activo', 'Daniela', 'Torres Sánchez', '1992-06-03', '923456789', 'daniela@gmail.com', 'AV. LAS VIOLETAS 750', 'EM19', 13),
(51, 'Activo', 'José', 'Flores Ramírez', '1994-04-10', '934567890', 'jose@gmail.com', 'JR. LAS FLORES 420', 'EM14', 14),
(52, 'Activo', 'Luisa', 'Torres Díaz', '1991-05-02', '945678901', 'luisa@gmail.com', 'AV. LAS VIOLETAS 780',  'EM01', 15),
(53, 'Activo', 'Manuel', 'Mendoza Flores', '1990-01-15', '956789012', 'manuel@gmail.com', 'JR. LAS FLORES 440', 'EM19', 16),
(54, 'Activo', 'Sofía', 'García Sánchez', '1992-11-28', '967890123', 'sofia@gmail.com', 'AV. LOS JAZMINES 690', 'EM20', 17),
(55, 'Activo', 'Jorge', 'Díaz Rodríguez', '1993-08-15', '978901234', 'jorge@gmail.com', 'JR. LAS AMÉRICAS 580', 'EM03', 18),
(56, 'Activo', 'María', 'Paredes Silva', '1990-06-22', '989012345', 'maria@gmail.com', 'AV. LOS CEDROS 820', 'EM02', 19),
(57, 'Activo', 'Raúl', 'Torres Pérez', '1989-03-18', '990123456', 'raul@gmail.com', 'JR. LOS ROBLES 470', 'EM03', 20),
(58, 'Activo', 'Ana', 'Flores Gutiérrez', '1994-12-05', '901234567', 'ana@gmail.com', 'AV. LAS PALMERAS 930', 'EM04', 21),
(59, 'Activo', 'Pablo', 'Mendoza Gonzales', '1991-09-24', '912345678', 'pablo@gmail.com', 'JR. LOS GIRASOLES 620', 'EM05', 22),
(60, 'Activo', 'Camila', 'López Torres', '1993-04-10', '923456789', 'camila@gmail.com', 'AV. LAS VIOLETAS 770', 'EM16', 23),
(61, 'Activo', 'Martín', 'Castillo Ramírez', '1988-11-30', '934567890', 'martin@gmail.com', 'JR. LAS FLORES 420', 'EM17', 24),
(62, 'Activo', 'Valeria', 'Sánchez Díaz', '1990-01-18', '945678901', 'valeria@gmail.com', 'AV. LAS ORQUÍDEAS 910', 'EM18', 25),
(63, 'Activo', 'Pedro', 'Gómez Flores', '1989-09-25', '956789012', 'pedro@gmail.com', 'JR. LOS GIRASOLES 600', 'EM19', 26),
(64, 'Activo', 'Daniela', 'Torres Sánchez', '1992-06-04', '967890123', 'daniela@gmail.com', 'AV. LAS VIOLETAS 750', 'EM10', 27),
(65, 'Activo', 'José', 'Flores Ramírez', '1994-04-11', '978901234', 'jose@gmail.com', 'JR. LAS FLORES 420', 'EM01', 28),
(66, 'Activo', 'Luisa', 'Torres Díaz', '1991-05-03', '989012345', 'luisa@gmail.com', 'AV. LAS VIOLETAS 780', 'EM18', 29),
(67, 'Activo', 'Manuel', 'Mendoza Flores', '1990-01-16', '990123456', 'manuel@gmail.com', 'JR. LAS FLORES 440', 'EM11', 30),
(68, 'Activo', 'Sofía', 'García Sánchez', '1992-11-29', '901234567', 'sofia@gmail.com', 'AV. LOS JAZMINES 690', 'EM19', 31),
(69, 'Activo', 'Jorge', 'Díaz Rodríguez', '1993-08-16', '912345678', 'jorge@gmail.com', 'JR. LAS AMÉRICAS 580', 'EM20', 32),
(70, 'Activo', 'María', 'Paredes Silva', '1990-06-23', '923456789', 'maria@gmail.com', 'AV. LOS CEDROS 820', 'EM04', 33);
SELECT * FROM TB_CLIENTES

SELECT c.id_clientes, u.distrito -- para verificar a q distrito pertenececen los clientes:
FROM TB_CLIENTES c
JOIN TB_UBICACION u ON c.id_ubicacion = u.id_ubicacion
WHERE u.id_ubicacion >= 1 AND u.id_ubicacion <= 43;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE TB_COMPROBANTE(
    id_comprobante INT PRIMARY KEY,
    tipo_comprobante VARCHAR(50) NOT NULL
);
INSERT INTO TB_COMPROBANTE  VALUES 
( 1, 'Factura'), -- reutilizar en  TB_PEDIDO
( 2, 'Boleta'),
( 3, 'Nota de crédito');
go
select * from TB_COMPROBANTE


CREATE TABLE TB_TIPO_ENTREGA(  -- reutilizar en  TB_PEDIDO
    id_tipoEntrega INT PRIMARY KEY,
    descripcion VARCHAR(200) NOT NULL,
    monto FLOAT,
	dias int
);
INSERT INTO TB_TIPO_ENTREGA VALUES 
(1, 'Retiro en tienda', 0, 1), -- creo que no trabajar con el retiro en tienda, solo con TE02 y TE03
(2, 'Entrega regular', 10, 5),
(3, 'Entrega rápida', 20, 2);
select * from TB_TIPO_ENTREGA

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE TB_ENTIENDA( 
    id_enTienda CHAR(25)NOT NULL PRIMARY KEY,
	nombre VARCHAR(200) NOT NULL,
    dirCentral VARCHAR(100) NOT NULL,
    --monto FLOAT, elimine porque se gestiona en TB_TIPO_ENTREGA
    id_tipoEntrega INT,
    FOREIGN KEY (id_tipoEntrega) REFERENCES TB_TIPO_ENTREGA(id_tipoEntrega)
);
INSERT INTO TB_ENTIENDA VALUES 
('ET01', 'Sodimac Comas', 'Av. Chacra Cerro 121', 2),
('ET02', 'Sodimac Puente Piedra','Av. San Juan de Dios con Calle 7', 2),
('ET03', 'Sodimac S. J. Lurigancho', 'Jr. Cajamarquilla, Urb.Zarate', 2),
('ET04', 'Sodimac Surco', 'Av. Caminos del Inca 456', 2),
('ET05', 'Sodimac La Molina', 'Av. La Fontana 789', 2),
('ET06', 'Sodimac San Borja', 'Av. San Luis 101', 3),
('ET07', 'Sodimac Lince', 'Av. Arenales 202', 2),
('ET08', 'Sodimac Magdalena', 'Av. Brasil 303', 2),
('ET09', 'Sodimac Barranco', 'Av. Miguel Grau 404', 2),
('ET10', 'Sodimac Pueblo Libre', 'Av. La Mar 505', 2),
('ET11', 'Sodimac Jesús María', 'Av. Salaverry 606', 2),
('ET12', 'Sodimac Rimac', 'Av. Alcazar 707', 2),
('ET13', 'Sodimac San Miguel', 'Av. La Marina 808', 2),
('ET14', 'Sodimac Chorrillos', 'Av. Huaylas 909', 2),
('ET15', 'Sodimac Callao', 'Av. Faucett 111', 2),
('ET16', 'Sodimac Ate', 'Av. Nicolas Ayllon 222', 2),
('ET17', 'Sodimac Villa El Salvador', 'Av. El Sol 333', 2),
('ET18', 'Sodimac Independencia', 'Av. Túpac Amaru 444', 3),
('ET19', 'Sodimac Los Olivos', 'Av. Universitaria 555', 2),
('ET20', 'Sodimac Ancon', 'Av. Próceres 666', 2);
SELECT * FROM TB_ENTIENDA

-------------------------------------------

-------------------------------- AUTOMATICO CON TRIGGER - se registrar con la tabla pedido.
CREATE TABLE TB_DELIVERY(
    id_delivery INT IDENTITY(1,1) PRIMARY KEY,
    id_tipoEntrega INT,
    id_ubicacion INT,
    FOREIGN KEY (id_tipoEntrega) REFERENCES TB_TIPO_ENTREGA(id_tipoEntrega),
    FOREIGN KEY (id_ubicacion) REFERENCES TB_UBICACION(id_ubicacion)
);
select * from TB_DELIVERY;


CREATE TABLE TB_PEDIDO( -- IMPORTANTE respetar LA TABLA id_tipoEntrega con las fechas por que hay 3 tipos de pedidos ( 5 y 2 dias)
    id_pedido INT PRIMARY KEY,
    estado VARCHAR(12),
    fecha_pedido DATE,
    fecha_entrega DATE,
    total_pedido FLOAT,
    id_clientes INT,

    id_comprobante INT,

    id_empleado CHAR(25),
    id_tipoEntrega INT,
	id_ubicacion INT,
    FOREIGN KEY (id_clientes) REFERENCES TB_CLIENTES(id_clientes),
    FOREIGN KEY (id_comprobante) REFERENCES TB_COMPROBANTE(id_comprobante),
    FOREIGN KEY (id_empleado) REFERENCES TB_EMPLEADO(id_empleado),
    FOREIGN KEY (id_tipoEntrega) REFERENCES TB_TIPO_ENTREGA(id_tipoEntrega),
	FOREIGN KEY (id_ubicacion) REFERENCES TB_UBiCACION(id_ubicacion)
);
select * from TB_PEDIDO;
go

-----------------------------------------------------------
-- Crear el trigger para actualizar TB_DELIVERY atomaticamente:
CREATE TRIGGER trg_after_insert_pedido
ON TB_PEDIDO
AFTER INSERT
AS
BEGIN
    INSERT INTO TB_DELIVERY (id_tipoEntrega, id_ubicacion)
    SELECT id_tipoEntrega, id_ubicacion
    FROM inserted;
END;
GO
-----------------------------------------------------------

-----------------------------
-- NUEVA TABLA:
-----------------------------

CREATE TABLE TB_SATISFACCION_CLIENTE(
    id_satisfaccion INT PRIMARY KEY IDENTITY(1,1),
    id_cliente INT,
    id_pedido INT,
    calificacion INT NOT NULL CHECK (calificacion BETWEEN 1 AND 5),
    fecha DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES TB_CLIENTES(id_clientes),
    FOREIGN KEY (id_pedido) REFERENCES TB_PEDIDO(id_pedido)
);
select * from TB_SATISFACCION_CLIENTE
GO


--------------------------------------------------------------------------------------------------

-- 1. RECUERDA LA FECHA con el TIPO DE EMTREGA.
-- 2. pedidos del año 2023.
-- 3. EL total_pedido -> es con la cantidad de TB_detallePEDIDO q es el precio del producto.
INSERT INTO TB_PEDIDO VALUES 
(1, 'Disponible', '2023-06-02', '2023-06-12', 699.90, 1, 1, 'EM01', 3, 1),
(2, 'En proceso', '2023-06-02', '2023-06-07', 538.00, 2, 2, 'EM02', 2, 2), -- 5 dias
(3, 'En proceso', '2023-06-03', '2023-06-04', 1799.00, 3, 3, 'EM03', 2, 3), -- 2 dias
(4, 'En Proceso', '2023-09-30', '2023-10-02', 1299.90, 4, 2, 'EM04', 2, 4),  -- Si es del 2015 las compras tambien.
(5, 'Disponible', '2023-10-15', '2023-10-20', 599.00, 5, 2, 'EM05', 2, 5), -- 5 dias
(6, 'En Proceso', '2023-11-21', '2023-11-24', 899.00, 6, 2, 'EM06', 2, 5), -- 2 dias
(7, 'Disponible', '2023-12-05', '2023-12-14', 1399.00, 7, 2, 'EM07', 2, 6), 
(8, 'En Proceso', '2023-05-13', '2023-05-18', 1099.00, 8, 2, 'EM08', 2, 7), -- 5 dias

(9, 'Disponible', '2023-04-18', '2023-04-20', 299.00, 9, 2, 'EM09', 2, 34), -- 2 dias
(10, 'En Proceso', '2023-03-13', '2023-03-22', 2299.00, 10, 1, 'EM10', 2, 7),
(11, 'Disponible', '2023-04-20', '2023-04-30', 2599.00, 11, 3, 'EM11', 2, 8), -- (2)5 dias
(12, 'En Proceso', '2023-05-05', '2023-05-07', 899.00, 12, 2, 'EM12', 2, 8), -- (3)2 dias
(13, 'Disponible', '2023-06-10', '2023-06-17', 3000.00, 13, 2, 'EM13', 2, 18),
							 
(14, 'En Proceso', '2023-07-20', '2023-07-25', 5000.00, 14, 3, 'EM14', 3, 34), -- 5 dias
(15, 'Disponible', '2023-08-14', '2023-08-16', 5600.00, 15, 2, 'EM15', 3, 35), -- 2 dias
(16, 'En Proceso', '2023-09-19', '2023-09-27', 245.00, 16, 2, 'EM16', 3, 36),
							 
(17, 'Disponible', '2023-10-25', '2023-10-30', 987.00, 17, 1, 'EM17', 3, 37), -- 5 dias
(18, 'En Proceso', '2023-11-20', '2023-11-29', 965.00, 18, 1, 'EM18', 3, 38), -- 2 dias
(19, 'Disponible', '2023-12-17', '2023-12-25', 5000.00, 19, 2, 'EM19', 2, 39),
(20, 'En Proceso', '2023-07-06', '2023-07-11', 3000.00, 20, 2, 'EM20', 2, 40);-- 5 dias
SELECT * FROM TB_PEDIDO
go

select * from TB_DELIVERY; -- para verificar si funciona el TRIGGER.
go


---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------
-- Data misma de la tienda Sodimac:
---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE TB_CATEGORIA (
    id_categoria INT PRIMARY KEY,
	tipo VARCHAR(50),
);
INSERT INTO TB_CATEGORIA  VALUES 
(1, 'Muebles'),
(2, 'Dormitorio'),
(3, 'Electrohogar'),
(4, 'Tecnologia'),
(5, 'Terrazas y Jardin'),
(6, 'Baños y Cocina'),
(7, 'Herramientas y Maquinarias'),
(8, 'Limpieza'),
(9, 'Decoracion, Mnaje e Iluminación'),
(10, 'Aire libre y Mascotas'),
(11, 'Pisos y Pinturas');
go

SELECT * FROM TB_CATEGORIA

-- SI HAY UN NUEVO PRODUCTO -> AGREGAR A TB_INVENTARIO (manualmente):
CREATE TABLE TB_PRODUCTO ( 
    id_producto INT PRIMARY KEY,
    estado VARCHAR(15),
    lote VARCHAR(50),
    nombre VARCHAR(150),
    marcha varchar(70),
    precio DECIMAL(38,2),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES TB_CATEGORIA(id_categoria)
)

INSERT INTO TB_PRODUCTO  VALUES (1, 'Disponible', 'LI001', 'Mesa de TV 65 Funes', 'JUST HOME COLLECTION', 699.90, 1) -- MUEBLES:
INSERT INTO TB_PRODUCTO  VALUES (2, 'Disponible', 'LI002', 'Mesa de Centro Beijing Negro', 'TUHOME', 269.00, 1)
INSERT INTO TB_PRODUCTO  VALUES (3, 'Disponible', 'LI003', 'Sofá Cama Venecia', 'BONNO', 1799.00, 1)
INSERT INTO TB_PRODUCTO VALUES (4, 'Disponible', 'LI004', 'Cama Queen Size', 'TUHOME', 1299.90, 2) -- DORMITORIO:
INSERT INTO TB_PRODUCTO VALUES (5, 'Disponible', 'LI005', 'Ropero 6 Puertas 2 Cajones', 'JUST HOME COLLECTION', 599.00, 2)
INSERT INTO TB_PRODUCTO VALUES (6, 'Disponible', 'LI006', 'Colchón Queen Size', 'PARAISO', 899.00, 2)
INSERT INTO TB_PRODUCTO VALUES (7, 'Disponible', 'LI007', 'Refrigeradora No Frost 278L', 'MABE', 1399.00, 3) -- ELECTROHOGAR:
INSERT INTO TB_PRODUCTO VALUES (8, 'Disponible', 'LI008', 'Lavadora 8Kg', 'LG', 1099.00, 3)
INSERT INTO TB_PRODUCTO VALUES (9, 'Disponible', 'LI009', 'Microondas 25L', 'MIRAY', 299.00, 3)
INSERT INTO TB_PRODUCTO VALUES (10, 'Disponible', 'LI010', 'Smart TV 55" 4K UHD', 'SAMSUNG', 2299.00, 4) -- TECNOLOGIA:
INSERT INTO TB_PRODUCTO VALUES (11, 'Disponible', 'LI011', 'Laptop 15.6" Core i5 8GB RAM 1TB HDD', 'HP', 2599.00, 4)
INSERT INTO TB_PRODUCTO VALUES (12, 'Disponible', 'LI012', 'Celular 6.5" 4GB RAM 128GB', 'XIAOMI', 899.00, 4)
INSERT INTO TB_PRODUCTO VALUES (13, 'Disponible', 'LI013', 'Terraza estilo nordico', 'HOUE', 3000.00, 5) --Terrazas y Jardin
INSERT INTO TB_PRODUCTO VALUES (14, 'Disponible', 'LI014', 'Jardin de eden', 'FERMOB', 5000.00, 5)
INSERT INTO TB_PRODUCTO VALUES (15, 'Disponible', 'LI015', 'Jardin El caracter moderno', 'EMU', 5600.00, 5)
INSERT INTO TB_PRODUCTO VALUES (16, 'Disponible', 'LI016', 'Cocina moderna', 'MABE', 245.00, 6) --Baños y Cocina
INSERT INTO TB_PRODUCTO VALUES (17, 'Disponible', 'LI017', 'Baño ceramico', 'ROCA', 987.00, 6)
INSERT INTO TB_PRODUCTO VALUES (18, 'Disponible', 'LI018', 'Baño gasfiteries', 'PFISTER', 965.00, 6)
INSERT INTO TB_PRODUCTO VALUES (19, 'Disponible', 'LI019', 'Martillo Neumático', 'Bosch GSH 16-30', 5000.00, 7) --Herramientas y Maquinarias----
INSERT INTO TB_PRODUCTO VALUES (20, 'Disponible', 'LI020', 'Cortadora de Metal', 'DeWalt DW872', 3000.00, 7)
INSERT INTO TB_PRODUCTO VALUES (21, 'Disponible', 'LI021', 'Taladro Percutor', 'Makita HR2475', 2400.00, 7)
INSERT INTO TB_PRODUCTO VALUES (22, 'Disponible', 'LI022', 'Excavadora Hidráulica', 'Caterpillar 320D', 2450.00, 7)
INSERT INTO TB_PRODUCTO VALUES (23, 'Disponible', 'LI023', 'Bulldozer', 'Komatsu D65EX-17', 900.00, 7)
INSERT INTO TB_PRODUCTO VALUES (24, 'Disponible', 'LI024', 'Grúa Móvil', 'Liebherr LTM 1090-4.1', 9687.00, 7)
INSERT INTO TB_PRODUCTO VALUES (25, 'Disponible', 'LI025', 'Lejía Clorox', 'Clorox', 500.00, 8) ----Limpieza
INSERT INTO TB_PRODUCTO VALUES (26, 'Disponible', 'LI026', 'Spray Desinfectante Lysol', 'Lysol', 678.00, 8)
INSERT INTO TB_PRODUCTO VALUES (27, 'Disponible', 'LI027', 'Limpiador Multiusos Mr. Clean', 'Mr. Clean', 345.00, 8)
INSERT INTO TB_PRODUCTO VALUES (28, 'Disponible', 'LI028', 'Esponjas Abrasivas Scotch-Brite', 'Scotch-Brite', 234.00, 8)
INSERT INTO TB_PRODUCTO VALUES (29, 'Disponible', 'LI029', 'Limpiador para Exteriores Windex', 'Windex', 122.00, 8)
INSERT INTO TB_PRODUCTO VALUES (30, 'Disponible', 'LI030', 'Pulidor de Muebles Pledge', 'Pledge', 178.00, 8)
INSERT INTO TB_PRODUCTO VALUES (31, 'Disponible', 'LI031', 'Sofá', 'IKEA', 455.00, 9) ----------Decoracion, Mnaje e Iluminación----
INSERT INTO TB_PRODUCTO VALUES (32, 'Disponible', 'LI032', 'Estantería', 'West Elm', 111.00, 9)
INSERT INTO TB_PRODUCTO VALUES (33, 'Disponible', 'LI033', 'Isla de Cocina Belmont', 'Crate & Barrel', 321.00, 9)
INSERT INTO TB_PRODUCTO VALUES (34, 'Disponible', 'LI034', 'Bombilla', 'Philips Hue', 908.00, 9)
INSERT INTO TB_PRODUCTO VALUES (35, 'Disponible', 'LI035', 'Bombilla con Altavoz LED', 'GE Lighting', 99.00, 9)
INSERT INTO TB_PRODUCTO VALUES (36, 'Disponible', 'LI036', 'Atenuador Inalámbrico Caseta', 'Lutron', 431.00, 9)
INSERT INTO TB_PRODUCTO VALUES (37, 'Disponible', 'LI037', 'Ahumador', 'Weber', 6000.00, 10) -----Aire libre y Mascotas
INSERT INTO TB_PRODUCTO VALUES (38, 'Disponible', 'LI038', ' Motosierra', 'Husqvarna', 5000.00, 10)
INSERT INTO TB_PRODUCTO VALUES (39, 'Disponible', 'LI039', 'Cortacésped Eléctrico', 'Black+Decker', 4500.00, 10)
INSERT INTO TB_PRODUCTO VALUES (40, 'Disponible', 'LI040', 'Alimento para Perros', 'Purina', 3400.00, 10)
INSERT INTO TB_PRODUCTO VALUES (41, 'Disponible', 'LI041', 'Juguete para Gatos', 'KONG', 9900.00, 10)
INSERT INTO TB_PRODUCTO VALUES (42, 'Disponible', 'LI042', 'Atenuador Inalámbrico Caseta', 'Tetra', 4000.00, 10)
INSERT INTO TB_PRODUCTO VALUES (43, 'Disponible', 'LI043', 'Piso Laminado', 'Pergo', 987.00, 11) ----Pisos y Pinturas---
INSERT INTO TB_PRODUCTO VALUES (44, 'Disponible', 'LI044', ' Piso de Vinilo de Lujo', 'Armstrong Flooring', 321.00, 11)
INSERT INTO TB_PRODUCTO VALUES (45, 'Disponible', 'LI045', 'Alfombra', 'Shaw Floors', 765.00, 11)
INSERT INTO TB_PRODUCTO VALUES (46, 'Disponible', 'LI046', 'Pintura Interior', 'Purina', 908.00, 11)
INSERT INTO TB_PRODUCTO VALUES (47, 'Disponible', 'LI047', 'Pintura Interior', 'Behr', 654.00, 11)
INSERT INTO TB_PRODUCTO VALUES (48, 'Disponible', 'LI048', 'Pintura Exterio', 'Benjamin Moore', 408.00, 11)
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
-- Estoy usando LOS PROVEEDORES de la misma marca de TB_PROUCTO:
INSERT INTO TB_PROVEEDORES (id_proveedor, nombre, estado, correo, nombre_contacto, ruc, telefono) VALUES
('LI001', 'Just Home Collection', 'Activo', 'contacto@justhomecollection.com', 'Representante Just Home', '20550235563', '01 555 1234'),
('LI002', 'TuHome', 'Activo', 'servicio@tuhome.com', 'Servicio al Cliente TuHome', '20550325564', '01 555 5678'),
('LI003', 'Bonno', 'Activo', 'info@bonno.com', 'Atención al Cliente Bonno', '20550435565', '01 555 9012'),
('LI004', 'TuHome', 'Activo', 'contacto@tuhome.com', 'Representante TuHome', '20550325564', '01 555 3456'),
('LI005', 'Just Home Collection', 'Activo', 'ventas@justhomecollection.com', 'Ventas Just Home', '20550235563', '01 555 7890'),
('LI006', 'Paraíso', 'Activo', 'postventa@paraiso.com', 'Postventa Paraíso', '20550545566', '01 555 6789'),
('LI007', 'Mabe', 'Activo', 'atencioncliente@mabe.com', 'Atención al Cliente Mabe', '20550655567', '01 555 4321'),
('LI008', 'LG', 'Activo', 'soporte@lg.com', 'Soporte Técnico LG', '20550765568', '01 555 8765'),
('LI009', 'Miray', 'Activo', 'contacto@miray.com', 'Contacto Miray', '20550875569', '01 555 4320'),
('LI010', 'Samsung', 'Activo', 'servicio@samsung.com', 'Servicio al Cliente Samsung', '20550985570', '01 555 8760'),
('LI011', 'HP', 'Activo', 'soporte@hp.com', 'Soporte Técnico HP', '20551095571', '01 555 4329'),
('LI012', 'Xiaomi', 'Activo', 'ventas@xiaomi.com', 'Ventas Xiaomi', '20551105572', '01 555 8769'),
('LI013', 'HOUSE', 'Activo', 'ventas@house.com', 'Ventas HOUSE', '20551109808', '01 555 8732'),
('LI014', 'FERMOB', 'Activo', 'atencion@fermob.com', 'Ventas FERMOB', '20551106754', '01 555 8765'),
('LI015', 'EMU', 'Activo', 'soporte@emu.com', 'Ventas EMU', '20551105532', '01 555 8709'),
('LI016', 'MABE', 'Activo', 'soporte@mabe.com', 'Ventas MABE', '20551107654', '01 555 1121'),
('LI017', 'ROCA', 'Activo', 'atencion@roca.com', 'Ventas ROCA', '20551105009', '01 555 0009'),
('LI018', 'PFISTER', 'Activo', 'cliente@pfister.com', 'Ventas PFISTER', '20551100091', '01 555 0987'),
('LI019', 'Bosch GSH 16-30', 'Activo', 'cliente@bBoschGSH16-30.com', 'Ventas Bosch GSH 16-30', '20551144345', '01 555 0234'),
('LI020', 'DeWalt DW872', 'Activo', 'cliente@deWaltDW872.com', 'Ventas DeWalt DW872', '20551105465', '01 555 0001'),
('LI021', 'Makita HR2475', 'Activo', 'cliente@makitaHR2475.com', 'Ventas Makita HR2475', '205511009822', '01 555 1124'),
('LI022', 'Caterpillar 320D', 'Activo', 'cliente@caterpillar 320D.com', 'Ventas Caterpillar 320D', '20551122123', '01 555 0092'),
('LI023', 'Komatsu D65EX-17', 'Activo', 'cliente@komatsuD65EX-17.com', 'VentasKomatsu D65EX-17', '20551122123', '01 555 0912'),
('LI024', 'Liebherr LTM 1090-4.1', 'Activo', 'cliente@liebherrLTM1090-4.1.com', 'Ventas Liebherr LTM 1090-4.1', '20551234445', '01 555 0934'),
('LI025', 'Clorox', 'Activo', 'atencion@Clorox.com', 'Ventas Clorox', '20551222212', '01 555 5621'),
('LI026', 'Lysol', 'Activo', 'soporte@Lysol.com', 'Ventas Lysol', '20551220098', '01 555 1451'),
('LI027', 'Mr. Clean', 'Activo', 'postventa@Mr. Clean.com', 'Ventas Mr. Clean', '20551222369', '01 555 9098'),
('LI028', 'Scotch-Brite', 'Activo', 'cliente@Scotch-Brite.com', 'Ventas Scotch-Brite', '20551222129', '01 555 0909'),
('LI029', 'Windex', 'Activo', 'ventas@Windex.com', 'Ventas Windex', '20551222176', '01 555 1232'),
('LI030', 'Liebherr LTM 1090-4.1', 'Activo', 'atencion@Pledge.com', 'Ventas Pledge', '28783452341', '01 555 0092'),
('LI031', 'IKEA', 'Activo', 'postventa@iKEA.com', 'Ventas IKEA', '20551220012', '01 555 3421'),
('LI032', 'West Elm', 'Activo', 'soporte@West Elm.com', 'Ventas West Elm', '20541200011', '01 555 6578'),
('LI033', 'Crate & Barrel', 'Activo', 'atencion@crate & Barrel.com', 'Ventas Crate & Barrel', '20541200000', '01 555 0932'),
('LI034', 'Philips Hue', 'Activo', 'venta@philips Hue.com', 'Ventas Philips Hue', '20751221112', '01 555 9854'),
('LI035', 'GE Lighting', 'Activo', 'venta@gE Lighting.com', 'Ventas GE Lighting', '20551222345', '01 555 0021'),
('LI036', 'Lutron', 'Activo', 'cñiente@Lutron.com', 'Ventas Lutron', '20541200123', '01 555 0935'),
('LI037', 'Weber', 'Activo', 'cliente@Weber.com', 'Ventas Weber', '20541222345', '01 555 2222'),
('LI038', 'Husqvarna', 'Activo', 'soporte@Husqvarna.com', 'Ventas Husqvarna', '20523222123', '01 555 1134'),
('LI039', 'Black+Decker', 'Activo', 'posventa@v.com', 'Ventas Black+Decker', '20545621234', '01 555 4352'),
('LI040', 'Purina', 'Activo', 'venta@Purina.com', 'Ventas Purina', '20534222888', '01 555 1123'),
('LI041', 'KONG', 'Activo', 'servicio@KONG.com', 'Ventas KONG', '20541222327', '01 555 0122'),
('LI042', 'Tetra', 'Activo', 'atencion@Tetra.com', 'Ventas Tetra', '20555546789', '01 555 2315'),
('LI043', 'Pergo', 'Activo', 'atencion@Pergo.com', 'Ventas Pergo', '20987654567', '01 555 1232'),
('LI044', 'Armstrong Flooring', 'Activo', 'soporte@Armstrong Flooring.com', 'Ventas Armstrong Flooring', '20555598765', '01 555 2134'),
('LI045', 'Shaw Floors', 'Activo', 'ventas@Shaw Floors.com', 'Ventas Shaw Floors', '20555540432', '01 555 3245'),
('LI046', 'Purina', 'Activo', 'postventa@Purina.com', 'Ventas Purina', '20555544542', '01 555 7876'),
('LI047', 'Behr', 'Activo', 'cliente@Behr.com', 'Ventas Behr', '20555546932', '01 555 3241'),
('LI048', 'Benjamin Moore', 'Activo', 'soporte@Benjamin Moore.com', 'Ventas Benjamin Moore', '20555546123', '01 555 0954');
go
select *from TB_PROVEEDORES


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
select *from TB_ALMACEN

CREATE TABLE TB_COMPRAS ( -- 1.
    id_compra INT PRIMARY KEY,
    cantidad INT,
    fecha_compra DATE,
    id_producto INT,
    id_proveedor CHAR(25),
    id_almacen CHAR(25),
    FOREIGN KEY (id_producto) REFERENCES TB_PRODUCTO(id_producto),
    FOREIGN KEY (id_proveedor) REFERENCES TB_PROVEEDORES(id_proveedor),
    FOREIGN KEY (id_almacen) REFERENCES TB_ALMACEN(id_almacen)
);
INSERT INTO TB_COMPRAS VALUES --> fecha de entreda se gestiona con TB_COMPRAS y decha de salida
(1, 10, '2023-01-01', 1, 'LI001', 'ALM01'),
(2, 20, '2023-01-02', 2, 'LI002', 'ALM01'),
(3, 15, '2023-01-03', 3, 'LI003', 'ALM01'),
(4, 25, '2023-01-04', 4, 'LI004', 'ALM01'),
(5, 30, '2023-01-05', 5, 'LI005', 'ALM01'),
(6, 18, '2023-01-06', 6, 'LI006', 'ALM01'),
(7, 12, '2023-01-07', 7, 'LI007', 'ALM01'),
(8, 22, '2023-01-08', 8, 'LI008', 'ALM01'),
(9, 28, '2023-01-09', 9, 'LI009', 'ALM01'),
(10, 10, '2023-01-10', 10, 'LI010', 'ALM01'),
(11, 15, '2023-01-11', 11, 'LI011', 'ALM01'),
(12, 20, '2023-01-12', 12, 'LI012', 'ALM01'), 
(13, 45, '2023-01-09', 13, 'LI013', 'ALM01'),
(14, 45, '2023-01-10', 14, 'LI014', 'ALM01'),
(15, 89, '2023-01-21', 15, 'LI015', 'ALM01'),
(16, 45, '2023-01-11', 16, 'LI016', 'ALM01'),
(17, 56, '2023-01-23', 17, 'LI017', 'ALM01'),
(18, 76, '2023-01-27', 18, 'LI018', 'ALM01'),
(19, 12, '2023-01-11', 19, 'LI019', 'ALM01'),
(20, 21, '2023-01-01', 20, 'LI020', 'ALM01'),
(21, 16, '2023-01-04', 21, 'LI021', 'ALM01'),
(22, 20, '2023-01-06', 22, 'LI022', 'ALM01'),
(23, 24, '2023-01-09', 23, 'LI023', 'ALM01'),
(24, 21, '2023-01-02', 24, 'LI024', 'ALM01'),
(25, 53, '2023-01-19', 25, 'LI025', 'ALM01'),
(26, 78, '2023-01-10', 26, 'LI026', 'ALM01'),
(27, 21, '2023-01-21', 27, 'LI027', 'ALM01'),
(28, 11, '2023-01-11', 28, 'LI028', 'ALM01'),
(29, 10, '2023-01-23', 29, 'LI029', 'ALM01'),
(30, 90, '2023-01-27', 30, 'LI030', 'ALM01'),
(31, 34, '2023-01-11', 31, 'LI031', 'ALM01'),
(32, 67, '2023-01-01', 32, 'LI032', 'ALM01'),
(33, 44, '2023-01-04', 33, 'LI033', 'ALM01'),
(34, 43, '2023-01-06', 34, 'LI034', 'ALM01'),
(35, 22, '2023-01-09', 35, 'LI035', 'ALM01'),
(36, 29, '2023-01-02', 36, 'LI036', 'ALM01'),
(37, 59, '2023-01-19', 37, 'LI037', 'ALM01'),
(38, 78, '2023-02-21', 38, 'LI038', 'ALM01'),
(39, 21, '2023-02-09', 39, 'LI039', 'ALM01'),
(40, 11, '2023-02-05', 40, 'LI040', 'ALM01'),
(41, 10, '2023-02-01', 41, 'LI041', 'ALM01'),
(42, 90, '2023-02-28', 42, 'LI042', 'ALM01'),
(43, 34, '2023-02-14', 43, 'LI043', 'ALM01'),
(44, 67, '2023-02-16', 44, 'LI044', 'ALM01'),
(45, 44, '2023-02-19', 45, 'LI045', 'ALM01'),
(46, 43, '2023-01-29', 46, 'LI046', 'ALM01'),
(47, 22, '2023-01-01', 47, 'LI047', 'ALM01'),
(48, 29, '2023-02-02', 48, 'LI048', 'ALM01');
go
select * from TB_COMPRAS;

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

/* ---------------------------------------------------------------- 
1. FECHA DE SALIDA: 
	debe de ir relacionado con la TB_COMPRAS, para estabablecer una fecha de salida.
	_ Tamien en la tabla de TB_TIPO_ENTREGA esta el rango que se va demorar en la entrega del producto.
*/ ----------------------------------------------------------------

CREATE TABLE TB_INVENTARIO ( -- 2.
    id_inventario INT PRIMARY KEY,  ---> IMPORTANTE REGISTRAR EL PEDIDO DE SALIDA DEL PRODUCTO CON EL PEDIDO DEL CLIENTE <---
    cantidad DECIMAL(38,2),
    fecha_entrada DATE, 
    fecha_salida DATE, -- se gestiona con la fecha de llegada de fecha_salida de la tabla TB_PEDIDO.
    id_producto INT,
    id_almacen CHAR(25),
	id_compra INT,
    FOREIGN KEY (id_producto) REFERENCES TB_PRODUCTO(id_producto),
    FOREIGN KEY (id_almacen) REFERENCES TB_ALMACEN(id_almacen),
	FOREIGN KEY (id_compra) REFERENCES TB_COMPRAS(id_compra)
);
INSERT INTO TB_INVENTARIO (id_inventario, cantidad, fecha_entrada, fecha_salida, id_producto, id_almacen, id_compra) VALUES
(1, 1000.00, '2023-01-01', '2023-06-12', 1, 'ALM01', 1),
(2, 2000.00, '2023-01-02', '2023-06-12', 2, 'ALM01', 2),
(3, 1500.00, '2023-01-03', '2023-06-12', 3, 'ALM01', 3),
(4, 2500.00, '2023-01-04', '2023-06-07', 4, 'ALM01', 4), 
(5, 3000.00, '2023-01-05', '2023-06-07', 5, 'ALM01', 5), 
(6, 1800.00, '2023-01-06', '2023-06-07', 6, 'ALM01', 6), 
(7, 1200.00, '2023-01-07', '2023-06-04', 7, 'ALM01', 7),
(8, 2200.00, '2023-01-08', '2023-06-04', 8, 'ALM01', 8),
(9, 2800.00, '2023-01-09', '2023-06-04', 9, 'ALM01', 9),
(10, 1000.00, '2023-01-10', '2023-10-02', 10, 'ALM01', 10),
(11, 1500.00, '2023-01-11', '2023-10-02', 11, 'ALM01', 11), 
(12, 2000.00, '2023-01-12', '2023-10-02', 12, 'ALM01', 12),
(13, 950.00, '2023-01-09', '2023-10-20', 13, 'ALM01', 13),
(14, 950.00, '2023-01-10', '2023-10-20', 14, 'ALM01', 14),
(15, 890.00, '2023-01-21', '2023-10-20', 15, 'ALM01', 15),
(16, 950.00, '2023-01-11', '2023-11-24', 16, 'ALM01', 16),
(17, 960.00, '2023-01-23', '2023-11-24', 17, 'ALM01', 17),
(18, 760.00, '2023-01-27', '2023-11-24', 18, 'ALM01', 18),
(19, 920.00, '2023-01-11', '2023-12-14', 19, 'ALM01', 19),
(20, 910.00, '2023-01-01', '2023-12-14', 20, 'ALM01', 20),
(21, 960.00, '2023-01-04', '2023-12-14', 21, 'ALM01', 21),
(22, 900.00, '2023-01-06', '2023-05-18', 22, 'ALM01', 22),
(23, 940.00, '2023-01-09', '2023-05-18', 23, 'ALM01', 23),
(24, 910.00, '2023-01-02', '2023-05-18', 24, 'ALM01', 24),
(25, 930.00, '2023-01-19', '2023-04-20', 25, 'ALM01', 25),
(26, 980.00, '2023-01-10', '2023-04-20', 26, 'ALM01', 26),
(27, 910.00, '2023-01-21', '2023-04-20', 27, 'ALM01', 27),
(28, 910.00, '2023-01-11', '2023-03-22', 28, 'ALM01', 28),
(29, 900.00, '2023-01-23', '2023-03-22', 29, 'ALM01', 29),
(30, 900.00, '2023-01-27', '2023-03-22', 30, 'ALM01', 30),
(31, 940.00, '2023-01-11', '2023-04-30', 31, 'ALM01', 31),
(32, 970.00, '2023-01-01', '2023-04-30', 32, 'ALM01', 32),
(33, 940.00, '2023-01-04', '2023-04-30', 33, 'ALM01', 33),
(34, 930.00, '2023-01-06', '2023-05-07', 34, 'ALM01', 34),
(35, 920.00, '2023-01-09', '2023-05-07', 35, 'ALM01', 35),
(36, 990.00, '2023-01-02', '2023-05-07', 36, 'ALM01', 36),
(37, 990.00, '2023-01-19', '2023-06-17', 37, 'ALM01', 37),
(38, 980.00, '2023-02-21', '2023-06-17', 38, 'ALM01', 38),
(39, 910.00, '2023-02-09', '2023-06-17', 39, 'ALM01', 39),
(40, 1100.00, '2023-02-05', '2023-07-25', 40, 'ALM01', 40),
(41, 1000.00, '2023-02-01', '2023-07-25', 41, 'ALM01', 41),
(42, 9000.00, '2023-02-28', '2023-08-16', 42, 'ALM01', 42),
(43, 3400.00, '2023-02-14', '2023-08-16', 43, 'ALM01', 43),
(44, 1070.00, '2023-02-16', '2023-09-27', 44, 'ALM01', 44),
(45, 3000.00, '2023-02-19', '2023-10-30', 45, 'ALM01', 45),
(46, 4030.00, '2023-01-29', '2023-11-29', 46, 'ALM01', 46),
(47, 2200.00, '2023-01-01', '2023-12-25', 47, 'ALM01', 47),
(48, 2900.00, '2023-02-02', '2023-07-11', 48, 'ALM01', 48);
select * from TB_INVENTARIO
go

-------------------------------------------------------------------------------------

-- Eliminar el trigger anterior si existe:
-- DROP TRIGGER IF EXISTS trg_update_inventario;

CREATE TABLE TB_detallePEDIDO(  
    id_detallePedido INT PRIMARY KEY,
    cantidad_objetiva DECIMAL(38,2),
    total_detalle FLOAT,
    id_pedido INT,
    id_producto INT,
    FOREIGN KEY (id_pedido) REFERENCES TB_PEDIDO(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES TB_PRODUCTO(id_producto)
);
select * from TB_detallePEDIDO
go

----------------------------------------------------------
-- Para actualizar automaticamente LA TABLA TB_INVENTARIO.
----------------------------------------------------------
CREATE TRIGGER trg_update_inventario 
ON TB_detallePEDIDO
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Actualizar la fecha_salida y disminuir la cantidad en TB_INVENTARIO
    UPDATE inv
    SET inv.fecha_salida = ped.fecha_entrega,
        inv.cantidad = inv.cantidad - det.cantidad_objetiva
    FROM TB_INVENTARIO inv
    INNER JOIN inserted det ON inv.id_producto = det.id_producto
    INNER JOIN TB_PEDIDO ped ON det.id_pedido = ped.id_pedido
    WHERE inv.cantidad >= det.cantidad_objetiva
      AND inv.id_inventario = (SELECT TOP 1 i.id_inventario
                               FROM TB_INVENTARIO i
                               WHERE i.id_producto = inv.id_producto
                                 AND i.cantidad >= det.cantidad_objetiva
                               ORDER BY i.fecha_entrada DESC);

    -- Validar si la cantidad no puede ser negativa
    IF (SELECT COUNT(*)
        FROM TB_INVENTARIO
        WHERE cantidad < 0) > 0
    BEGIN
        RAISERROR('La cantidad en inventario no puede ser negativa.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
----------------------------------------------------------


INSERT INTO TB_detallePEDIDO  VALUES (1, 1, 699.90, 1, 1) -- 2023-06-12
INSERT INTO TB_detallePEDIDO  VALUES (2, 2, 538.00, 2, 2)
INSERT INTO TB_detallePEDIDO  VALUES (3, 1, 1799.00, 3, 3)
INSERT INTO TB_detallePEDIDO  VALUES (4, 1, 1299.90, 4, 4) -- 2023-06-07
INSERT INTO TB_detallePEDIDO  VALUES (5, 1, 599.00, 5, 5)
INSERT INTO TB_detallePEDIDO  VALUES (6, 1, 899.00, 6, 6)
INSERT INTO TB_detallePEDIDO  VALUES (7, 1, 1399.00, 7, 7) -- 2023-06-04
INSERT INTO TB_detallePEDIDO  VALUES (8, 1, 987.00, 8, 43)
INSERT INTO TB_detallePEDIDO  VALUES (9, 1, 987.00, 9, 43)
INSERT INTO TB_detallePEDIDO  VALUES (10, 1, 987.00, 10, 43) -- 2023-10-02
INSERT INTO TB_detallePEDIDO  VALUES (11, 1, 987.00, 11, 43)
INSERT INTO TB_detallePEDIDO  VALUES (12, 1, 987.00, 12, 43)
INSERT INTO TB_detallePEDIDO  VALUES (13, 1, 987.00, 13, 43) -- 2023-10-20
INSERT INTO TB_detallePEDIDO  VALUES (14, 1, 987.00, 14, 43)
INSERT INTO TB_detallePEDIDO  VALUES (15, 1, 987.00, 15, 43)
INSERT INTO TB_detallePEDIDO  VALUES (16, 1, 111.00, 16, 32) -- 2023-11-24
INSERT INTO TB_detallePEDIDO  VALUES (17, 1, 321.00, 17, 33)
INSERT INTO TB_detallePEDIDO  VALUES (18, 1, 965.00, 18, 18)
INSERT INTO TB_detallePEDIDO  VALUES (19, 1, 5000.00, 19, 19) -- 2023-12-14
INSERT INTO TB_detallePEDIDO  VALUES (20, 1, 3000.00, 20, 20)

select * from TB_detallePEDIDO

select * from TB_INVENTARIO
go

--------------------------------------------
-- Trigger para insertar automáticamente en TB_SATISFACCION_CLIENTE
--------------------------------------------
-- Eliminar el trigger anterior si existe:
--DROP TRIGGER IF EXISTS trg_InsertarSatisfaccion;
--go


-- Trigger para insertar automáticamente en TB_SATISFACCION_CLIENTE
CREATE TRIGGER trg_InsertarSatisfaccion
ON TB_PEDIDO
AFTER INSERT
AS
BEGIN
    DECLARE @id_pedido INT, @estado VARCHAR(12), @id_cliente INT, @fecha_pedido DATE;

    -- Recorrer los registros insertados en TB_PEDIDO
    DECLARE cur CURSOR FOR
    SELECT id_pedido, estado, id_clientes, fecha_pedido
    FROM inserted;

    OPEN cur;
    FETCH NEXT FROM cur INTO @id_pedido, @estado, @id_cliente, @fecha_pedido;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Verificar si el estado del pedido es 'Retrasado'
        IF @estado = 'Retrasado'
        BEGIN
            -- Verificar si ya existe una satisfacción registrada para este pedido
            IF NOT EXISTS (SELECT 1 FROM TB_SATISFACCION_CLIENTE WHERE id_pedido = @id_pedido)
            BEGIN
                -- Insertar en TB_SATISFACCION_CLIENTE
                INSERT INTO TB_SATISFACCION_CLIENTE (id_cliente, id_pedido, calificacion, fecha)
                VALUES (@id_cliente, @id_pedido, 1, DATEADD(DAY, 2, @fecha_pedido));
            END
        END

        FETCH NEXT FROM cur INTO @id_pedido, @estado, @id_cliente, @fecha_pedido;
    END

    CLOSE cur;
    DEALLOCATE cur;
END;
GO


select * from TB_SATISFACCION_CLIENTE

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------

/* -----------------------------------------------------------------------------------------------
-- Insertar 30 pedidos desde marzo hasta julio:
crear 30 pedidos entre marzo y julio, con un 15% de retrasos en la fecha de entrega, y asegurarnos 
de que las ubicaciones corresponden a los 43 distritos de Lima, podemos usar una combinación de 
inserciones directas y cálculos de fechas en SQL Server.
*/ -----------------------------------------------------------------------------------------------

-- Insertar pedidos y sus detalles - y con retraso automatico:
DECLARE @i INT = 501 -- INICIO
DECLARE @fecha DATE
DECLARE @dias_entrega INT
DECLARE @retraso INT
DECLARE @id_producto INT
DECLARE @precio DECIMAL(38,2)

WHILE @i <= 600 -- FINAL
BEGIN
    -- Seleccionar un producto aleatorio
    SELECT TOP 1 @id_producto = id_producto, @precio = precio FROM TB_PRODUCTO ORDER BY NEWID()

    -- Seleccionar un tipo de entrega aleatorio entre 2 y 3
    SELECT TOP 1 @dias_entrega = dias FROM TB_TIPO_ENTREGA WHERE id_tipoEntrega IN (2, 3) ORDER BY NEWID()

    -- Calcular fecha de pedido aleatoria entre 1 de marzo y 31 de julio de 2023
    SET @fecha = DATEADD(DAY, ABS(CHECKSUM(NEWID())) % 153, '2023-03-01') -- 153 días de diferencia entre 1 de marzo y 31 de julio

    -- Calcular retraso de 2 y 3 días
    SET @retraso = CASE WHEN @i % 6 = 0 THEN (ABS(CHECKSUM(NEWID())) % 3) + 2 ELSE 0 END

    -- Calcular días de entrega incluyendo el retraso
    SET @dias_entrega = @dias_entrega + @retraso

    -- Insertar en TB_PEDIDO
    INSERT INTO TB_PEDIDO (id_pedido, estado, fecha_pedido, fecha_entrega, total_pedido, id_clientes, id_comprobante, id_empleado, id_tipoEntrega, id_ubicacion)
    VALUES (
        @i,
        CASE WHEN @retraso > 0 THEN 'Retrasado' ELSE 'En Proceso' END,
        @fecha,
        DATEADD(DAY, @dias_entrega, @fecha),
        @precio,
        ABS(CHECKSUM(NEWID())) % 70 + 1, -- id_clientes aleatorio entre 1 y 70
        ABS(CHECKSUM(NEWID())) % 3 + 1, -- id_comprobante aleatorio entre 1 y 3
        'EM' + RIGHT('00' + CAST(ABS(CHECKSUM(NEWID())) % 20 + 1 AS VARCHAR), 2), -- id_empleado aleatorio
        CASE WHEN ABS(CHECKSUM(NEWID())) % 2 = 0 THEN 2 ELSE 3 END, -- id_tipoEntrega aleatorio entre 2 y 3
        ABS(CHECKSUM(NEWID())) % 43 + 1 -- id_ubicacion aleatorio entre 1 y 43
    )

    -- Insertar en TB_detallePEDIDO
	INSERT INTO TB_detallePEDIDO (id_detallePedido, id_pedido, id_producto, cantidad_objetiva, total_detalle)
	VALUES (
		@i,
		1, -- id_pedido (cambia según tu lógica)
		@id_producto,
		1, -- cantidad_objetiva (cambia según tu lógica)
		@precio -- total_detalle
	)


    SET @i = @i + 1
END
GO


-- Verificar los datos insertados
SELECT * FROM TB_PEDIDO;
GO

select * from TB_SATISFACCION_CLIENTE
GO

-- Verificando si se descuenta el inventario (obvio q si)
select * from TB_INVENTARIO
go


--------------------------------------------
-- Consulta para obtener todos los productos con retraso de exactamente 2 o 3 días:
--------------------------------------------

WITH PedidosRetrasados AS (
    SELECT 
        TB_PEDIDO.id_pedido,
        TB_PEDIDO.fecha_pedido,
        TB_PEDIDO.fecha_entrega,
        TB_PEDIDO.id_tipoEntrega,
        DATEDIFF(DAY, DATEADD(DAY, TB_TIPO_ENTREGA.dias, TB_PEDIDO.fecha_pedido), TB_PEDIDO.fecha_entrega) AS dias_retraso
    FROM 
        TB_PEDIDO
    JOIN
        TB_TIPO_ENTREGA ON TB_PEDIDO.id_tipoEntrega = TB_TIPO_ENTREGA.id_tipoEntrega
    WHERE 
        DATEDIFF(DAY, DATEADD(DAY, TB_TIPO_ENTREGA.dias, TB_PEDIDO.fecha_pedido), TB_PEDIDO.fecha_entrega) IN (2, 3)
        AND TB_PEDIDO.estado = 'Retrasado'
)
SELECT 
    PedidosRetrasados.id_pedido,
    TB_PEDIDO.fecha_pedido,
    TB_PEDIDO.fecha_entrega,
    TB_PRODUCTO.nombre AS nombre_producto,
    TB_detallePEDIDO.total_detalle,
    TB_detallePEDIDO.cantidad_objetiva,
    PedidosRetrasados.dias_retraso,
    PedidosRetrasados.id_tipoEntrega
FROM 
    PedidosRetrasados
JOIN 
    TB_detallePEDIDO ON PedidosRetrasados.id_pedido = TB_detallePEDIDO.id_pedido
JOIN 
    TB_PRODUCTO ON TB_detallePEDIDO.id_producto = TB_PRODUCTO.id_producto
JOIN
    TB_PEDIDO ON PedidosRetrasados.id_pedido = TB_PEDIDO.id_pedido
ORDER BY 
    PedidosRetrasados.dias_retraso DESC;

--------------------------------------------
-- Consulta para obtener el 15% de los pedidos retrasados y calcular los días de retraso
--------------------------------------------
WITH PedidosRetrasados AS (
    SELECT 
        id_pedido,
        fecha_pedido,
        fecha_entrega,
        DATEDIFF(DAY, fecha_pedido, fecha_entrega) - dias AS dias_retraso
    FROM 
        TB_PEDIDO
    JOIN 
        TB_TIPO_ENTREGA ON TB_PEDIDO.id_tipoEntrega = TB_TIPO_ENTREGA.id_tipoEntrega
    WHERE 
        estado = 'Retrasado'
),
TotalPedidos AS (
    SELECT COUNT(*) AS total FROM PedidosRetrasados
),
TopRetrasados AS (
    SELECT 
        id_pedido,
        fecha_pedido,
        fecha_entrega,
        dias_retraso,
        ROW_NUMBER() OVER (ORDER BY dias_retraso DESC) AS row_num
    FROM 
        PedidosRetrasados
)
SELECT 
    id_pedido,
    fecha_pedido,
    fecha_entrega,
    dias_retraso
FROM 
    TopRetrasados
WHERE 
    row_num <= (SELECT CEILING(0.15 * total) FROM TotalPedidos);
GO

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------

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
go


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

