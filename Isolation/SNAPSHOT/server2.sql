/*
Script de Consulta con Aislamiento Snapshot - Tabla Inventario
Base de datos: DB_InventariosGlobal

Descripci�n:
Este script configura y utiliza el nivel de aislamiento SNAPSHOT para realizar
consultas consistentes sobre el inventario. Incluye una pausa deliberada entre
consultas para demostrar la consistencia de los datos en el tiempo.

Operaciones secuenciales:
1. Consulta inicial del inventario completo
2. Habilitaci�n de SNAPSHOT_ISOLATION a nivel de base de datos
3. Configuraci�n del nivel de aislamiento SNAPSHOT
4. Inicio de transacci�n 'invent'
5. Primera consulta de inventario espec�fico
6. Pausa de 10 segundos
7. Segunda consulta del mismo inventario
8. Transacci�n pendiente de confirmaci�n

Caracter�sticas de SNAPSHOT ISOLATION:
- Proporciona consistencia de lectura basada en versiones
- Evita bloqueos de lectura
- Mantiene una vista consistente de los datos al inicio de la transacci�n
- Permite operaciones concurrentes sin bloqueos

Notas t�cnicas:
- El WAITFOR DELAY simula un proceso largo para demostrar el comportamiento del snapshot
- Las lecturas son consistentes independientemente de las actualizaciones concurrentes
- Requiere espacio adicional en tempdb para mantener las versiones de filas

*/

USE DB_InventariosGlobal;
GO

SELECT * FROM Inventario

ALTER DATABASE DB_InventariosGlobal
SET ALLOW_SNAPSHOT_ISOLATION ON

SET TRANSACTION ISOLATION LEVEL SNAPSHOT

BEGIN TRANSACTION invent

SELECT * FROM Inventario WHERE inventarioID = 281
WAITFOR DELAY '00:00:10'
SELECT * FROM Inventario WHERE inventarioID = 281

-- COMMIT TRANSACTION�invent