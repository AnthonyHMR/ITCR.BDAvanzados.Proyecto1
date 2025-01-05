-- ================================================================
-- Descripción: Script para configurar un servidor vinculado (Linked Server)
--              entre el servidor actual y el servidor KUN
-- ================================================================

USE master;
GO

-- Crear el servidor vinculado 'KUN'
EXEC sp_addlinkedserver 
    @server     = N'KUN',			-- Nombre del servidor vinculado
    @srvproduct = N'SQL Server';	-- Tipo de producto del servidor remoto
GO

-- Configurar las credenciales de acceso para el servidor vinculado
EXEC sp_addlinkedsrvlogin 
    @rmtsrvname = N'KUN',		-- Nombre del servidor vinculado
    @useself    = false,		-- No usar las credenciales del usuario actual
    @rmtuser    = N'servidor1', -- Usuario remoto
    @rmtpassword= N'1234';		-- Contraseña del usuario remoto
GO