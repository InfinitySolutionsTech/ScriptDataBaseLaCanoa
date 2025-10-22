ALTER TABLE lacanoa.orders RENAME COLUMN paid to status;
ALTER TABLE lacanoa.orders MODIFY COLUMN status INT NOT NULL DEFAULT 1;

alter table lacanoa.orders 
add constraint fk_order_status 
foreign key(status) 
    references lacanoa.status_order_catalog(id)
    on delete restrict
    on update restrict;
   
   
CREATE TABLE lacanoa.status_order_catalog(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL,
	description VARCHAR(200) NOT NULL
);

INSERT INTO lacanoa.status_order_catalog(name, description)
VALUES('CREATED', 'Order has been created'),
('IN PROCESS', 'Order processing'),
('DELIVERED', 'Order delivered'),
('CANCELED', 'Order Canceled'),
('PAID', 'Order Successfull payed');