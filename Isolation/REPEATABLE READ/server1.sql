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
    WHERE productoID IN (1, 281)
    ORDER BY inventarioID;