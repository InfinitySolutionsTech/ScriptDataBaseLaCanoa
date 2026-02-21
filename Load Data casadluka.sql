-- -------------------------------------------------------------
-- Información del negocio
-- -------------------------------------------------------------
INSERT INTO casadluka.business_info (id, name, street, email, phone, nit, city, country, state, created_at)
VALUES (1, 'casadluka', 'Carrera 9 # 29 - 28', 'casadluka@gmail.com', '3223647012', '1069754569-6', 'Sogamoso', 'Colombia', 'Boyaca', '2026-02-21 01:51:59');

-- Insert default values
INSERT INTO casadluka.identificationType (name) VALUES
('CC'),           
('Pasaporte'),     
('CE'),
('RUT'),
('NIT');       
-- Insert possible roles into Catalogs table
INSERT INTO casadluka.catalogs (role) VALUES ('administrador'), ('mesero'), ('cajero');
-- 2. Insertar registros en TipoProducto
INSERT INTO casadluka.product_type (name, parent_id, color_hex)
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

-- Insertar los registros de las mesas
INSERT INTO casadluka.tables (name) 
VALUES 
    ('P1'), ('P2'), ('P3'), ('P4'), ('P5'), 
    ('P6'), ('P7'), ('A1'), ('A3'), ('A4'),
    ('A4'), ('V1'), ('V2'), ('V3'), ('V4'),
    ('V5');
-- 2. Insertar los registros en orden alfabético
INSERT INTO casadluka.payment_method (name) 
VALUES
    ('Efectivo'),
    ('Daviplata'),
    ('Nequi'),
    ('Breb'),
    ('Tarjeta Debito'),
	('Tarjeta Credito');
-- Insert the report types
INSERT INTO casadluka.reports (report_name, report_type, is_active) VALUES
    ('Reporte General', 'CSV', true),
    ('Reporte Rendimiento productos', 'CSV', true),
    ('Reporte Gastos', 'CSV', true),
    ('Reporte General', 'PDF', true),
    ('Reporte Rendimiento productos', 'PDF', true),
    ('Reporte Gastos', 'PDF', true);
-- data Clients 
INSERT INTO casadluka.personTypes (Name) VALUES
('Natural'),
('Juridical');
-- suppliers
INSERT INTO casadluka.supplierCategories (Name, Description) VALUES
('Alimentos', 'Proveedores de productos alimenticios para restaurantes y bares.'),
('Bebidas', 'Proveedores de bebidas, incluyendo opciones alcohólicas y no alcohólicas.'),
('Desechables', 'Proveedores de productos desechables como empaques, vasos, platos, cubiertos y materiales de un solo uso para restaurantes.'),
('Aseo', 'Proveedores de productos y artículos de limpieza e higiene para mantener las áreas de cocina y servicio en óptimas condiciones sanitarias.'),
('Servicios Publicos', 'Servicios esenciales para la operación del restaurante como agua, energía eléctrica, gas, internet y recolección de residuos.');
--
insert into casadluka.users(identification_type_id,identification, first_name, last_name, email, password, birth_date, phone_country_code, phone, address, age, role_id, is_active, created_by, created_at, updated_at)
values(1,1057597671,'store','pro','soluciones@infinitycore.com.co','dsf234',current_timestamp,'+57','3112251244','Carrera 11 # 13-91 of. 205 Sogamoso',30,1,true,null,current_timestamp,null);

INSERT INTO casadluka.expense_categories 
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

INSERT INTO casadluka.notification_type (name, description, is_active)
VALUES ("Informativa", "mensaje informativo para la app", true),
("Alerta", "mensaje de alerta para la app", true),
("Recordatorio", "mensaje de recordatorio para la app", true),
("Promoción", "mensaje de promoción para la app", true);



-- ===============================
-- Estados de incidencia
-- ===============================
INSERT INTO casadluka.incident_statuses (name, description) VALUES
('Abierto', 'Incidencia recién creada y pendiente de asignación'),
('Asignado', 'Incidencia asignada a un técnico pero sin iniciar trabajo'),
('En Proceso', 'Incidencia en proceso de resolución'),
('Solucionado', 'Incidencia resuelta y cerrada');

-- ===============================
-- Niveles de severidad de incidencia
-- ===============================
INSERT INTO casadluka.incident_severities (level, details) VALUES
('Baja', 'Impacto menor o sin afectación crítica'),
('Media', 'Impacto intermedio, requiere atención pronta'),
('Alta', 'Impacto alto o crítico, requiere atención inmediata');

-- ===============================
-- Categorías de incidencia (ejemplos)
-- ===============================
INSERT INTO casadluka.incident_categories (name, description) VALUES
('Bug', 'Error de funcionamiento o defectos en el sistema'),
('Mejora', 'Solicitudes para mejorar funcionalidades existentes'),
('Consulta', 'Dudas, requerimientos o preguntas del cliente');



-- -------------------------------------------------------------
-- Insertar datos iniciales en catálogo de estados de órdenes
-- -------------------------------------------------------------
INSERT INTO casadluka.status_order_catalog(name, description)
VALUES('CREATED', 'Order has been created'),
('IN PROCESS', 'Order processing'),
('DELIVERED', 'Order delivered'),
('CANCELED', 'Order Canceled'),
('PAID', 'Order Successfull payed');


