USE DB_InventariosGlobal;
GO
CREATE OR ALTER PROC SP_005_ProductInformation
(
    @categoria VARCHAR(50) = 'Ropa de Ba�o'
)
AS
BEGIN
    SELECT * FROM (
        SELECT 
            p.productoID,        -- ID �nico del producto
            p.nombre,            -- Nombre del producto
            p.precio,            -- Precio del producto
            p.categoria,         -- Categor�a del producto
            p.descripcion,       -- Descripci�n del producto
            p.stockMinimo,       -- Stock m�nimo requerido
            p.activo             -- Estado activo/inactivo del producto
        FROM DB_InventariosGlobal.dbo.Producto p              
        UNION ALL           
        SELECT 
            k.productoID,     
            k.nombre,       
            k.precio,        
            k.categoria,
            k.descripcion,
            k.stockMinimo,
            k.activo
        FROM [LAY].[DB_InventariosGlobal].[dbo].[Producto] k 
    ) AS ProductosUnidos
    WHERE ProductosUnidos.categoria = @categoria
        AND ProductosUnidos.activo = 1    -- Solo productos activos
    ORDER BY productoID;
END
GO

-- Ejemplo de ejecuci�n:
EXEC SP_005_ProductInformation @categoria = 'Ropa de Trabajo';
GO

-- SELECT * FROM Producto