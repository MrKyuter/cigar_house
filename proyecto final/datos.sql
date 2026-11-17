-- Datos de ejemplo de Cigar House
USE cigar_house;

INSERT INTO rol (id_rol,nombre) VALUES
(1,'administrador'),(2,'empleado'),(3,'cliente');

INSERT INTO usuario (id_usuario,nombre,apellido,email,contrasena,id_rol) VALUES
(1,'Administrador','Cigar House','admin@cigarhouse.com','$2y$10$8WfmzOICFjDhScQe0RC2iOvIGHaTv0ByhNuC2lyExbBZ0Br7KYLs2',1),
(2,'Jose','Moreira','moreirasantiago350@gmail.com','$2y$10$hD.UuszctJc.AoX.hR2XLegqtvf3oqtP6CfxILj0ajbTfJc6TOCMO',3),
(3,'joe','moe','joemoe@gmail.com','$2y$10$uVSvLRECYR9afxFRZBkzHO2ab8h2PgaaQurfAYypZvXzVizjuWwv.',2),
(4,'josue','josue','josue@gmail.com','$2y$10$qzxAIeVhWMTdOUCgk7sUfObq0Lc1LMvDxTAseq6JCLBg1hspKRyhe',3);

INSERT INTO categoria (id_categoria,nombre,descripcion) VALUES
(1,'Habano','Productos de tabaco y habanos'),(2,'Whisky','Bebidas de tipo whisky');

INSERT INTO producto (id_producto,nombre,descripcion,precio,stock,id_categoria) VALUES
(1,'King Edwards','Habano King Edwards',700.00,8,1),
(2,'Montecristo','Habano Montecristo',650.00,10,1),
(3,'Chivas Regal','Whisky Chivas Regal',1200.00,8,2),
(4,'Jack Daniels','Whisky Jack Daniels',1500.00,7,2),
(8,'Vat','Whisky',900.00,9,2);

INSERT INTO proveedor (id_proveedor,nombre,email,direccion) VALUES
(1,'Proveedor Habano A','habano@example.com','Montevideo'),
(2,'Proveedor Whisky B','whisky@example.com','Montevideo');

INSERT INTO telefono_proveedor (id_telefono,numero,id_proveedor) VALUES
(1,'099111111',1),(2,'099222222',2);

INSERT INTO producto_proveedor (id_producto,id_proveedor,fecha_desde,costo_compra) VALUES
(1,1,'2026-01-01',300.00),(2,1,'2026-01-01',400.00),
(3,2,'2026-01-01',800.00),(4,2,'2026-01-01',950.00);

INSERT INTO pedido (id_pedido,fecha,estado,subtotal,descuento,total,id_cliente,id_empleado) VALUES
(1,'2026-11-13 17:19:44','pagado',3000.00,0.00,3000.00,2,1),
(2,'2026-11-13 17:20:06','pendiente',1400.00,0.00,1400.00,2,1),
(3,'2026-11-15 18:08:12','pagado',2400.00,0.00,2400.00,2,3),
(4,'2026-11-16 15:30:33','pagado',9000.00,900.00,8100.00,2,1);

INSERT INTO detalle_pedido (id_detalle,cantidad,precio_unitario,subtotal,id_pedido,id_producto) VALUES
(1,2,1500.00,3000.00,1,4),(2,2,700.00,1400.00,2,1),
(3,2,1200.00,2400.00,3,3),(4,10,900.00,9000.00,4,8);

INSERT INTO pago (id_pago,fecha,monto,metodo_pago,estado,id_pedido) VALUES
(1,'2026-11-15 18:08:29',3000.00,'efectivo','completado',1),
(2,'2026-11-16 15:30:57',8100.00,'tarjeta','completado',4),
(3,'2026-11-16 15:31:02',2400.00,'transferencia','completado',3);
