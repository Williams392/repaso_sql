Use datamartSodimac
go

delete from dim_producto
DBCC CHECKIDENT ( 'dim_producto', RESEED, 0 )
go
delete from dim_cliente
DBCC CHECKIDENT ( 'dim_cliente', RESEED, 0 )
go
delete from dim_tiempo
go
delete from dim_ubicacion
go
delete from dim_empleado
DBCC CHECKIDENT ( 'dim_empleado', RESEED, 0 )
go
delete from fac_ventas;
DBCC CHECKIDENT ('fac_ventas', RESEED, 0);
go

-- paso2:

use sodimac_BD
go

-- Cargamos la dimension cliente
insert into datamartSodimac.dbo.dim_cliente
select id_clientes as pk_cliente,nombres as nombres, apellido as apellido,P.distrito distrito from dbo.TB_CLIENTES C
join dbo.TB_UBICACION P on C.id_ubicacion = P.id_ubicacion
GO

SELECT * FROM datamartSodimac.dbo.dim_cliente


-- Cargamos la dimension producto
insert into datamartSodimac.dbo.dim_producto
select P.id_producto AS pk_producto,P.nombre nombre, tipo categoria from dbo.TB_CATEGORIA C 
join dbo.TB_PRODUCTO P on C.id_categoria = P.id_categoria
go

SELECT * FROM datamartSodimac.dbo.dim_producto

-- Cargamos la dimension tiempo
INSERT INTO datamartSodimac.dbo.dim_tiempo
SELECT fecha_pedido as fecha_pedido, fecha_entrega as fecha_entrega,
DATEDIFF(day, fecha_pedido, fecha_entrega) AS diferencia
FROM TB_PEDIDO
go

SELECT * FROM datamartSodimac.dbo.dim_tiempo

-- Cargar la dimension ubicación
INSERT INTO datamartSodimac.dbo.dim_ubicacion
SELECT * FROM TB_UBICACION
go

select * from datamartSodimac.dbo.dim_ubicacion
go

-- Cargar la dimensión empleado
INSERT INTO datamartSodimac.dbo.dim_empleado
SELECT id_empleado as pk_empleado, nombre, apellido, estado FROM TB_EMPLEADO
go

select * from datamartSodimac.dbo.dim_empleado
go

-- paso 1:

--cargar la FAC Ventas (tabla de hechos)
INSERT INTO datamartSodimac.dbo.fac_ventas
SELECT D_CL.id_cliente, D_EM.id_empleado, D_UB.id_ubicacion, D_PR.id_producto, D_T.fecha_pedido, P.fecha_entrega, DATEDIFF(day, P.fecha_pedido, P.fecha_entrega) AS diferencia
FROM dbo.TB_PEDIDO P
JOIN datamartSodimac.dbo.dim_cliente D_CL ON D_CL.pk_cliente = P.id_clientes
JOIN datamartSodimac.dbo.dim_empleado D_EM ON D_EM.pk_empleado = P.id_empleado
JOIN datamartSodimac.dbo.dim_ubicacion D_UB ON D_UB.id_ubicacion = P.id_ubicacion
JOIN dbo.TB_detallePEDIDO DP ON DP.id_pedido = P.id_pedido
JOIN datamartSodimac.dbo.dim_producto D_PR ON D_PR.pk_producto = DP.id_producto
JOIN datamartSodimac.dbo.dim_tiempo D_T ON D_T.fecha_entrega = P.fecha_entrega

SELECT * FROM datamartSodimac.dbo.fac_ventas


	