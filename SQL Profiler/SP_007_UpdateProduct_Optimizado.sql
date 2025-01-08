-- VERSI�N OPTIMIZADA
USE DB_InventariosGlobal;
GO
CREATE OR ALTER PROC SP_007_UpdateProduct_Optimizado
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
    SET NOCOUNT ON;
    
    -- Variables para control de transacci�n
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    BEGIN TRY
        -- Validaciones r�pidas en bloque
        IF (@precio IS NOT NULL AND @precio <= 0) OR
           (@stockMinimo IS NOT NULL AND @stockMinimo < 0) OR
           (@nombre = '')
        BEGIN
            THROW 50001, 'Valores de entrada inv�lidos', 1;
        END

        -- Inicio de transacci�n
        BEGIN TRANSACTION;

        -- Variable para verificar si se realiz� alguna actualizaci�n
        DECLARE @UpdateCount INT = 0;

        -- Actualizar en la base local con una sola verificaci�n de existencia
        UPDATE DB_InventariosGlobal.dbo.Producto WITH (ROWLOCK)
        SET 
            nombre = ISNULL(@nombre, nombre),
            precio = ISNULL(@precio, precio),
            categoria = ISNULL(@categoria, categoria),
            descripcion = ISNULL(@descripcion, descripcion),
            stockMinimo = ISNULL(@stockMinimo, stockMinimo),
            activo = ISNULL(@activo, activo)
        WHERE productoID = @productoID
        AND (
            @nombre IS NOT NULL OR
            @precio IS NOT NULL OR
            @categoria IS NOT NULL OR
            @descripcion IS NOT NULL OR
            @stockMinimo IS NOT NULL OR
            @activo IS NOT NULL
        );
        
        SET @UpdateCount = @UpdateCount + @@ROWCOUNT;

        -- Actualizar en la base remota
        UPDATE [LAY].[DB_InventariosGlobal].[dbo].[Producto] WITH (ROWLOCK)
        SET 
            nombre = ISNULL(@nombre, nombre),
            precio = ISNULL(@precio, precio),
            categoria = ISNULL(@categoria, categoria),
            descripcion = ISNULL(@descripcion, descripcion),
            stockMinimo = ISNULL(@stockMinimo, stockMinimo),
            activo = ISNULL(@activo, activo)
        WHERE productoID = @productoID
        AND (
            @nombre IS NOT NULL OR
            @precio IS NOT NULL OR
            @categoria IS NOT NULL OR
            @descripcion IS NOT NULL OR
            @stockMinimo IS NOT NULL OR
            @activo IS NOT NULL
        );

        SET @UpdateCount = @UpdateCount + @@ROWCOUNT;

        -- Verificar si se realiz� alguna actualizaci�n
        IF @UpdateCount = 0
        BEGIN
            THROW 50002, 'Producto no encontrado en ninguna base de datos', 1;
        END

        COMMIT TRANSACTION;

        -- Retornar resultado con SET en lugar de SELECT
        SET @ErrorMessage = 'Producto actualizado exitosamente';
        SELECT @ErrorMessage AS Resultado;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT 
            ERROR_MESSAGE() AS ErrorMessage,
            ERROR_SEVERITY() AS ErrorSeverity,
            ERROR_STATE() AS ErrorState;
            
        THROW;
    END CATCH;
END
GO