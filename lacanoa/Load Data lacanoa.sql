-- =====================================================================
-- SCRIPT DE CARGA DE DATOS ESPECÍFICOS PARA LACANOA
-- Este archivo contiene solo los inserts específicos de este restaurante
-- NOTA: Ejecutar primero "Load Data Common.sql" reemplazando {schema_name} por lacanoa
-- =====================================================================

-- =====================================================================
-- INFORMACIÓN DEL NEGOCIO
-- =====================================================================
INSERT INTO lacanoa.business_info (id, name, street, email, phone, nit, city, country, state, created_at)
VALUES (1, 'lacanoa', 'calle 1', 'lacanoa@example.com', '34522435245', '23452353425', 'Sogamoso', 'Colombia', 'boayaca', '2026-02-21 01:51:59');

-- =====================================================================
-- ROLES DEL SISTEMA
-- =====================================================================
INSERT INTO lacanoa.catalogs (role) VALUES ('administrador'), ('mesero'), ('cajero'), ('superadmin');

-- =====================================================================
-- TIPOS DE PRODUCTO
-- =====================================================================
INSERT INTO lacanoa.product_type (name, parent_id, color_hex)
VALUES
('Entradas', 1, '#FF5733'),
('Fuertes', 2, '#33FF57'),
('Jugos Naturales', 3, '#3357FF'),
('Bebidas', 4, '#F3FF33'),
('Vinos', 5, '#FF33F6'),
('Cremas', 6, '#33FFF6');

-- =====================================================================
-- MESAS
-- =====================================================================
INSERT INTO lacanoa.tables (name)
VALUES
    ('S1'), ('S2'), ('S3'), ('S4'), ('S5'),
    ('S6'), ('S7'), ('S8'), ('S9'), ('S10'),
    ('S11'), ('S12'), ('S13'), ('S14'), ('S15'),
    ('S16'), ('S17'), ('S18'), ('S19'), ('S20'),
    ('S21'), ('S22'), ('S23'), ('S24'), ('S25'),
    ('K1'), ('K2'), ('K3'), ('K4'), ('K5'),
    ('T1'), ('T2'), ('T3'), ('T4'), ('T5');

-- =====================================================================
-- MÉTODOS DE PAGO
-- =====================================================================
INSERT INTO lacanoa.payment_method (name)
VALUES
    ('Ahorro a la Mano'),
    ('Efectivo'),
    ('Daviplata'),
    ('Nequi'),
    ('QR Bancolombia'),
    ('QR Davivienda'),
    ('Tarjeta');

-- =====================================================================
-- CATEGORÍAS DE PROVEEDORES
-- =====================================================================
INSERT INTO lacanoa.supplierCategories (Name, Description) VALUES
('Alimentos', 'Proveedores de productos alimenticios para restaurantes y bares.'),
('Bebidas', 'Proveedores de bebidas, incluyendo opciones alcohólicas y no alcohólicas.'),
('Utensilios', 'Proveedores de utensilios de cocina y accesorios para restaurantes.');

-- =====================================================================
-- CATEGORÍAS DE GASTOS
-- =====================================================================
INSERT INTO lacanoa.expense_categories
(categoryName, description, isActive)
VALUES
('Insumos de cocina', 'Gastos relacionados con ingredientes y materiales de cocina', true),
('Bebidas', 'Gastos relacionados con bebidas alcohólicas y no alcohólicas', true),
('Productos de limpieza', 'Gastos en productos de limpieza y mantenimiento general', true),
('Mantenimiento', 'Gastos de mantenimiento de equipos e instalaciones', true),
('Servicios públicos', 'Gastos en servicios como agua, luz, gas, internet, etc.', true),
('Nómina', 'Gastos relacionados con sueldos y salarios del personal', true),
('Utencilios', 'Gastos relacionados con herramientas para operacion', true);

-- =====================================================================
-- USUARIO INICIAL
-- =====================================================================
insert into lacanoa.users(identification_type_id,identification, first_name, last_name, email, password, birth_date, phone_country_code, phone, address, age, role_id, is_active, created_by, created_at, updated_at)
values(1,1057597,'Jonh','Nino','jonh.nino@example.com','dsf234',current_timestamp,'+57','3112251244','address',29,1,true,null,current_timestamp,null);


