-- ================================================================
-- Descripci�n: Script para agregar una restricci�n CHECK a la tabla Region
--              que excluye ciertos pa�ses en el servidor 2 (LAY)
-- ================================================================

USE DB_InventariosGlobal;
GO

-- Agregar restricci�n CHECK a la tabla Region
-- Esta restricci�n asegura que NO se puedan ingresar los pa�ses 
-- listados, ya que estos pertenecen al Servidor1
ALTER TABLE Region
ADD CONSTRAINT CK_Region_Servidor2    -- Nombre de la restricci�n
   CHECK (pais NOT IN (             -- Verifica que el pa�s NO est� en la lista
       'Argentina',                 -- Lista de pa�ses excluidos
       'Belice',
       'Bolivia', 
       'Brasil',
       'Chile',
       'Colombia',
       'El Salvador',
       'Guatemala',
       'Hait�',
       'M�xico'
   ));