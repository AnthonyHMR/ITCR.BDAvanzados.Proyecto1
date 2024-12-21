/*
    Script para:
      1. Vaciar (eliminar) datos de las tablas.
      2. Eliminar las tablas.
      3. Eliminar la base de datos DB_InventariosGlobal.
*/

/* 1) Asegurarse de usar la base de datos */
USE DB_InventariosGlobal;
GO

/* 
   2) Eliminar (vaciar) los datos de las tablas 
      en orden de las relaciones:
      - Primero se borran las tablas "hijas"
      - Después las tablas "padres"
*/
PRINT 'Eliminando contenido de DetallePedido...';
DELETE FROM DetallePedido;

PRINT 'Eliminando contenido de Inventario...';
DELETE FROM Inventario;

PRINT 'Eliminando contenido de Pedido...';
DELETE FROM Pedido;

PRINT 'Eliminando contenido de Usuario...';
DELETE FROM Usuario;

PRINT 'Eliminando contenido de Producto...';
DELETE FROM Producto;

PRINT 'Eliminando contenido de Region...';
DELETE FROM Region;
GO

/*
   3) Eliminar las tablas en orden inverso 
      al que se crearon (hijas primero, padres después)
*/
PRINT 'Eliminando tabla DetallePedido...';
DROP TABLE DetallePedido;
GO

PRINT 'Eliminando tabla Inventario...';
DROP TABLE Inventario;
GO

PRINT 'Eliminando tabla Pedido...';
DROP TABLE Pedido;
GO

PRINT 'Eliminando tabla Usuario...';
DROP TABLE Usuario;
GO

PRINT 'Eliminando tabla Producto...';
DROP TABLE Producto;
GO

PRINT 'Eliminando tabla Region...';
DROP TABLE Region;
GO

/*
   4) Regresar al contexto de master para poder 
      eliminar la base de datos
*/
USE master;
GO

/*
   5) Eliminar la base de datos
*/
PRINT 'Eliminando la base de datos DB_InventariosGlobal...';
DROP DATABASE DB_InventariosGlobal;
GO
