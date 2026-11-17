-- Estructura de Cigar House
CREATE DATABASE IF NOT EXISTS cigar_house CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE cigar_house;

CREATE TABLE rol (
 id_rol INT NOT NULL AUTO_INCREMENT, nombre VARCHAR(30) NOT NULL,
 PRIMARY KEY (id_rol), UNIQUE KEY uq_rol_nombre (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE usuario (
 id_usuario INT NOT NULL AUTO_INCREMENT, nombre VARCHAR(60) NOT NULL,
 apellido VARCHAR(60) NOT NULL, email VARCHAR(100) NOT NULL,
 contrasena VARCHAR(255) NOT NULL, id_rol INT NOT NULL,
 PRIMARY KEY (id_usuario), UNIQUE KEY uq_usuario_email (email),
 KEY fk_usuario_rol (id_rol),
 CONSTRAINT fk_usuario_rol FOREIGN KEY (id_rol) REFERENCES rol(id_rol) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE categoria (
 id_categoria INT NOT NULL AUTO_INCREMENT, nombre VARCHAR(50) NOT NULL,
 descripcion VARCHAR(255) DEFAULT NULL, PRIMARY KEY (id_categoria),
 UNIQUE KEY uq_categoria_nombre (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE producto (
 id_producto INT NOT NULL AUTO_INCREMENT, nombre VARCHAR(100) NOT NULL,
 descripcion VARCHAR(255) DEFAULT NULL, precio DECIMAL(10,2) NOT NULL,
 stock INT NOT NULL, id_categoria INT NOT NULL, PRIMARY KEY (id_producto),
 KEY fk_producto_categoria (id_categoria),
 CONSTRAINT fk_producto_categoria FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE proveedor (
 id_proveedor INT NOT NULL AUTO_INCREMENT, nombre VARCHAR(100) NOT NULL,
 email VARCHAR(100) DEFAULT NULL, direccion VARCHAR(150) DEFAULT NULL,
 PRIMARY KEY (id_proveedor)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE pedido (
 id_pedido INT NOT NULL AUTO_INCREMENT, fecha DATETIME NOT NULL,
 estado VARCHAR(30) NOT NULL, subtotal DECIMAL(10,2) NOT NULL,
 descuento DECIMAL(10,2) NOT NULL, total DECIMAL(10,2) NOT NULL,
 id_cliente INT NOT NULL, id_empleado INT NOT NULL, PRIMARY KEY (id_pedido),
 KEY fk_pedido_cliente (id_cliente), KEY fk_pedido_empleado (id_empleado),
 CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES usuario(id_usuario) ON UPDATE CASCADE,
 CONSTRAINT fk_pedido_empleado FOREIGN KEY (id_empleado) REFERENCES usuario(id_usuario) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE detalle_pedido (
 id_detalle INT NOT NULL AUTO_INCREMENT, cantidad INT NOT NULL,
 precio_unitario DECIMAL(10,2) NOT NULL, subtotal DECIMAL(10,2) NOT NULL,
 id_pedido INT NOT NULL, id_producto INT NOT NULL, PRIMARY KEY (id_detalle),
 KEY fk_detalle_pedido (id_pedido), KEY fk_detalle_producto (id_producto),
 CONSTRAINT fk_detalle_pedido FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido) ON UPDATE CASCADE,
 CONSTRAINT fk_detalle_producto FOREIGN KEY (id_producto) REFERENCES producto(id_producto) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE pago (
 id_pago INT NOT NULL AUTO_INCREMENT, fecha DATETIME NOT NULL,
 monto DECIMAL(10,2) NOT NULL, metodo_pago VARCHAR(40) NOT NULL,
 estado VARCHAR(30) NOT NULL, id_pedido INT NOT NULL, PRIMARY KEY (id_pago),
 UNIQUE KEY uq_pago_pedido (id_pedido),
 CONSTRAINT fk_pago_pedido FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE telefono_proveedor (
 id_telefono INT NOT NULL AUTO_INCREMENT, numero VARCHAR(25) NOT NULL,
 id_proveedor INT NOT NULL, PRIMARY KEY (id_telefono),
 UNIQUE KEY uq_telefono_proveedor (id_proveedor, numero),
 CONSTRAINT fk_telefono_proveedor FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE producto_proveedor (
 id_producto INT NOT NULL, id_proveedor INT NOT NULL,
 fecha_desde DATE NOT NULL, costo_compra DECIMAL(10,2) NOT NULL,
 PRIMARY KEY (id_producto, id_proveedor), KEY fk_pp_proveedor (id_proveedor),
 CONSTRAINT fk_pp_producto FOREIGN KEY (id_producto) REFERENCES producto(id_producto) ON UPDATE CASCADE,
 CONSTRAINT fk_pp_proveedor FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
