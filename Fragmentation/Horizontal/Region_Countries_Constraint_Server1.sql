-- ================================================================
-- Descripción: Script para agregar una restricción CHECK a la tabla Region
--              que limita los países permitidos en el servidor 1 (KUN)
-- ================================================================

USE DB_InventariosGlobal;
GO

-- Agregar restricción CHECK a la tabla Region
-- Esta restricción asegura que solo se puedan ingresar países 
-- de América Latina específicos en el campo 'pais'
ALTER TABLE Region
ADD CONSTRAINT CK_Region_Servidor1    -- Nombre de la restricción
   CHECK (pais IN (                 -- Verifica que el país esté en la lista
       'Argentina',                 -- Lista de países permitidos
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