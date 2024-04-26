/*****************************************
			MANEJO DE CURSORES
*****************************************/

-- Declaración del cursor 
DECLARE <nombreCursor> CURSOR 
FOR <sentenciaSQL> 
-- Apertura del cursor 
OPEN <nombreCursor>
-- Lectura de la primera fila del cursor 
FETCH <nombreCursor> INTO <Lista variables>
WHILE (@@FETCH_STATUS = 0) 
BEGIN 
	-- Lectura de la siguiente fila de un cursor 
	FETCH <nombreCursor> INTO <Lista variables>
END
-- Fin del bucle WHILE 
-- Cierra el cursor 
CLOSE <nombreCursor>
-- Libera los recursos del cursor 
DEALLOCATE <nombreCursor>



Use Negocios
go

--Declaramos el cursor del tipo Scroll
DECLARE c_producto CURSOR SCROLL FOR
SELECT * FROM Compras.productos
--Abrimos el cursor
OPEN c_producto
--recorremos el cusor
FETCH FIRST FROM c_producto
FETCH ABSOLUTE 6 FROM c_producto
FETCH LAST FROM c_producto
FETCH ABSOLUTE 3 FROM c_producto
--cerramos el cursor
CLOSE c_producto
--liberamos el cursor
DEALLOCATE c_producto

-- Creamos el cursor C_Cliente para recorrer elnombre y dirección de todos los clietes
Declare C_Cliente Cursor For Select NomCliente, DirCliente 
								from Ventas.clientes
Declare @vc_NomCli Varchar(50), @vc_DirCli varchar(50)
Open C_Cliente
Fetch C_Cliente Into @vc_Nomcli, @vc_Dircli
Print Space(25)+'REPORTE DE CLIENTES'
Print Space(25)+Replicate('*',25)
While @@FETCH_STATUS=0
Begin
	Print 'Nombre del Cliente   : '+@vc_NomCli
	Print 'Dirección Cliente    : '+@vc_DirCli
	Print ''
	Fetch C_Cliente Into @vc_Nomcli, @vc_Dircli
End
Print Replicate ('*',50)
Close C_Cliente
Deallocate C_Cliente
go
-- yo
-- Mostrar el nombre del producto y el precio de la unidad
Declare C_produc Cursor For Select NomProducto, PrecioUnidad 
								from Compras.productos
Declare @cp_Produc Varchar(50), @cp_PrecUnid varchar(50)
Open C_produc
Fetch C_produc Into @cp_Produc, @cp_PrecUnid
Print Space(25)+'REPORTE DE CLIENTES'
Print Space(25)+Replicate('*',25)
While @@FETCH_STATUS=0
Begin
	Print 'Nombre del Producto   : '+@cp_Produc
	Print 'Precio de la Unidad    : '+@cp_PrecUnid
	Print ''
	Fetch C_produc Into @cp_Produc, @cp_PrecUnid
End
Print Replicate ('*',50)
Close C_produc
Deallocate C_produc
go

--------------------------------

-- PROFE
-- Mostrar el nombre del producto y el precio de la unidad

-- cursosr de productos
CREATE OR ALTER PROCEDURE usp_reporte_prod -- esto se hace para guardar esta info.
As 
Begin
	Declare C_produc Cursor For Select NomProducto, PrecioUnidad 
									from Compras.productos
	Declare @cp_Produc Varchar(50), @cp_PrecUnid decimal(10,0), @v_cant_prod int = 0
	Declare @v_precio_total decimal(10,0) = 0
	Open C_produc
	Fetch C_produc Into @cp_Produc, @cp_PrecUnid
	Print Space(25)+'REPORTE DE PRODUCTOS'
	Print Space(25)+Replicate('*',25)
	While @@FETCH_STATUS=0
	Begin
		set @v_cant_prod = @v_cant_prod + 1 -- contador
		set @v_precio_total = @v_precio_total + @cp_PrecUnid -- acumulador de precio

		Print 'Nombre del Producto   : '+ cast(@cp_Produc as char(50)) + '' + LTRIM(@cp_PrecUnid)
		-- Print 'Precio de la Unidad    : '+ LTRIM(@cp_PrecUnid)
		Print ''
		Fetch C_produc Into @cp_Produc, @cp_PrecUnid
	End
	Print Replicate ('*',50)
	Close C_produc
	Deallocate C_produc
	print 'La cantidad de productos es: ' + ltrim(@v_cant_prod)
	print 'El precio total  del producto es: ' + ltrim(@v_precio_total)
