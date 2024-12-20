USE GestionInventarios;
GO

-- Insertar datos de prueba para la tabla Region
INSERT INTO Region (nombre, pais, zonaHoraria)
VALUES
('Norteamérica', 'Estados Unidos', 'GMT-5'),
('Europa', 'España', 'GMT+1'),
('Asia', 'Japón', 'GMT+9');

-- Insertar datos de prueba para la tabla Usuario
INSERT INTO Usuario (nombre, email, telefono, rol, regionID)
VALUES
('Juan Pérez', 'juan.perez@example.com', '123456789', 'Cliente', 1),
('Ana López', 'ana.lopez@example.com', '987654321', 'Administrador', 2),
('Carlos Tanaka', 'carlos.tanaka@example.com', '456123789', 'Cliente', 3);

-- Insertar datos de prueba para la tabla Producto
INSERT INTO Producto (nombre, descripcion, precio, categoria, stockMinimo, activo)
VALUES
('Laptop', 'Laptop de alta gama', 1200.00, 'Electrónica', 10, 1),
('Silla de Oficina', 'Silla ergonómica', 150.00, 'Muebles', 5, 1),
('Cámara', 'Cámara digital profesional', 800.00, 'Electrónica', 8, 1),
('Mesa', 'Mesa de madera', 200.00, 'Muebles', 3, 1),
('Teléfono', 'Teléfono inteligente', 600.00, 'Electrónica', 5, 1);

-- Insertar datos de prueba para la tabla Inventario
INSERT INTO Inventario (estado, cantidad, productoID, regionID)
VALUES
('Disponible', 50, 1, 1),
('Disponible', 20, 2, 1),
('Disponible', 15, 3, 2),
('Disponible', 10, 4, 3),
('Disponible', 30, 5, 1);

-- Insertar datos de prueba para la tabla Pedido
INSERT INTO Pedido (estado, total, usuarioID, regionID)
VALUES
('Procesado', 1350.00, 1, 1),
('Pendiente', 800.00, 1, 1),
('Enviado', 150.00, 2, 2),
('Completado', 800.00, 3, 3);

-- Insertar datos de prueba para la tabla Contiene
INSERT INTO Contiene (pedidoID, productoID, cantidad, precioUnitario)
VALUES
(1, 1, 1, 1200.00),  -- Pedido 1 incluye 1 Laptop
(1, 2, 1, 150.00),   -- Pedido 1 incluye 1 Silla de Oficina
(2, 3, 1, 800.00),   -- Pedido 2 incluye 1 Cámara
(3, 2, 1, 150.00),   -- Pedido 3 incluye 1 Silla de Oficina
(4, 5, 1, 600.00);   -- Pedido 4 incluye 1 Teléfono

GO


-- Consultar los datos de cada tabla
SELECT * FROM Region;
SELECT * FROM Usuario;
SELECT * FROM Producto;
SELECT * FROM Inventario;
SELECT * FROM Pedido;
SELECT * FROM Contiene;
