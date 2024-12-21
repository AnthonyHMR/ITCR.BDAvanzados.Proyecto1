/*
  ---------------------------------------------------
  Script de Eliminación de Tablas y Base de Datos
  ---------------------------------------------------
*/

-- Primero nos aseguramos de usar la base de datos master
USE master;
GO

-- Si la base de datos existe, procedemos a eliminarla
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'DB_InventariosGlobal')
BEGIN
    -- Verificar y cerrar conexiones existentes
    ALTER DATABASE DB_InventariosGlobal SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    
    -- Eliminar la base de datos
    DROP DATABASE DB_InventariosGlobal;
    PRINT 'Base de datos DB_InventariosGlobal eliminada exitosamente.';
END
ELSE
BEGIN
    PRINT 'La base de datos DB_InventariosGlobal no existe.';
END
GO

/*
  ---------------------------------------------------
  Nota: No es necesario eliminar las tablas una por una
  ya que al eliminar la base de datos se eliminan
  automáticamente todas las tablas y objetos contenidos.
  ---------------------------------------------------
*/