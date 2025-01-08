/*
Script de Actualización y Consulta Distribuida - Tabla Inventario
Base de datos: DB_InventariosGlobal

Descripción:
Este script realiza una actualización en una instancia vinculada de la base de datos
seguida de una consulta unificada que compara los inventarios entre ambas instancias.
La operación está diseñada para sincronizar y verificar el estado del inventario
entre diferentes ubicaciones de la base de datos.

Operaciones:
1. Actualización en la instancia vinculada [LAY]:
  - Incremento de 10 unidades en la cantidad
  - Filtrado por inventarioID y productoID específicos

2. Consulta unificada mediante UNION ALL:
  - Combina registros de la instancia local y vinculada
  - Selecciona campos específicos con comentarios descriptivos
  - Filtra específicamente el productoID 281
  - Ordena resultados por inventarioID

Consideraciones importantes:
- La actualización afecta solo a la instancia vinculada [LAY]
- La consulta posterior permite verificar la sincronización entre instancias
- El uso de UNION ALL mantiene posibles duplicados para validación

*/

UPDATE [LAY].[DB_InventariosGlobal].[dbo].[Inventario]
SET cantidad = cantidad + 10
WHERE inventarioID = 281 AND productoID = 281;

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
    WHERE productoID IN (281)
    ORDER BY inventarioID;