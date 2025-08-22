-- 1.Obtén el “Top 10” de productos por unidades vendidas y su ingreso total--
SELECT p.id_producto, 
       p.nombre,
       SUM(cp.cantidad) AS unidades_vendidas,
       SUM(cp.total) AS ingreso_total
FROM compras_productos cp
JOIN productos p ON cp.id_producto = p.id_producto
GROUP BY p.id_producto, p.nombre
ORDER BY unidades_vendidas DESC
LIMIT 10;


-- 2.Categorías con mayor número de productos vendidos --

SELECT c.id_categoria, 
       c.descripcion,
       SUM(cp.cantidad) AS total_vendidos
FROM compras_productos cp
JOIN productos p ON cp.id_producto = p.id_producto
JOIN categorias c ON p.id_categoria = c.id_categoria
GROUP BY c.id_categoria, c.descripcion
ORDER BY total_vendidos DESC;

-- 3.Clientes que han gastado más dinero --

SELECT c.id, 
       c.nombre, 
       c.apellidos,
       SUM(cp.total) AS gasto_total
FROM clientes c
JOIN compras co ON c.id = co.id_cliente
JOIN compras_productos cp ON co.id_compra = cp.id_compra
GROUP BY c.id, c.nombre, c.apellidos
ORDER BY gasto_total DESC;

-- 4.Productos con menor stock disponible --

SELECT id_producto, nombre, cantidad_stock
FROM productos
ORDER BY cantidad_stock ASC
LIMIT 10;

--5. Promedio de gasto por compra --

SELECT co.id_compra,
       c.nombre,
       c.apellidos,
       SUM(cp.total) AS valor_total
FROM compras co
JOIN clientes c ON co.id_cliente = c.id
JOIN compras_productos cp ON co.id_compra = cp.id_compra
GROUP BY co.id_compra, c.nombre, c.apellidos
ORDER BY valor_total DESC
LIMIT 4;

--6.Ventas por cada mes del año --

SELECT 
    EXTRACT(YEAR FROM co.fecha) AS año,
    EXTRACT(MONTH FROM co.fecha) AS mes,
    SUM(cp.total) AS ventas_totales
FROM compras co
JOIN compras_productos cp ON co.id_compra = cp.id_compra
GROUP BY año, mes
ORDER BY año, mes;

-- 10.Última compra por cliente--

SELECT c.id,
       c.nombre,
       c.apellidos,
       MAX(co.fecha) AS ultima_compra
FROM clientes c
JOIN compras co ON c.id = co.id_cliente
GROUP BY c.id, c.nombre, c.apellidos
ORDER BY ultima_compra DESC;


