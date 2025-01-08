/*
Script de respaldo y restauraci�n para la base de datos DB_InventariosGlobal.
Implementa un respaldo completo (full backup) con nomenclatura de archivo por fecha/hora
y su correspondiente proceso de restauraci�n.

Funcionalidad del respaldo:
- Genera nombre de archivo con timestamp para identificaci�n �nica
- Realiza respaldo completo de la base de datos
- Guarda el archivo .bak en la ruta C:\DB
- Muestra estad�sticas del progreso cada 10%

Funcionalidad de la restauraci�n:
- Pone la base de datos en modo usuario �nico
- Restaura desde el archivo de respaldo especificado 
- Reubica los archivos .mdf y .ldf a las rutas definidas
- Permite sobrescribir si existe (REPLACE)
- Restaura con recuperaci�n completa
- Devuelve la base de datos a modo multiusuario

IMPORTANTE: Ajustar las rutas y nombre del archivo de respaldo seg�n el entorno.
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
Script de respaldo diferencial y restauraci�n para la base de datos DB_InventariosGlobal.
El respaldo diferencial guarda solo los cambios realizados desde el �ltimo respaldo completo,
resultando en archivos m�s peque�os y tiempos de respaldo m�s cortos.

Funcionalidad del respaldo diferencial:
- Genera nombre de archivo con timestamp y extensi�n .dif
- Realiza respaldo diferencial usando WITH DIFFERENTIAL
- Guarda el archivo en la ruta C:\DB
- Muestra estad�sticas del progreso cada 10%
- Usa SKIP, NOREWIND y NOUNLOAD para optimizar el proceso

Funcionalidad de la restauraci�n:
- Restaura desde el archivo diferencial especificado
- Reubica los archivos .mdf y .ldf a las rutas definidas 
- Permite sobrescribir si existe (REPLACE)
- Restaura con recuperaci�n completa

IMPORTANTE: 
- Se requiere un respaldo completo previo
- Ajustar las rutas y nombre del archivo seg�n el entorno
- La restauraci�n diferencial debe realizarse despu�s de restaurar el respaldo completo base
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
Script de respaldo y restauraci�n del registro de transacciones (log) para la base de datos DB_InventariosGlobal.
El respaldo transaccional captura la secuencia de cambios en el registro de transacciones desde el �ltimo respaldo,
permitiendo recuperar la base de datos a un punto espec�fico en el tiempo.

Funcionalidad del respaldo transaccional:
- Genera nombre de archivo con timestamp y extensi�n .trn
- Realiza respaldo del log usando BACKUP LOG
- Guarda el archivo en la ruta C:\DB
- Muestra estad�sticas del progreso cada 10%
- Usa SKIP, NOREWIND y NOUNLOAD para optimizar el proceso

Funcionalidad de la restauraci�n:
- Restaura desde el archivo de log especificado
- Reubica los archivos .mdf y .ldf a las rutas definidas
- Permite sobrescribir si existe (REPLACE)
- Restaura con recuperaci�n completa

IMPORTANTE:
- Requiere que la base de datos est� en modo de recuperaci�n FULL
- Se requiere un respaldo completo previo
- La restauraci�n debe realizarse en secuencia: full -> diferencial -> logs
- Ajustar las rutas y nombre del archivo seg�n el entorno
- El respaldo de logs es crucial para la recuperaci�n punto en el tiempo
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
