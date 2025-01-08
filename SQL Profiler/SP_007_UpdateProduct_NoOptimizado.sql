-- VERSIÓN NO OPTIMIZADA
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