end
go -- Esto se crea en un ESQUEMA -> DBO (esquema por defecto).

exec usp_reporte_prod
go

------------------------------------------------------

--cursores anidados
--Muestre el nombre y dirección del cliente, por cada uno mostrar Id de Pedido y fecha de pedido generados., 
--los datos se deben mostrar el consola con PRINT

Declare C_Cliente Cursor For Select IdCliente, NomCliente, DirCliente from Ventas.clientes
Declare @vc_Idcli  Varchar(5), @vc_NomCli Varchar(50), @vc_DirCli varchar(50)
Open C_Cliente
Fetch C_Cliente Into @vc_Idcli, @vc_Nomcli, @vc_Dircli
Print Space(25)+'REPORTE DE CLIENTES'
Print Space(25)+Replicate('*',25)
While @@FETCH_STATUS=0
Begin
	Print 'Nombre del Cliente   : '+@vc_NomCli
	Print 'Dirección Cliente    : '+@vc_DirCli
	Print ''
		Declare C_PedidoCli Cursor For Select IdPedido, FechaPedido  From Ventas.pedidoscabe
		   Where IdCliente=@vc_Idcli
		Declare @vc_IdPed int, @vc_FecPed Date
		Open C_PedidoCli
		Fetch C_PedidoCli Into @vc_IdPed, @vc_FecPed
		While @@FETCH_STATUS =0
		Begin
			Print SPACE(20) + LTRIM(@vc_IdPed) + SPACE(20) + CONVERT(VARCHAR(16),@vc_FecPed,6)
			Print SPACE(20) + '-------------------------------------------------'
			Fetch C_PedidoCli Into @vc_IdPed, @vc_FecPed
		End
		Close C_PedidoCli
		Deallocate C_PedidoCli
	Fetch C_Cliente Into @vc_Idcli, @vc_Nomcli, @vc_Dircli
End
Print Replicate ('*',50)
Close C_Cliente
Deallocate C_Cliente
go


--caso 1: Crear un procedimiento almacenado que reciba como parametro el Id de un cliente y devuelva el
--siguiente resultado, por medio de un cursor.
/*
							REPORTE DE CLIENTES
                         *************************
Id Cliente			 : ALFKI
Nombre del Cliente   : Alfreds Futterkiste
Dirección Cliente    : Obere Str. 57
 
                    10643                    25 Aug 97
                    -------------------------------------------------
                    10692                    03 Oct 97
                    -------------------------------------------------
                    10702                    13 Oct 97
                    -------------------------------------------------
					10835                    15 Jan 98
                    -------------------------------------------------
                    10952                    16 Mar 98
                    -------------------------------------------------
                    11011                    09 Apr 98
                    -------------------------------------------------
La cantidad de pedidos es 6
******************************************************/

--Caso integrador

--cree la bd VENTASUPN
Use ventasupn
go

--CONSIDERE LA SIGUIENTE CONSULTA QUE DEVUELVE el total (monto monetario) facturado a cada cliente
--en estado 2 (pendiente de pago)
select cl.COD_CLI, CL.RAZ_SOC_CLI, SUM(CAN_VEN * PRE_VEN) from TB_FACTURA FA
			JOIN TB_DETALLE_FACTURA DF ON FA.NUM_FAC = DF.NUM_FAC
			JOIN TB_CLIENTE CL ON CL.COD_CLI = FA.COD_CLI
			WHERE FA.EST_FAC = 2
			GROUP BY cl.COD_CLI, CL.RAZ_SOC_CLI


/*******************************************
		FUNCIONES
*******************************************/
USE Negocios
GO

--EJEMPLO 1: Crear la función SUMAR_NUMEROS
--CREATE or alter FUNCTION SUMAR_NUMEROS(@P_NUM1 SMALLINT, @P_NUM2 SMALLINT) 
CREATE OR ALTER FUNCTION SUMAR_NUMEROS(@P_NUM1 SMALLINT, @P_NUM2 SMALLINT) 
   RETURNS smallint -- smallint tipo de dato numerico.
