/*
Script de respaldo y restauración para la base de datos DB_InventariosGlobal.
Implementa un respaldo completo (full backup) con nomenclatura de archivo por fecha/hora
y su correspondiente proceso de restauración.

Funcionalidad del respaldo:
- Genera nombre de archivo con timestamp para identificación única
- Realiza respaldo completo de la base de datos
- Guarda el archivo .bak en la ruta C:\DB
- Muestra estadísticas del progreso cada 10%

Funcionalidad de la restauración:
- Pone la base de datos en modo usuario único
- Restaura desde el archivo de respaldo especificado 
- Reubica los archivos .mdf y .ldf a las rutas definidas
- Permite sobrescribir si existe (REPLACE)
- Restaura con recuperación completa
- Devuelve la base de datos a modo multiusuario

IMPORTANTE: Ajustar las rutas y nombre del archivo de respaldo según el entorno.
*/

-- RESPALDO FULL
DECLARE @FechaHora NVARCHAR(20)
SET @FechaHora = FORMAT(GETDATE(), 'yyyyMMdd_HHmmss')

DECLARE @BackupPath NVARCHAR(255)
SET @BackupPath = N'C:\DB\DB_InventariosGlobal_' + @FechaHora + '.bak'

BACKUP DATABASE [DB_InventariosGlobal] 
TO DISK = @BackupPath
WITH NOFORMAT, NOINIT, 
     NAME = N'Prueba-Full Database Backup',
     STATS = 10;
GO

-- RESTAURAR RESPALDO
ALTER DATABASE DB_InventariosGlobal SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

RESTORE DATABASE DB_InventariosGlobal 
FROM DISK = 'C:\DB\DB_InventariosGlobal_.bak' -- Cambiar por el nombre del archivo generado
WITH MOVE 'DB_InventariosGlobal' TO 'C:\DB\DB_InventariosGlobal.mdf',
     MOVE 'DB_InventariosGlobal_log' TO 'C:\DB\DB_InventariosGlobal_log.ldf',
     REPLACE, 
     STATS = 10, 
     RECOVERY;
GO

ALTER DATABASE DB_InventariosGlobal SET MULTI_USER;
GO


------------------------------------------------------------------------------------

/*
Script de respaldo diferencial y restauración para la base de datos DB_InventariosGlobal.
El respaldo diferencial guarda solo los cambios realizados desde el último respaldo completo,
resultando en archivos más pequeños y tiempos de respaldo más cortos.

Funcionalidad del respaldo diferencial:
- Genera nombre de archivo con timestamp y extensión .dif
- Realiza respaldo diferencial usando WITH DIFFERENTIAL
- Guarda el archivo en la ruta C:\DB
- Muestra estadísticas del progreso cada 10%
- Usa SKIP, NOREWIND y NOUNLOAD para optimizar el proceso

Funcionalidad de la restauración:
- Restaura desde el archivo diferencial especificado
- Reubica los archivos .mdf y .ldf a las rutas definidas 
- Permite sobrescribir si existe (REPLACE)
- Restaura con recuperación completa

IMPORTANTE: 
- Se requiere un respaldo completo previo
- Ajustar las rutas y nombre del archivo según el entorno
- La restauración diferencial debe realizarse después de restaurar el respaldo completo base
*/

-- RESPALDO DIFERENCIAL
DECLARE @BackupFileName NVARCHAR(MAX);
SET @BackupFileName = 'C:\DB\DB_InventariosGlobal_' 
                      + FORMAT(GETDATE(), 'yyyyMMdd_HHmmss') + '.dif';

BACKUP DATABASE [DB_InventariosGlobal] 
TO DISK = @BackupFileName
WITH DIFFERENTIAL, NOFORMAT, NOINIT, 
NAME = N'Prueba-Dif Database Backup',
SKIP, NOREWIND, NOUNLOAD, STATS = 10;
GO

-- RESTAURAR RESPALDO
RESTORE DATABASE DB_InventariosGlobal 
FROM DISK = 'C:\DB\DB_InventariosGlobal_.dif' -- Cambiar por el nombre del archivo generado
WITH MOVE 'DB_InventariosGlobal' TO 'C:\DB\DB_InventariosGlobal.mdf',
     MOVE 'DB_InventariosGlobal_log' TO 'C:\DB\DB_InventariosGlobal_log.ldf',
     REPLACE, 
     STATS = 10, 
     RECOVERY;
GO

------------------------------------------------------------------------------------

/*
Script de respaldo y restauración del registro de transacciones (log) para la base de datos DB_InventariosGlobal.
El respaldo transaccional captura la secuencia de cambios en el registro de transacciones desde el último respaldo,
permitiendo recuperar la base de datos a un punto específico en el tiempo.

Funcionalidad del respaldo transaccional:
- Genera nombre de archivo con timestamp y extensión .trn
- Realiza respaldo del log usando BACKUP LOG
- Guarda el archivo en la ruta C:\DB
- Muestra estadísticas del progreso cada 10%
- Usa SKIP, NOREWIND y NOUNLOAD para optimizar el proceso

Funcionalidad de la restauración:
- Restaura desde el archivo de log especificado
- Reubica los archivos .mdf y .ldf a las rutas definidas
- Permite sobrescribir si existe (REPLACE)
- Restaura con recuperación completa

IMPORTANTE:
- Requiere que la base de datos esté en modo de recuperación FULL
- Se requiere un respaldo completo previo
- La restauración debe realizarse en secuencia: full -> diferencial -> logs
- Ajustar las rutas y nombre del archivo según el entorno
- El respaldo de logs es crucial para la recuperación punto en el tiempo
*/

-- RESPALDO TRANSACIONAL
DECLARE @BackupFileName NVARCHAR(MAX);
SET @BackupFileName = 'C:\DB\DB_InventariosGlobal_' 
                      + FORMAT(GETDATE(), 'yyyyMMdd_HHmmss') + '.trn';

BACKUP LOG [DB_InventariosGlobal] 
TO DISK = @BackupFileName
WITH NOFORMAT, NOINIT, 
NAME = N'Prueba-Trn Database Backup',
SKIP, NOREWIND, NOUNLOAD, STATS = 10;
GO

-- RESTAURAR RESPALDO
RESTORE DATABASE DB_InventariosGlobal 
FROM DISK = 'C:\DB\DB_InventariosGlobal_.trn' -- Cambiar por el nombre del archivo generado
WITH MOVE 'DB_InventariosGlobal' TO 'C:\DB\DB_InventariosGlobal.mdf',
     MOVE 'DB_InventariosGlobal_log' TO 'C:\DB\DB_InventariosGlobal_log.ldf',
     REPLACE, 
     STATS = 10, 
     RECOVERY;
GO
