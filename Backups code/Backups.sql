-- RESPALDO FULL
BACKUP DATABASE [DB_InventariosGlobal] TO DISK = N'C:\DB\DB_InventariosGlobal.bak'
WITH NOFORMAT, NOINIT, NAME = N'Prueba-Full Database Backup',
STATS = 10
GO

-- RESTAURAR RESPALDO
RESTORE FILELISTONLY FROM DISK = 'C:\DB\DB_InventariosGlobal.bak'
RESTORE DATABASE DB_InventariosGlobal FROM DISK = 'C:\DB\DB_InventariosGlobal.bak'
WITH MOVE 'DB_InventariosGlobal' TO 'C:\DB\DB_InventariosGlobal.mdf',
			MOVE 'DB_InventariosGlobal_log' TO 'C:\DB\DB_InventariosGlobal_log.ldf',
			REPLACE, STATS = 10, recovery

------------------------------------------------------------------------------------

-- RESPALDO DIFERENCIAL
BACKUP DATABASE [DB_InventariosGlobal] TO DISK = N'C:\DB\DB_InventariosGlobal.dif'
WITH DIFFERENTIAL, NOFORMAT, NOINIT, NAME = N'Prueba-Dif Database Backup',
SKIP, NOREWIND, NOUNLOAD, STATS = 10
GO

-- RESTAURAR RESPALDO
RESTORE DATABASE DB_InventariosGlobal FROM DISK = 'C:\DB\DB_InventariosGlobal.dif'
WITH MOVE 'DB_InventariosGlobal' TO 'C:\DB\DB_InventariosGlobal.mdf',
			MOVE 'DB_InventariosGlobal_log' TO 'C:\DB\DB_InventariosGlobal_log.ldf',
			REPLACE, STATS = 10, recovery

------------------------------------------------------------------------------------

-- RESPALDO TRANSACIONAL
BACKUP LOG [DB_InventariosGlobal] TO DISK = N'C:\DB\DB_InventariosGlobal.trn'
WITH NOFORMAT, NOINIT, NAME = N'Prueba-Trn Database Backup',
SKIP, NOREWIND, NOUNLOAD, STATS = 10
GO

-- RESTAURAR RESPALDO
RESTORE DATABASE DB_InventariosGlobal FROM DISK = 'C:\DB\DB_InventariosGlobal2.trn'
WITH MOVE 'DB_InventariosGlobal' TO 'C:\DB\DB_InventariosGlobal.mdf',
			MOVE 'DB_InventariosGlobal_log' TO 'C:\DB\DB_InventariosGlobal_log.ldf',
			REPLACE, STATS = 10, recovery, STOPAT = '20250107 12:30:00.000'