/*
AVISO: Esta es una versión no optimizada del SP_007_UpdateProduct. Se mantiene como ejemplo 
de prácticas NO recomendadas en el desarrollo de procedimientos almacenados.

Procedimiento almacenado que actualiza información de productos con las siguientes deficiencias:
- Validaciones redundantes y verbosas
- Verificaciones de existencia ineficientes usando COUNT
- Sin manejo de transacciones
- Uso de CASE innecesario en lugar de ISNULL
- Actualizaciones separadas sin verificación de cambios reales
- Consultas repetitivas a las bases de datos

Parámetros:
    @productoID INT           - ID del producto a actualizar (requerido)
    @nombre VARCHAR(100)      - Nuevo nombre del producto
    @precio DECIMAL(10,2)     - Nuevo precio (debe ser mayor que 0)
    @categoria VARCHAR(50)    - Nueva categoría del producto
    @descripcion VARCHAR(250) - Nueva descripción del producto
    @stockMinimo INT         - Nuevo valor de stock mínimo (no puede ser negativo)
    @activo BIT              - Nuevo estado de activación del producto

Usar preferentemente la versión optimizada SP_007_UpdateProduct en su lugar.
*/

USE DB_InventariosGlobal;
GO
CREATE OR ALTER PROC SP_007_UpdateProduct_NoOptimizado
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
    -- Sin manejo de transacciones
    -- Validaciones redundantes y poco eficientes
    IF @precio IS NOT NULL
    BEGIN
        IF @precio <= 0
        BEGIN
            RAISERROR('El precio debe ser mayor que 0', 16, 1);
            RETURN;
        END
    END

    IF @stockMinimo IS NOT NULL
    BEGIN
        IF @stockMinimo < 0
        BEGIN
            RAISERROR('El stock mínimo no puede ser negativo', 16, 1);
            RETURN;
        END
    END

    IF @nombre IS NOT NULL
    BEGIN
        IF LEN(@nombre) = 0
        BEGIN
            RAISERROR('El nombre no puede estar vacío', 16, 1);
            RETURN;
        END
    END

    -- Verificaciones separadas y redundantes
    DECLARE @existeLocal BIT = 0
    DECLARE @existeRemoto BIT = 0

    SELECT @existeLocal = COUNT(*)
    FROM DB_InventariosGlobal.dbo.Producto
    WHERE productoID = @productoID

    SELECT @existeRemoto = COUNT(*)
    FROM [LAY].[DB_InventariosGlobal].[dbo].[Producto]
    WHERE productoID = @productoID

    IF @existeLocal = 1 OR @existeRemoto = 1
    BEGIN
        -- Actualizaciones sin verificar si realmente hay cambios
        IF @existeLocal = 1
        BEGIN
            UPDATE DB_InventariosGlobal.dbo.Producto
            SET 
                nombre = CASE WHEN @nombre IS NULL THEN nombre ELSE @nombre END,
                precio = CASE WHEN @precio IS NULL THEN precio ELSE @precio END,
                categoria = CASE WHEN @categoria IS NULL THEN categoria ELSE @categoria END,
                descripcion = CASE WHEN @descripcion IS NULL THEN descripcion ELSE @descripcion END,
                stockMinimo = CASE WHEN @stockMinimo IS NULL THEN stockMinimo ELSE @stockMinimo END,
                activo = CASE WHEN @activo IS NULL THEN activo ELSE @activo END
            WHERE productoID = @productoID;
        END

        IF @existeRemoto = 1
        BEGIN
            UPDATE [LAY].[DB_InventariosGlobal].[dbo].[Producto]
            SET 
                nombre = CASE WHEN @nombre IS NULL THEN nombre ELSE @nombre END,
                precio = CASE WHEN @precio IS NULL THEN precio ELSE @precio END,
                categoria = CASE WHEN @categoria IS NULL THEN categoria ELSE @categoria END,
                descripcion = CASE WHEN @descripcion IS NULL THEN descripcion ELSE @descripcion END,
                stockMinimo = CASE WHEN @stockMinimo IS NULL THEN stockMinimo ELSE @stockMinimo END,
                activo = CASE WHEN @activo IS NULL THEN activo ELSE @activo END
            WHERE productoID = @productoID;
        END

        SELECT 'Producto actualizado exitosamente' AS Resultado;
    END
    ELSE
    BEGIN
        RAISERROR('Producto no encontrado en ninguna base de datos', 16, 1);
    END
END
GO

