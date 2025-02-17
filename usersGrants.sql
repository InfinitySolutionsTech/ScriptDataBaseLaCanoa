CREATE USER 'lacanoa_user'@'%' IDENTIFIED BY '5T0r3Pr8S01ut20ns';
GRANT SELECT, INSERT, UPDATE, DELETE ON lacanoa.* TO 'lacanoa_user'@'%';
FLUSH PRIVILEGES;

SHOW GRANTS FOR 'lacanoa_user'@'%';
