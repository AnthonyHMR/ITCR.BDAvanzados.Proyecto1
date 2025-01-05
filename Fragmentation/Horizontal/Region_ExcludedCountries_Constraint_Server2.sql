-- ================================================================
-- Descripción: Script para agregar una restricción CHECK a la tabla Region
--              que excluye ciertos países en el servidor 2 (LAY)
-- ================================================================

USE DB_InventariosGlobal;
GO

-- Agregar restricción CHECK a la tabla Region
-- Esta restricción asegura que NO se puedan ingresar los países 
-- listados, ya que estos pertenecen al Servidor1
ALTER TABLE Region
ADD CONSTRAINT CK_Region_Servidor2    -- Nombre de la restricción
   CHECK (pais NOT IN (             -- Verifica que el país NO esté en la lista
       'Argentina',                 -- Lista de países excluidos
       'Belice',
       'Bolivia', 
       'Brasil',
       'Chile',
       'Colombia',
       'El Salvador',
       'Guatemala',
       'Haití',
       'México'
   ));