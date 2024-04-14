-- Pregunta 1:
/* 
Usando la base de datos Negocios, elaborar el Procedimiento AlmacenadouspRegistraProveedor
en el esquema Compras, que realice una inserción a la tablaPROVEEDORES, se debe validar la 
integridad referencial del campo IDPAIS (es decir, debe validarsu existencia). 
Controles los errores que se puedan generar con TRY CATCH. Todos los mensajesse deben devolver
con un parámetro de salida.
*/

-- PROCEDIMINETO ALMACENADO:

USE Negocios
GO

SELECT * FROM Compras.proveedores
go

CREATE OR ALTER PROCEDURE Compras.uspRegistraProveedor
    @IdProveedor INT, @p_NomProveedor VARCHAR(40), @p_DirProveedor VARCHAR(60), 
    @p_NomContacto VARCHAR(80), @p_CargoContacto VARCHAR(50), @p_idpais CHAR(3), 
	@p_fonoProveedor VARCHAR(15), @p_FaxProveedor VARCHAR(15),
    @v_mensaje VARCHAR(500) OUTPUT
AS
BEGIN
    BEGIN TRY
        -- Verificar si el p_idpais existe en la tabla paises
        IF NOT EXISTS (SELECT * FROM Ventas.paises WHERE idpais = @p_idpais)
        BEGIN
            SET @v_mensaje = 'Error: El p_idpais ' + @p_idpais + ' no existe.'
            RETURN
        END

        -- Insertar el nuevo proveedor
        INSERT INTO Compras.proveedores (IdProveedor, NomProveedor, DirProveedor, NomContacto, CargoContacto, idpais, fonoProveedor, FaxProveedor)
        VALUES (@IdProveedor, @p_NomProveedor, @p_DirProveedor, @p_NomContacto, @p_CargoContacto, @p_idpais, @p_fonoProveedor, @p_FaxProveedor)

        SET @v_mensaje = 'El proveedor se registró correctamente con el ID: ' + CAST(@IdProveedor AS VARCHAR)
    END TRY
    BEGIN CATCH
        -- Control de errores
        SET @v_mensaje = 'Ocurrió un error: ' + ERROR_MESSAGE() + ' en línea ' + CAST(ERROR_LINE() AS VARCHAR) + 
                                ' en procedimiento ' + ERROR_PROCEDURE()
    END CATCH
END
GO

-- Para probar el procedimiento almacenado:

-- Good 
DECLARE @v_Mensaje VARCHAR(500)
EXEC Compras.uspRegistraProveedor 
    @IdProveedor = 31, 
    @p_NomProveedor = 'Marcus ', 
    @p_DirProveedor = 'Ashton 703 centro', 
    @p_NomContacto = 'Gerente de compras', 
    @p_CargoContacto = 'av. 31 Gilbert', 
    @p_idpais = '003', 
    @p_fonoProveedor = '(171) 555-3435', 
    @p_FaxProveedor = '',
    @v_mensaje = @v_Mensaje OUTPUT
PRINT @v_Mensaje
GO
-- Mensaje: El proveedor se registró correctamente con el ID: 31

-- Error:
DECLARE @v_Mensaje VARCHAR(500)
EXEC Compras.uspRegistraProveedor 
    @IdProveedor = 30, 
    @p_NomProveedor = 'Exotic Liquids', 
    @p_DirProveedor = 'Charlotte Cooper', 
    @p_NomContacto = 'Gerente de compras', 
    @p_CargoContacto = '49 Gilbert St.', 
    @p_idpais = '003', 
    @p_fonoProveedor = '(171) 555-2222', 
    @p_FaxProveedor = '',
    @v_mensaje = @v_Mensaje OUTPUT
PRINT @v_Mensaje
GO
/* Mensaje: Ocurrió un error: Violation of PRIMARY KEY constraint 'PK__proveedo__E8B631AF6F59C499'. Cannot insert 
duplicate key in object 'Compras.proveedores'. The duplicate key value is (1). en línea 18 en procedimiento 
Compras.uspRegistraProveedor
*/


-- PREGUNTA 2:
/* Usando la base de datos Negocios, Elaborar el Store Procedure uspReportePedido que reciba3 parámetros de entrada: 
el código del empleado (IdEmpleado), el mes y año de pedido. Elprocedimiento debe devolver, por medio de una 
consulta, los productos y monto total pagado(PrecioUnidad* Cantidad de PedidoDeta), filtrando por los parámetros 
de entrada. Usefunciones de agrupamiento y manejo de errores. 
*/

USE Negocios
go

CREATE PROCEDURE uspReportePedido
    @IdEmpleado INT,
    @mes INT,
    @año INT,
    @v_Mensaje VARCHAR(550) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        SELECT
            p.IdProducto,
            p.NomProducto,
            SUM(pd.PrecioUnidad * pd.Cantidad) AS MontoTotalPagado
        FROM Ventas.pedidoscabe pc
        INNER JOIN Ventas.pedidosdeta pd ON pc.IdPedido = pd.IdPedido
        INNER JOIN Compras.productos p ON pd.IdProducto = p.IdProducto
        WHERE pc.IdEmpleado = @IdEmpleado
            AND MONTH(pc.FechaPedido) = @mes
            AND YEAR(pc.FechaPedido) = @año
        GROUP BY p.IdProducto, p.NomProducto;

        SET @v_Mensaje = 'Consulta ejecutada correctamente.';
    END TRY
    BEGIN CATCH
        -- Manejar errores aquí (si es necesario)
        SET @v_Mensaje = 'Ocurrió un error: ' + ERROR_MESSAGE() + ' en línea ' + CAST(ERROR_LINE() AS VARCHAR) + 
                         ' en procedimiento ' + ERROR_PROCEDURE()
    END CATCH;
END;

DECLARE @Mensaje VARCHAR(500);
EXEC uspReportePedido @IdEmpleado = 2, @mes = 10, @año = 2010, @v_Mensaje = @Mensaje OUTPUT;
PRINT @Mensaje;

-- Eliminar un procedimiento almacenado exixtente:
DROP PROCEDURE uspReportePedido;
go

-- ver 
select * from RRHH.empleados
select * from Compras.productos

select * from Ventas.pedidoscabe
select * from Ventas.pedidosdeta