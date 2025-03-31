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

    -- Campos estandarizados en inglés
    country VARCHAR(100),
    state VARCHAR(100),
    city VARCHAR(100),
    address VARCHAR(255),
    neighborhood VARCHAR(100),

    age INT,
    role_id BIGINT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_by BIGINT,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME,

    CONSTRAINT fk_user_identification_type
        FOREIGN KEY (identification_type_id) REFERENCES identificationType(id),
    CONSTRAINT fk_user_role
        FOREIGN KEY (role_id) REFERENCES catalogs(id),
    CONSTRAINT fk_user_created_by
        FOREIGN KEY (created_by) REFERENCES users(id)
);

-- Create ProductType table
CREATE TABLE lacanoa.product_type (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    parent_id BIGINT,
    color_hex VARCHAR(7)
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
    supplierID BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    contact VARCHAR(255),
    phone VARCHAR(20),
    email VARCHAR(255),

    -- Campos estandarizados en inglés
    address TEXT,
    country VARCHAR(100),
    state VARCHAR(100),
    city VARCHAR(100),
    neighborhood VARCHAR(100),

    postalCode VARCHAR(20),
    categoryID INT NOT NULL,
    identificationTypeID BIGINT NOT NULL,
    documentNumber VARCHAR(50) NOT NULL,
    createdBy BIGINT,
    registrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    isActive BOOLEAN DEFAULT TRUE,

    FOREIGN KEY (categoryID) REFERENCES supplierCategories(categoryID),
    FOREIGN KEY (identificationTypeID) REFERENCES identificationType(id),
    FOREIGN KEY (createdBy) REFERENCES lacanoa.users(id)
);

-- Clientes 
CREATE TABLE lacanoa.personTypes (
    personTypeID BIGINT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del tipo de persona
    name VARCHAR(50) NOT NULL UNIQUE            -- Nombre del tipo de persona (Natural o Juridical)
);
CREATE TABLE lacanoa.clients (
    clientID BIGINT  AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(100),
    lastName VARCHAR(100),
    identificationTypeID BIGINT NOT NULL,
    documentNumber VARCHAR(50) NOT NULL UNIQUE,
    verificationDigit CHAR(1),

    -- Campos estandarizados en inglés
    address TEXT,
    city VARCHAR(100),
    country VARCHAR(100),
    state VARCHAR(100),
    neighborhood VARCHAR(100),

    email VARCHAR(255),
    phone VARCHAR(20),
    personTypeID BIGINT NOT NULL,
    isTaxWithholder BOOLEAN DEFAULT FALSE,
    createdBy BIGINT,
    registrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (identificationTypeID) REFERENCES lacanoa.identificationType(id),
    FOREIGN KEY (personTypeID) REFERENCES lacanoa.personTypes(PersonTypeID),
    FOREIGN KEY (createdBy) REFERENCES lacanoa.users(id)
);



-- Create Invoice table
CREATE TABLE lacanoa.invoice (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT NOT NULL,
    client_id BIGINT,
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
-- Gastos
-- Tabla complementaria para categorías de gastos
CREATE TABLE lacanoa.expense_categories (
    categoryID INT AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(100) NOT NULL,
    description TEXT,
    isActive BOOLEAN DEFAULT TRUE,
    createdDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE lacanoa.expenses (
    expenseID BIGINT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del gasto
    supplierID bigint NULL, -- Relación con el proveedor (puede ser NULL si no está asociado a un proveedor)
    expenseDate DATE NOT NULL, -- Fecha del gasto
    description TEXT NOT NULL, -- Descripción detallada del gasto
    amount DECIMAL(10,2) NOT NULL, -- Monto del gasto
    payment_method_id BIGINT NOT NULL, -- Método de pago relacionado con payment_method
    expense_category_id INT NOT NULL, -- Categoría del gasto
    invoiceNumber VARCHAR(50), -- Número de factura si existe
    created_by BIGINT NOT NULL, -- Usuario que registró el gasto (relacionado con users)
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Fecha de registro
    updated_at DATETIME, -- Última actualización
    is_active BOOLEAN DEFAULT TRUE, -- Estado del registro
    FOREIGN KEY (supplierID) REFERENCES lacanoa.suppliers(supplierID),
    FOREIGN KEY (created_by) REFERENCES lacanoa.users(id),
    FOREIGN KEY (payment_method_id) REFERENCES lacanoa.payment_method(id),
    FOREIGN KEY (expense_category_id) REFERENCES lacanoa.expense_categories(categoryID)
);

CREATE TABLE lacanoa.notification_type(
	notification_type_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description VARCHAR(200) NOT NULL,
  is_active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE lacanoa.notification_history(
	notification_history_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  user_send INT NOT NULL,
  message TEXT NOT NULL,
  message_title VARCHAR(200) NOT NULL,
  creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  type INT NOT NULL
);

CREATE TABLE lacanoa.notification_user(
	notification_user_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  notification_history_id BIGINT NOT NULL,
  user_id BIGINT,
  is_for_all_users BOOLEAN NOT NULL 
);