AS
BEGIN
	DECLARE @p_resultado SMALLINT
	SET @p_resultado = @P_NUM1 + @P_NUM2
	RETURN @p_resultado
END
GO

--PROBAMOS LA FUNCION
SELECT dbo.SUMAR_NUMEROS(35, 27)
-- O
PRINT dbo.SUMAR_NUMEROS(35, 27)
GO


----------------- YO
-- crear la misma funcion pera mandar un parametro @operar si pongo + cambia y si pongo menos cambia
CREATE OR ALTER FUNCTION operar_NUMEROS(@P_NUM1 SMALLINT, @P_NUM2 SMALLINT,
									   @operar char(1)) 
   RETURNS smallint -- smallint tipo de dato numerico.
AS
BEGIN
	DECLARE @p_resultado SMALLINT
	IF @operar = '+'
        SET @p_resultado = @P_NUM1 + @P_NUM2
    ELSE IF @operar = '-'
        SET @p_resultado = @P_NUM1 - @P_NUM2
	RETURN @p_resultado
END
GO

--PROBAMOS LA FUNCION
SELECT dbo.operar_NUMEROS(12, 11, '+');
SELECT dbo.operar_NUMEROS(12, 11, '-');
go

select * from Compras.productos
go

-- 
CREATE VIEW vw_producto
AS
select *,dbo.SUMAR_NUMEROS(UnidadesEnExistencia, UnidadesEnPedido) As total_unidades
from Compras.productos

select * from vw_producto
go

-----------------

--También podemos usar la función en una consulta de la BD
USE Negocios
GO

SELECT NomProducto, UnidadesEnExistencia, UnidadesEnPedido, dbo.SUMAR_NUMEROS(UnidadesEnExistencia, UnidadesEnPedido) Suma
FROM Compras.productos
GO

--Crear una función que realiza una operación entre 2 números según el  tipo de operación indicada en el 
--parámetro P_OPERACION

CREATE FUNCTION OPERAR_NUMEROS (
@P_NUM1 NUMERIC(5,2),
@P_NUM2 NUMERIC(5,2), 
@P_OP   CHAR(1)
) RETURNS NUMERIC(8,2) 
AS
BEGIN
declare @V_RES numeric(8,2)
SET @V_RES=CASE
			WHEN @P_OP = '+' THEN 
				  @P_NUM1 + @P_NUM2  
			WHEN @P_OP = '-' THEN   
				 @P_NUM1 - @P_NUM2
			WHEN @P_OP = '*' THEN
				@P_NUM1 * @P_NUM2
			WHEN @P_OP = '/' THEN
				@P_NUM1 / @P_NUM2
			END			
		RETURN @V_RES
END
go

--validamos
SELECT dbo.OPERAR_NUMEROS(17,7,'/')

--validamos con un bloque T-SQL
DECLARE
@V_NUMA	NUMERIC, @V_NUMB	NUMERIC,  @V_OPERACION	CHAR(1),  @V_RESULTADO	NUMERIC(8,2)
BEGIN
SET @V_NUMA = 10
SET @V_NUMB = 30  
SET @V_OPERACION = '+'
SET @V_RESULTADO = dbo.OPERAR_NUMEROS(@V_NUMA,@V_NUMB,@V_OPERACION)
PRINT TRIM(STR(@V_NUMA)) +' '+ @V_OPERACION +' '+ TRIM(STR(@V_NUMB)) + '=' + TRIM(STR(@V_RESULTADO))

SET @V_OPERACION = '*'
SET @V_RESULTADO = dbo.OPERAR_NUMEROS(@V_NUMA,@V_NUMB,@V_OPERACION)
PRINT STR(@V_NUMA) +' '+ @V_OPERACION +' '+ STR(@V_NUMB) + '=' + STR(@V_RESULTADO)

SET @V_RESULTADO = dbo.OPERAR_NUMEROS(23,56,'*')
PRINT '23 * 56' + ' = ' + STR(@V_RESULTADO)
END


--funcion format para la fecha
SELECT FORMAT(getdate(),'D','es-es') 
go

