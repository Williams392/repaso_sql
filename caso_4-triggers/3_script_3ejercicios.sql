/* 
PREGUNTA 1:

_ Cree un trigger que permita auditar los cambios (UPDATE) del sueldo de la tabla 
TB_VENDEDOR, para ello cree la tabla ADITA_SUELDOS que permita guardar:

El tipo de modificación (UPDATE SUELDO)
La fecha de modificación
El HOSTNAME que realizó la operación
El nombre del usuario de sistema operativo
El COD_VEN que se le aplicó el cambio
El sueldo (SUELDO_VEN) antes del cambio
El sueldo (SUELDO_VEN) después del cambio

*/

use VENTASUPN
go

CREATE TABLE TB_VENDEDOR(
COD_VEN CHAR(3)NOT NULL PRIMARY KEY ,
NOM_VEN VARCHAR(20)NOT NULL,
APE_VEN VARCHAR(20)NOT NULL,
SUELDO_VEN MONEY NOT NULL,
FEC_ING DATE NOT NULL, 
TIP_VEN VARCHAR(10)NOT NULL,
COD_DIS CHAR(5)NOT NULL REFERENCES TB_DISTRITO
)
go

select * from TB_VENDEDOR

INSERT INTO TB_VENDEDOR VALUES('V01','JUANA','ALVA',1000,'07/12/2003','1','D08')
INSERT INTO TB_VENDEDOR VALUES('V02','JUAN','SOTO',1200,'10/03/2002','2','D03')
go

-----------------------------------------------------------------------------------

-- opcion 1:

-- Primero, creamos la tabla de auditoría para guardar los cambios de sueldos

CREATE TABLE AUDITA_SUELDOS (
	ID_AUDITA INT IDENTITY(1,1) PRIMARY KEY,
    TIPO_MODIF VARCHAR(20) NOT NULL,
    FECHA_MODIF DATETIME NOT NULL,
    HOSTNAME VARCHAR(255) NOT NULL,
    USUARIO_SO VARCHAR(255) NOT NULL,
    COD_VEN CHAR(3) NOT NULL,
    SUELDO_VEN_ANTES MONEY NOT NULL,
    SUELDO_VEN_DESPUES MONEY NOT NULL
)
go


-- Ahora, creamos el trigger para auditar los cambios en la tabla TB_VENDEDOR
create trigger TRG_AUDITAR_SUELDO
on TB_VENDEDOR
for UPDATE
As
BEGIN
    -- Variables para almacenar los datos antes y después del cambio
    declare @cod_ven CHAR(3), @sueldo_antes MONEY, @sueldo_despues MONEY, @hostname VARCHAR(255), @usuario_os VARCHAR(255)

    -- Seleccionamos el código del vendedor y el sueldo antes del cambio
    select @cod_ven = i.COD_VEN, @sueldo_antes = d.SUELDO_VEN
    from deleted d
    INNER JOIN inserted i ON d.COD_VEN = i.COD_VEN

    -- Seleccionamos el sueldo después del cambio
    select @sueldo_despues = SUELDO_VEN FROM inserted

    -- Obtenemos el HOSTNAME y el nombre del usuario del sistema operativo
    select @hostname = HOST_NAME(), @usuario_os = SUSER_SNAME()

    -- Insertamos los datos en la tabla de auditoría
    insert into AUDITA_SUELDOS (TIPO_MODIF, FECHA_MODIF, HOSTNAME, USUARIO_SO, 
								COD_VEN, SUELDO_VEN_ANTES, SUELDO_VEN_DESPUES)

    values ('UPDATE SUELDO', GETDATE(), @hostname, @usuario_os, @cod_ven, @sueldo_antes, @sueldo_despues)
END
go

-- probando:
UPDATE TB_VENDEDOR
SET SUELDO_VEN = 1200
WHERE COD_VEN = 'V01';
go

select * from AUDITA_SUELDOS;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

						-- Deshabilitar el trigger
						DISABLE TRIGGER TRG_AUDITAR_SUELDO ON TB_VENDEDOR;
						go

						-- Habilitar el trigger
						ENABLE TRIGGER TRG_AUDITAR_SUELDO ON TB_VENDEDOR;
						go

						-- Eliminar el trigger
						DROP TRIGGER trg_ActualizarStock;
						go

						--------------------------
						-- Eliminar tabla:
						DROP TABLE AUDITA_SUELDOS;
						GO
						--------------------------

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- PREGUNTA 2:

