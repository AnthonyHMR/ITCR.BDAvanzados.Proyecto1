/*
Procedimiento almacenado que recupera información de todos los productos activos de una categoría específica.
Consolida datos desde dos fuentes diferentes (local y LAY) y retorna detalles completos de los productos 
incluyendo ID, nombre, precio, categoría, descripción y stock mínimo. Los resultados se ordenan por ID 
de producto y solo incluyen productos que están marcados como activos.

Parámetros:
    @categoria VARCHAR(50) = 'Ropa de Baño' - Categoría de productos a consultar.
                                             'Ropa de Baño' es el valor predeterminado.
*/

USE DB_InventariosGlobal;
GO
CREATE OR ALTER PROC SP_005_ProductInformation
(
    @categoria VARCHAR(50) = 'Ropa de Baño'
)
AS
BEGIN
    SELECT * FROM (
        SELECT 
            p.productoID,        -- ID único del producto
            p.nombre,            -- Nombre del producto
            p.precio,            -- Precio del producto
            p.categoria,         -- Categoría del producto
            p.descripcion,       -- Descripción del producto
            p.stockMinimo,       -- Stock mínimo requerido
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

-- Ejemplo de ejecución:
EXEC SP_005_ProductInformation @categoria = 'Ropa de Trabajo';
GO

-- SELECT * FROM Producto