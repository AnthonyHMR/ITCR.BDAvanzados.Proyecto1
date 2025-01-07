-- ================================================================
-- Descripci�n: Script para agregar una restricci�n CHECK a la tabla Region
--              que limita los pa�ses permitidos en el servidor 1 (KUN)
-- ================================================================

USE DB_InventariosGlobal;
GO

-- Agregar restricci�n CHECK a la tabla Region
-- Esta restricci�n asegura que solo se puedan ingresar pa�ses 
-- de Am�rica Latina espec�ficos en el campo 'pais'
ALTER TABLE Region
ADD CONSTRAINT CK_Region_Servidor1    -- Nombre de la restricci�n
   CHECK (pais IN (                 -- Verifica que el pa�s est� en la lista
       'Argentina',                 -- Lista de pa�ses permitidos
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