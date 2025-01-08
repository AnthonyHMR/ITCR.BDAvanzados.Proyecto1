USE DB_InventariosGlobal;
GO

-------------------------------------------------------------------------------
-- Vista para unificar los datos de Usuario y Usuario sensible
-------------------------------------------------------------------------------
CREATE VIEW Usuario_Unificado AS
SELECT 
    u.usuarioID,
    u.nombre,
    u.apellido,
    u.regionID,
    us.email,
    us.telefono
FROM Usuario u
LEFT JOIN DB_DatosSensibles.dbo.Usuario us
    ON u.usuarioID = us.usuarioID;
GO

-------------------------------------------------------------------------------
-- Vista para unificar los datos de DetallePedido y DetallePedido sensible
-------------------------------------------------------------------------------
CREATE VIEW DetallePedido_Unificado AS
SELECT 
    dp.pedidoID,
    dp.productoID,
    dps.cantidad,
    dps.precioUnitario,
    dps.subtotal
FROM DetallePedido dp
LEFT JOIN DB_DatosSensibles.dbo.DetallePedido dps
    ON dp.pedidoID = dps.pedidoID;
GO
-------------------------------------------------------------------------------
-- Vista para unificar los datos de Inventario y Inventario sensible
-------------------------------------------------------------------------------
CREATE VIEW Inventario_Unificado AS
SELECT 
    inv.inventarioID,
	inv.productoID,
	inv.regionID,
	inv.estado,
    invs.cantidad,
    invs.ultimaActualizacion
FROM Inventario inv
LEFT JOIN DB_DatosSensibles.dbo.Inventario invs
    ON inv.inventarioID = invs.inventarioID;
GO