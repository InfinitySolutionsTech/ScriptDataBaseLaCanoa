-- =====================================================================
-- SCRIPT DE CARGA DE DATOS ESPECÍFICOS PARA trigonia
-- Este archivo contiene solo los inserts específicos de este restaurante
-- NOTA: Ejecutar primero "Load Data Common.sql" reemplazando {schema_name} por trigonia
-- =====================================================================

-- =====================================================================
-- INFORMACIÓN DEL NEGOCIO
-- =====================================================================
INSERT INTO trigonia.business_info (id, name, street, email, phone, nit, city, country, state, created_at)
VALUES (1, 'trigonia', 'Carrera 9 # 29 - 28', 'trigonia@gmail.com', '3223647012', '1069754569-6', 'Sogamoso', 'Colombia', 'Boyaca', '2026-02-21 01:51:59');

-- =====================================================================
-- ROLES DEL SISTEMA
-- =====================================================================
INSERT INTO trigonia.catalogs (role) VALUES ('administrador'), ('mesero'), ('cajero');

-- =====================================================================
-- TIPOS DE PRODUCTO
-- =====================================================================
INSERT INTO trigonia.product_type (name, parent_id, color_hex)
VALUES
('Entradas', 1, '#FF5733'),
('Pastas y Lasagnas', 2, '#33FF57'),
('Ensaladas', 3, '#3357FF'),
('Platos Fuertes', 4, '#F3FF33'),
('Pescados', 5, '#FF33F6'),
('Pizzas', 6, '#33FFF6'),
('Desayunos', 7, '#33FFF6'),
('Postres', 8, '#33FFF6'),
('Bebidas Calientes', 9, '#33FFF6'),
('Bebidas Frias', 10, '#33FFF6'),
('Bedidas', 11, '#33FFF6');

-- =====================================================================
-- MESAS
-- =====================================================================
INSERT INTO trigonia.tables (name)
VALUES
    ('P1'), ('P2'), ('P3'), ('P4'), ('P5'),
    ('P6'), ('P7'), ('A1'), ('A3'), ('A4'),
    ('A4'), ('V1'), ('V2'), ('V3'), ('V4'),
    ('V5');

-- =====================================================================
-- MÉTODOS DE PAGO
-- =====================================================================
INSERT INTO trigonia.payment_method (name)
VALUES
    ('Efectivo'),
    ('Daviplata'),
    ('Nequi'),
    ('Breb'),
    ('Tarjeta Debito'),
	('Tarjeta Credito');

-- =====================================================================
-- CATEGORÍAS DE PROVEEDORES
-- =====================================================================
INSERT INTO trigonia.supplierCategories (Name, Description) VALUES
('Alimentos', 'Proveedores de productos alimenticios para restaurantes y bares.'),
('Bebidas', 'Proveedores de bebidas, incluyendo opciones alcohólicas y no alcohólicas.'),
('Desechables', 'Proveedores de productos desechables como empaques, vasos, platos, cubiertos y materiales de un solo uso para restaurantes.'),
('Aseo', 'Proveedores de productos y artículos de limpieza e higiene para mantener las áreas de cocina y servicio en óptimas condiciones sanitarias.'),
('Servicios Publicos', 'Servicios esenciales para la operación del restaurante como agua, energía eléctrica, gas, internet y recolección de residuos.');

-- =====================================================================
-- CATEGORÍAS DE GASTOS
-- =====================================================================
INSERT INTO trigonia.expense_categories
(categoryName, description, isActive)
VALUES
('Insumos de cocina', 'Gastos relacionados con ingredientes y materiales de cocina', true),
('Bebidas', 'Gastos relacionados con bebidas alcohólicas y no alcohólicas', true),
('Productos de limpieza', 'Gastos en productos de limpieza y mantenimiento general', true),
('Mantenimiento', 'Gastos de mantenimiento de equipos e instalaciones', true),
('Servicios públicos', 'Gastos en servicios como agua, luz, gas, internet, etc.', true),
('Nómina', 'Gastos relacionados con sueldos y salarios del personal', true),
('Utencilios', 'Gastos relacionados con herramientas para operacion', true),
('Costos Fijos', 'Gastos Fijos', true);

-- =====================================================================
-- USUARIO INICIAL
-- =====================================================================
insert into trigonia.users(identification_type_id,identification, first_name, last_name, email, password, birth_date, phone_country_code, phone, address, age, role_id, is_active, created_by, created_at, updated_at)
values(1,1057597671,'store','pro','soluciones@infinitycore.com.co','dsf234',current_timestamp,'+57','3112251244','Carrera 11 # 13-91 of. 205 Sogamoso',30,1,true,null,current_timestamp,null);


