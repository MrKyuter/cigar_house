-- Usuarios y permisos de Cigar House
USE cigar_house;

CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY 'Admin_CigarHouse_2026!';
GRANT ALL PRIVILEGES ON cigar_house.* TO 'admin'@'localhost';

CREATE USER IF NOT EXISTS 'app_user'@'localhost' IDENTIFIED BY 'App_CigarHouse_2026!';
GRANT SELECT, INSERT, UPDATE, DELETE ON cigar_house.* TO 'app_user'@'localhost';

CREATE USER IF NOT EXISTS 'analyst'@'localhost' IDENTIFIED BY 'Analyst_CigarHouse_2026!';
GRANT SELECT ON cigar_house.* TO 'analyst'@'localhost';

FLUSH PRIVILEGES;

-- Para comprobar:
-- SHOW GRANTS FOR 'admin'@'localhost';
-- SHOW GRANTS FOR 'app_user'@'localhost';
-- SHOW GRANTS FOR 'analyst'@'localhost';
