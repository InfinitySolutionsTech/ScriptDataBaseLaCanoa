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
INSERT INTO lacanoa.product_type (name) 
VALUES 
    ('Entradas'),
    ('Fuertes'),
    ('Jugos Naturales'),
    ('Bebidas'),
    ('Vinos'),
    ('Cremas');
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
insert into lacanoa.users(identification_type_id,identification, first_name, last_name, email, password, birth_date, phone, address, age, role_id, is_active, created_by, created_at, updated_at)
values(1,1057597,'Jonh','Nino','jonh.nino@example.com','dsf234',current_timestamp,'3112251244','address',29,1,true,null,current_timestamp,null);