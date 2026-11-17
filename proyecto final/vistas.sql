-- Las tres vistas del sistema
USE cigar_house;

CREATE OR REPLACE VIEW vista_productos AS
SELECT p.id_producto, p.nombre AS producto, c.nombre AS categoria,
       p.descripcion, p.precio, p.stock
FROM producto p
INNER JOIN categoria c ON p.id_categoria = c.id_categoria;

CREATE OR REPLACE VIEW vista_pedidos AS
SELECT pe.id_pedido, pe.fecha, pe.estado AS estado_pedido,
       CONCAT(cli.nombre,' ',cli.apellido) AS cliente,
       CONCAT(emp.nombre,' ',emp.apellido) AS empleado,
       pe.subtotal, pe.descuento, pe.total,
       CASE WHEN pa.id_pago IS NULL THEN 'Pendiente' ELSE pa.estado END AS estado_pago
FROM pedido pe
INNER JOIN usuario cli ON pe.id_cliente = cli.id_usuario
INNER JOIN usuario emp ON pe.id_empleado = emp.id_usuario
LEFT JOIN pago pa ON pe.id_pedido = pa.id_pedido;

CREATE OR REPLACE VIEW vista_productos_proveedores AS
SELECT p.id_producto, p.nombre AS producto, pr.id_proveedor,
       pr.nombre AS proveedor, pp.fecha_desde, pp.costo_compra
FROM producto_proveedor pp
INNER JOIN producto p ON pp.id_producto = p.id_producto
INNER JOIN proveedor pr ON pp.id_proveedor = pr.id_proveedor;
