USE DB_InventariosGlobal;
GO

-------------------------------------------------------------------------------
-- Crear tabla para datos sensibles de Usuario
-------------------------------------------------------------------------------

CREATE TABLE UsuarioSensibles (
    usuarioID   VARCHAR(9) NOT NULL,
    email       VARCHAR(100) NOT NULL,
    telefono    VARCHAR(20),
    regionID    INT NOT NULL,

    CONSTRAINT PK_UsuarioSensibles
        PRIMARY KEY (usuarioID),

    CONSTRAINT FK_UsuarioSensibles_Region
        FOREIGN KEY (regionID) REFERENCES Region(regionID)
);

-- Migrar datos sensibles de la tabla original
INSERT INTO UsuarioSensibles (usuarioID, email, telefono, regionID)
SELECT usuarioID, email, telefono, regionID
FROM Usuario;

-- Eliminar columnas sensibles de la tabla original
ALTER TABLE Usuario
DROP CONSTRAINT UQ_Usuario_Email;

DROP INDEX IX_Usuario_RegionID ON Usuario;

ALTER TABLE Usuario
DROP CONSTRAINT FK_Usuario_Region;

ALTER TABLE Usuario
DROP COLUMN email, telefono, regionID;


-------------------------------------------------------------------------------
-- Crear tabla para datos sensibles de Pedido
-------------------------------------------------------------------------------

CREATE TABLE PedidoSensibles (
    pedidoID   INT NOT NULL,
    estado     VARCHAR(50) NOT NULL DEFAULT 'Pendiente',
    total      DECIMAL(10,2) NOT NULL DEFAULT 0,

    CONSTRAINT PK_PedidoSensibles
        PRIMARY KEY (pedidoID),

    CONSTRAINT FK_PedidoSensibles_Pedido
        FOREIGN KEY (pedidoID) REFERENCES Pedido(pedidoID)
);

-- Migrar datos sensibles de la tabla original
INSERT INTO PedidoSensibles (pedidoID, estado, total)
SELECT pedidoID, estado, total
FROM Pedido;

-- Eliminar columnas sensibles de la tabla original
ALTER TABLE Pedido
DROP CONSTRAINT DF__Pedido__estado__4BAC3F29;

ALTER TABLE Pedido
DROP CONSTRAINT DF__Pedido__total__4CA06362;

ALTER TABLE Pedido
DROP CONSTRAINT CK_Pedido_EstadoValido;

ALTER TABLE Pedido
DROP CONSTRAINT CK_Pedido_TotalNoNegativo;

DROP INDEX IX_Pedido_Estado ON Pedido;

ALTER TABLE Pedido
DROP COLUMN estado, total;

