/*
Script de Consulta - Tabla Inventario
Base de datos: DB_InventariosGlobal

Descripci�n:
Este script realiza una consulta espec�fica en la tabla Inventario utilizando el nivel
de aislamiento READ UNCOMMITTED (lectura no confirmada). La consulta est� dise�ada
para recuperar registros de inventario bas�ndose en la coincidencia exacta de
inventarioID y productoID.

Detalles t�cnicos:
- Nivel de aislamiento: READ UNCOMMITTED
  * Permite lecturas sucias (dirty reads)
  * Optimiza el rendimiento al no adquirir bloqueos de lectura
  * �til para consultas donde la consistencia inmediata no es cr�tica
- Filtros aplicados:
  * inventarioID = 281
  * productoID = 281

Nota: El uso de READ UNCOMMITTED debe considerarse cuidadosamente ya que puede 
retornar datos no confirmados o en proceso de modificaci�n.

*/

USE DB_InventariosGlobal;
GO

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED 
SELECT * FROM [LAY].[DB_InventariosGlobal].[dbo].[Inventario]
WHERE inventarioID = 281 AND productoID = 281;


