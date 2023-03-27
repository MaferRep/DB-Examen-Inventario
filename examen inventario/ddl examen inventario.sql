CREATE TABLE "producto" (
  "codigo_barras" text UNIQUE PRIMARY KEY NOT NULL,
  "nombre_producto" text NOT NULL CHECK (TRIM(nombre_producto) != ''),
  "precio_tienda" numeric NOT NULL CHECK (precio_tienda>=0),
  "codigo_origen_producto" int NOT NULL,
  "descripcion" text,
  "existencia" int NOT NULL CHECK (existencia>=0),
  "codigo_departamento" int NOT NULL
);

CREATE TABLE "departamento" (
  "codigo_departamento" SERIAL PRIMARY KEY NOT NULL,
  "nombre_departamento" text NOT NULL CHECK (TRIM(nombre_departamento) != '')
);

CREATE TABLE "pais_origen" (
  "codigo_origen_producto" SERIAL PRIMARY KEY NOT NULL,
  "nombre_pais" text NOT NULL CHECK (TRIM(nombre_pais) != '')
);

CREATE TABLE "proveedor" (
  "codigo_provedor" SERIAL PRIMARY KEY NOT NULL,
  "nombre_proveedor" text NOT NULL CHECK (TRIM(nombre_proveedor) != ''),
  "descripcion_proveedor" text,
  "rif" text UNIQUE NOT NULL,
  "codigo_direccion" int NOT NULL
);

CREATE TABLE "estados" (
  "codigo_estado" SERIAL PRIMARY KEY NOT NULL,
  "nombre" text NOT NULL CHECK (TRIM(nombre) != '')
);

CREATE TABLE "ciudad" (
  "codigo_ciudad" SERIAL PRIMARY KEY NOT NULL,
  "codigo_estado" int NOT NULL,
  "nombre" text NOT NULL CHECK (TRIM(nombre) != '')
);

CREATE TABLE "direccion" (
  "codigo_direccion" SERIAL PRIMARY KEY NOT NULL,
  "codigo_ciudad" int NOT NULL,
  "nombre" text NOT NULL CHECK (TRIM(nombre) != '')
);

CREATE TABLE "factura" (
  "codigo_factura" SERIAL PRIMARY KEY NOT NULL,
  "fecha_factura" date NOT NULL,
  "codigo_vendedor" int NOT NULL,
  "codigo_cliente" int NOT NULL
);

CREATE TABLE "cliente" (
  "codigo_cliente" SERIAL PRIMARY KEY NOT NULL,
  "nombre" text NOT NULL CHECK (TRIM(nombre) != ''),
  "apellido" text NOT NULL CHECK (TRIM(apellido) != ''),
  "cedula" text UNIQUE NOT NULL CHECK (TRIM(cedula) != ''),
  "fecha_nacimiento" date NOT NULL,
  "direccion_detallada" text NOT NULL CHECK (TRIM(direccion_detallada) != ''),
  "codigo_direccion" int NOT NULL,
  "codigo_postal" text NOT NULL CHECK (TRIM(codigo_postal) != ''),
  "telefono" text UNIQUE NOT NULL CHECK (TRIM(telefono) != ''),
  "email" text NOT NULL CHECK (TRIM(email) != '')
);

CREATE TABLE "vendedor" (
  "codigo_vendedor" SERIAL PRIMARY KEY NOT NULL,
  "nombre" text NOT NULL CHECK (TRIM(nombre) != ''),
  "apellido" text NOT NULL CHECK (TRIM(apellido) != ''),
  "fecha_nacimiento" date NOT NULL,
  "fecha_contratacion" date NOT NULL,
  "direccion_detallada" text NOT NULL CHECK (TRIM(direccion_detallada) != ''),
  "codigo_direccion" int NOT NULL,
  "codigo_postal" text NOT NULL CHECK (TRIM(codigo_postal) != ''),
  "telefono" text NOT NULL CHECK (TRIM(telefono) != ''),
  "email" text NOT NULL CHECK (TRIM(email) != '')
);

CREATE TABLE "compra" (
  "numero_compra" SERIAL PRIMARY KEY NOT NULL,
  "fecha" date NOT NULL,
  "codigo_proveedor" int NOT NULL
);

CREATE TABLE "producto_compra" (
  "numero_compra" int NOT NULL,
  "cantidad" int NOT NULL CHECK (cantidad>0),
  "codigo_barras" text NOT NULL,
  "precio_compra" numeric CHECK (precio_compra>0)
);

CREATE TABLE "producto_venta" (
  "codigo_factura" int NOT NULL,
  "cantidad" int NOT NULL CHECK (cantidad>0),
  "codigo_barras" text NOT NULL,
  "precio_venta" numeric NOT NULL CHECK (precio_venta>0)
);

ALTER TABLE "ciudad" ADD FOREIGN KEY ("codigo_estado") REFERENCES "estados" ("codigo_estado");

ALTER TABLE "direccion" ADD FOREIGN KEY ("codigo_ciudad") REFERENCES "ciudad" ("codigo_ciudad");

ALTER TABLE "compra" ADD FOREIGN KEY ("codigo_provedor") REFERENCES "proveedor" ("codigo_proveedor");

ALTER TABLE "producto_compra" ADD FOREIGN KEY ("numero_compra") REFERENCES "compra" ("numero_compra");

ALTER TABLE "producto" ADD FOREIGN KEY ("codigo_origen_producto") REFERENCES "pais_origen" ("codigo_origen_producto");

ALTER TABLE "factura" ADD FOREIGN KEY ("codigo_cliente") REFERENCES "cliente" ("codigo_cliente");

ALTER TABLE "factura" ADD FOREIGN KEY ("codigo_vendedor") REFERENCES "vendedor" ("codigo_vendedor");

ALTER TABLE "producto" ADD FOREIGN KEY ("codigo_departamento") REFERENCES "departamento" ("codigo_departamento");

ALTER TABLE "producto_venta" ADD FOREIGN KEY ("codigo_barras") REFERENCES "producto" ("codigo_barras");

ALTER TABLE "producto_compra" ADD FOREIGN KEY ("codigo_barras") REFERENCES "producto" ("codigo_barras");

ALTER TABLE "producto_venta" ADD FOREIGN KEY ("codigo_factura") REFERENCES "factura" ("codigo_factura");

ALTER TABLE "cliente" ADD FOREIGN KEY ("codigo_direccion") REFERENCES "direccion" ("codigo_direccion");

ALTER TABLE "vendedor" ADD FOREIGN KEY ("codigo_direccion") REFERENCES "direccion" ("codigo_direccion");

ALTER TABLE "proveedor" ADD FOREIGN KEY ("codigo_direccion") REFERENCES "direccion" ("codigo_direccion");
