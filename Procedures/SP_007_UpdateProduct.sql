/*
Procedimiento almacenado que actualiza la información de un producto específico en ambas bases de datos 
(local y LAY). Permite la actualización parcial o completa de los atributos del producto y realiza 
validaciones de datos antes de efectuar los cambios.

Parámetros:
    @productoID INT           - ID del producto a actualizar (requerido)
    @nombre VARCHAR(100)      - Nuevo nombre del producto
    @precio DECIMAL(10,2)     - Nuevo precio (debe ser mayor que 0)
    @categoria VARCHAR(50)    - Nueva categoría del producto
    @descripcion VARCHAR(250) - Nueva descripción del producto
    @stockMinimo INT         - Nuevo valor de stock mínimo (no puede ser negativo)
    @activo BIT              - Nuevo estado de activación del producto

Validaciones:
    - Verifica que el precio sea mayor que 0
    - Verifica que el stock mínimo no sea negativo
    - Verifica que el nombre no esté vacío
    - Verifica la existencia del producto en ambas bases de datos

Retorna un mensaje de éxito si la actualización se realiza correctamente o un error si las validaciones fallan.
*/

USE DB_InventariosGlobal;
GO
CREATE OR ALTER PROC SP_007_UpdateProduct
(
    @productoID INT,
    @nombre VARCHAR(100) = NULL,
    @precio DECIMAL(10,2) = NULL,
    @categoria VARCHAR(50) = NULL,
    @descripcion VARCHAR(250) = NULL,
    @stockMinimo INT = NULL,
    @activo BIT = NULL
)
AS
BEGIN
    -- Validaciones iniciales
    IF @precio IS NOT NULL AND @precio <= 0
    BEGIN
        RAISERROR('El precio debe ser mayor que 0', 16, 1);
        RETURN;
    END

    IF @stockMinimo IS NOT NULL AND @stockMinimo < 0
    BEGIN
        RAISERROR('El stock mínimo no puede ser negativo', 16, 1);
        RETURN;
    END

    IF @nombre = ''
    BEGIN
        RAISERROR('El nombre no puede estar vacío', 16, 1);
        RETURN;
    END

    -- Verificar existencia del producto usando UNION
    IF EXISTS (
        SELECT productoID 
        FROM DB_InventariosGlobal.dbo.Producto 
        WHERE productoID = @productoID
        UNION ALL
        SELECT productoID 
        FROM [LAY].[DB_InventariosGlobal].[dbo].[Producto] 
        WHERE productoID = @productoID
    )
    BEGIN
        -- Actualizar en la base local si existe ahí
        UPDATE DB_InventariosGlobal.dbo.Producto
        SET 
            nombre = ISNULL(@nombre, nombre),
            precio = ISNULL(@precio, precio),
            categoria = ISNULL(@categoria, categoria),
            descripcion = ISNULL(@descripcion, descripcion),
            stockMinimo = ISNULL(@stockMinimo, stockMinimo),
            activo = ISNULL(@activo, activo)
        WHERE productoID = @productoID;

        -- Actualizar en la base remota si existe ahí
        UPDATE [LAY].[DB_InventariosGlobal].[dbo].[Producto]
        SET 
            nombre = ISNULL(@nombre, nombre),
            precio = ISNULL(@precio, precio),
            categoria = ISNULL(@categoria, categoria),
            descripcion = ISNULL(@descripcion, descripcion),
            stockMinimo = ISNULL(@stockMinimo, stockMinimo),
            activo = ISNULL(@activo, activo)
        WHERE productoID = @productoID;

        SELECT 'Producto actualizado exitosamente' AS Resultado;
    END
    ELSE
    BEGIN
        RAISERROR('Producto no encontrado en ninguna base de datos', 16, 1);
    END
END
GO

-- Ejemplos de uso:
-- Actualizar precio y categoría
EXEC SP_007_UpdateProduct 
    @productoID = 1,
    @precio = 20.99,
    @categoria = 'Ropa';

EXEC SP_007_UpdateProduct 
    @productoID = 281,
    @precio = 20.99,
    @categoria = 'Ropa';

-- Actualización completa
EXEC SP_007_UpdateProduct 
    @productoID = 1,
    @nombre = 'Laptop HP',
    @precio = 899.99,
    @categoria = 'Computadoras',
    @descripcion = 'Laptop HP 15 pulgadas',
    @stockMinimo = 5,
    @activo = 1;