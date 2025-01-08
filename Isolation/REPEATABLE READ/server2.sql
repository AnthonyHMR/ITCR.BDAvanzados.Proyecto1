USE DB_InventariosGlobal;
GO

SELECT * FROM Inventario

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ

BEGIN TRANSACTION invent

UPDATE Inventario
SET cantidad = cantidad - 10
WHERE inventarioID = 281 AND productoID = 281;

-- COMMIT TRANSACTION invent