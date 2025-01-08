/*
Procedimiento almacenado que recupera informaci�n consolidada del inventario seg�n su estado.
Combina registros de inventario desde dos fuentes diferentes (local y LAY) y retorna detalles 
completos incluyendo IDs de inventario, producto y regi�n, cantidad, fecha de �ltima actualizaci�n 
y estado. Los resultados se ordenan por ID de inventario.

Par�metros:
    @estado VARCHAR(50) = 'Disponible' - Estado del inventario a consultar.
                                        'Disponible' es el valor predeterminado.
*/

USE DB_InventariosGlobal;
GO
CREATE OR ALTER PROC SP_004_InventoryInformation
(
    @estado VARCHAR(50) = 'Disponible'
)
AS
BEGIN
    SELECT * FROM (
        SELECT 
            i.inventarioID,           -- ID �nico del inventario
            i.productoID,             -- ID del producto
            i.regionID,               -- ID de la regi�n
            i.cantidad,               -- Cantidad en inventario
            i.ultimaActualizacion,    -- Fecha de �ltima actualizaci�n
            i.estado                  -- Estado del inventario
        FROM DB_InventariosGlobal.dbo.Inventario i              
        UNION ALL           
        SELECT 
            k.inventarioID,     
            k.productoID,       
            k.regionID,        
            k.cantidad,
            k.ultimaActualizacion,
            k.estado
        FROM [LAY].[DB_InventariosGlobal].[dbo].[Inventario] k 
    ) AS InventariosUnidos
    WHERE InventariosUnidos.estado = @estado
    ORDER BY inventarioID;
END
GO

-- Ejemplo de ejecuci�n:
EXEC SP_004_InventoryInformation @estado = 'Disponible';
GO