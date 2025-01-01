CREATE DATABASE curso_sql_2;

USE curso_sql_2;

CREATE TABLE suscripciones (
    id INT  UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    costo DECIMAL(5,2) NOT NULL
);

INSERT INTO suscripciones VALUE
(0, 'Bronce', 199.99),
(0, 'Plata', 299.99),
(0, 'Oro', 399.99);

CREATE TABLE clientes (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    email VARCHAR (50) UNIQUE
);

CREATE TABLE tarjetas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cliente INT UNSIGNED,
    tarjeta BLOB,
    FOREIGN KEY (cliente) REFERENCES clientes(id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE servicios (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cliente INT UNSIGNED,
    tarjeta INT UNSIGNED,
    suscripcion INT UNSIGNED,
    FOREIGN KEY (cliente) REFERENCES clientes(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (tarjeta) REFERENCES tarjetas(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (suscripcion) REFERENCES suscripciones (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

SELECT * FROM suscripciones;
SELECT * FROM clientes;
SELECT * FROM tarjetas;
SELECT * FROM servicios;

DELIMITER //
CREATE PROCEDURE sp_obtener_suscripciones()
    BEGIN
        SELECT * FROM suscripciones;
    END //
DELIMITER ;

--- EJECUTA
CALL sp_obtener_suscripciones();


---- El cliente no puede tener mas de dos suscripciones con el mismo email
DELIMITER //
CREATE PROCEDURE sp_asignar_servicio(
    -- PARAMETRO DE ENTRADA
    IN i_suscripcion INT UNSIGNED,
    IN i_nombre VARCHAR(30),
    IN i_correo VARCHAR (50),
    IN i_tarjeta VARCHAR(16),

    -- PARAMETRO DE SALIDA
    OUT o_respuesta VARCHAR(50)
)
    BEGIN
        -- VARIABLES
        DECLARE exist_email INT DEFAULT 0;
        DECLARE cliente_id INT DEFAULT 0;
        DECLARE tarjeta_id INT DEFAULT 0;

        START TRANSACTION;
            SELECT COUNT(*) INTO exist_email FROM clientes
            WHERE email = i_correo;

            -- <> distinto
            IF exist_email <> 0 THEN
                SELECT 'Tu correo ya ha sido registrado' INTO o_respuesta;
            ELSE
                INSERT INTO clientes VALUES (0, i_nombre, i_correo);
                SELECT LAST_INSERT_ID() INTO cliente_id;

                INSERT INTO tarjetas VALUES (0, cliente_id, AES_ENCRYPT(i_tarjeta, cliente_id));
                SELECT LAST_INSERT_ID() INTO tarjeta_id;

                INSERT INTO servicios VALUES (0, cliente_id, tarjeta_id, i_suscripcion);

                SELECT 'Servicio asignado con exito' INTO o_respuesta;
            END IF;
        COMMIT;
    END //
DELIMITER ;

------ LISTS PROCEDURE
SHOW PROCEDURE STATUS WHERE db='curso_sql_2';

------ DELETE PROCEDURE
DROP PROCEDURE sp_obtener_suscripciones;

--------------
CALL sp_asignar_servicio(3, 'Kendra Contreras', 'kcontreras@dallase.pe', '1234567890123456', @res);
SELECT @res;

SELECT * FROM suscripciones;
SELECT * FROM clientes;
SELECT * FROM tarjetas;
SELECT * FROM servicios;