/************************************************
			manejo de transacciones
************************************************/
USE Negocios
GO

CREATE TABLE CUENTAS (
    numCuenta VARCHAR(12),
    saldo DECIMAL(18,2)
)
GO

Insert into CUENTAS VALUES('20161206',2200),('20161207',3000)
GO

--DELETE FROM CUENTAS
SELECT * FROM CUENTAS

-----------------------------------------------------------------------------
--PROCESO CON TRANACCION EXPLICITA
--bloque para simular la operación
DECLARE @Monto DECIMAL(18,2), @CuentaADecrementar VARCHAR(12), @CuentaAIncrementar VARCHAR(12) 
/* Asignamos el monto de la transacción y las cuentas a afectar*/
SET @Monto = 1900 
SET @CuentaADecrementar = '20161206'
SET @CuentaAIncrementar = '20161207' 
BEGIN TRANSACTION 
BEGIN TRY
    /* Descontamos el monto de la cuenta a decrementar */
    UPDATE CUENTAS SET SALDO = SALDO - @Monto WHERE NUMCUENTA = @CuentaADecrementar 
        /* Incrementamos el monto de la cuenta a incrementar */
    UPDATE CUENTAS SET SALDO = SALDO + @Monto WHERE NUMCUENTA = @CuentaAIncrementar 
    /* Confirmamos la transaccion*/
    COMMIT TRANSACTION 
END TRY
BEGIN CATCH
    /* Ocurrió un error, deshacemos los cambios*/ 
    ROLLBACK TRANSACTION
    PRINT 'Ha ocurrido un error!'
END CATCH

SELECT * FROM CUENTAS

-----------------------------------------------------------------------------

--SAVE POINT / Actualizar saldo:
BEGIN TRAN 
UPDATE CUENTAS SET SALDO = 50000 WHERE NUMCUENTA = '20161206'
 SAVE TRANSACTION Punto1 -- Guardamos la transaccion (Savepoint)
UPDATE CUENTAS SET SALDO = 5000 WHERE NUMCUENTA = '20161206'
--SAVE TRANSACTION Punto1 -- Guardamos la transaccion (Savepoint)
UPDATE CUENTAS SET SALDO = 5 WHERE NUMCUENTA = '20161206'
-- Este ROLLBACK afecta solo a las instrucciones posteriores al savepoint Punto1.
ROLLBACK TRANSACTION Punto1 
-- Confirmamos la transaccion
COMMIT

--
SELECT * FROM CUENTAS
-----------------------------------------------------------------------------

--PROBANDO BLOQUEOS
--SAVE POINT
BEGIN TRAN 
UPDATE CUENTAS SET SALDO = 50000 
 WHERE NUMCUENTA = '20161206'
 go

 commit -- si se CUELGA
 go

 CREATE OR ALTER PROCEDURE usp_ejemplo
 As
 Begin
	null
 End
 go

 execute usp_ejemplo
 go

 CREATE OR ALTER FUNCTION fu_ejemplo
 RETURN <TIPO DATO>
 As
 Begin
	RETURN
 End

 select dbo.fu_ejemplo()
 go

/************************************************
			trigger
************************************************/

--trigger DML
CREATE or ALTER TRIGGER RRHH.trgDistrito
ON RRHH.Distritos
FOR INSERT, UPDATE, DELETE
AS
BEGIN
    PRINT 'SE REALIZÓ UNA OPERACION DML'
END

-- El trgDistrito creado esta guardado en rrhh.distrito en la carpeta Triggers.
-----------------------------------------------

--probamos
SET NOCOUNT ON -- ES OBLIGATORIO en los trigger.
INSERT INTO RRHH.Distritos VALUES(8,'Comas') -- contiene un trigger porque tiene DML
GO

select * from RRHH.Distritos
go

-- 1. Registros DELETED y INSERTED
CREATE OR ALTER  TRIGGER [RRHH].[trgDistrito]
ON [RRHH].[Distritos]
FOR INSERT, UPDATE, DELETE
AS
BEGIN
    SELECT * FROM inserted
    SELECT * FROM deleted
END
GO

-- 2. lo mismo pero UPDATE:
CREATE OR ALTER  TRIGGER [RRHH].[trgDistrito] -- Este es un codigo para validar.
ON [RRHH].[Distritos]
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	IF EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted)
	    PRINT 'Es un UPDATE'
	ELSE IF EXISTS(SELECT * FROM inserted)
	    PRINT 'Es un INSER'
	ELSE IF EXISTS(SELECT * FROM deleted)
	    PRINT 'Es un DELETE'
END
GO

INSERT INTO RRHH.Distritos VALUES(99,'SJL')

UPDATE RRHH.Distritos 
SET nomDistrito = 'VMT'
WHERE idDistrito = 99

DELETE RRHH.Distritos 
WHERE idDistrito = 99
GO
-----------------------------------------------

--trigger para auditar 

--algunos datos a considerar
  SELECT GETDATE(),
	   SUBSTRING(HOST_NAME(),1,128),
	   SUBSTRING(SUSER_SNAME(),1,128),
	   SUBSTRING(APP_NAME(),1,128)

	   PRINT APP_NAME()


SELECT * FROM RRHH.Cargos

select SUSER_NAME()

DROP TABLE LOG_TABLE
GO

CREATE TABLE LOG_TABLE ( -- DATOS ALMACENAR
LOG_COLUMN VARCHAR(200),  USER_NAME VARCHAR(30), FECHA_REGISTRO DATETIME,
cargo_new VARCHAR(100), cargo_old VARCHAR(100)
)
GO

