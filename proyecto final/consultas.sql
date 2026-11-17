-- Diez consultas SQL de Cigar House
USE cigar_house;

-- 1. Productos con precio mayor a 800 (WHERE y ORDER BY).
SELECT nombre, precio FROM producto
WHERE precio > 800 ORDER BY precio DESC;

-- 2. Productos y sus categorías (JOIN).
SELECT p.nombre AS producto, c.nombre AS categoria
FROM producto p INNER JOIN categoria c ON p.id_categoria=c.id_categoria
ORDER BY c.nombre, p.nombre;

-- 3. Pedidos con cliente y empleado (varios JOIN).
SELECT pe.id_pedido, CONCAT(cli.nombre,' ',cli.apellido) AS cliente,
       CONCAT(emp.nombre,' ',emp.apellido) AS empleado, pe.fecha, pe.total
FROM pedido pe
INNER JOIN usuario cli ON pe.id_cliente=cli.id_usuario
INNER JOIN usuario emp ON pe.id_empleado=emp.id_usuario
ORDER BY pe.fecha DESC;

-- 4. Cantidad de productos por categoría (COUNT y GROUP BY).
SELECT c.nombre AS categoria, COUNT(p.id_producto) AS cantidad_productos
FROM categoria c LEFT JOIN producto p ON c.id_categoria=p.id_categoria
GROUP BY c.id_categoria,c.nombre ORDER BY cantidad_productos DESC;

-- 5. Total de pedidos por estado (SUM y GROUP BY).
SELECT estado, SUM(total) AS total_vendido
FROM pedido GROUP BY estado ORDER BY total_vendido DESC;

-- 6. Precio promedio del catálogo (AVG).
SELECT AVG(precio) AS precio_promedio FROM producto;

-- 7. Precio máximo y mínimo (MAX y MIN).
SELECT MAX(precio) AS precio_maximo, MIN(precio) AS precio_minimo
FROM producto;

-- 8. Productos con sus proveedores (JOIN de tres tablas).
SELECT p.nombre AS producto, pr.nombre AS proveedor, pp.costo_compra
FROM producto_proveedor pp
INNER JOIN producto p ON pp.id_producto=p.id_producto
INNER JOIN proveedor pr ON pp.id_proveedor=pr.id_proveedor
ORDER BY p.nombre;

-- 9. Pedidos y estado del pago (LEFT JOIN).
SELECT pe.id_pedido, pe.total,
       CASE WHEN pa.id_pago IS NULL THEN 'Pendiente' ELSE pa.estado END AS estado_pago
FROM pedido pe LEFT JOIN pago pa ON pe.id_pedido=pa.id_pedido
ORDER BY pe.id_pedido;

-- 10. Productos sin proveedor asociado (NOT EXISTS).
SELECT p.id_producto,p.nombre FROM producto p
WHERE NOT EXISTS (
 SELECT 1 FROM producto_proveedor pp WHERE pp.id_producto=p.id_producto
) ORDER BY p.nombre;
