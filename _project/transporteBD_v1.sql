
CREATE DATABASE transporte_BD;
go

USE transporte_BD;
go

CREATE TABLE TB_NIVELES (
    id_nivel INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(20)
)

CREATE TABLE TB_MARCA ( 
    id_marca INT NOT NULL PRIMARY KEY,
    descripcion VARCHAR(90),
    estado VARCHAR(12)
)

CREATE TABLE TB_MODELO ( 
    id_modelo INT NOT NULL PRIMARY KEY,
    descripcion VARCHAR(90),
    estado VARCHAR(12)
)

CREATE TABLE TB_UNIDAD ( 
    id_unidad INT NOT NULL PRIMARY KEY,
    idMarca INT,
    idModelo INT,
	descripcion VARCHAR(100),
    placa VARCHAR(15),
    numero_asientos INT,
	estado VARCHAR(15),
    FOREIGN KEY (idMarca) REFERENCES TB_MARCA(id_marca),
    FOREIGN KEY (idModelo) REFERENCES TB_MODELO(id_modelo)
)

CREATE TABLE TB_ASIENTO ( 
    id_asiento INT NOT NULL PRIMARY KEY,
	idUnidad INT,
    idNivel INT,
	numero_asiento INT,
	estado VARCHAR(12),
    FOREIGN KEY (idUnidad) REFERENCES TB_UNIDAD(id_unidad),
	FOREIGN KEY (idNivel) REFERENCES TB_NIVELES(id_nivel)
)

------------------------------------------------------------------

CREATE TABLE TB_ORIGEN (
    id_origen INT NOT NULL PRIMARY KEY, -- ya
    ciudad VARCHAR(100) not null,
    estado VARCHAR(12) not null
)

--
CREATE TABLE TB_DESTINOS (
    id_destino INT NOT NULL PRIMARY KEY, -- ya
    ciudad VARCHAR(100) not null,
    estado VARCHAR(12) not null
)

CREATE TABLE TB_CLIENTE ( -- ya
	id_cliente INT PRIMARY KEY,
	tipo_documento VARCHAR(15) not null,
	dni VARCHAR(15) not null,
	nombre VARCHAR(50) not null,
	apellido VARCHAR(50) not null,
	fecha_nacimiento DATE not null,
	ruc CHAR(11),
	razon_social VARCHAR(100),
	sexo CHAR(1),
	celular VARCHAR(30),
	direccion VARCHAR(100),
	estado VARCHAR(12)
)

CREATE TABLE TB_PERMISOS ( -- ya ---------------
	id_permiso INT PRIMARY KEY,
	permiso VARCHAR(100),
	clave VARCHAR(50)
)

----------------- FOREN

CREATE TABLE TB_PROGRAMACION ( -- ya
    id_programacion INT NOT NULL PRIMARY KEY, 
    idOrigen INT not null,
    idDestino INT not null,
	idUnidad INT not null,
	fecha DATE not null,  
	hora TIME not null,
	costo DECIMAL(10,2),
	estado VARCHAR(12),
	FOREIGN KEY (idOrigen) REFERENCES TB_ORIGEN(id_origen),
	FOREIGN KEY (idDestino) REFERENCES TB_DESTINOS(id_destino),
	FOREIGN KEY (idUnidad) REFERENCES TB_UNIDAD(id_unidad)
)

CREATE TABLE TB_RESERVA ( -- ya
    id_reserva INT PRIMARY KEY,
    idCliente INT,
    nro_reserva VARCHAR(8),
	fecha_reserva DATE,
	hora_reserva TIME,
	estado VARCHAR(15),
	FOREIGN KEY (idCliente) REFERENCES TB_CLIENTE(id_cliente)
)

CREATE TABLE TB_PRECIOS ( -- ya
    id_precio INT NOT NULL PRIMARY KEY,
    origen INT not null,
    destino INT not null,
    fecha DATE,
    precio DECIMAL(10,2),
    estado VARCHAR(12),
    FOREIGN KEY (origen) REFERENCES TB_ORIGEN(id_origen),
    FOREIGN KEY (destino) REFERENCES TB_DESTINOS(id_destino)
)

CREATE TABLE TB_CROQUIS_PROGRAMACION ( -- ya
    id_asiento_prog INT NOT NULL PRIMARY KEY,
    idProgramacion INT not null,
    idAsiento INT not null,
	estado VARCHAR(12),
	FOREIGN KEY (idProgramacion) REFERENCES TB_PROGRAMACION(id_programacion),
	FOREIGN KEY (idAsiento) REFERENCES TB_ASIENTO(id_asiento),
)

