CREATE INDEX codbarras ON producto(codigo_barras); --buscar un producto en especifico
CREATE INDEX codbarcom ON producto_compra(codigo_barras); --buscar entradas
CREATE INDEX codbarven ON producto_venta(codigo_barras); --para buscar las salidas
CREATE INDEX precios ON producto(precio_tienda); --para precios (sirve en low to high)
CREATE INDEX dates ON factura(fecha_factura);--buscar fechas de facturas

CREATE INDEX estado ON estados(nombre);
CREATE INDEX ciudades ON ciudad(nombre);
CREATE INDEX direcciones ON direccion(nombre);