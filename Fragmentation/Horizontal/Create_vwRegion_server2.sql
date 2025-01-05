-- ================================================================
-- Descripción: Crea una vista que combina los datos de Region de ambos
--              servidores, proporcionando una vista global de todas las regiones
-- 
-- Notas importantes: 
--    1. Reemplazar [KUN] por el nombre de tu servidor vinculado
--    2. Verificar que ambas tablas Region tengan la misma estructura
--    3. Asegurar que existan los permisos necesarios en ambos servidores
-- ================================================================

USE DB_InventariosGlobal;
GO

-- Eliminar la vista si ya existe para evitar errores
IF EXISTS (SELECT * FROM sys.views WHERE name = 'vwRegion')
    DROP VIEW vwRegion;
GO

-- Crear vista que une los datos de Region de ambos servidores
CREATE VIEW vwRegion AS
SELECT 
    r.regionID,      -- ID único de la región
    r.nombre,        -- Nombre de la región
    r.pais,         -- País al que pertenece la región
    r.zonaHoraria   -- Zona horaria de la región
FROM DB_InventariosGlobal.dbo.Region r              -- Tabla Region del servidor local
UNION ALL           -- Usar UNION ALL para incluir todos los registros (incluso duplicados)
SELECT 
    k.regionID,     
    k.nombre,       
    k.pais,        
    k.zonaHoraria  
FROM [KUN].[DB_InventariosGlobal].[dbo].[Region] k; -- Tabla Region del servidor remoto
                                                     -- IMPORTANTE: Reemplazar [KUN] por el nombre
                                                     -- de tu servidor vinculado
GO

-- Comando para probar la vista una vez creada
-- SELECT * FROM dbo.vwRegion;