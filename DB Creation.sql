/* 
  ---------------------------------------------------
  1. Crear la base de datos (opcional si no existe)
  ---------------------------------------------------
*/
CREATE DATABASE DB_InventariosGlobal;
GO

USE DB_InventariosGlobal;
GO

/* 
  ---------------------------------------------------
  2. TABLA: Region
     - regionID (PK)
     - nombre (no nulo)
     - pais (no nulo)
     - zonaHoraria (opcional)
  Relacionado con: 
     - Usuario (1 a n)
     - Inventario (1 a n)
     - Pedido (1 a n)
  ---------------------------------------------------
*/
CREATE TABLE Region (
    regionID       INT           IDENTITY(1,1) NOT NULL,
    nombre         VARCHAR(50)   NOT NULL,
    pais           VARCHAR(50)   NOT NULL,
    zonaHoraria    VARCHAR(50),
    
    CONSTRAINT PK_Region
        PRIMARY KEY (regionID)
);

-- Índice opcional para búsquedas rápidas por nombre de la región
CREATE INDEX IX_Region_Nombre ON Region (nombre);
GO

/*
  ---------------------------------------------------
  3. TABLA: Usuario
     - usuarioID (PK, cédula 9 dígitos)
     - nombre (no nulo)
     - apellido (no nulo) [NUEVO]
     - email (no nulo, único)
     - telefono (opcional)
     - regionID (FK a Region)
  Relación: 
     - Cada Usuario pertenece a 1 Region 
     - Un Region tiene N Usuarios
     - Un Usuario puede realizar muchos Pedidos
  ---------------------------------------------------
*/
CREATE TABLE Usuario (
    usuarioID   VARCHAR(9)     NOT NULL,
    nombre      VARCHAR(100)   NOT NULL,
    apellido    VARCHAR(100)   NOT NULL,
    email       VARCHAR(100)   NOT NULL,
    telefono    VARCHAR(20),
    regionID    INT            NOT NULL,

    CONSTRAINT PK_Usuario
        PRIMARY KEY (usuarioID),

    CONSTRAINT UQ_Usuario_Email
        UNIQUE (email),

    CONSTRAINT FK_Usuario_Region
        FOREIGN KEY (regionID) 
        REFERENCES Region(regionID),
        
    -- Restricción para asegurar que la cédula tenga 9 dígitos
    CONSTRAINT CK_Usuario_Cedula
        CHECK (usuarioID LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);

-- Índices para búsquedas
CREATE INDEX IX_Usuario_Nombre ON Usuario (nombre);
CREATE INDEX IX_Usuario_Apellido ON Usuario (apellido);
CREATE INDEX IX_Usuario_RegionID ON Usuario (regionID);
GO

/*
  ---------------------------------------------------
  4. TABLA: Producto
     - productoID (PK)
     - nombre (no nulo)
     - precio (no nulo, > 0)
     - categoria
     - descripcion
     - stockMinimo (>= 0)
     - activo (boolean)
  Relación:
     - Un Producto puede existir en varios Inventarios
     - DetallePedido (muchos-a-muchos vía Pedido)
  ---------------------------------------------------
*/
CREATE TABLE Producto (
    productoID    INT            IDENTITY(1,1) NOT NULL,
    nombre        VARCHAR(100)   NOT NULL,
    precio        DECIMAL(10,2)  NOT NULL,
    categoria     VARCHAR(50),
    descripcion   VARCHAR(250),
    stockMinimo   INT            NOT NULL DEFAULT 0,
    activo        BIT            NOT NULL DEFAULT 1,

    CONSTRAINT PK_Producto
        PRIMARY KEY (productoID),

    CONSTRAINT CK_Producto_PrecioPositivo
        CHECK (precio > 0),

    CONSTRAINT CK_Producto_StockMinimo
        CHECK (stockMinimo >= 0)
);

-- Índices para búsquedas
CREATE INDEX IX_Producto_Nombre ON Producto (nombre);
CREATE INDEX IX_Producto_Categoria ON Producto (categoria);
GO

/*
  ---------------------------------------------------
  5. TABLA: Inventario
     - inventarioID (PK)
     - productoID (FK a Producto)
     - regionID (FK a Region)
     - cantidad (>= 0)
     - ultimaActualizacion
     - estado (texto libre o con CHECK)
  Relación:
     - 1 Region tiene N Inventarios
     - 1 Producto puede estar en varios Inventarios
  ---------------------------------------------------
*/
CREATE TABLE Inventario (
    inventarioID        INT            IDENTITY(1,1) NOT NULL,
    productoID          INT            NOT NULL,
    regionID            INT            NOT NULL,
    cantidad            INT            NOT NULL DEFAULT 0,
    ultimaActualizacion DATETIME       NOT NULL DEFAULT GETDATE(),
    estado              VARCHAR(50)    NULL,

    CONSTRAINT PK_Inventario
        PRIMARY KEY (inventarioID),

    CONSTRAINT FK_Inventario_Producto
        FOREIGN KEY (productoID) REFERENCES Producto(productoID),

    CONSTRAINT FK_Inventario_Region
        FOREIGN KEY (regionID)   REFERENCES Region(regionID),

    CONSTRAINT CK_Inventario_CantidadNoNegativa
        CHECK (cantidad >= 0)
);

-- Índices para búsquedas
CREATE INDEX IX_Inventario_Producto_Region 
    ON Inventario (productoID, regionID);
CREATE INDEX IX_Inventario_Estado ON Inventario (estado);
GO

/*
  ---------------------------------------------------
  6. TABLA: Pedido
     - pedidoID (PK)
     - regionID (FK a Region)
     - usuarioID (FK a Usuario)
     - fecha (default GETDATE())
     - estado (p.ej. 'Pendiente','EnProceso','Completado','Cancelado')
     - total (>= 0, o calculado)
  Relación:
     - N Pedidos en 1 Region
     - N Pedidos realizados por 1 Usuario
  ---------------------------------------------------
*/
CREATE TABLE Pedido (
    pedidoID   INT            IDENTITY(1,1) NOT NULL,
    regionID   INT            NOT NULL,
    usuarioID  VARCHAR(9)     NOT NULL,  -- Modificado para coincidir con el tipo de cédula
    fecha      DATETIME       NOT NULL DEFAULT GETDATE(),
    estado     VARCHAR(50)    NOT NULL DEFAULT 'Pendiente',
    total      DECIMAL(10,2)  NOT NULL DEFAULT 0,

    CONSTRAINT PK_Pedido
        PRIMARY KEY (pedidoID),

    CONSTRAINT FK_Pedido_Region
        FOREIGN KEY (regionID) REFERENCES Region(regionID),

    CONSTRAINT FK_Pedido_Usuario
        FOREIGN KEY (usuarioID) REFERENCES Usuario(usuarioID),

    CONSTRAINT CK_Pedido_TotalNoNegativo
        CHECK (total >= 0)
);

-- CHECK constraint para estados válidos
ALTER TABLE Pedido 
ADD CONSTRAINT CK_Pedido_EstadoValido
    CHECK (estado IN ('Pendiente','EnProceso','Completado','Cancelado'));

-- Índices para consultas frecuentes
CREATE INDEX IX_Pedido_Fecha ON Pedido (fecha);
CREATE INDEX IX_Pedido_Estado ON Pedido (estado);
GO

/*
  ---------------------------------------------------
  7. TABLA: DetallePedido
     - pedidoID (FK)
     - productoID (FK)
     - cantidad (>= 1)
     - precioUnitario (>= 0)
     - subtotal (>= 0)
  Llave primaria compuesta (pedidoID, productoID)
  Relación:
     - Muchos-a-muchos entre Pedido y Producto
  ---------------------------------------------------
*/
CREATE TABLE DetallePedido (
    pedidoID       INT            NOT NULL,
    productoID     INT            NOT NULL,
    cantidad       INT            NOT NULL DEFAULT 1,
    precioUnitario DECIMAL(10,2)  NOT NULL,
    subtotal       DECIMAL(10,2)  NOT NULL,

    CONSTRAINT PK_DetallePedido
        PRIMARY KEY (pedidoID, productoID),

    CONSTRAINT FK_DetallePedido_Pedido
        FOREIGN KEY (pedidoID) REFERENCES Pedido(pedidoID),

    CONSTRAINT FK_DetallePedido_Producto
        FOREIGN KEY (productoID) REFERENCES Producto(productoID),

    CONSTRAINT CK_DetallePedido_CantidadPositiva
        CHECK (cantidad >= 1),

    CONSTRAINT CK_DetallePedido_PrecioUnitarioPositivo
        CHECK (precioUnitario >= 0),

    CONSTRAINT CK_DetallePedido_SubtotalPositivo
        CHECK (subtotal >= 0)
);

-- Índices para consultas
CREATE INDEX IX_DetallePedido_Producto ON DetallePedido (productoID);
CREATE INDEX IX_DetallePedido_Pedido ON DetallePedido (pedidoID);
GO

/*
  ---------------------------------------------------
  FIN DEL SCRIPT
  ---------------------------------------------------
*/