CREATE TABLE TB_DETALLE_RESERVA ( -- CAMBIE
    id_detalle_reserva BIGINT PRIMARY KEY,
    idReserva INT,
    idAsiento INT,
    nmr_documento VARCHAR(10),
    nombres VARCHAR(45),
	estado VARCHAR(12),
    FOREIGN KEY (idReserva) REFERENCES TB_RESERVA(id_reserva),
    FOREIGN KEY (idAsiento) REFERENCES TB_ASIENTO(id_asiento)
)

CREATE TABLE TB_CARGOS ( -- ya
    id_cargo INT NOT NULL PRIMARY KEY,
    descripcion VARCHAR(30),
	estado VARCHAR(12)
)

CREATE TABLE TB_PERSONAL ( -- ya
    id_personal INT PRIMARY KEY,
    idCargo INT,
	dni VARCHAR(15) not null,
	nombre VARCHAR(50) not null,
	apellido VARCHAR(50) not null,
	direccion VARCHAR(100),
	celular VARCHAR(30),
	email VARCHAR(30),
	estado VARCHAR(12)
	FOREIGN KEY (idCargo) REFERENCES TB_CARGOS(id_cargo)
)

CREATE TABLE TB_TRIPULACION ( -- ya
    id_tripulacion INT PRIMARY KEY,
    idPersonal INT,
	idProgramacion INT,
	FOREIGN KEY (idPersonal) REFERENCES TB_PERSONAL(id_personal),
	FOREIGN KEY (idProgramacion) REFERENCES TB_PROGRAMACION(id_programacion)
)

------------------------------------------------------------------

CREATE TABLE TB_PERMISOS_CARGO ( -- ya
    id_permisososCargo INT PRIMARY KEY,
	idCargo int,
    idPermiso int,
	valor TINYINT,
	FOREIGN KEY (idCargo) REFERENCES TB_CARGOS(id_cargo),
	FOREIGN KEY (idPermiso) REFERENCES TB_PERMISOS(id_permiso)
)

CREATE TABLE TB_USUARIOS ( -- ya
	id_user INT PRIMARY KEY,
	idPersonal int,
	usuario VARCHAR(30),
	clave VARCHAR(70),
	fecha DATETIME,
	estado VARCHAR(12),
	FOREIGN KEY (idPersonal) REFERENCES TB_PERSONAL(id_personal)
)

CREATE TABLE TB_PERMISOS_USUARIO (  -- ya
	id_permisoUsuario INT PRIMARY KEY,
	idUser int,
	idPermiso int,
	FOREIGN KEY (idUser) REFERENCES TB_USUARIOS(id_user),
	FOREIGN KEY (idPermiso) REFERENCES TB_PERMISOS(id_permiso)
)


CREATE TABLE TB_BOLETOS( -- ya
	id_boletos INT,
	idCliente INT,
	idAsientos_prog INT,
	idUser INT,
	idDestino INT,
	fecha_registro DATETIME,
	fecha_viaje DATE,
	fecha_expedicion DATE,
	Hora_partida TIME,
	tipo_comprobante VARCHAR(15),
	serie VARCHAR(4),
	correlativo VARCHAR(8),
	moneda VARCHAR(6),
	cantidad INT,
	precio DECIMAL(10,2),
	importe DECIMAL(10,2),
	documento_referencia VARCHAR(8),
	estado VARCHAR(12),
	FOREIGN KEY (idCliente) REFERENCES TB_CLIENTE(id_cliente),
	FOREIGN KEY (idAsientos_prog) REFERENCES TB_CROQUIS_PROGRAMACION(id_asiento_prog),
	FOREIGN KEY (idUser) REFERENCES TB_USUARIOS(id_user),
	FOREIGN KEY (idDestino) REFERENCES TB_DESTINOS(id_destino)
)

------------------------------------------------------------------


CREATE TABLE TB_PAGOS_PAYPAL ( -- ya
	id_pago INT,
	fecha_pago DATETIME,
	dni VARCHAR(15),
	nombres VARCHAR(100),
	correo VARCHAR(100),
	documento_referencia VARCHAR(15),
	txn_id VARCHAR(100),
	moneda VARCHAR(5),
	numero_items INT,
	importe DECIMAL(10,2),
	estado VARCHAR(20),
)