/* 
Como política de la empresa se tiene que a los VNEDEDORES solo se les puede incrementar 
máximo el 40% de su sueldo actual. Para cumplir con esta regla, cree un trigger que permita 
validar si el nuevo sueldo supera el 40% del sueldo antiguo, en caso supere debe evitarse 
continuar con la operación. Use RAISERROR de severidad 10.

-- YO:
. En estos casos hay que tener cuidado con controla incrementos sucesivos.

*/

create trigger TRG_VALIDAR_INCREMENTO_SUELDO
on TB_VENDEDOR
for UPDATE
As
BEGIN
    -- Variables para almacenar los datos antes y después del cambio
    DECLARE @cod_ven CHAR(3), @sueldo_antes MONEY, @sueldo_despues MONEY, @porcentaje_maximo MONEY

    -- Seleccionamos el código del vendedor y el sueldo antes del cambio
    select @cod_ven = i.COD_VEN, @sueldo_antes = d.SUELDO_VEN
    from deleted d
    INNER JOIN inserted i ON d.COD_VEN = i.COD_VEN

    -- Seleccionamos el sueldo después del cambio
    select @sueldo_despues = SUELDO_VEN from inserted

    -- Calculamos el 40% del sueldo actual
    --SET @porcentaje_maximo = @sueldo_antes * 0.4
	set @porcentaje_maximo = @sueldo_antes + (@sueldo_antes * 0.4)


    -- Verificamos si el nuevo sueldo supera el 40% del sueldo actual
    if @sueldo_despues > @porcentaje_maximo
    BEGIN
        -- Generamos un mensaje de error con RAISERROR
        RAISERROR('El nuevo sueldo supera el 40%% de incremento permitido para el vendedor con codigo %s.', 10, 1, @cod_ven)
        
        -- Evitamos continuar con la operación de actualización
        ROLLBACK  TRANSACTION
        return 
    END
END
go

-- INSERT INTO TB_VENDEDOR VALUES('V02','JUAN','SOTO',1200,'10/03/2002','2','D03')

UPDATE TB_VENDEDOR
SET SUELDO_VEN = 2000
WHERE COD_VEN = 'V02';
go

-- IMPORTANTE: --
DISABLE TRIGGER TRG_VALIDAR_INCREMENTO_SUELDO ON TB_VENDEDOR; -- Desabilitar el trigger
go
ENABLE TRIGGER TRG_VALIDAR_INCREMENTO_SUELDO ON TB_VENDEDOR; -- Habilitar el trigger
go

---- test:

-- probando (pero hay un error se debe de tomar el sueldo original o EL SUELDO DESPUES para que no suba cada rato):

INSERT INTO TB_VENDEDOR VALUES('V02','JUAN','SOTO',1200,'10/03/2002','2','D03')

UPDATE TB_VENDEDOR
SET SUELDO_VEN = 1200
WHERE COD_VEN = 'V02';
go

UPDATE TB_VENDEDOR
SET SUELDO_VEN = 2000
WHERE COD_VEN = 'V02';
go

UPDATE TB_VENDEDOR
SET SUELDO_VEN = 3300
WHERE COD_VEN = 'V02';
go

select * from AUDITA_SUELDOS

-------------------------------------------------------------------------------------------------------------------

-- PREGUNTA 3:

/* 
Cree un trigger que cuando se inserte, actualice o elimine el campo CANT_VEN de la tabla 
TB_DETALLE_FACTURA, permita actualizar el stock de los PRODUCTOS (STK_ACT) de acuerdo 
con las cantidades que se modifiquen.
*/

use VENTASUPN
go

CREATE TABLE  TB_PRODUCTO(
	COD_PRO CHAR(5)NOT NULL PRIMARY KEY,
	DES_PRO  VARCHAR(50)NOT NULL,
	PRE_PRO MONEY NOT NULL,
	STK_ACT INT NOT NULL,
	STK_MIN INT NOT NULL,
	UNI_MED VARCHAR(30)NOT NULL,
	LIN_PRO VARCHAR(30)NOT NULL,
	IMPORTADO VARCHAR(10)NOT NULL
)

INSERT INTO  TB_PRODUCTO VALUES('P001','Papel Bond A-4',35.0, 200,1500,'Mll','2','V')
INSERT INTO  TB_PRODUCTO VALUES('P002','Papel Bond Oficio ',35, 50,1500,'Mll','2','F')

select * from TB_PRODUCTO

CREATE TABLE  TB_DETALLE_FACTURA(
NUM_FAC VARCHAR(12)NOT NULL  REFERENCES TB_FACTURA,
COD_PRO CHAR(5)NOT NULL  REFERENCES TB_PRODUCTO,
CAN_VEN INT NOT NULL, 
PRE_VEN MONEY NOT NULL
PRIMARY KEY (NUM_FAC,COD_PRO)
)

