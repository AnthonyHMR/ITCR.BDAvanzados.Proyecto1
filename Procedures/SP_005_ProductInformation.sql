/*
Procedimiento almacenado que recupera informaci�n de todos los productos activos de una categor�a espec�fica.
Consolida datos desde dos fuentes diferentes (local y LAY) y retorna detalles completos de los productos 
incluyendo ID, nombre, precio, categor�a, descripci�n y stock m�nimo. Los resultados se ordenan por ID 
de producto y solo incluyen productos que est�n marcados como activos.

Par�metros:
    @categoria VARCHAR(50) = 'Ropa de Ba�o' - Categor�a de productos a consultar.
                                             'Ropa de Ba�o' es el valor predeterminado.
*/

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