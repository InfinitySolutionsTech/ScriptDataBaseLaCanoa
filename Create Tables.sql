-- Version 3

-- SQL Schema
-- Create Catalogs table (possible roles)
CREATE TABLE lacanoa.Catalogs (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    role VARCHAR(50) NOT NULL UNIQUE
);



-- Create IdentificationType table
CREATE TABLE lacanoa.IdentificationType (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);



-- Create Users table
CREATE TABLE lacanoa.Users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    identification_type_id BIGINT NOT NULL,
    identification VARCHAR(50) UNIQUE NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    birth_date DATE,
    phone VARCHAR(20),
    role_id BIGINT NOT NULL,
    created_by BIGINT,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME,
    
    -- Foreign keys
    CONSTRAINT fk_user_identification_type FOREIGN KEY (identification_type_id) REFERENCES IdentificationType(id),
    CONSTRAINT fk_user_role FOREIGN KEY (role_id) REFERENCES Catalogs(id),
    CONSTRAINT fk_user_created_by FOREIGN KEY (created_by) REFERENCES Users(id)
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
    time DATETIME NOT NULL,
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
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    Consumption_type BOOLEAN DEFAULT FALSE,
    
    CONSTRAINT fk_detail_order FOREIGN KEY (order_id) 
        REFERENCES orders(id),
    CONSTRAINT fk_detail_product FOREIGN KEY (product_id) 
        REFERENCES product(id)
);

-- Create Invoice table
CREATE TABLE lacanoa.invoice (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT NOT NULL,
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
    
    CONSTRAINT fk_invoice_order FOREIGN KEY (order_id) 
        REFERENCES orders(id),
    CONSTRAINT fk_invoice_payment_method FOREIGN KEY (payment_method_id) 
        REFERENCES payment_method(id)
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
