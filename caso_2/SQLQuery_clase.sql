use Negocios
go

BEGIN TRY
	SELECT 1/0
	PRINT 'No genere error'
END TRY
BEGIN CATCH
	print error_number()
	print error_severity()
	print error_state()
	print error_procedure()
END CATCH
go

-- Ejemplo:
use Negocios
go

select * from Ventas.paises
SELECT * FROM Ventas.clientes


BEGIN
Declare @nompais varchar(30), @idpais char(3) = '001'
	--select * from Ventas.clientes where idpais='001'
	select @nompais=NombrePais
	from Ventas.paises
	where Idpais=@idpais

	BEGIN TRY
		--DELETE FROM Ventas.paises WHERE Idpais = '001'
		delete from Ventas.paises where Idpais=@idpais
	END TRY
	BEGIN CATCH
		print @@error
		print 'No se puede eliminar mi pais ' + @nompais
		print 'El error ocurrio en la linea ' + ltrim(error_line())
		print error_number()
		--print @@error
	END CATCH
END
GO


-------
-- Opcion 1:

create procedure usp_valida_edad
as
begin
Declare @edad smallint = 16

begin try
	if @edad >= 18
		print 'Es mayor de edad, Insertamos el registro' 
	else
		begin
			RAISERROR('No es mayor de edad', 16,1)
			print('Esto continua con mas codigo')	
		end
	end try
	begin catch
		print 'error'
	end catch
end
go
-- probando el sp
EXECUTE usp_valida_edad
-------

-- Opcion 2:
BEGIN TRY
    DECLARE @edad SMALLINT;

    IF @edad >= 18
    BEGIN
        PRINT 'Es mayor de edad, insertamos el registro'; 
    END
    ELSE
    BEGIN
        RAISERROR('No es mayor de edad', 16, 1);
        PRINT 'Esto continúa con más código';	
    END;
END TRY
BEGIN CATCH
    PRINT 'Se produjo un error: ' + ERROR_MESSAGE();
END CATCH;
go
-------


-- con este comando vamos a saber el error exacto
select * from  SYS.messages
--

select * from Compras.productos
go
-------

-- Ejemplo:
create or alter proc usp_nombre 
	@p_nombre varchar(100), @p_edad smallint
As
Begin 
	print 'El nombre ingresado es: ' + @p_nombre + 'y la edad: ' + ltrim(@p_edad)
End

-- probando el procedimiento
exec usp_nombre 'Williams', 20
go

-- Resolver opcion 2
-- crear un procedimiento almacenado para insertar un nuevo pais, los valores se debe 
-- ingresar como parametro con idpais y NombrePais
-- forma de ingresar: insert into value (idpais,NombrePais)
select * from Ventas.paises
go

CREATE OR ALTER PROCEDURE usp_InsertarPais
    @idpais INT,
    @NombrePais VARCHAR(100)
AS
BEGIN
    Begin try
		insert into Ventas.paises values (@idpais, @NombrePais)
	end try
	begin catch
		print 'ocurrio un error: ' + error_message() + 'en linea' + ltrim(error_line()) + 
		' en procedimiento' + error_procedure() -- error_line en un dato de tipo numerico.
	end catch
END
-- probando:
EXEC usp_InsertarPais @idpais = 014, @NombrePais = 'Rusia' --  Esto es como un return
go


-- Opcion 2:
select * from Ventas.paises
go

CREATE OR ALTER PROCEDURE usp_InsertarPais
    @idpais CHAR(3), 
    @p_nompais VARCHAR(100), 
    @p_mensaje VARCHAR(300) OUTPUT -- Agregar OUTPUT para devolver el mensaje
AS
BEGIN
    BEGIN TRY
        INSERT INTO Ventas.paises VALUES (@idpais, @p_nompais)
        SET @p_mensaje = 'El país se registró correctamente: ' + @idpais
    END TRY
    BEGIN CATCH
        SET @p_mensaje = 'Ocurrió un error: ' + ERROR_MESSAGE() + ' en línea ' + LTRIM(STR(ERROR_LINE())) + 
                         ' en procedimiento ' + ERROR_PROCEDURE() -- ERROR_LINE devuelve un número
    END CATCH
END

-- probando:
DECLARE @v_mensaje VARCHAR(50)
EXEC usp_InsertarPais @idpais = '017', @p_nompais = 'Pakistan', @p_mensaje = @v_mensaje OUTPUT
PRINT @v_mensaje
GO


-- Ejemplo:
-- Ejer parametro de salida
CREATE or Alter Procedure usp_suma
	@p_num1 int, @p_num2 int, @p_resultado int OUTPUT
as
Begin
	SET @p_resultado = @p_num1 + @p_num2
End

-- probando:
Declare @v_resultado int 
EXEC usp_suma 20, 50, @v_resultado output
print @v_resultado
GO


-- Practica 2:
select * from RRHH.empleados
select MAX(IdEmpleado) from RRHH.empleados -- idDistrito	
go

CREATE OR ALTER PROCEDURE uspInsertaEmpleado
    @p_ApeEmp varchar(50), @p_NomEmp varchar(50),
	@p_FecNac datetime, @p_DirEmp varchar(60),
	@p_idDist int, @p_fonoEmp varchar(15),
	@p_idCargo int, @p_FecContrata datetime,
    @P_resultado VARCHAR(300) OUTPUT
AS
Begin
declare @v_idEmp int
--Validamos la existencia del idDistrito porintegridad referencial
IF EXISTS(SELECT * FROM RRHH.Distritos WHERE idDistrito = @p_idDist)BEGIN--Calculamos el nuevo Id de empleado
	SELECT @v_idEmp = MAX(IdEmpleado) + 1FROM RRHH.empleados
	--controlamos el error en la inserción
	BEGIN TRY
	INSERT INTO RRHH.empleados VALUES(@v_idEmp,@p_ApeEmp,@p_NomEmp,@p_FecNac,@p_DirEmp,@p_idDist,@p_fonoEmp,@p_idCargo,@p_FecContrata)
	SET @P_resultado = 'El empleado con ID ' + trim(str(@v_idEmp))+' se insertó correctamente'
	END TRY
	BEGIN CATCH
	SET @P_resultado = 'Ocurrió un error con el insert ' +ERROR_PROCEDURE() + ' -- ' + ERROR_MESSAGE()
	END CATCH
	END
	ELSE
		SET @P_resultado = 'El distrito con ID ' + trim(str(@p_idDist))+' no exite'
End
GO
-- falta el exec


-- crear una vista
select * from RRHH.empleados
select IdEmpleado, NomEmpleado + '' + ApeEmpleado,datediff(YY.FecNac,GETDATE()), CAST.desCargo
from RRHH.empleados