INSERT INTO TB_DETALLE_FACTURA VALUES('FA001','P007','6'  ,'5')
INSERT INTO TB_DETALLE_FACTURA VALUES('FA001','P011','25'  ,'25')
go

select * from TB_DETALLE_FACTURA

-- opcion 1:

USE VENTASUPN;
GO

CREATE TRIGGER trg_ActualizarStock
ON TB_DETALLE_FACTURA
FOR INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @cod_pro CHAR(5);
    DECLARE @cant_ven INT;
    DECLARE @stk_act INT;

    IF EXISTS(SELECT * FROM inserted)
    BEGIN
        SELECT @cod_pro = i.COD_PRO, @cant_ven = i.CAN_VEN
        FROM inserted i;

        -- Verificar si el producto existe en la tabla TB_PRODUCTO
        IF EXISTS(SELECT 1 FROM TB_PRODUCTO WHERE COD_PRO = @cod_pro)
        BEGIN
            SELECT @stk_act = STK_ACT FROM TB_PRODUCTO WHERE COD_PRO = @cod_pro;

            IF EXISTS(SELECT * FROM deleted)
            BEGIN
                DECLARE @cant_ven_anterior INT;
                SELECT @cant_ven_anterior = d.CAN_VEN FROM deleted d;
                SET @cant_ven = @cant_ven - @cant_ven_anterior;
            END

            -- Aumenta el stock en lugar de disminuirlo
            UPDATE TB_PRODUCTO
            SET STK_ACT = @stk_act + @cant_ven
            WHERE COD_PRO = @cod_pro;

            IF EXISTS(SELECT * FROM deleted)
                PRINT 'Se ha realizado un UPDATE en TB_DETALLE_FACTURA';
            ELSE
                PRINT 'Se ha realizado un INSERT en TB_DETALLE_FACTURA';
        END
    END

    ELSE IF EXISTS(SELECT * FROM deleted)
    BEGIN
        SELECT @cod_pro = d.COD_PRO, @cant_ven = d.CAN_VEN
        FROM deleted d;

        -- Verificar si el producto existe en la tabla TB_PRODUCTO
        IF EXISTS(SELECT 1 FROM TB_PRODUCTO WHERE COD_PRO = @cod_pro)
        BEGIN
            SELECT @stk_act = STK_ACT FROM TB_PRODUCTO WHERE COD_PRO = @cod_pro;

            -- Disminuye el stock ya que es una eliminación
            UPDATE TB_PRODUCTO
            SET STK_ACT = @stk_act - @cant_ven
            WHERE COD_PRO = @cod_pro;

            PRINT 'Se ha realizado un DELETE en TB_DETALLE_FACTURA';
        END
    END
END;
go


select * from TB_PRODUCTO
select * from TB_DETALLE_FACTURA

select * from TB_FACTURA

-- Insertar un nuevo producto
INSERT INTO TB_PRODUCTO (COD_PRO, DES_PRO, PRE_PRO, STK_ACT, STK_MIN, UNI_MED, LIN_PRO, IMPORTADO)
VALUES ('P022', 'SSD MSI 480 GB', 130.0, 100, 50, 'Uni', '1', 'N');

-- Insertar un nuevo detalle de factura
INSERT INTO TB_DETALLE_FACTURA (NUM_FAC, COD_PRO, CAN_VEN, PRE_VEN)
VALUES ('FA020', 'P022', '10', '20');

----------
-- UPDATE:
----------

-- Actualizar el stock de un producto existente
UPDATE TB_PRODUCTO
SET STK_ACT = STK_ACT - 10 -- Disminuir el stock en 10 unidades
WHERE COD_PRO = 'P022';

-- Actualizar la cantidad vendida de un detalle de factura existente
UPDATE TB_DETALLE_FACTURA
SET CAN_VEN = CAN_VEN + 15 -- Aumentar la cantidad vendida en 5 unidades
WHERE NUM_FAC = 'FA020' AND COD_PRO = 'P022';

----------
-- DELETE:
----------

-- Eliminar un producto
DELETE FROM TB_PRODUCTO
WHERE COD_PRO = 'P022';

-- Eliminar un detalle de factura
DELETE FROM TB_DETALLE_FACTURA
WHERE NUM_FAC = 'FA020' AND COD_PRO = 'P022';


--- IMPORTANTE: ---
DISABLE TRIGGER trg_ActualizarStock ON TB_DETALLE_FACTURA; -- Desabilitar el trigger
go
ENABLE TRIGGER trg_ActualizarStock ON TB_DETALLE_FACTURA; -- Habilitar el trigger
go

-------------------------------------------------------------------------------------------------------------------