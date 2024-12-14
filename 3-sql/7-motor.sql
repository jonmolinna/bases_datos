USE curso_sql;

------------------------- Motores DB
-- TABLA PLANA, No acepta relaciones, restricciones o transaciones
CREATE TABLE armaduras (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL
) ENGINE=MyISAM;

-- TABLA POR DEFAULT
CREATE TABLE armaduras (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL
) ENGINE=InnoDB;


------------------------- Caracteres DB
CREATE TABLE armaduras (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL
) DEFAULT CHARSET=utf8mb4;

------------------------- RESTRICCIONES (DELETE Y UPDATE)
--  - CASCADE
--  - SET NULL
--  - SET DEFAULT
--  - RESTRICT

USE curso_sql;

CREATE TABLE lenguajes (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);

INSERT INTO lenguajes (name) VALUES
("JavaScript"),
("Php"),
("Python"),
("Ruby"),
("Java");

CREATE TABLE entornos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);

INSERT INTO entornos (name) VALUES
("Frontend"),
("Backend");

CREATE TABLE frameworks (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    lenguaje INT UNSIGNED,
    entorno INT UNSIGNED,
    FOREIGN KEY (lenguaje) REFERENCES lenguajes(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (entorno) REFERENCES entornos(id) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO frameworks (name, lenguaje, entorno) VALUES
("React", 1, 1),
("Angular", 1, 1),
("Vue", 1, 1),
("Svelte", 1, 1),
("Laravel", 2, 2),
("Symfony", 2, 2),
("Flask", 3, 2),
("Django", 3, 2),
("On Rails", 4, 2);


SELECT * FROM lenguajes;
SELECT * FROM frameworks;

SELECT * FROM frameworks f INNER JOIN lenguajes l ON f.lenguaje = l.id;

--- Eliminar
DELETE FROM lenguajes WHERE id = 3;

DROP TABLE lenguajes;
DROP TABLE frameworks;

---------------------------------------- CASCADE AND RESTRICT
CREATE TABLE frameworks (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    lenguaje INT UNSIGNED,
    FOREIGN KEY (lenguaje) REFERENCES lenguajes(id) ON DELETE RESTRICT ON UPDATE CASCADE
);

--- UPDATED
UPDATE lenguajes SET id = 13 WHERE id = 3;

---------------------------------------- SET NULL
CREATE TABLE frameworks (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    lenguaje INT UNSIGNED,
    FOREIGN KEY (lenguaje) REFERENCES lenguajes(id) ON DELETE SET NULL ON UPDATE CASCADE
);