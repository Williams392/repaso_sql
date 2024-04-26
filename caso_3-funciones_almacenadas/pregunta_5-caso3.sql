-- Pregunta 5:
/* 
Con la BD VENTASUPN Crear una función que reciba una cantidad de años y permita indicar 
el estado de promoción de los vendedores, de acuerdo al tiempo en años que vine trabajando 
y con el siguiente criterio:

--si la cantidad de años es menor o igual a 21, devolver "sin promoción"
--si la cantidad de años es mayor a 21 y menor a 28, devolver "evaluación de promoción"
--si la cantidad de años es mayor o igual a 28, devolver "promoción directa"

✓ Realice una consulta a la tabla vendedores mostrando el estado de promoción con la función creada.
✓ Cree una vista que incluya la función creada.
*/

USE VENTASUPN
GO

-- analisis:
select * from TB_VENDEDOR 
select * from TB_FACTURA 
go

CREATE OR ALTER FUNCTION dbo.estdPromcn(@p_aniosTrabajando INT)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @v_estadoPromocion VARCHAR(50)

    IF @p_aniosTrabajando <= 21
        SET @v_estadoPromocion = 'Sin promoción'
    ELSE IF @p_aniosTrabajando > 21 AND @p_aniosTrabajando <= 28
        SET @v_estadoPromocion = 'Evaluación de promoción'
    ELSE
        SET @v_estadoPromocion = 'Promoción directa'

    RETURN @v_estadoPromocion
END
GO

-- ✓ 1.Consulta para obtener el estado de promoción de los vendedores
SELECT COD_VEN AS codigo_vendedor, NOM_VEN AS nombre_vendedor, APE_VEN AS apellido_vendedor,
    DATEDIFF(YEAR, FEC_ING, GETDATE()) AS anios_trabajando,
    dbo.estdPromcn(DATEDIFF(YEAR, FEC_ING, GETDATE())) AS estado_promocion
FROM dbo.TB_VENDEDOR
GO

-- ✓ 2.
CREATE VIEW VistaEstadoPromocion AS SELECT COD_VEN AS codigo_vendedor, -- y se guarda.
	NOM_VEN AS nombre_vendedor, APE_VEN AS apellido_vendedor,
    DATEDIFF(YEAR, FEC_ING, GETDATE()) AS anios_trabajando,
    dbo.estdPromcn(DATEDIFF(YEAR, FEC_ING, GETDATE())) AS estado_promocion
FROM dbo.TB_VENDEDOR
GO

SELECT * FROM VistaEstadoPromocion;

