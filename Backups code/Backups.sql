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
