-- SQL Schema
CREATE SCHEMA lacanoa;
-- Create Catalogs table (possible roles)
CREATE TABLE lacanoa.catalogs (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    role VARCHAR(50) NOT NULL UNIQUE
);
-- Create IdentificationType table
CREATE TABLE lacanoa.identificationType (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE lacanoa.users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    identification_type_id BIGINT NOT NULL,
    identification VARCHAR(50) UNIQUE NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    birth_date DATE,
    phone VARCHAR(20),
    address VARCHAR(255),
    age INT,
    role_id BIGINT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_by BIGINT,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME,

    CONSTRAINT fk_user_identification_type FOREIGN KEY (identification_type_id) REFERENCES identificationType(id),
    CONSTRAINT fk_user_role FOREIGN KEY (role_id) REFERENCES catalogs(id),
    CONSTRAINT fk_user_created_by FOREIGN KEY (created_by) REFERENCES users(id)
);
-- Create ProductType table
CREATE TABLE lacanoa.product_type (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);
-- Create Product table
CREATE TABLE lacanoa.product (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type_id BIGINT NOT NULL,
    value DECIMAL(10, 2) NOT NULL,
    description VARCHAR(255) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    creation_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_date DATETIME,
    
    CONSTRAINT fk_product_type FOREIGN KEY (type_id) 
        REFERENCES product_type(id)
);
-- Create Tables table (restaurant tables)
CREATE TABLE lacanoa.tables (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
-- Create PaymentMethod table
CREATE TABLE lacanoa.payment_method (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
-- Create Orders table
CREATE TABLE lacanoa.orders (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    table_id BIGINT NOT NULL,
    paid BOOLEAN NOT NULL DEFAULT false,
    creation_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_date DATETIME,
    
    CONSTRAINT fk_order_user FOREIGN KEY (user_id) 
        REFERENCES users(id),
    CONSTRAINT fk_order_table FOREIGN KEY (table_id) 
        REFERENCES tables(id)
);
-- Create OrderDetails table
CREATE TABLE lacanoa.order_details (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    observations VARCHAR(100),
    Consumption_type BOOLEAN DEFAULT FALSE,
    
    CONSTRAINT fk_detail_order FOREIGN KEY (order_id) 
        REFERENCES orders(id),
    CONSTRAINT fk_detail_product FOREIGN KEY (product_id) 
        REFERENCES product(id)
);
 -- Create the reports table
CREATE TABLE lacanoa.reports (
    id SERIAL PRIMARY KEY,
    report_name VARCHAR(100) NOT NULL,
    report_type VARCHAR(50) NOT NULL,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- informacion para crear proovedores 
CREATE TABLE lacanoa.supplierCategories (
    categoryID INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único de la categoría
    name VARCHAR(100) NOT NULL UNIQUE,         -- Nombre de la categoría
    description TEXT                           -- Descripción opcional de la categoría
);
CREATE TABLE lacanoa.suppliers (
    supplierID BIGINT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del proveedor
    name VARCHAR(255) NOT NULL,                -- Nombre del proveedor o empresa
    contact VARCHAR(255),                      -- Nombre de la persona de contacto
    phone VARCHAR(20),                         -- Número de teléfono
    email VARCHAR(255),                        -- Dirección de correo electrónico
    address TEXT,                              -- Dirección física
    city VARCHAR(100),                         -- Ciudad
    state VARCHAR(100),                        -- Estado o provincia
    postalCode VARCHAR(20),                    -- Código postal
    country VARCHAR(100) DEFAULT 'Mexico',     -- País (por defecto, México)
    categoryID INT NOT NULL,                   -- Categoría del proveedor (FK de SupplierCategories)
    identificationTypeID BIGINT NOT NULL,      -- Tipo de documento (FK de identificationType)
    documentNumber VARCHAR(50) NOT NULL,       -- Número de documento del proveedor
    createdBy BIGINT ,                         -- User who created the client (FK to lacanoa.users)
    registrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha de registro
    lastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha de última actualización
    isActive BOOLEAN DEFAULT TRUE,             -- Estado activo/inactivo
    FOREIGN KEY (categoryID) REFERENCES supplierCategories(categoryID), -- Relación con SupplierCategories
    FOREIGN KEY (identificationTypeID) REFERENCES identificationType(id), -- Relación con identificationType
    FOREIGN KEY (createdBy) REFERENCES lacanoa.users(id) -- Relationship with lacanoa.users

);
-- Clientes 
CREATE TABLE lacanoa.personTypes (
    personTypeID INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del tipo de persona
    name VARCHAR(50) NOT NULL UNIQUE            -- Nombre del tipo de persona (Natural o Juridical)
);
CREATE TABLE lacanoa.clients (
   	clientID INT AUTO_INCREMENT PRIMARY KEY,           -- Unique identifier for the client
    firstName VARCHAR(100),                            -- Client's first name
    lastName VARCHAR(100),                             -- Client's last name
    identificationTypeID BIGINT NOT NULL,              -- Foreign key to IdentificationType table
    documentNumber VARCHAR(50) NOT NULL UNIQUE,        -- Document number
    verificationDigit CHAR(1),                         -- Verification digit for the document
    address TEXT,                                      -- Client's address
    city VARCHAR(100),                         		   -- Ciudad 
    email VARCHAR(255),                                -- Client's email address
    phone VARCHAR(20),                                 -- Client's phone number
    personTypeID INT NOT NULL,                         -- Foreign key to PersonTypes table
    isTaxWithholder BOOLEAN DEFAULT FALSE,             -- Indicates if the client is a tax withholder
    createdBy BIGINT ,                         -- User who created the client (FK to lacanoa.users)
    registrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Registration date
    lastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Last updated date
    FOREIGN KEY (identificationTypeID) REFERENCES lacanoa.identificationType(id), -- Relationship with IdentificationType
    FOREIGN KEY (personTypeID) REFERENCES lacanoa.personTypes(PersonTypeID), -- Relationship with PersonTypes
    FOREIGN KEY (createdBy) REFERENCES lacanoa.users(id) -- Relationship with lacanoa.users
);
-- Create Invoice table
CREATE TABLE lacanoa.invoice (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT NOT NULL,
    client_id INT,
    total DECIMAL(10, 2) NOT NULL,
    amount_delivered DECIMAL(10, 2) NOT NULL,
    changes DECIMAL(10, 2) NOT NULL,
    discount DECIMAL(5, 2),
    vat DECIMAL(10, 2) NOT NULL,
    consumption_tax DECIMAL(10, 2) NOT NULL,
    emission_date DATETIME NOT NULL,
    status BOOLEAN NOT NULL DEFAULT FALSE,
    pre_invoice BOOLEAN NOT NULL DEFAULT FALSE,
    invoice BOOLEAN NOT NULL DEFAULT FALSE,
    electronic_invoice BOOLEAN NOT NULL DEFAULT FALSE,
    payment_method_id BIGINT NOT NULL,
    
    CONSTRAINT fk_invoice_order FOREIGN KEY (order_id) REFERENCES orders(id),
    CONSTRAINT fk_invoice_payment_method FOREIGN KEY (payment_method_id) REFERENCES payment_method(id),
    CONSTRAINT fk_invoice_client FOREIGN KEY (client_id) REFERENCES lacanoa.clients(clientID)
);