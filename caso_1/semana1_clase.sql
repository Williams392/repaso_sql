
DECLARE @numero SMALLINT
BEGIN 
	SET @numero = 100
	PRINT @numero
END

-- Bloque para el  nombre:
DECLARE @name VARCHAR(10), @edad smallint
BEGIN 
	SET @name ='Williams'
	set @edad = 20
	PRINT 'Mi nombre es: ' + @name
	PRINT 'Mi edad es:' + str(@edad)
END



-- Suma de dos Numeros:
-- opcion1:
DECLARE @a int, @b int
BEGIN 
	SET @a = 5
	set @b = 20
	PRINT @a + @b
END

-- opcion2:
DECLARE @num1 int=50, @num2 int=60, @resultado int
BEGIN 
	SET @resultado = @num1 + @num2
	PRINT 'El resultado es: ' + cast(@resultado as varchar(4))
END



-- Variables Globales:
 print @@version
 print @@servername 



 ----------------------------
 -- Activando la BD negocios:
 ----------------------------
 use Negocios
 go

 declare @cant_empl int 
 BEGIN 
	
	SELECT @cant_empl = COUNT(*) 
	FROM RRHH.empleados

	PRINT 'La cantidad de empleados es: ' + CAST(@cant_empl AS VARCHAR(5)) --el CAST es para contactenar para no sumarlo.

	IF @cant_empl%2 = 0 --	Una estructura condicional atraves del if
		begin
			PRINT 'ES PAR' -- si es 2 lineas si o si usar el begin-end.
			PRINT 'ES PAR'
		end
	ELSE 
		begin
			PRINT 'ES INPAR'
		end
 END


-- repetitiva con While
DECLARE @NUM3 SMALLINT = 0
WHILE @NUM3 <= 10
BEGIN
	PRINT @NUM3
	SET @NUM3 += 1
END

DECLARE @NUM5 SMALLINT = 5
WHILE @NUM5 <= 100
BEGIN
	PRINT @NUM5
	SET @NUM5 = @NUM5 + 5
END

-- Mutiplicacion x 5
DECLARE @NUM INT = 0 
BEGIN
	WHILE @NUM <= 20
	BEGIN
		PRINT '5 X ' + LTRIM( STR(@NUM)) + ' = '+ LTRIM(STR(5 * @NUM)) --LTRIN quita el espacio.
		SET @NUM += 1
	END
END
GO

-- bucle while y con if:
DECLARE @NUM SMALLINT = 1, @ESPAR int = 0, @ESINPAR int = 0
BEGIN
	WHILE @NUM <= 100
	BEGIN

		IF @NUM%2 = 0 
			begin
				PRINT LTRIM(STR(@NUM)) + ' ES PAR' 
				SET @ESPAR += 1
			end
		ELSE 
			begin
				PRINT LTRIM(STR(@NUM)) + ' ES IMPAR' 
				SET @ESINPAR += 1
			end

		SET @NUM += 1
	END
		PRINT 'LA CANTIDAD DE PARE ES: ' + STR(@ESPAR)
		PRINT 'LA CANTIDAD DE INPARES ES: ' + STR(@ESINPAR)
END
GO


-- Longitud que el nombre original

-- Cambiar el codigo para saber ahora cuantas vocales y constantes
-- Opcion 1:
DECLARE 
@v_nombre varchar(100),
@v_asteriscos varchar(100) = '',
@v_caracteres int
BEGIN
	SET @v_nombre = 'WILLIAMS'
	-- SET @v_asteriscos = LEN(@v_nombre)
	SET @v_caracteres = LEN(@v_nombre)
	WHILE @v_caracteres > 0
	BEGIN
		SET @v_asteriscos = @v_asteriscos +'*'
		SET @v_caracteres -= 1
	END
	-- Mostramos el enmascarado
	PRINT @v_nombre + '-->' + @v_asteriscos
END
GO

-- Opcion 2:
DECLARE 
    @v_nombre varchar(100),
    @v_asteriscos varchar(100) = '',
    @v_caracteres int,
    @v_vocales int = 0,
    @v_consonantes int = 0
BEGIN
    SET @v_nombre = 'WILLIAMS'
    SET @v_caracteres = LEN(@v_nombre)
    WHILE @v_caracteres > 0
    BEGIN
        SET @v_asteriscos = @v_asteriscos +'*'
        SET @v_caracteres -= 1
    END
    -- Contar vocales y consonantes
    DECLARE @i int = 1, @caracter varchar(1)
    WHILE @i <= LEN(@v_nombre)
    BEGIN
        SET @caracter = SUBSTRING(@v_nombre, @i, 1)
        IF @caracter IN ('A', 'E', 'I', 'O', 'U', 'a', 'e', 'i', 'o', 'u')
            SET @v_vocales = @v_vocales + 1
        ELSE 
            SET @v_consonantes = @v_consonantes + 1
        SET @i = @i + 1
    END
    -- Se Mostramos el enmascarado y el conteo de vocales y consonantes
    PRINT @v_nombre + '-->' + @v_asteriscos
    PRINT 'Vocales: ' + CAST(@v_vocales AS varchar)
    PRINT 'Consonantes: ' + CAST(@v_consonantes AS varchar)
END
GO

-- Opcion 3:
DECLARE 
@v_nombre varchar(100), @INDICE INT = 1,
@v_caracteres int, @CARACTER VARCHAR(1), @VOCALES INT = 0, @CONSONANTES INT = 0
BEGIN
	SET @v_nombre = 'WILLIAMS'
	SET @v_caracteres = LEN(@v_nombre)

	WHILE @INDICE <= @v_caracteres
	BEGIN
		SET @CARACTER = SUBSTRING(@v_nombre, @INDICE, 1) -- el SUBSTRING para sacar caracter x caracter

		IF @CARACTER IN ('a', 'e', 'i', 'o', 'u')
			SET @VOCALES += 1
		ELSE 
			SET @CONSONANTES += 1

		SET @INDICE += 1
	END
	-- Mostramos 
	PRINT 'VOCALES: ' + STR(@VOCALES)
	PRINT 'CONSONANTES: ' + STR(@CONSONANTES)
END
GO