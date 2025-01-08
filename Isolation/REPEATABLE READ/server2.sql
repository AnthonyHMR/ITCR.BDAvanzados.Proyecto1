/*
Script de Actualización Transaccional con Aislamiento - Tabla Inventario
Base de datos: DB_InventariosGlobal

Descripción:
Este script realiza una actualización de inventario dentro de una transacción con
nivel de aislamiento REPEATABLE READ. La operación está diseñada para garantizar
la consistencia en la lectura durante toda la transacción.

Operaciones secuenciales:
1. Consulta inicial del estado del inventario
2. Establecimiento del nivel de aislamiento REPEATABLE READ
3. Inicio de transacción 'invent'
4. Actualización de cantidad (reducción de 10 unidades)
5. Transacción pendiente de confirmación

Características del nivel de aislamiento REPEATABLE READ:
- Previene lecturas sucias
- Garantiza lecturas consistentes durante la transacción
- Evita lecturas no repetibles
- Mantiene bloqueos en los datos leídos hasta el fin de la transacción

Notas importantes:
- La transacción queda pendiente (COMMIT comentado)
- Los bloqueos se mantendrán hasta la confirmación o reversión
- Otros procesos no podrán modificar los datos leídos por esta transacción

*/

USE DB_InventariosGlobal;
GO

SELECT * FROM Inventario

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ

BEGIN TRANSACTION invent

UPDATE Inventario
SET cantidad = cantidad - 10
WHERE inventarioID = 281 AND productoID = 281;

-- COMMIT TRANSACTION invent