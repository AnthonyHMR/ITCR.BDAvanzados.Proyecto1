/*
Procedimiento almacenado que recupera información detallada de un usuario específico.
Consolida datos de usuario desde dos fuentes diferentes (local y LAY), retornando los detalles 
personales y de contacto del usuario incluyendo su ID, nombre completo, email, teléfono y región asignada.

Parámetros:
    @usuarioID VARCHAR(9) - Identificador único del usuario que se desea consultar.
                           Debe ser un ID válido existente en la base de datos.
*/

USE DB_InventariosGlobal;
GO
CREATE OR ALTER PROC SP_002_UserInformation
(
    @usuarioID VARCHAR(9)
)
AS
BEGIN
    SELECT * FROM (
        SELECT 
            u.usuarioID,     -- ID único del usuario
            u.nombre,        -- Nombre del usuario
            u.apellido,      -- Apellido del usuario
            u.email,         -- Email del usuario
            u.telefono,      -- Teléfono del usuario
            u.regionID       -- ID de la región a la que pertenece
        FROM DB_InventariosGlobal.dbo.Usuario u              
        UNION ALL           
        SELECT 
            k.usuarioID,     
            k.nombre,       
            k.apellido,        
            k.email,
            k.telefono,
            k.regionID  
        FROM [LAY].[DB_InventariosGlobal].[dbo].[Usuario] k 
    ) AS UsuariosUnidos
    WHERE UsuariosUnidos.usuarioID = @usuarioID;
END
GO
-- Ejemplo de ejecución:
EXEC SP_002_UserInformation @usuarioID = '100030226';
GO

-- SELECT * FROM Usuario