/*
Procedimiento almacenado que recupera información consolidada de regiones para un país específico.
Combina datos de regiones desde dos fuentes diferentes (local y LAY) y permite filtrar por país.
Los datos retornados incluyen el ID de región, nombre, país y zona horaria.

Parámetros:
    @pais VARCHAR(50) = 'México' - País del cual se desea obtener la información regional. 
                                  México es el valor predeterminado.
*/

USE DB_InventariosGlobal;
GO

CREATE OR ALTER PROC SP_001_RegionInformation
(
    @pais VARCHAR(50) = 'México'
)
AS
BEGIN
    SELECT * FROM (
        SELECT 
            r.regionID,      -- ID único de la región
            r.nombre,        -- Nombre de la región
            r.pais,         -- País al que pertenece la región
            r.zonaHoraria   -- Zona horaria de la región
        FROM DB_InventariosGlobal.dbo.Region r              
        UNION ALL           
        SELECT 
            k.regionID,     
            k.nombre,       
            k.pais,        
            k.zonaHoraria  
        FROM [LAY].[DB_InventariosGlobal].[dbo].[Region] k 
    ) AS RegionesUnidas
    WHERE RegionesUnidas.pais = @pais;
END
GO

-- Ejemplo de ejecución (debes especificar un país):
EXEC SP_001_RegionInformation @pais = 'Argentina';
GO