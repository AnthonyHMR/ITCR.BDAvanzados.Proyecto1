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
  Relaciones (desde el diagrama):
     - 1,n con Pedido  (una región tiene muchos pedidos)
     - 1,n con Usuario (una región tiene muchos usuarios)
     - 1,n con Inventario (una región gestiona muchos inventarios)
  ---------------------------------------------------
*/
CREATE TABLE Region (
    regionID       INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    nombre         VARCHAR(50) NOT NULL,
    pais           VARCHAR(50) NOT NULL,
    zonaHoraria    VARCHAR(50)
);
GO

/*
  ---------------------------------------------------
  3. TABLA: Usuario
  Relaciones (desde el diagrama):
     - (1,n) con Pedido  (un usuario puede realizar muchos pedidos)
     - (n,1) con Region (cada usuario pertenece a exactamente una región)
  ---------------------------------------------------
*/
CREATE TABLE Usuario (
    usuarioID   INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    nombre      VARCHAR(100) NOT NULL,
    email       VARCHAR(100) NOT NULL UNIQUE,
    rol         VARCHAR(50)  NOT NULL,
    telefono    VARCHAR(20),
    regionID    INT NOT NULL,  -- Relación con Region

    CONSTRAINT FK_Usuario_Region
        FOREIGN KEY (regionID) 
        REFERENCES Region(regionID)
);
GO

/*
  ---------------------------------------------------
  4. TABLA: Producto
  No depende directamente de Region ni de Usuario.
  ---------------------------------------------------
*/
CREATE TABLE Producto (
    productoID   INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    nombre       VARCHAR(100) NOT NULL,
    precio       DECIMAL(10,2) NOT NULL,
    categoria    VARCHAR(50),
    descripcion  VARCHAR(250),
    stockMinimo  INT DEFAULT 0,
    activo       BIT DEFAULT 1
);
GO

/*
  ---------------------------------------------------
  5. TABLA: Inventario
  Relaciones (desde el diagrama):
     - (1,n) con Region   (una región almacena muchos inventarios)
     - (1,n) con Producto (un producto puede estar en múltiples inventarios)
  ---------------------------------------------------
*/
CREATE TABLE Inventario (
    inventarioID       INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    productoID         INT NOT NULL,     -- FK a Producto
    regionID           INT NOT NULL,     -- FK a Region
    cantidad           INT NOT NULL DEFAULT 0,
    ultimaActualizacion DATETIME NOT NULL DEFAULT GETDATE(),
    estado             VARCHAR(50),

    CONSTRAINT FK_Inventario_Producto
        FOREIGN KEY (productoID) REFERENCES Producto(productoID),
    CONSTRAINT FK_Inventario_Region
        FOREIGN KEY (regionID)   REFERENCES Region(regionID)
);
GO

/*
  ---------------------------------------------------
  6. TABLA: Pedido
  Relaciones (desde el diagrama):
    - (n,1) con Region  (cada pedido sucede en exactamente una región)
    - (1,n) con Usuario (un usuario realiza muchos pedidos)
  ---------------------------------------------------
*/
CREATE TABLE Pedido (
    pedidoID   INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    regionID   INT NOT NULL,  -- FK a Region (relación "está en")
    usuarioID  INT NOT NULL,  -- FK a Usuario (relación "realiza")
    fecha      DATETIME NOT NULL DEFAULT GETDATE(),
    estado     VARCHAR(50),
    total      DECIMAL(10,2),

    CONSTRAINT FK_Pedido_Region
        FOREIGN KEY (regionID) REFERENCES Region(regionID),
    CONSTRAINT FK_Pedido_Usuario
        FOREIGN KEY (usuarioID) REFERENCES Usuario(usuarioID)
);
GO

/*
  ---------------------------------------------------
  7. TABLA: DetallePedido (o Contiene)
  Relación muchos-a-muchos entre Pedido y Producto.
  Atributos clave:
    - pedidoID (FK)
    - productoID (FK)
    - cantidad
    - precioUnitario
    - subtotal
  Llave primaria compuesta: (pedidoID, productoID)
  ---------------------------------------------------
*/
CREATE TABLE DetallePedido (
    pedidoID       INT NOT NULL,
    productoID     INT NOT NULL,
    cantidad       INT NOT NULL DEFAULT 1,
    precioUnitario DECIMAL(10,2) NOT NULL,
    subtotal       DECIMAL(10,2) NOT NULL,

    CONSTRAINT PK_DetallePedido
        PRIMARY KEY (pedidoID, productoID),

    CONSTRAINT FK_DetallePedido_Pedido
        FOREIGN KEY (pedidoID)   REFERENCES Pedido(pedidoID),
    CONSTRAINT FK_DetallePedido_Producto
        FOREIGN KEY (productoID) REFERENCES Producto(productoID)
);
GO

/*
  ---------------------------------------------------
  FIN DEL SCRIPT
  ---------------------------------------------------
*/
