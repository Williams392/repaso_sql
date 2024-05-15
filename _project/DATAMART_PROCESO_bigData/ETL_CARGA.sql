
Use datamartventa
go
--Paso 1: Limpiamos tablas
delete from fac_ventas
DBCC CHECKIDENT ( 'fac_ventas', RESEED, 0 )
go
delete from dim_producto
DBCC CHECKIDENT ( 'dim_producto', RESEED, 0 )
go
delete from dim_cliente
DBCC CHECKIDENT ( 'dim_cliente', RESEED, 0 )
go
delete from dim_canal
DBCC CHECKIDENT ( 'dim_canal', RESEED, 0 )
go
delete from dim_metodoPago
DBCC CHECKIDENT ( 'dim_metodoPago', RESEED, 0 )
go
delete from dim_tiempo
go
truncate table stg_operacion
go
truncate table stg_CANAL
go
truncate table stg_metodoPago
go

------------------------------------------------------------------------------------------------------

--paso 2
use Negocios
go

--Cargamos la dimension cliente
insert into datamartventa.dbo.dim_cliente
select IdCliente as pk_cliente,NomCliente as nombre,P.NombrePais pais from Ventas.clientes C
join Ventas.paises P on C.idpais = P.Idpais
go

select * from datamartventa.dbo.dim_cliente
go

--Cargamos la dimension PRODUCTO 
insert into datamartventa.dbo.dim_producto
select P.IdProducto pk_producto,P.NomProducto nombre, NombreCategoria categoria from Compras.categorias C 
join Compras.productos P on C.IdCategoria = P.IdCategoria
go
select * from datamartventa.dbo.dim_producto
go

--Cargamos la dimension tiempo
Declare @inicio date, @fin date
select @inicio = Min(FechaPedido) , @fin = Max(FechaPedido)  from Ventas.pedidoscabe

WHILE (@inicio <= @fin)
	BEGIN

		INSERT INTO datamartventa.dbo.dim_tiempo
		SELECT @inicio fecha, DATEPART(yyyy, @inicio) anio, DATEPART(m, @inicio) mes, DATEPART(d, @inicio) diaMes,
			CASE DATEPART(dw, @inicio)
					WHEN 1 THEN 'Domingo'
					WHEN 2 THEN 'Lunes'
					WHEN 3 THEN 'Martes'
					WHEN 4 THEN 'Miércoles'
					WHEN 5 THEN 'Jueves'
					WHEN 6 THEN 'Viernes'
					WHEN 7 THEN 'Sábado'
				END AS diaSemana,
				DATEPART(q, @inicio) AS trimstre

		SET @inicio = DATEADD(d, 1, @inicio);
	end
go

select * from datamartventa.dbo.dim_tiempo
go

------------------------------------------------------------------------------------------------------

--cargamos stagin operacion || YO: D:\txt  ----------
BEGIN
  DECLARE @ARCHIVO VARCHAR(100), @DELIMITADOR CHAR(1)
  SET @ARCHIVO = 'E:\txt_bd\txt_profe_semana7\operacionVenta.txt'

  --cargar datos a partir de un archivo plano
  DECLARE @sql VARCHAR(MAX)
   SET @sql = 'BULK INSERT datamartventa.dbo.stg_operacion' +
              ' FROM ''' + @ARCHIVO + ''' WITH (FIELDTERMINATOR =''|'', ROWTERMINATOR = ''\n'', FIRSTROW = 2)'
   EXEC(@sql)
END
go

select * from datamartventa.dbo.stg_operacion
go

/* En caso falle el sql dinámico usar lo siguiente

Bulk insert datamartventa.dbo.stg_operacion
	  from 'D:\txt\operacionVenta.txt'
	  WITH
	  (FIRSTROW = 2,
	  FIELDTERMINATOR='|')
*/

--Cargar DIM_CANAL
Bulk insert datamartventa.dbo.stg_CANAL
	  from 'E:\txt_bd\txt_profe_semana7\canales.txt'
	  WITH
	  (FIRSTROW = 1,
	  FIELDTERMINATOR=',', ROWTERMINATOR = '\n')
go

Insert into datamartventa.dbo.dim_canal
select * from datamartventa.dbo.stg_CANAL
go

select * from datamartventa.dbo.dim_canal

--Cargar DIM_METODOP
Bulk insert datamartventa.dbo.stg_metodoPago
	  from 'E:\txt_bd\txt_profe_semana7\metodopago.txt'
	  WITH
	  (FIRSTROW = 1,
	  FIELDTERMINATOR=',', ROWTERMINATOR = '\n')
go

Insert into datamartventa.dbo.dim_metodoPago
select * from datamartventa.dbo.stg_metodoPago
go

select * from datamartventa.dbo.dim_metodoPago
go

------------------------------------------------------------------------------------------------------
--cargar la FAC Ventas (tabla de hechos) --Esta es la parte importante y dificil:

insert into datamartventa.dbo.fac_ventas
Select D_CL.id_cliente,D_PR.id_producto,D_CA.id_canal,D_MP.id_metodoP, cast(FechaPedido as date) fecha,
		sum(Cantidad) cantidad,sum(cantidad*PrecioUnidad) subTotal,  
		sum(cantidad*PrecioUnidad*Descuento) descuento,
		sum(cantidad*PrecioUnidad*(1-Descuento)) total
from Ventas.pedidoscabe PC 
join Ventas.pedidosdeta PD on PD.IdPedido = PC.IdPedido
join datamartventa.dbo.stg_operacion OP on OP.idVenta = PC.IdPedido
Join datamartventa.dbo.dim_producto D_PR on D_PR.pk_producto = IdProducto
Join datamartventa.dbo.dim_cliente D_CL on D_CL.pk_cliente = IdCliente
join datamartventa.dbo.dim_canal D_CA on D_CA.pk_canal = OP.canal
join datamartventa.dbo.dim_metodoPago D_MP on D_MP.pk_metodoP = OP.metodoPago
group by D_CL.id_cliente,D_PR.id_producto,D_CA.id_canal,D_MP.id_metodoP,cast(FechaPedido as date)
go

select * from datamartventa.dbo.fac_ventas
go