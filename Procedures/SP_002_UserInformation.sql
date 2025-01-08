/*
Procedimiento almacenado que recupera informaci�n detallada de un usuario espec�fico.
Consolida datos de usuario desde dos fuentes diferentes (local y LAY), retornando los detalles 
personales y de contacto del usuario incluyendo su ID, nombre completo, email, tel�fono y regi�n asignada.

Par�metros:
    @usuarioID VARCHAR(9) - Identificador �nico del usuario que se desea consultar.
                           Debe ser un ID v�lido existente en la base de datos.
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
            u.usuarioID,     -- ID �nico del usuario
            u.nombre,        -- Nombre del usuario
            u.apellido,      -- Apellido del usuario
            u.email,         -- Email del usuario
            u.telefono,      -- Tel�fono del usuario
            u.regionID       -- ID de la regi�n a la que pertenece
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
-- Ejemplo de ejecuci�n:
EXEC SP_002_UserInformation @usuarioID = '100030226';
GO

-- SELECT * FROM Usuario