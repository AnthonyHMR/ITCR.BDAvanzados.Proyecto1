-- ================================================================
-- Descripción: Script para configurar un servidor vinculado (Linked Server)
--              entre el servidor actual y el servidor LAY
-- ================================================================

USE master;
GO

-- Crear el servidor vinculado 'LAY'
EXEC sp_addlinkedserver 
    @server     = N'LAY',      -- Nombre del servidor vinculado
    @srvproduct = N'SQL Server'; -- Tipo de producto del servidor remoto
GO

-- Configurar las credenciales de acceso para el servidor vinculado
EXEC sp_addlinkedsrvlogin 
    @rmtsrvname  = N'LAY',     -- Nombre del servidor vinculado
    @useself     = false,      -- No usar las credenciales del usuario actual
    @rmtuser     = N'servidor2',-- Usuario remoto
    @rmtpassword = N'1234';    -- Contraseña del usuario remoto
GO