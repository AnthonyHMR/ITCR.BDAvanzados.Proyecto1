CREATE DATABASE DB_DatosSensibles;
GO

USE DB_InventariosGlobal;
GO

-------------------------------------------------------------------------------
-- Crear tabla para datos sensibles de Usuario
-------------------------------------------------------------------------------
CREATE TABLE DB_DatosSensibles.dbo.Usuario (
    usuarioID   VARCHAR(9) NOT NULL,
    email       VARCHAR(100) NOT NULL,
    telefono    VARCHAR(20),

    CONSTRAINT PK_UsuarioSensible
        PRIMARY KEY (usuarioID)
);
GO

-- Migrar datos sensibles de la tabla original
INSERT INTO DB_DatosSensibles.dbo.Usuario (usuarioID, email, telefono)
SELECT usuarioID, email, telefono
FROM Usuario;

-- Eliminar columnas sensibles de la tabla original
ALTER TABLE Usuario
DROP CONSTRAINT UQ_Usuario_Email;

ALTER TABLE Usuario
DROP COLUMN email, telefono;

-- Confirmar fragmentacion de las tablas
SELECT * FROM Usuario;
SELECT * FROM DB_DatosSensibles.dbo.Usuario;


-------------------------------------------------------------------------------
-- Crear tabla para datos sensibles de DetallePedido
-------------------------------------------------------------------------------
CREATE TABLE DB_DatosSensibles.dbo.DetallePedido (
    pedidoID       INT            NOT NULL,
    productoID     INT            NOT NULL,
    cantidad       INT            NOT NULL DEFAULT 1,
    precioUnitario DECIMAL(10,2)  NOT NULL,
    subtotal       DECIMAL(10,2)  NOT NULL,

    CONSTRAINT PK_DetallePedido
        PRIMARY KEY (pedidoID, productoID),

	CONSTRAINT CK_DetallePedido_CantidadPositiva
        CHECK (cantidad >= 1),

    CONSTRAINT CK_DetallePedido_PrecioUnitarioPositivo
        CHECK (precioUnitario >= 0),

    CONSTRAINT CK_DetallePedido_SubtotalPositivo
        CHECK (subtotal >= 0)
);
GO

-- Migrar datos sensibles de la tabla original
INSERT INTO DB_DatosSensibles.dbo.DetallePedido (pedidoID, productoID, cantidad, precioUnitario, subtotal)
SELECT pedidoID, productoID, cantidad, precioUnitario, subtotal
FROM DetallePedido;

-- Eliminar columnas sensibles de la tabla original
ALTER TABLE DetallePedido
DROP CONSTRAINT CK_DetallePedido_CantidadPositiva, CK_DetallePedido_PrecioUnitarioPositivo, CK_DetallePedido_SubtotalPositivo, DF__DetallePe__canti__534D60F1;

ALTER TABLE DetallePedido
DROP COLUMN cantidad, precioUnitario, subtotal;

-- Confirmar fragmentacion de las tablas
SELECT * FROM DetallePedido;
SELECT * FROM DB_DatosSensibles.dbo.DetallePedido;


-------------------------------------------------------------------------------
-- Crear tabla para datos sensibles de Inventario
-------------------------------------------------------------------------------
CREATE TABLE DB_DatosSensibles.dbo.Inventario (
    inventarioID        INT            NOT NULL,
    cantidad            INT            NOT NULL DEFAULT 0,
    ultimaActualizacion DATETIME       NOT NULL DEFAULT GETDATE(),
	
    CONSTRAINT PK_Inventario
        PRIMARY KEY (inventarioID),
		
    CONSTRAINT CK_Inventario_CantidadNoNegativa
        CHECK (cantidad >= 0)
);
GO

-- Migrar datos sensibles de la tabla original
INSERT INTO DB_DatosSensibles.dbo.Inventario (inventarioID, cantidad, ultimaActualizacion)
SELECT inventarioID, cantidad, ultimaActualizacion
FROM Inventario;

-- Eliminar columnas sensibles de la tabla original
ALTER TABLE Inventario
DROP CONSTRAINT CK_Inventario_CantidadNoNegativa, DF__Inventari__canti__440B1D61, DF__Inventari__ultim__44FF419A;

ALTER TABLE Inventario
DROP COLUMN cantidad, ultimaActualizacion;

-- Confirmar fragmentacion de las tablas
SELECT * FROM Inventario;
SELECT * FROM DB_DatosSensibles.dbo.Inventario;