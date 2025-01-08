/*
Script de Consulta Unificada - Tabla Inventario
Base de datos: DB_InventariosGlobal

Descripción:
Este script realiza una consulta combinada de inventarios entre dos bases de datos
diferentes utilizando UNION ALL. La consulta está diseñada para obtener una vista
unificada del inventario, combinando registros de la instancia local y de una 
instancia vinculada [LAY].

Estructura:
1. Subconsulta que une (UNION ALL):
  - Registros de DB_InventariosGlobal.dbo.Inventario
  - Registros de [LAY].[DB_InventariosGlobal].[dbo].[Inventario]
2. Filtrado por productos específicos (IDs: 1 y 281)
3. Ordenamiento por inventarioID

Campos seleccionados:
- inventarioID: Identificador único del inventario
- productoID: Identificador del producto
- regionID: Identificador de la región
- cantidad: Cantidad en inventario
- ultimaActualizacion: Timestamp de última modificación
- estado: Estado actual del inventario

Nota: La consulta utiliza UNION ALL para incluir todos los registros, incluyendo
duplicados si existieran.

*/

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
    WHERE productoID IN (1, 281)
    ORDER BY inventarioID;