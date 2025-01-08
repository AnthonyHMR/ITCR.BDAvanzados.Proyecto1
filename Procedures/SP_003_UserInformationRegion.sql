/*
Procedimiento almacenado que recupera informaci�n de todos los usuarios pertenecientes a un pa�s espec�fico.
Consolida datos desde dos fuentes diferentes (local y LAY), realizando un join entre las tablas Usuario y Region 
para obtener informaci�n detallada de los usuarios incluyendo sus datos personales y la regi�n/pa�s al que pertenecen.
Los resultados se ordenan por ID de usuario.

Par�metros:
    @pais VARCHAR(50) = 'M�xico' - Pa�s del cual se desea obtener la informaci�n de usuarios. 
                                  M�xico es el valor predeterminado.
*/

USE DB_InventariosGlobal;
GO
CREATE OR ALTER PROC SP_003_UserInformationRegion
(
    @pais VARCHAR(50) = 'M�xico'
)
AS
BEGIN
    SELECT * FROM (
        -- Usuarios del servidor local
        SELECT 
            u.usuarioID,     
            u.nombre,        
            u.apellido,      
            u.email,         
            u.telefono,      
            u.regionID,
            r.pais
        FROM DB_InventariosGlobal.dbo.Usuario u              
        INNER JOIN DB_InventariosGlobal.dbo.Region r
            ON u.regionID = r.regionID
        
        UNION ALL           
        
        -- Usuarios del servidor remoto
        SELECT 
            k.usuarioID,     
            k.nombre,       
            k.apellido,        
            k.email,
            k.telefono,
            k.regionID,
            kr.pais
        FROM [LAY].[DB_InventariosGlobal].[dbo].[Usuario] k 
        INNER JOIN [LAY].[DB_InventariosGlobal].[dbo].[Region] kr
            ON k.regionID = kr.regionID
    ) AS UsuariosUnidos
    WHERE UsuariosUnidos.pais = @pais
    ORDER BY usuarioID;
END
GO

-- Ejemplo de ejecuci�n:
EXEC SP_003_UserInformationRegion @pais = 'Argentina';
GO