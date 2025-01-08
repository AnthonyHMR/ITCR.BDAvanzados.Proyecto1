USE DB_InventariosGlobal;
GO
CREATE OR ALTER PROC SP_006_InsertRegion
(
    @nombre VARCHAR(100),
    @pais VARCHAR(50),
    @zonaHoraria VARCHAR(50)
)
AS
BEGIN
    -- Lista de países para la base de datos local
    IF @pais IN ('Argentina', 'Belice', 'Bolivia', 'Brasil', 'Chile', 
                 'Colombia', 'El Salvador', 'Guatemala', 'Haití', 'México')
    BEGIN
        -- Insertar en la base de datos local
        INSERT INTO DB_InventariosGlobal.dbo.Region 
            (nombre, pais, zonaHoraria)
        VALUES 
            (@nombre, @pais, @zonaHoraria);
            
        SELECT 'Registro insertado en DB_InventariosGlobal local' AS Resultado;
    END
    ELSE
    BEGIN
        -- Insertar en la base de datos remota
        INSERT INTO [LAY].[DB_InventariosGlobal].[dbo].[Region]
            (nombre, pais, zonaHoraria)
        VALUES 
            (@nombre, @pais, @zonaHoraria);
            
        SELECT 'Registro insertado en LAY.DB_InventariosGlobal' AS Resultado;
    END
END
GO

-- Ejemplos de uso:
-- Insertar región de México (irá a la base local)
EXEC SP_006_InsertRegion 
    @nombre = 'Guadalajara',
    @pais = 'México',
    @zonaHoraria = 'GMT-6';

-- Insertar región de España (irá a la base remota)
EXEC SP_006_InsertRegion 
    @nombre = 'Madrid',
    @pais = 'España',
    @zonaHoraria = 'GMT+1';