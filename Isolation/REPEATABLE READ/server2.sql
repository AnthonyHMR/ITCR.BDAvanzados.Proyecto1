/*
Script de Actualizaci�n Transaccional con Aislamiento - Tabla Inventario
Base de datos: DB_InventariosGlobal

Descripci�n:
Este script realiza una actualizaci�n de inventario dentro de una transacci�n con
nivel de aislamiento REPEATABLE READ. La operaci�n est� dise�ada para garantizar
la consistencia en la lectura durante toda la transacci�n.

Operaciones secuenciales:
1. Consulta inicial del estado del inventario
2. Establecimiento del nivel de aislamiento REPEATABLE READ
3. Inicio de transacci�n 'invent'
4. Actualizaci�n de cantidad (reducci�n de 10 unidades)
5. Transacci�n pendiente de confirmaci�n

Caracter�sticas del nivel de aislamiento REPEATABLE READ:
- Previene lecturas sucias
- Garantiza lecturas consistentes durante la transacci�n
- Evita lecturas no repetibles
- Mantiene bloqueos en los datos le�dos hasta el fin de la transacci�n

Notas importantes:
- La transacci�n queda pendiente (COMMIT comentado)
- Los bloqueos se mantendr�n hasta la confirmaci�n o reversi�n
- Otros procesos no podr�n modificar los datos le�dos por esta transacci�n

*/

USE DB_InventariosGlobal;
GO

SELECT * FROM Inventario

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ

BEGIN TRANSACTION invent

UPDATE Inventario
SET cantidad = cantidad - 10
WHERE inventarioID = 281 AND productoID = 281;

-- COMMIT TRANSACTION�invent