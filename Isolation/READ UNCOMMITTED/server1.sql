USE DB_InventariosGlobal;
GO

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED 
SELECT * FROM [LAY].[DB_InventariosGlobal].[dbo].[Inventario]
WHERE inventarioID = 281 AND productoID = 281;


