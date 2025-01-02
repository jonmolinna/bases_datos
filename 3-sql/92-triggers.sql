CREATE DATABASE curso_sql_2;

CREATE TABLE actividad_cliente (
    ac_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cliente INT UNSIGNED,
    fecha DATETIME,
    FOREIGN KEY (cliente)
    REFERENCES clientes (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

/*
SINTAXIS TRIGGERS

DELIMITER //
CREATE TRIGGER name_disparador
    [BEFORE | AFTER] [INSERT | UPDATE | DELETE]
    ON name_table
    FOR EACH ROW
BEGIN
END //
DELIMITER ;

*/

SELECT * FROM actividad_cliente;

---- los triggers si disparan despues de ejecutar una accion

DELIMITER //
CREATE TRIGGER tg_actividad_clientes
  AFTER INSERT
  ON clientes
  FOR EACH ROW
  BEGIN
    INSERT INTO actividad_cliente VALUES (0, NEW.id, NOW());
  END //
DELIMITER ;

-- Ver Triggers
SHOW TRIGGERS FROM curso_sql_2;

-- DELETE TRIGGERS
DROP TRIGGER tg_actividad_clientes;