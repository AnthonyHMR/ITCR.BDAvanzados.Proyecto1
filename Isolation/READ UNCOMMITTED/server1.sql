/*
Script de Consulta - Tabla Inventario
Base de datos: DB_InventariosGlobal

Descripción:
Este script realiza una consulta específica en la tabla Inventario utilizando el nivel
de aislamiento READ UNCOMMITTED (lectura no confirmada). La consulta está diseñada
para recuperar registros de inventario basándose en la coincidencia exacta de
inventarioID y productoID.

Detalles técnicos:
- Nivel de aislamiento: READ UNCOMMITTED
  * Permite lecturas sucias (dirty reads)
  * Optimiza el rendimiento al no adquirir bloqueos de lectura
  * Útil para consultas donde la consistencia inmediata no es crítica
- Filtros aplicados:
  * inventarioID = 281
  * productoID = 281

Nota: El uso de READ UNCOMMITTED debe considerarse cuidadosamente ya que puede 
retornar datos no confirmados o en proceso de modificación.

*/

USE DB_InventariosGlobal;
GO

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED 
SELECT * FROM [LAY].[DB_InventariosGlobal].[dbo].[Inventario]
WHERE inventarioID = 281 AND productoID = 281;


