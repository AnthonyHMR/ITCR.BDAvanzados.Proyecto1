CREATE DATABASE GestionPedidos;
GO

USE GestionPedidos;
GO

-- Tabla Region
CREATE TABLE Region (
    regionID INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(50) NOT NULL,
    pais NVARCHAR(50) NOT NULL,
    zonaHoraria NVARCHAR(50) NOT NULL
);

-- Tabla Usuario
CREATE TABLE Usuario (
    usuarioID INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) UNIQUE NOT NULL,
    telefono NVARCHAR(15) NOT NULL,
    rol NVARCHAR(50) NOT NULL,
    regionID INT NOT NULL,
    FOREIGN KEY (regionID) REFERENCES Region(regionID)
);

-- Tabla Producto
CREATE TABLE Producto (
    productoID INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(MAX),
    precio DECIMAL(10, 2) NOT NULL,
    categoria NVARCHAR(50) NOT NULL,
    stockMinimo INT NOT NULL,
    activo BIT NOT NULL DEFAULT 1
);

-- Tabla Inventario
CREATE TABLE Inventario (
    inventarioID INT PRIMARY KEY IDENTITY(1,1),
    estado NVARCHAR(50) NOT NULL,
    cantidad INT NOT NULL,
    ultimaActualizacion DATETIME NOT NULL DEFAULT GETDATE(),
    productoID INT NOT NULL,
    regionID INT NOT NULL,
    FOREIGN KEY (productoID) REFERENCES Producto(productoID),
	FOREIGN KEY (regionID) REFERENCES Region(regionID)
);

-- Tabla Pedido
CREATE TABLE Pedido (
    pedidoID INT PRIMARY KEY IDENTITY(1,1),
    fecha DATETIME NOT NULL DEFAULT GETDATE(),
    estado NVARCHAR(50) NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    usuarioID INT NOT NULL,
    regionID INT NOT NULL,
    FOREIGN KEY (usuarioID) REFERENCES Usuario(usuarioID),
    FOREIGN KEY (regionID) REFERENCES Region(regionID)
);

-- Tabla contiene (relación entre Pedido y Producto)
CREATE TABLE Contiene (
    pedidoID INT NOT NULL,
    productoID INT NOT NULL,
    cantidad INT NOT NULL,
    precioUnitario DECIMAL(10, 2) NOT NULL,
    subtotal AS (cantidad * precioUnitario) PERSISTED,
    PRIMARY KEY (pedidoID, productoID),
    FOREIGN KEY (pedidoID) REFERENCES Pedido(pedidoID),
    FOREIGN KEY (productoID) REFERENCES Producto(productoID)
);
