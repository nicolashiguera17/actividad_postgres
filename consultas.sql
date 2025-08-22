-- 1 Obtén el “Top 10” de productos por unidades vendidas y su ingreso total--
SELECT p.id_producto, 
       p.nombre,
       SUM(cp.cantidad) AS unidades_vendidas,
       SUM(cp.total) AS ingreso_total
FROM compras_productos cp
JOIN productos p ON cp.id_producto = p.id_producto
GROUP BY p.id_producto, p.nombre
ORDER BY unidades_vendidas DESC
LIMIT 10;
