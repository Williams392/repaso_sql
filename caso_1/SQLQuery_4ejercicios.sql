-- Pregunta 1:
/* Usando la BD Negocios, elaborar un bloque Transact SQL que permita recuperar la cantidadde clientes de
   un determinado país (use una variable para ingresar el código de país). Deberámostrar los siguientes 
   mensajes: si la cantidad es Cero: “El País no está asociado a ningúnCliente”. Si la cantidad es mayor 
   igual Uno pero menor a 10: “El país está asociado a una cantidadregular de clientes”, caso contrario 
   “El país está asociado a una cantidad importante declientes”                                        */


use Negocios
go

SELECT * FROM Ventas.paises;
SELECT * FROM Ventas.clientes;

-- obtener ---
SELECT 
    c.IdCliente, c.NomCliente, c.DirCliente,
    p.Idpais, p.NombrePais
FROM 
    Ventas.clientes c
JOIN 
    Ventas.paises p ON c.idpais = p.Idpais;

 --  Obteniendo la cantidad de clientes de cada Pais y cantidad:
SELECT p.Idpais, p.NombrePais, COUNT(c.IdCliente) AS NumeroClientes
FROM Ventas.paises p
LEFT JOIN Ventas.clientes c ON p.Idpais = c.idpais
GROUP BY p.Idpais, p.NombrePais;
go

DECLARE @NombrePais VARCHAR(40) = 'Chile';
DECLARE @cantidClientes INT;
BEGIN
	SELECT @cantidClientes = COUNT(*)
	FROM Ventas.clientes
	WHERE idpais = (SELECT Idpais FROM Ventas.paises WHERE NombrePais = @NombrePais);

	IF @cantidClientes = 0
		PRINT 'El País ' + @NombrePais + ' no esta asociado a ningún Cliente';
	ELSE IF @cantidClientes >= 1 AND @cantidClientes < 10
		PRINT 'El país ' + @NombrePais + ' esta asociado a una cantidad regular de clientes';
	ELSE
		PRINT 'El país ' + @NombrePais + ' esta asociado a una cantidad importante de clientes';
END
go

-----------------------------------------------------------
-- Pregunta 2:
/* 
Usando la BD Northwind crear un bloque Transact SQL que imprima la edad 
(BirthDate)mínima y máxima de la tabla empleados (EMPLOYEES), cuyo país sea USA.
*/


USE Northwind;
go

BEGIN
    DECLARE @MinAge INT, @MaxAge INT;

    SELECT 
        @MinAge = MIN(DATEDIFF(YEAR, BirthDate, GETDATE())),
        @MaxAge = MAX(DATEDIFF(YEAR, BirthDate, GETDATE()))
    FROM 
        Employees
    WHERE 
        Country = 'USA';

    PRINT 'Edad mínima: ' + CAST(@MinAge AS VARCHAR(10));
    PRINT 'Edad máxima: ' + CAST(@MaxAge AS VARCHAR(10));
END
go


-----------------------------------------------------------
-- Pregunta 3:
/* 
Usando la BD Northwind crear un bloque Transact SQL que permita hallar 
el total deempleados que ingresaron a laborar (Hiredate) en el año 1993.
*/


USE Northwind;
go

SELECT * FROM Employees; -- Empleados

BEGIN
    SELECT 
        FirstName + ' ' + LastName AS EmployeeName,
        HireDate
    FROM 
        Employees
    WHERE 
        YEAR(HireDate) = 1993
    ORDER BY 
        HireDate;
END
go

-----------------------------------------------------------
-- Pregunta 4:
/* 
Desarrolle un bloque Transact SQL en el cual se ingrese una palabra 
y permita contar lacantidad de vocales y consonantes. No se deben 
contabilizar las vocales o consonantesrepetidas.
*/

DECLARE 
@v_nombre varchar(100), @INDICE INT = 1, @v_caracteres int,
@CARACTER VARCHAR(1), @VOCALES INT = 0, @CONSONANTES INT = 0;
BEGIN
	SET @v_nombre = 'WILLIAMS';
	SET @v_caracteres = LEN(@v_nombre);

	WHILE @INDICE <= @v_caracteres
	BEGIN
		SET @CARACTER = SUBSTRING(@v_nombre, @INDICE, 1); -- Extraemos el caracter uno por uno

		IF @CARACTER IN ('a', 'e', 'i', 'o', 'u')
			SET @VOCALES += 1;
		ELSE 
			SET @CONSONANTES += 1;

		SET @INDICE += 1;
	END

	-- Mostramos los resultados
	PRINT 'VOCALES: ' + STR(@VOCALES);
	PRINT 'CONSONANTES: ' + STR(@CONSONANTES);
END
GO