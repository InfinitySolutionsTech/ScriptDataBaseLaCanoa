-- =====================================================================
-- SCRIPT DE CARGA DE DATOS COMUNES PARA TODOS LOS RESTAURANTES
-- Este archivo contiene los inserts que son idénticos en los 3 restaurantes
-- Debe ejecutarse DESPUÉS de crear las tablas en cada base de datos
-- =====================================================================

-- NOTA: Este script debe ejecutarse para cada restaurante reemplazando {schema_name}
-- por el nombre del esquema correspondiente: lasburguers, casadluka, o lacanoa

-- =====================================================================
-- TIPOS DE IDENTIFICACIÓN
-- =====================================================================
-- Insert default values
INSERT INTO {schema_name}.identificationType (name) VALUES
('CC'),           -- Citizen ID
('Pasaporte'),    -- International Travel Document
('CE'),
('RUT'),
('NIT');          -- Tax ID Number

-- =====================================================================
-- TIPOS DE PERSONA
-- =====================================================================
-- data Clients 
INSERT INTO {schema_name}.personTypes (Name) VALUES
('Natural'),
('Juridical');

-- =====================================================================
-- TIPOS DE NOTIFICACIÓN
-- =====================================================================
INSERT INTO {schema_name}.notification_type (name, description, is_active)
VALUES ("Informativa", "mensaje informativo para la app", true),
("Alerta", "mensaje de alerta para la app", true),
("Recordatorio", "mensaje de recordatorio para la app", true),
("Promoción", "mensaje de promoción para la app", true);

-- =====================================================================
-- TIPOS DE REPORTES COMUNES
-- =====================================================================
INSERT INTO {schema_name}.reports (report_name, report_type, is_active) VALUES
    ('Reporte General', 'CSV', true),
    ('Reporte Rendimiento productos', 'CSV', true),
    ('Reporte Gastos', 'CSV', true),
    ('Reporte General', 'PDF', true),
    ('Reporte Rendimiento productos', 'PDF', true),
    ('Reporte Gastos', 'PDF', true);

-- =====================================================================
-- ESTADOS DE INCIDENCIA
-- =====================================================================
INSERT INTO {schema_name}.incident_statuses (name, description) VALUES
('Abierto', 'Incidencia recién creada y pendiente de asignación'),
('Asignado', 'Incidencia asignada a un técnico pero sin iniciar trabajo'),
('En Proceso', 'Incidencia en proceso de resolución'),
('Solucionado', 'Incidencia resuelta y cerrada');

-- =====================================================================
-- NIVELES DE SEVERIDAD DE INCIDENCIA
-- =====================================================================
INSERT INTO {schema_name}.incident_severities (level, details) VALUES
('Baja', 'Impacto menor o sin afectación crítica'),
('Media', 'Impacto intermedio, requiere atención pronta'),
('Alta', 'Impacto alto o crítico, requiere atención inmediata');

-- =====================================================================
-- CATEGORÍAS DE INCIDENCIA
-- =====================================================================
INSERT INTO {schema_name}.incident_categories (name, description) VALUES
('Bug', 'Error de funcionamiento o defectos en el sistema'),
('Mejora', 'Solicitudes para mejorar funcionalidades existentes'),
('Consulta', 'Dudas, requerimientos o preguntas del cliente');

-- =====================================================================
-- CATÁLOGO DE ESTADOS DE ÓRDENES
-- =====================================================================
INSERT INTO {schema_name}.status_order_catalog(name, description)
VALUES('CREATED', 'Order has been created'),
('IN PROCESS', 'Order processing'),
('DELIVERED', 'Order delivered'),
('CANCELED', 'Order Canceled'),
('PAID', 'Order Successfull payed');

