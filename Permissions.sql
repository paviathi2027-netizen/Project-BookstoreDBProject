-- Create Roles
CREATE ROLE 'admin';
CREATE ROLE 'manager';
CREATE ROLE 'sales';
CREATE ROLE 'inventory';
CREATE ROLE 'read_only';

-- ======================================================================================

-- Grant Privileges
-- Admin: Full Access
GRANT ALL PRIVILEGES ON OnlineBookstoreDB.* TO 'admin';

-- Manager: Broad operational access
GRANT SELECT, INSERT, UPDATE, DELETE ON OnlineBookstoreDB.* TO 'manager';

-- Sales: Orders, Customers, Payments
GRANT SELECT, INSERT, UPDATE ON OnlineBookstoreDB.Orders TO 'sales';
GRANT SELECT, INSERT, UPDATE ON OnlineBookstoreDB.OrderDetails TO 'sales';
GRANT SELECT, INSERT, UPDATE ON OnlineBookstoreDB.Customers TO 'sales';
GRANT SELECT, INSERT, UPDATE ON OnlineBookstoreDB.Payments TO 'sales';

-- Inventory: Books & Suppliers
GRANT SELECT, INSERT, UPDATE ON OnlineBookstoreDB.Books TO 'inventory';
-- GRANT SELECT, INSERT, UPDATE ON OnlineBookstoreDB.Suppliers TO 'inventory';
-- GRANT SELECT, INSERT, UPDATE ON OnlineBookstoreDB.Book_Supplier TO 'inventory';

-- Read Only: Reporting Only
GRANT SELECT ON OnlineBookstoreDB.* TO 'read_only';

-- ==============================================================================================

-- Create Users
CREATE USER 'bookstore_admin'@'localhost' IDENTIFIED BY 'StrongPassword1!';
CREATE USER 'manager1'@'localhost' IDENTIFIED BY 'ManagerPass1!';
CREATE USER 'sales1'@'localhost' IDENTIFIED BY 'SalesPass1!';
CREATE USER 'inventory1'@'localhost' IDENTIFIED BY 'InventoryPass1!';
CREATE USER 'readonly1'@'localhost' IDENTIFIED BY 'ReadOnlyPass1!';

-- Assign roles
GRANT 'admin' TO 'bookstore_admin'@'localhost';
GRANT 'manager' TO 'manager1'@'localhost';
GRANT 'sales_staff' TO 'sales1'@'localhost';
GRANT 'inventory_staff' TO 'inventory1'@'localhost';
GRANT 'read_only_analyst' TO 'readonly1'@'localhost';