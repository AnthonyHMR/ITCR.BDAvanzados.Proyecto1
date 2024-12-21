USE DB_InventariosGlobal;
GO

-------------------------------------------------------------------------------
-- Subcategoría: Camisetas y Tops (40 INSERTS)
-------------------------------------------------------------------------------
INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES 

('Camiseta Básica Algodón Blanca', 15.99, 'Ropa', 'Camiseta clásica de algodón 100%, corte regular.', 15, 1), 
('Top Crop Nike Dri-FIT', 29.99, 'Ropa', 'Top deportivo con tecnología de absorción de sudor.', 8, 1),
('Camiseta Polo Ralph Lauren', 45.00, 'Ropa', 'Polo clásico con logo bordado, algodón piqué.', 6, 1),
('Blusa Manga Larga H&M', 24.99, 'Ropa', 'Blusa elegante con detalles en puños.', 10, 1),
('Tank Top Under Armour', 22.50, 'Ropa', 'Camiseta sin mangas deportiva, tejido HeatGear.', 12, 1),
('Camiseta Graphic Levis', 19.99, 'Ropa', 'Camiseta con estampado vintage del logo.', 8, 1),
('Top Halter Zara', 17.90, 'Ropa', 'Top elegante con cuello halter y espalda descubierta.', 6, 1),
('Camiseta Térmica Columbia', 35.00, 'Ropa', 'Camiseta térmica de primera capa con Omni-Heat.', 10, 1),
('Top Deportivo Puma', 26.99, 'Ropa', 'Top con soporte medio para actividades físicas.', 8, 1),
('Camiseta Oversize Adidas', 32.00, 'Ropa', 'Camiseta holgada con logo reflectante.', 10, 1),
('Blusa Cuello V Express', 28.50, 'Ropa', 'Blusa formal con cuello en V y botones frontales.', 7, 1),
('Camiseta Tommy Hilfiger', 39.99, 'Ropa', 'Camiseta con logo bordado en el pecho.', 6, 1),
('Top Crochet Mango', 22.90, 'Ropa', 'Top tejido a crochet estilo bohemio.', 5, 1),
('Camiseta Tie-Dye Pull&Bear', 18.99, 'Ropa', 'Camiseta con diseño tie-dye multicolor.', 8, 1),
('Top Deportivo Nike Pro', 34.99, 'Ropa', 'Top de compresión para alto rendimiento.', 10, 1),
('Camiseta Manga Larga GAP', 25.00, 'Ropa', 'Camiseta básica de manga larga, algodón suave.', 12, 1),
('Top Seda Massimo Dutti', 49.90, 'Ropa', 'Top elegante de seda natural con detalle plisado.', 4, 1),
('Camiseta Reebok Classic', 27.50, 'Ropa', 'Camiseta retro con logo vintage.', 8, 1),
('Top Corset Bershka', 19.99, 'Ropa', 'Top estilo corset con varillas y cordones.', 6, 1),
('Camiseta Champion', 23.00, 'Ropa', 'Camiseta deportiva con logo en el pecho.', 10, 1),
('Top Asimétrico Stradivarius', 16.99, 'Ropa', 'Top con diseño asimétrico y un hombro descubierto.', 7, 1),
('Camiseta The North Face', 29.99, 'Ropa', 'Camiseta técnica para senderismo.', 8, 1),
('Top Terciopelo Urban Outfitters', 28.00, 'Ropa', 'Top de terciopelo con cuello alto.', 5, 1),
('Camiseta Vans Off The Wall', 24.50, 'Ropa', 'Camiseta skater con estampado clásico.', 9, 1),
('Top Lencero Oysho', 19.95, 'Ropa', 'Top estilo lencero con encaje.', 6, 1),
('Camiseta DC Shoes', 22.99, 'Ropa', 'Camiseta con logo DC en el pecho.', 8, 1),
('Top Reversible Fila', 31.00, 'Ropa', 'Top deportivo reversible con dos diseños.', 7, 1),
('Camiseta Element', 25.99, 'Ropa', 'Camiseta de skateboarding con diseño gráfico.', 8, 1),
('Top Mesh Forever 21', 15.90, 'Ropa', 'Top transparente de malla con forro.', 10, 1),
('Camiseta Volcom', 26.50, 'Ropa', 'Camiseta de surf con estampado hawaiano.', 6, 1),
('Top Metalizado Bebe', 34.99, 'Ropa', 'Top con acabado metalizado brillante.', 4, 1),
('Camiseta Quiksilver', 23.99, 'Ropa', 'Camiseta de playa con estampado surfero.', 8, 1),
('Top Peplum Karen Millen', 45.00, 'Ropa', 'Top formal con volante en la cintura.', 5, 1),
('Camiseta Billabong', 24.90, 'Ropa', 'Camiseta con estampado tropical.', 7, 1),
('Top Bandeau Hollister', 18.50, 'Ropa', 'Top estilo bandeau elástico.', 9, 1),
('Camiseta RVCA', 27.99, 'Ropa', 'Camiseta con diseño artístico exclusivo.', 6, 1),
('Top Cut-Out Topshop', 29.90, 'Ropa', 'Top con recortes estratégicos.', 5, 1),
('Camiseta Roxy', 21.99, 'Ropa', 'Camiseta playera con estampado bohemio.', 8, 1),
('Top Drapeado Coast', 42.00, 'Ropa', 'Top elegante con drapeado lateral.', 4, 1),
('Camiseta Converse', 25.99, 'Ropa', 'Camiseta con estampado retro All Star.', 7, 1);

