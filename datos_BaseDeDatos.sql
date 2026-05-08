-- DATOS DE PRUEBA PARA EL SISTEMA DE VENTAS DE COMIDA

-- TABLA CLIENTE
INSERT INTO cliente (nombre, apellido, dni, email, telefono) VALUES
('Carlos', 'Mamani', '7894561', 'carlos@gmail.com', '71234567'),
('Ana', 'Quispe', '4561237', 'ana@hotmail.com', '72345678'),
('Luis', 'Perez', '9513574', 'luis@yahoo.com', '73456789'),
('Maria', 'Lopez', '8521479', 'maria@gmail.com', '74567891'),
('Jose', 'Condori', '7539514', 'jose@hotmail.com', '75678912');

-- TABLA VENDEDOR
INSERT INTO vendedor (nombre, apellido, telefono, direccion, correo) VALUES
('Miguel', 'Rojas', '76543210', 'Zona Central', 'miguel@gmail.com'),
('Patricia', 'Flores', '77654321', 'Zona Sur', 'patricia@gmail.com'),
('Diego', 'Mendoza', '78765432', 'Villa Fatima', 'diego@gmail.com'),
('Lucia', 'Choque', '79876543', 'Miraflores', 'lucia@gmail.com'),
('Fernando', 'Gutierrez', '70987654', 'Sopocachi', 'fernando@gmail.com');

-- TABLA PRODUCTO
INSERT INTO producto (nombre, descripcion, precio, stock) VALUES
('Pollo a la Brasa', 'Pollo entero con papas fritas', 85.00, 15),
('Hamburguesa Doble', 'Hamburguesa con doble carne y queso', 45.00, 20),
('Salchipapas', 'Salchicha con papas fritas', 30.00, 10),
('Pizza Familiar', 'Pizza grande de jamon y queso', 70.00, 8),
('Lasaña', 'Lasaña boloñesa especial', 55.00, 12);

-- TABLA PEDIDO
INSERT INTO pedido (id_vendedor, id_cliente, fecha, estado, total) VALUES
(1, 1, CURRENT_TIMESTAMP, 'Entregado', 115.00),
(2, 2, CURRENT_TIMESTAMP, 'Preparando', 85.00),
(3, 3, CURRENT_TIMESTAMP, 'En camino', 70.00),
(4, 4, CURRENT_TIMESTAMP, 'Entregado', 55.00),
(5, 5, CURRENT_TIMESTAMP, 'Nuevo', 130.00);

-- TABLA DETALLE_PEDIDO
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, subtotal) VALUES
(1, 1, 1, 85.00),
(1, 3, 1, 30.00),
(2, 1, 1, 85.00),
(3, 4, 1, 70.00),
(4, 5, 1, 55.00);

-- TABLA PAGO
INSERT INTO pago (id_pedido, metodo, monto) VALUES
(1, 'Efectivo', 115.00),
(2, 'QR', 85.00),
(3, 'Tarjeta', 70.00),
(4, 'Efectivo', 55.00),
(5, 'QR', 130.00);
