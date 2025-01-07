USE DB_InventariosGlobal;
GO

-- Primero eliminamos las restricciones de FK que dependen de las columnas que volverán a ser IDENTITY
ALTER TABLE Usuario DROP CONSTRAINT FK_Usuario_Region;
ALTER TABLE Inventario DROP CONSTRAINT FK_Inventario_Region;
ALTER TABLE Pedido DROP CONSTRAINT FK_Pedido_Region;
ALTER TABLE Inventario DROP CONSTRAINT FK_Inventario_Producto;
ALTER TABLE DetallePedido DROP CONSTRAINT FK_DetallePedido_Producto;
ALTER TABLE DetallePedido DROP CONSTRAINT FK_DetallePedido_Pedido;

-- Ahora restauramos las columnas con IDENTITY
-- Tabla Region
ALTER TABLE Region DROP CONSTRAINT PK_Region;
ALTER TABLE Region DROP COLUMN regionID;
ALTER TABLE Region ADD regionID INT IDENTITY(1,1) NOT NULL;
ALTER TABLE Region ADD CONSTRAINT PK_Region PRIMARY KEY (regionID);

-- Tabla Producto
ALTER TABLE Producto DROP CONSTRAINT PK_Producto;
ALTER TABLE Producto DROP COLUMN productoID;
ALTER TABLE Producto ADD productoID INT IDENTITY(1,1) NOT NULL;
ALTER TABLE Producto ADD CONSTRAINT PK_Producto PRIMARY KEY (productoID);

-- Tabla Inventario
ALTER TABLE Inventario DROP CONSTRAINT PK_Inventario;
ALTER TABLE Inventario DROP COLUMN inventarioID;
ALTER TABLE Inventario ADD inventarioID INT IDENTITY(1,1) NOT NULL;
ALTER TABLE Inventario ADD CONSTRAINT PK_Inventario PRIMARY KEY (inventarioID);

-- Tabla Pedido
ALTER TABLE Pedido DROP CONSTRAINT PK_Pedido;
ALTER TABLE Pedido DROP COLUMN pedidoID;
ALTER TABLE Pedido ADD pedidoID INT IDENTITY(1,1) NOT NULL;
ALTER TABLE Pedido ADD CONSTRAINT PK_Pedido PRIMARY KEY (pedidoID);

-- Restauramos las restricciones de FK
ALTER TABLE Usuario 
    ADD CONSTRAINT FK_Usuario_Region 
    FOREIGN KEY (regionID) REFERENCES Region(regionID);

ALTER TABLE Inventario 
    ADD CONSTRAINT FK_Inventario_Region 
    FOREIGN KEY (regionID) REFERENCES Region(regionID);

ALTER TABLE Inventario 
    ADD CONSTRAINT FK_Inventario_Producto 
    FOREIGN KEY (productoID) REFERENCES Producto(productoID);

ALTER TABLE Pedido 
    ADD CONSTRAINT FK_Pedido_Region 
    FOREIGN KEY (regionID) REFERENCES Region(regionID);

ALTER TABLE DetallePedido 
    ADD CONSTRAINT FK_DetallePedido_Producto 
    FOREIGN KEY (productoID) REFERENCES Producto(productoID);

ALTER TABLE DetallePedido 
    ADD CONSTRAINT FK_DetallePedido_Pedido 
    FOREIGN KEY (pedidoID) REFERENCES Pedido(pedidoID);