-------------------------------------------------------------------------------
-- Subcategoría: Pantalones y Faldas (40 INSERTS)
-------------------------------------------------------------------------------
INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Jeans Levis 501 Original', 89.99, 'Ropa', 'Vaqueros clásicos de corte recto.', 10, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Falda Plisada Zara', 39.90, 'Ropa', 'Falda midi plisada con cintura elástica.', 6, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Pantalón Chino Dockers', 45.00, 'Ropa', 'Pantalón casual de algodón slim fit.', 8, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Falda Vaquera Pull&Bear', 29.99, 'Ropa', 'Falda corta de mezclilla con botones.', 5, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Pantalón Deportivo Nike', 49.99, 'Ropa', 'Pantalón de chándal con tecnología Dri-FIT.', 12, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Falda Larga Mango', 35.90, 'Ropa', 'Falda maxi con estampado floral.', 4, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Jeans Skinny H&M', 34.99, 'Ropa', 'Vaqueros ajustados de tiro alto.', 8, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Falda Tubo Karen Millen', 59.90, 'Ropa', 'Falda de corte lápiz para oficina.', 3, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Pantalón Cargo Bershka', 32.99, 'Ropa', 'Pantalón estilo militar con bolsillos.', 6, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Falda Tennis Adidas', 45.00, 'Ropa', 'Falda deportiva con shorts incorporados.', 5, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Jeans Mom Fit Topshop', 49.99, 'Ropa', 'Vaqueros de cintura alta estilo vintage.', 7, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Falda Wrap Massimo Dutti', 55.90, 'Ropa', 'Falda cruzada de tejido fluido.', 4, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Pantalón Palazzo Zara', 39.99, 'Ropa', 'Pantalón ancho de tiro alto.', 5, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Falda Mini Stradivarius', 19.99, 'Ropa', 'Falda corta con volantes.', 8, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Jeans Straight Calvin Klein', 79.90, 'Ropa', 'Vaqueros rectos de corte clásico.', 6, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Falda Skater Forever 21', 24.90, 'Ropa', 'Falda circular con vuelo.', 7, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Pantalón Pinzas Mango', 42.99, 'Ropa', 'Pantalón formal con pliegues.', 4, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Falda Cuero Sintético Bershka', 29.99, 'Ropa', 'Falda de polipiel con cremallera.', 5, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Pantalón Jogger Puma', 39.90, 'Ropa', 'Pantalón deportivo con puños elásticos.', 8, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Falda Cargo Urban Outfitters', 45.00, 'Ropa', 'Falda estilo militar con bolsillos.', 4, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Jeans Bootcut Gap', 59.99, 'Ropa', 'Vaqueros con ligero acampanado.', 6, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Falda Plisada Tommy Hilfiger', 69.90, 'Ropa', 'Falda midi con diseño plisado.', 3, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Pantalón Cuadros Uniqlo', 39.99, 'Ropa', 'Pantalón formal con patrón de cuadros.', 5, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Falda Denim Levis', 49.99, 'Ropa', 'Falda vaquera con botones frontales.', 6, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Pantalón Culotte COS', 59.90, 'Ropa', 'Pantalón ancho cropped.', 4, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Falda Asimétrica & Other Stories', 49.00, 'Ropa', 'Falda con corte irregular.', 3, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Jeans Baggy Pepe Jeans', 65.00, 'Ropa', 'Vaqueros anchos estilo oversize.', 5, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Falda Pareo Oysho', 25.99, 'Ropa', 'Falda de playa con diseño envolvente.', 6, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Pantalón Lino Arket', 69.90, 'Ropa', 'Pantalón de lino para verano.', 4, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Falda Tablones Sandro', 89.00, 'Ropa', 'Falda con pliegues definidos.', 3, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Pantalón Ciclista Fila', 29.99, 'Ropa', 'Pantalón corto ajustado deportivo.', 7, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Falda Crochet Free People', 75.00, 'Ropa', 'Falda tejida estilo bohemio.', 3, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Jeans Wide Leg Weekday', 55.00, 'Ropa', 'Vaqueros anchos de tiro alto.', 5, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Falda Estampada Desigual', 59.90, 'Ropa', 'Falda con estampado multicolor.', 4, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Pantalón Vestir Hugo Boss', 99.00, 'Ropa', 'Pantalón formal de corte recto.', 3, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Falda Satén Reformation', 79.00, 'Ropa', 'Falda brillante con abertura.', 3, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Pantalón Deportivo Under Armour', 54.99, 'Ropa', 'Pantalón técnico para entrenamiento.', 6, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Falda Tul Needle & Thread', 89.90, 'Ropa', 'Falda de tul con capas.', 2, 1);

