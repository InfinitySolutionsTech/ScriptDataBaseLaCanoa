-- Insert default values
INSERT INTO lacanoa.identificationType (name) VALUES
('CC'),           -- Citizen ID
('Pasaporte'),     -- International Travel Document
('CE'),
('RUT'),
('NIT');       -- Tax ID Number
-- Insert possible roles into Catalogs table
INSERT INTO lacanoa.catalogs (role) VALUES ('administrador'), ('mesero'), ('cajero'), ('superadmin');
-- 2. Insertar registros en TipoProducto
INSERT INTO lacanoa.product_type (name, parent_id, color_hex)
VALUES
('Entradas', 1, '#FF5733'),
('Fuertes', 2, '#33FF57'),
('Jugos Naturales', 3, '#3357FF'),
('Bebidas', 4, '#F3FF33'),
('Vinos', 5, '#FF33F6'),
('Cremas', 6, '#33FFF6');
-- Insertar los registros de las mesas
INSERT INTO lacanoa.tables (name) 
VALUES 
    ('S1'), ('S2'), ('S3'), ('S4'), ('S5'), 
    ('S6'), ('S7'), ('S8'), ('S9'), ('S10'),
    ('S11'), ('S12'), ('S13'), ('S14'), ('S15'),
    ('S16'), ('S17'), ('S18'), ('S19'), ('S20'),
    ('S21'), ('S22'), ('S23'), ('S24'), ('S25'),
    ('K1'), ('K2'), ('K3'), ('K4'), ('K5'),
    ('T1'), ('T2'), ('T3'), ('T4'), ('T5');
-- 2. Insertar los registros en orden alfabético
INSERT INTO lacanoa.payment_method (name) 
VALUES
    ('Ahorro a la Mano'),
    ('Efectivo'),
    ('Daviplata'),
    ('Nequi'),
    ('QR Bancolombia'),
    ('QR Davivienda'),
    ('Tarjeta');
-- Insert the report types
INSERT INTO lacanoa.reports (report_name, report_type, is_active) VALUES
    ('Reporte General', 'CSV', true),
    ('Reporte Facturación Electrónica', 'CSV', true),
    ('Reporte General', 'PDF', true),
    ('Reporte Facturación Electrónica', 'PDF', true);
-- data Clients 
INSERT INTO lacanoa.personTypes (Name) VALUES
('Natural'),
('Juridical');
-- suppliers
INSERT INTO lacanoa.supplierCategories (Name, Description) VALUES
('Alimentos', 'Proveedores de productos alimenticios para restaurantes y bares.'),
('Bebidas', 'Proveedores de bebidas, incluyendo opciones alcohólicas y no alcohólicas.'),
('Utensilios', 'Proveedores de utensilios de cocina y accesorios para restaurantes.');
--
insert into lacanoa.users(identification_type_id,identification, first_name, last_name, email, password, birth_date, phone_country_code, phone, address, age, role_id, is_active, created_by, created_at, updated_at)
values(1,1057597,'Jonh','Nino','jonh.nino@example.com','dsf234',current_timestamp,'+57','3112251244','address',29,1,true,null,current_timestamp,null);

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

INSERT INTO lacanoa.notification_type (name, description, is_active)
VALUES ("Informativa", "mensaje informativo para la app", true),
("Alerta", "mensaje de alerta para la app", true),
("Recordatorio", "mensaje de recordatorio para la app", true),
("Promoción", "mensaje de promoción para la app", true);



-- ===============================
-- Estados de incidencia
-- ===============================
INSERT INTO incident_statuses (name, description) VALUES
('Abierto', 'Incidencia recién creada y pendiente de asignación'),
('Asignado', 'Incidencia asignada a un técnico pero sin iniciar trabajo'),
('En Proceso', 'Incidencia en proceso de resolución'),
('Solucionado', 'Incidencia resuelta y cerrada');

-- ===============================
-- Niveles de severidad de incidencia
-- ===============================
INSERT INTO incident_severities (level, details) VALUES
('Baja', 'Impacto menor o sin afectación crítica'),
('Media', 'Impacto intermedio, requiere atención pronta'),
('Alta', 'Impacto alto o crítico, requiere atención inmediata');

-- ===============================
-- Categorías de incidencia (ejemplos)
-- ===============================
INSERT INTO incident_categories (name, description) VALUES
('Bug', 'Error de funcionamiento o defectos en el sistema'),
('Mejora', 'Solicitudes para mejorar funcionalidades existentes'),
('Consulta', 'Dudas, requerimientos o preguntas del cliente');

-- -------------------------------------------------------------
-- Insertar datos iniciales para order_status
-- -------------------------------------------------------------
INSERT INTO order_status (name, description) VALUES
('Pendiente', 'Orden creada pero no entregada al cliente'),
('Entregado sin pagar', 'Orden entregada al cliente pero no pagada'),
('Pagado', 'Orden pagada completamente');