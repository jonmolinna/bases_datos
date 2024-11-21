-- Crear Nase de datos
CREATE DATABASE curso_sql;

CREATE DATABASE IF NOT EXISTS curso_sql;

-- Eliminar una base de datos
DROP DATABASE curso_sql;

DROP DATABASE IF EXISTS curso_sql;

-- CREANDO UN USUARIO
-- mysql -u kcontreras -p
CREATE USER 'kcontreras'@'localhost' IDENTIFIED BY '125';

-- ADD PRIVILEGIOS
GRANT ALL PRIVILEGES ON curso_sql TO 'kcontreras'@'localhost';

-- UPDATED PRIVILEGES
FLUSH PRIVILEGES;

-- SHOW PRIVELEGES BY USER
SHOW GRANTS FOR 'kcontreras'@'localhost';

-- REMOVE PRIVELEGES BY USER
REVOKE ALL, GRANT OPTION FROM 'kcontreras'@'localhost';

-- DELETE USER
DROP USER 'kcontreras'@'localhost';