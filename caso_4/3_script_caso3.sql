/* 
_ Cree un trigger que permita auditar los cambios (UPDATE) del sueldo de la tabla 
TB_VENDEDOR, para ello cree la tabla ADITA_SUELDOS que permita guardar:

El tipo de modificaci�n (UPDATE SUELDO)
La fecha de modificaci�n
El HOSTNAME que realiz� la operaci�n
El nombre del usuario de sistema operativo
El COD_VEN que se le aplic� el cambio
El sueldo (SUELDO_VEN) antes del cambio
El sueldo (SUELDO_VEN) despu�s del cambio

*/

use VENTASUPN
go


CREATE TABLE   TB_VENDEDOR(
COD_VEN CHAR(3)NOT NULL PRIMARY KEY ,
NOM_VEN VARCHAR(20)NOT NULL,
APE_VEN VARCHAR(20)NOT NULL,
SUELDO_VEN MONEY NOT NULL,
FEC_ING DATE NOT NULL, 
TIP_VEN VARCHAR(10)NOT NULL,
COD_DIS CHAR(5)NOT NULL REFERENCES TB_DISTRITO
)

-- resolver: