/*
Script de Actualizaci�n y Consulta Distribuida - Tabla Inventario
Base de datos: DB_InventariosGlobal

Descripci�n:
Este script realiza una actualizaci�n en una instancia vinculada de la base de datos
seguida de una consulta unificada que compara los inventarios entre ambas instancias.
La operaci�n est� dise�ada para sincronizar y verificar el estado del inventario
entre diferentes ubicaciones de la base de datos.

Operaciones:
1. Actualizaci�n en la instancia vinculada [LAY]:
  - Incremento de 10 unidades en la cantidad
  - Filtrado por inventarioID y productoID espec�ficos

2. Consulta unificada mediante UNION ALL:
  - Combina registros de la instancia local y vinculada
  - Selecciona campos espec�ficos con comentarios descriptivos
  - Filtra espec�ficamente el productoID 281
  - Ordena resultados por inventarioID

Consideraciones importantes:
- La actualizaci�n afecta solo a la instancia vinculada [LAY]
- La consulta posterior permite verificar la sincronizaci�n entre instancias
- El uso de UNION ALL mantiene posibles duplicados para validaci�n

*/

UPDATE [LAY].[DB_InventariosGlobal].[dbo].[Inventario]
SET cantidad = cantidad + 10
WHERE inventarioID = 281 AND productoID = 281;

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
    WHERE productoID IN (281)
    ORDER BY inventarioID;