/*
Script de Actualizaci�n Transaccional - Tabla Inventario
Base de datos: DB_InventariosGlobal

Descripci�n:
Este script realiza una operaci�n de actualizaci�n sobre el inventario dentro de una
transacci�n expl�cita. Primero consulta el estado actual del inventario y luego
reduce la cantidad en 10 unidades para un registro espec�fico.

Operaciones:
1. Consulta inicial del estado del inventario
2. Inicio de transacci�n 'invent'
3. Actualizaci�n de cantidad (reducci�n de 10 unidades)
4. Transacci�n pendiente de confirmaci�n (COMMIT comentado)

Nota importante: 
- La transacci�n queda pendiente de confirmaci�n (COMMIT est� comentado)
- Los cambios permanecer�n en estado provisional hasta que se confirme o revierta la transacci�n
- Es necesario ejecutar expl�citamente COMMIT TRANSACTION o ROLLBACK TRANSACTION 
  para finalizar la transacci�n

*/

USE DB_InventariosGlobal;
GO

SELECT * FROM Inventario

BEGIN TRANSACTION invent

UPDATE Inventario
SET cantidad = cantidad - 10
WHERE inventarioID = 281 AND productoID = 281;

-- COMMIT TRANSACTION�invent