--Crear una función que retorne la fecha actual del sistema, tendrá como  parámetro de entrada 
--el formato de salida presentación de la fecha
CREATE OR ALTER FUNCTION OBTENER_FECHA (
@P_FORMATO  char(1) -- d= fecha corta, D= fecha texto
) RETURNS VARCHAR(50)
AS
BEGIN
 declare @V_FECHA	VARCHAR(50)
 SELECT @V_FECHA = FORMAT(getdate(),@P_FORMATO,'es-es') 

 RETURN @V_FECHA
END;

--VALIDAMOS LA FUNCIÓN CREADA
select dbo.obtener_fecha('D') as fecha

drop function OBTENER_FECHA
GO

-- PREGUNTA TIPO EXAMEN:
--Crear una función en el esquema compras que reciba como parámetro el ID de un proveedor 
--y que devuelva el promedio de precios  de los productos que abastece dicho  proveedor.
--Luego genere una consulta que muestre la lista de proveedores y el promedio de precios
--de los productos que abastece.

CREATE FUNCTION Compras.fu_promedio_precio(@P_IDPROVEEDOR INT)
RETURNS DECIMAL(12,2)
AS
BEGIN
	DECLARE @V_PROMEDIO_PRECIO DECIMAL(12,2)
	SELECT @V_PROMEDIO_PRECIO = AVG(PrecioUnidad) FROM Compras.productos
	WHERE IdProveedor = @P_IDPROVEEDOR

	RETURN @V_PROMEDIO_PRECIO
END
go

---VALIDANDO LA FUNCION
SELECT NomProveedor, Compras.fu_promedio_precio(idProveedor) As promedio_precio  
FROM Compras.proveedores

--
select Compras.fu_promedio_precio(2) -- el promedio de todos los producto del proveedor.

select * from Compras.productos where IdProveedor=2 -- (el where para ver especifico lo que quiero ver)

select NomProveedor,Compras.fu_promedio_precio(2) from Compras.proveedores


--YO
-- crear una funcion que muestre el sueldo maximo de el sueldo maximo  empleados de un 
-- determinado distrito como parametro su codigo de distrito.
USE VENTASUPN
GO

CREATE FUNCTION dbo.sueldo_maximo(@p_codDistrito CHAR(5))
RETURNS MONEY
as
Begin
	DECLARE @V_sueldo_maximo MONEY
	SELECT @V_sueldo_maximo = MAX(SUELDO_VEN) FROM dbo.TB_VENDEDOR

	WHERE COD_DIS = @p_codDistrito

	RETURN @V_sueldo_maximo
end
go

DROP FUNCTION dbo.sueldo_maximo;

select COD_DIS, dbo.sueldo_maximo(COD_DIS) from dbo.TB_DISTRITO
go

SELECT * ,dbo.sueldo_maximo(cod_dis) as SUELDO_VEN from TB_DISTRITO
order by SUELDO_VEN desc
go

-- opcion 2:
-- falta poner nombre del distrito y que salga primero el sueldo maximo.
-- NOM_DIS
CREATE OR ALTER FUNCTION dbo.sueldoMaximo(@p_codDist CHAR(5))
RETURNS MONEY
AS
BEGIN
	DECLARE @p_sueldoMax MONEY
	SELECT @p_sueldoMax = MAX(SUELDO_VEN) FROM dbo.TB_VENDEDOR
	WHERE COD_DIS = @p_codDist

	RETURN @p_sueldoMax
END
GO

SELECT COD_DIS AS codigo_distrito, dbo.sueldoMaximo(COD_DIS) AS sueldo_maximo FROM dbo.TB_VENDEDOR
GO

-- OPCION 3:

CREATE OR ALTER FUNCTION dbo.sueldoMaximo(@p_codDist CHAR(5))
RETURNS MONEY
AS
BEGIN
    DECLARE @p_sueldoMax MONEY
    SELECT @p_sueldoMax = MAX(SUELDO_VEN) FROM dbo.TB_VENDEDOR
    WHERE COD_DIS = @p_codDist

    RETURN @p_sueldoMax
END

-- UN ANALISIS
select * from TB_DISTRITO

SELECT dbo.sueldoMaximo(COD_DIS) AS sueldo_maximo, COD_DIS AS codigo_distrito
FROM dbo.TB_VENDEDOR
GROUP BY COD_DIS
ORDER BY sueldo_maximo DESC
