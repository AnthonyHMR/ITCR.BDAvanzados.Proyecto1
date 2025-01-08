/*
Procedimiento almacenado que recupera información consolidada del inventario según su estado.
Combina registros de inventario desde dos fuentes diferentes (local y LAY) y retorna detalles 
completos incluyendo IDs de inventario, producto y región, cantidad, fecha de última actualización 
y estado. Los resultados se ordenan por ID de inventario.

Parámetros:
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
            i.inventarioID,           -- ID único del inventario
            i.productoID,             -- ID del producto
            i.regionID,               -- ID de la región
            i.cantidad,               -- Cantidad en inventario
            i.ultimaActualizacion,    -- Fecha de última actualización
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

-- Ejemplo de ejecución:
EXEC SP_004_InventoryInformation @estado = 'Disponible';
GO