-- consultas examen

SELECT* FROM producto WHERE codigo_barras ='1 123456 123456 3'; --info producto por codigo de barras 
SELECT COUNT(codigo_barras) AS total_entrada FROM compra ca INNER JOIN producto_compra pc ON ca.numero_compra=pc.numero_compra WHERE codigo_barras ='5 234567 222222 2' AND fecha>='2019-02-02' AND fecha<= '2021-07-07'; --cuantas veces entro 
SELECT COUNT(codigo_barras) AS total_salida FROM factura ca INNER JOIN producto_venta pc ON ca.codigo_factura=pc.codigo_factura WHERE codigo_barras ='5 234567 222222 2' AND fecha_factura>='2019-02-02' AND fecha_factura<= '2021-07-07'; --cuantas veces salio
SELECT existencia FROM producto WHERE codigo_barras= '1 123456 123456 3'; --existencia de maltas 

--consultas propias 

SELECT codigo_factura, SUM(cantidad * precio_venta) as total FROM producto_venta GROUP BY codigo_factura; --total por factura
SELECT* FROM  producto ca INNER JOIN pais_origen pc ON ca.codigo_origen_producto=pc.codigo_origen_producto; -- productos y su origen 
SELECT nombre_producto, precio_tienda FROM producto ORDER BY precio_tienda DESC LIMIT 1; --cual es el producto mas caro 
SELECT nombre_producto, precio_tienda FROM producto ORDER BY precio_tienda ASC; --productos por orden low to high (lo vi en amazon)
SELECT *  FROM factura ORDER BY fecha_factura DESC LIMIT 1; --venta mas reciente
SELECT* FROM departamento ca LEFT JOIN producto pc ON ca.codigo_departamento =pc.codigo_departamento WHERE pc.codigo_departamento IS NULL; -- departamentos vacios
SELECT COUNT (codigo_barras) FROM producto_venta WHERE codigo_barras= '5 234567 222222 2';-- cuantos insectors vendi desde que inicio todo