-------------------------------------------------------------------------------
-- Subcategoría: Vestidos y Monos (40 INSERTS)
-------------------------------------------------------------------------------
INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Vestido Floral Zara', 49.99, 'Ropa', 'Vestido midi con estampado de flores.', 5, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Mono Vaquero H&M', 39.90, 'Ropa', 'Mono denim de manga larga.', 4, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Vestido Punto Mango', 35.99, 'Ropa', 'Vestido ajustado de punto elástico.', 6, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Mono Culotte Massimo Dutti', 69.90, 'Ropa', 'Mono elegante con pernera ancha.', 3, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Vestido Camisero Polo Ralph Lauren', 129.00, 'Ropa', 'Vestido estilo camisa con cinturón.', 2, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Mono Deportivo Nike', 54.99, 'Ropa', 'Mono ajustado para entrenamiento.', 5, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Vestido Fiesta Karen Millen', 159.00, 'Ropa', 'Vestido de cóctel con pedrería.', 2, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Mono Corto Pull&Bear', 29.99, 'Ropa', 'Mono estilo playero con estampado.', 6, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Vestido Tejido Free People', 89.90, 'Ropa', 'Vestido bohemio de punto grueso.', 3, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Mono Largo Bershka', 34.99, 'Ropa', 'Mono de tirantes con espalda cruzada.', 4, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Vestido Wrap Diane von Furstenberg', 298.00, 'Ropa', 'Vestido cruzado de seda estampada.', 1, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Mono Peto Levis', 79.90, 'Ropa', 'Mono vaquero estilo peto clásico.', 4, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Vestido Lino Arket', 79.00, 'Ropa', 'Vestido suelto de lino para verano.', 3, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Mono Satén & Other Stories', 89.00, 'Ropa', 'Mono elegante con diseño fluido.', 2, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Vestido Maxi Desigual', 95.90, 'Ropa', 'Vestido largo con estampado colorido.', 3, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Mono Palazzo Topshop', 55.00, 'Ropa', 'Mono de pierna ancha con cinturón.', 4, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Vestido Cóctel Coast', 149.00, 'Ropa', 'Vestido corto para eventos formales.', 2, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Mono Short Oysho', 39.99, 'Ropa', 'Mono corto estilo casual.', 5, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Vestido Playa Calzedonia', 45.00, 'Ropa', 'Vestido ligero de tejido transparente.', 4, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Mono Terciopelo Urban Outfitters', 69.90, 'Ropa', 'Mono de terciopelo con manga larga.', 3, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Vestido Asimétrico COS', 89.00, 'Ropa', 'Vestido con diseño asimétrico minimalista.', 2, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Mono Estampado Anthropologie', 128.00, 'Ropa', 'Mono con estampado bohemio exclusivo.', 2, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Vestido Denim Pepe Jeans', 85.00, 'Ropa', 'Vestido vaquero con botones frontales.', 3, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Mono Rayas Sandro', 175.00, 'Ropa', 'Mono de rayas con cinturón incorporado.', 2, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Vestido Punto Guess', 99.90, 'Ropa', 'Vestido ceñido de punto con logo.', 3, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Mono Kimono Style Uterqüe', 129.00, 'Ropa', 'Mono estilo kimono con estampado oriental.', 2, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Vestido Volantes Reformation', 248.00, 'Ropa', 'Vestido sostenible con volantes.', 1, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Mono Work Wear Dickies', 59.90, 'Ropa', 'Mono de trabajo resistente.', 4, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Vestido Camiseta Tommy Hilfiger', 79.90, 'Ropa', 'Vestido estilo camiseta oversized.', 3, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Mono Plisado Adolfo Domínguez', 159.00, 'Ropa', 'Mono con plisado permanente.', 2, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Vestido Jersey Weekend Max Mara', 195.00, 'Ropa', 'Vestido de punto fino con cuello alto.', 2, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Mono Casual GAP', 69.95, 'Ropa', 'Mono informal de algodón.', 3, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Vestido Tubo Hugo Boss', 229.00, 'Ropa', 'Vestido entallado para oficina.', 2, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Mono Print River Island', 65.00, 'Ropa', 'Mono con estampado geométrico.', 3, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Vestido Encaje Self-Portrait', 375.00, 'Ropa', 'Vestido de encaje con detalles calados.', 1, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Mono Jumpsuit Forever 21', 29.90, 'Ropa', 'Mono básico con bolsillos.', 5, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Vestido Blazer Zara', 69.90, 'Ropa', 'Vestido estilo americana cruzado.', 3, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Mono Halter Mango', 49.99, 'Ropa', 'Mono con cuello halter y espalda descubierta.', 4, 1);

INSERT INTO Producto (nombre, precio, categoria, descripcion, stockMinimo, activo)
VALUES ('Vestido Bohemio Free People', 168.00, 'Ropa', 'Vestido largo estilo boho con bordados.', 2, 1);

SELECT COUNT(*) AS TotalProductos FROM Producto;
SELECT * FROM Producto ORDER BY nombre, precio;
GO