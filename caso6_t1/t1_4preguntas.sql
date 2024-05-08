
use VENTASUPN
go


-- Pregunta 1:
/*
Crear el procedimiento almacenado que permita guardar un nuevo registro en la tabla TB_FACTURA, 
considere los siguientes requerimientos:

. Se debe validar la existencia del cliente COD_CLI en la tabla TB_CLIENTE antes de 
  ser insertada la factura.

. Considere controlar los errores que pueden generar en el proceso.
. Los mensajes deben devolverse con un parámetro de salida (OUTPUT), no use el PRINT
  dentro del procedimiento.
. Finalmente, para probar el procedimiento implemente un bloque T-SQL para mostrar 
  los resultados. En este bloque haga uso del PRINTT

*/

USE VENTASUPN
GO

CREATE PROCEDURE GuardarFactura
    @p_NUM_FAC VARCHAR(12), @p_FEC_FAC DATE, @p_COD_CLI CHAR(5),
    @p_FEC_CAN DATE, @p_EST_FAC VARCHAR(10), @p_COD_VEN CHAR(3),
    @p_PORC_IGV DECIMAL(5,2), @p_Mensaje VARCHAR(255) OUTPUT
As
BEGIN
    SET NOCOUNT ON;

    DECLARE @ClienteExiste INT;

    -- Verificar si el cliente existe
    SELECT @ClienteExiste = COUNT(*) FROM TB_CLIENTE WHERE COD_CLI = @p_COD_CLI;

    IF @ClienteExiste = 0
    BEGIN
        SET @p_Mensaje = 'El cliente con el código ' + @p_COD_CLI + ' no existe.';
        RETURN;
    END

    BEGIN TRY
        -- Insertar la factura
        INSERT INTO TB_FACTURA (NUM_FAC, FEC_FAC, COD_CLI, FEC_CAN, EST_FAC, COD_VEN, PORC_IGV)
        VALUES (@p_NUM_FAC, @p_FEC_FAC, @p_COD_CLI, @p_FEC_CAN, @p_EST_FAC, @p_COD_VEN, @p_PORC_IGV);

        SET @p_Mensaje = 'La factura se ha insertado correctamente.';
    END TRY
    BEGIN CATCH
        SET @p_Mensaje = 'Ocurrió un error: ' + ERROR_MESSAGE() + ' en línea ' + CAST(ERROR_LINE() AS VARCHAR) + 
                       ' en procedimiento ' + ERROR_PROCEDURE();
    END CATCH
END
GO

DECLARE @p_Mensaje VARCHAR(255);
EXEC GuardarFactura 'FA023', '2014-09-04', 'C002', '2014-10-04', 
					'2', 'V01', 0.19, @p_Mensaje OUTPUT;
PRINT @p_Mensaje;

-- error:
-- Intentar insertar una factura con un formato de fecha incorrecto
EXEC GuardarFactura 'FA023', '07/04/2014', 'C001', '2014-08-04', 
					'2', 'V01', 0.19, @p_Mensaje OUTPUT;
PRINT @p_Mensaje;

INSERT INTO TB_FACTURA VALUES('FA001','06-07-2013','C001' ,'05-08-2013', '2','V01','0.19')


--
select * from TB_FACTURA
SELECT * from TB_CLIENTE
go

------------------------------------------------------------------------------------

-- Pregunta 2:
/*
Cree una función almacenada FU_BONO que reciba un código de un vendedor y devuelva
el valor del bono que recibirá, de acuerdo al siguiente criterio:

. Si la cantidad de FACTURAS que generó es igual o devolver 0.0
. Si la cantidad de FACTURAS que generó es mayor a 0 y menor igual a 2 devolver 0.2 
. Caso contrario, devolver 0.4


Tenga en cuenta que el valor devuelto es un decimal.

*/

CREATE TABLE TB_VENDEDOR(
COD_VEN CHAR(3)NOT NULL PRIMARY KEY ,
NOM_VEN VARCHAR(20)NOT NULL,
APE_VEN VARCHAR(20)NOT NULL,
SUELDO_VEN MONEY NOT NULL,
FEC_ING DATE NOT NULL, 
TIP_VEN VARCHAR(10)NOT NULL,
COD_DIS CHAR(5)NOT NULL REFERENCES TB_DISTRITO
)
INSERT INTO TB_VENDEDOR VALUES('V01','JUANA','ALVA',1000,'07/12/2003','1','D08')
select * from TB_VENDEDOR

CREATE TABLE  TB_FACTURA(
NUM_FAC VARCHAR(12)NOT NULL PRIMARY KEY,
FEC_FAC DATE NOT NULL,
COD_CLI CHAR(5)NOT NULL REFERENCES TB_CLIENTE,
FEC_CAN DATE NOT NULL,
EST_FAC VARCHAR(10)NOT NULL,
COD_VEN CHAR(3)NOT NULL REFERENCES TB_VENDEDOR,
PORC_IGV DECIMAL NOT NULL
)
INSERT INTO TB_FACTURA VALUES('FA001','06-07-2013','C001' ,'05-08-2013', '2','V01','0.19')
select * from TB_FACTURA

-- opcion 1:

CREATE OR ALTER FUNCTION FU_BONO ( @p_COD_VEN CHAR(3) )
RETURNS DECIMAL(5,2)
AS
BEGIN
    DECLARE @p_Bono DECIMAL(5,2);
    DECLARE @p_CantidadFacturas INT;

    SELECT @p_CantidadFacturas = COUNT(*) 
    FROM TB_FACTURA 
    WHERE COD_VEN = @p_COD_VEN;

    IF @p_CantidadFacturas = 0
        SET @p_Bono = 0.0;
    ELSE IF @p_CantidadFacturas > 0 AND @p_CantidadFacturas <= 2
        SET @p_Bono = 0.2;
    ELSE
        SET @p_Bono = 0.4;

    RETURN @p_Bono;
