USE DB_InventariosGlobal;
GO

BEGIN TRANSACTION invent

UPDATE Inventario
SET cantidad = cantidad - 10
WHERE inventarioID = 281 AND productoID = 281;

-- COMMIT TRANSACTION invent