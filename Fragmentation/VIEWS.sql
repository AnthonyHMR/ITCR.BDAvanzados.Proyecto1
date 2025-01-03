USE DB_InventariosGlobal;
GO

-------------------------------------------------------------------------------
-- Vista para unificar los datos de Usuario y UsuarioSensibles
-------------------------------------------------------------------------------

CREATE VIEW Usuario_Unificado AS
SELECT 
    u.usuarioID,
    u.nombre,
    u.apellido,
    us.email,
    us.telefono,
    us.regionID
FROM Usuario u
LEFT JOIN UsuarioSensibles us
    ON u.usuarioID = us.usuarioID;

-------------------------------------------------------------------------------
-- Vista para unificar los datos de Pedido y PedidoSensibles
-------------------------------------------------------------------------------

CREATE VIEW Pedido_Unificado AS
SELECT 
    p.pedidoID,
    p.usuarioID,
    p.fecha,
    ps.estado,
    ps.total
FROM Pedido p
LEFT JOIN PedidoSensibles ps
    ON p.pedidoID = ps.pedidoID;

