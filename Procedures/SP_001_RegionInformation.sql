USE DB_InventariosGlobal;
GO

CREATE OR ALTER PROC SP_001_RegionInformation
(
    @pais VARCHAR(50) = 'M�xico'
)
AS
BEGIN
    SELECT * FROM (
        SELECT 
            r.regionID,      -- ID �nico de la regi�n
            r.nombre,        -- Nombre de la regi�n
            r.pais,         -- Pa�s al que pertenece la regi�n
            r.zonaHoraria   -- Zona horaria de la regi�n
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

-- Ejemplo de ejecuci�n (debes especificar un pa�s):
EXEC SP_001_RegionInformation @pais = 'Argentina';
GO