END;
GO

DECLARE @Bono DECIMAL(5,2);
SELECT @Bono = dbo.FU_BONO('V01');
PRINT 'El bono para el vendedor es: ' + CAST(@Bono AS VARCHAR(5));



-- para ver la factura por vendedor:
SELECT COD_VEN, COUNT(*) AS CantidadFacturas
FROM TB_FACTURA
GROUP BY COD_VEN;


------------------------------------------------------------------------------------

-- Pregunta 3:
/* 
Se requiere crear la vista VW_BONO_VENDEDOR, que muestre los siguientes campos: 
código de vendedor, nombre completo, cantidad de años laborando, sueldo y el bono otorgado 
(use la función creada previamente para este campo multiplicándolo por el sueldo). 
Consulte la vista y muestre su resultado.
*/

CREATE TABLE TB_VENDEDOR(
	COD_VEN CHAR(3)NOT NULL PRIMARY KEY ,
	NOM_VEN VARCHAR(20)NOT NULL,
	APE_VEN VARCHAR(20)NOT NULL,
	SUELDO_VEN MONEY NOT NULL,
	FEC_ING DATE NOT NULL, 
	TIP_VEN VARCHAR(10)NOT NULL,
	COD_DIS CHAR(5)NOT NULL REFERENCES TB_DISTRITO
)
INSERT INTO TB_VENDEDOR VALUES('V01','JUANA','ALVA',1000,'07/12/2003','1','D08')
INSERT INTO TB_VENDEDOR VALUES('V02','JUAN','SOTO',1200,'10/03/2002','2','D03')
INSERT INTO TB_VENDEDOR VALUES('V03','CARLOS','AREVALO',1500,'02/10/1992','2','D09')
select * from TB_VENDEDOR

-- opcion 1:

-- Creación de la vista
CREATE OR ALTER VIEW VW_BONO_VENDEDOR 
As
SELECT 
    COD_VEN,
    NOM_VEN + ' ' + APE_VEN AS Nombre_Completo,
    DATEDIFF(YEAR, FEC_ING, GETDATE()) AS Años_Laborando,
    SUELDO_VEN AS Sueldo,
    dbo.FU_BONO(COD_VEN) * SUELDO_VEN AS BonoOtorgado
FROM TB_VENDEDOR;

SELECT * FROM VW_BONO_VENDEDOR;

------------------------------------------------------------------------------------

-- Disparadores 
/* 
-- Pregunta 4:
Se requiere poder auditar las actualizaciones (update) del precio de abastecimiento (PRE_ABA) 
en TB_ABASTECIMIENTO, para ello cree una tabla donde se guarde la fecha de actualización, el 
usuario de sistema operativo y precio de abastecimiento nuevo y antiguo. A continuación, cree 
un trigger (DISPARADOR) que permita registrar los datos solicitado al momento de realizar la 
actualización. Use la BD VentasUPN. Pruebe el trigger y muestre su resultado. 
*/

CREATE  TABLE TB_ABASTECIMIENTO(
COD_PRV CHAR(5)NOT NULL  REFERENCES TB_PROVEEDOR,
COD_PRO CHAR(5)NOT NULL  REFERENCES TB_PRODUCTO,
PRE_ABA MONEY NOT NULL
PRIMARY KEY (COD_PRV,COD_PRO)
)
GO

select * from TB_ABASTECIMIENTO

-- opcion 1:

CREATE TABLE TB_AUDITORIA_ABASTECIMIENTO (
    ID_AUDITORIA INT PRIMARY KEY IDENTITY,
    FECHA_ACTUALIZACION DATETIME,
    USUARIO_OPERATIVO VARCHAR(100),
    COD_PRV CHAR(5),
    COD_PRO CHAR(5),
    PRECIO_ANTIGUO MONEY,
    PRECIO_NUEVO MONEY
);
GO

CREATE OR ALTER TRIGGER TRG_AUDIT_ABASTECIMIENTO
ON TB_ABASTECIMIENTO
AFTER UPDATE
As
BEGIN
    DECLARE @FechaActualizacion DATETIME = GETDATE(), @UsuarioOperativo VARCHAR(100) = SYSTEM_USER,
		    @CodPrv CHAR(5), @CodPro CHAR(5), @PrecioAntiguo MONEY, @PrecioNuevo MONEY;

    SELECT @CodPrv = INSERTED.COD_PRV,
           @CodPro = INSERTED.COD_PRO,
           @PrecioAntiguo = DELETED.PRE_ABA,
           @PrecioNuevo = INSERTED.PRE_ABA
    FROM INSERTED
    INNER JOIN DELETED ON INSERTED.COD_PRV = DELETED.COD_PRV AND INSERTED.COD_PRO = DELETED.COD_PRO;

    INSERT INTO TB_AUDITORIA_ABASTECIMIENTO (FECHA_ACTUALIZACION, USUARIO_OPERATIVO, COD_PRV, COD_PRO, PRECIO_ANTIGUO, PRECIO_NUEVO)
    VALUES (@FechaActualizacion, @UsuarioOperativo, @CodPrv, @CodPro, @PrecioAntiguo, @PrecioNuevo);
END;
go

UPDATE TB_ABASTECIMIENTO
SET PRE_ABA = 40.00
WHERE COD_PRO = 'P005';

SELECT * FROM TB_AUDITORIA_ABASTECIMIENTO;