CREATE OR ALTER TRIGGER RRHH.TRG_INS_CARGO -- se crea TRIGGER de auditoria.
ON RRHH.CARGOS
FOR INSERT
AS
BEGIN
  INSERT INTO LOG_TABLE VALUES('INSERCION EN LA TABLA CARGOS', USER, GETDATE())
END
go


INSERT INTO LOG_TABLE VALUES('main','juan')
select * from LOG_TABLE
go
--RETO: Incluya el registro de las tres operaciones
-- EJEMPLO 2:
-- Actualizacion, eliminacion y update en el mismo trigger con su mensaje:
CREATE TABLE LOG_TABLE ( -- DATOS ALMACENAR
LOG_COLUMN VARCHAR(200),  USER_NAME VARCHAR(30), FECHA_REGISTRO DATETIME
)
GO

CREATE OR ALTER TRIGGER RRHH.TRG_INS_CARGO -- se crea TRIGGER de auditoria.
ON RRHH.CARGOS
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	declare @v_cargo_new varchar(100), @v_cargo_old varchar(100)

	select @v_cargo_new = desCargo from inserted
	select @v_cargo_old = desCargo from deleted

	IF EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted)
		INSERT INTO LOG_TABLE VALUES('UPDATE', USER, GETDATE(), @v_cargo_new, @v_cargo_old)
	ELSE IF EXISTS(SELECT * FROM inserted)
	    INSERT INTO LOG_TABLE VALUES( 'INSERCION', USER, GETDATE(), @v_cargo_new, @v_cargo_old)
	ELSE IF EXISTS(SELECT * FROM deleted)
	    INSERT INTO LOG_TABLE VALUES( 'DELETE', USER, GETDATE(), @v_cargo_new, @v_cargo_old)
END
go
--
select * from LOG_TABLE

INSERT INTO LOG_TABLE VALUES(5,'juan')

UPDATE RRHH.CARGOS
SET desCargo = 'Gerente'
WHERE idcargo = 5

DELETE RRHH.CARGOS 
WHERE idcargo = 2
GO

-----------------------------------------------

--Crear un TRIGGER en el esquema RRHH con nombre TRG_UPD_PRODUCTO, en la  cual solo permita actualizar 
--el precioUnidad de PRODUCTOS en horario de 8:00 a 12:00, caso  contrario revertir la transacción y 
--devolver un mensaje usando RAISERROR con severidad 10.

select DATEPART(hh,getdate()) -- hora actual del sistema
GO

CREATE OR ALTER TRIGGER COMPRAS.TRG_UPD_PRODUCTO
 ON Compras.productos  
FOR UPDATE
AS
BEGIN  
  IF DATEPART(HH,getdate()) NOT BETWEEN 8 AND 12 
  BEGIN
    PRINT 'SON LAS' + STR(DATEPART(HH,getdate())) + ' HORAS'
    ROLLBACK TRANSACTION
    RAISERROR('!!SE ENCUENTRA FUERA DEL HORARIO PARA ACTUALIZAR',10,1)    
  END
END

--prueba de validación
--18
UPDATE Compras.productos
SET PrecioUnidad = 18
WHERE IdProducto = 1
GO

--desactivando el trigger
DISABLE TRIGGER COMPRAS.TRG_UPD_PRODUCTO ON COMPRAS.PRODUCTOS -- desactivar.
go
enable TRIGGER COMPRAS.TRG_UPD_PRODUCTO ON COMPRAS.PRODUCTOS -- activar
go
SELECT * FROM Compras.productos
WHERE IdProducto = 1
go


--Por regla de negocio se ha definido que no se puede incrementar el preciodeunidad de los 
--productos más del 30% del precio actual. Cree un trigger que permita asegurar esta regla, 
--caso contrario revertir la trasacción y devolver un mensaje usando RAISERROR, con severidad 10, 
--indicando cual es el valor máximo que se puede actualizar

CREATE OR ALTER TRIGGER COMPRAS.TRG_UPD30_PRODUCTO
 ON Compras.productos  
FOR UPDATE  
AS
BEGIN  
    DECLARE @v_precioActual decimal(10,0), @v_precioNuevo decimal(10,0), @v_mensaje VARCHAR(200)
   SELECT @v_precioActual = PrecioUnidad FROM deleted
    SELECT @v_precioNuevo = PrecioUnidad FROM inserted
    IF @v_precioNuevo > 1.3 * @v_precioActual
    BEGIN
      set @v_mensaje = '!!NO SE PUEDE ACTUALIZAR MÁS DEL 30 porciento AL PRECIO DE UNIDAD. MÁXIMO : ' + TRIM(STR(1.3 * @v_precioActual))
      ROLLBACK TRANSACTION
      RAISERROR(@v_mensaje,10,1)
    END  
END

select * from Compras.productos 

UPDATE Compras.productos  -- maximo 20
SET PrecioUnidad = 19
Where IdProducto = 3
go

-------------------------------------------------------------
-- PARA QUE NO ELIMINE LA TABLA:

--trigger DDL
CREATE OR ALTER TRIGGER trgImpideEliminarTablas
 ON DATABASE  
AFTER DROP_TABLE  
AS
BEGIN  
    RAISERROR('!!NO PUEDE ELIMINAR UNA TABLA EN ESTA BD',10,1)  
    ROLLBACK   
END

DROP TABLE LOG_TABLE 
GO

--probamos la eliminación
DROP TABLE CUENTAS
GO

