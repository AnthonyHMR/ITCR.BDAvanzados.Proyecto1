/*
Script de Actualización Transaccional - Tabla Inventario
Base de datos: DB_InventariosGlobal

Descripción:
Este script realiza una operación de actualización sobre el inventario dentro de una
transacción explícita. Primero consulta el estado actual del inventario y luego
reduce la cantidad en 10 unidades para un registro específico.

Operaciones:
1. Consulta inicial del estado del inventario
2. Inicio de transacción 'invent'
3. Actualización de cantidad (reducción de 10 unidades)
4. Transacción pendiente de confirmación (COMMIT comentado)

Nota importante: 
- La transacción queda pendiente de confirmación (COMMIT está comentado)
- Los cambios permanecerán en estado provisional hasta que se confirme o revierta la transacción
- Es necesario ejecutar explícitamente COMMIT TRANSACTION o ROLLBACK TRANSACTION 
  para finalizar la transacción

*/

USE DB_InventariosGlobal;
GO

SELECT * FROM Inventario

BEGIN TRANSACTION invent

UPDATE Inventario
SET cantidad = cantidad - 10
WHERE inventarioID = 281 AND productoID = 281;

-- COMMIT TRANSACTION invent