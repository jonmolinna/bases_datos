USE curso_sql;

-- VER TABLAS
SHOW TABLES;

-- DESCRIBE TABLE
DESCRIBE name_table;

-- CREATE TABLE
CREATE TABLE users (
    name VARCHAR(50),
    email VARCHAR(50)
);

-- ALTER TABLE
ALTER TABLE users ADD COLUMN surname VARCHAR(50);
ALTER TABLE users ADD COLUMN birthday VARCHAR(50);

ALTER TABLE users MODIFY birthday DATE;
ALTER TABLE users RENAME COLUMN birthday TO age;
ALTER TABLE users DROP COLUMN age;

DROP TABLE users;

-- CREATE TABLE
CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    surname VARCHAR(30) NOT NULL,
    email VARCHAR(50) UNIQUE,
    address VARCHAR(100) DEFAULT "SIN DIRECCION",
    age INT DEFAULT 0
);

--------------------- INSERT
INSERT INTO users VALUES (0, 'Kendra', 'Contreras', 'kendra.contreras@dallase.pe', 'Av. los Alisos', 29);
INSERT INTO users (name, surname, age) VALUES ("Mireya", "Espinoza", 30);
INSERT INTO users SET name = "Raquel", surname="Rodriguez", age = 25;
INSERT INTO users (name, surname, email, age) VALUES
('Emma', 'Watson', 'emma.watson@dallase.pe', 24),
('Estrella', 'Reyes', 'estrella.reyes@dallase.pe', 28),
('Noah', 'Miranda', 'noah.miranda@dallase.pe', 20);

--------------------- SELECT
SELECT * FROM users;
SELECT name, age, id FROM users;

-- Cuantos registros hay
SELECT COUNT(*) FROM users;
SELECT COUNT(*) AS total_users FROM users;

-- CLAUSULA WHERE AND WHERE IN
SELECT * FROM users WHERE name = 'emma';
SELECT * FROM users WHERE name IN ('emma', 'noah');

-- CLAUSULA LIKE
SELECT * FROM users WHERE name LIKE 'E%';

-- CLAUSULA NOT LIKE
SELECT * FROM users WHERE name NOT LIKE 'E%';

-- Operadores Relacionales
SELECT * FROM users WHERE age > 28;
SELECT * FROM users WHERE age <= 28;

-- Operadores Logicos
SELECT * FROM users WHERE NOT address = 'SIN DIRECCION';
SELECT * FROM users WHERE age >= 20 AND name = "emma";
SELECT * FROM users WHERE name = "emma" OR age = 10;

--------------------- UPDATED
UPDATE users SET email = 'mireya.espinoza@dallase.pe', address = 'Av. Arequipa' WHERE id = 2;

--------------------- DELETE
DELETE FROM users WHERE id = 3;

--------------------- TRUNCATE (reinicia la tabla)
TRUNCATE TABLE users;

---------------------------------- Ejecicios
CREATE TABLE users (
	id INT auto_increment primary key,
    name varchar(30) NOT NULL,
    surname varchar(30) not null,
    email varchar(50) not null,
    age int default 0
);

INSERT INTO users (name, surname, email, age) values
("kendra", "contreras", "kcontreras@dallase.pe", 29),
("malina", "tanase", "mtanase@dallase.pe", 25),
("mireya", "espinoza", "mespinoza", 30),
("noah", "saez", "noahsa@dallase.pe", 25);

create table products (
	id INT auto_increment primary key,
    name varchar(50) not null,
    description varchar(50),
    precio decimal(7,2),
    cantidad int unsigned
);

insert into products (name, description, precio, cantidad) values
("computadora", "macbook air m2", 29999.99, 5),
("celular", "nothing phone 1", 11999.99, 15),
("camara web", "logitech c920", 1500, 13),
("microfono", "blue yeti", 2500, 19),
("audifonos", "audifonos bose", 6500, 10);

CREATE TABLE caballeros (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30),
    armadura VARCHAR(30) UNIQUE,
    rango VARCHAR(30),
    signo VARCHAR(30),
    ejercito VARCHAR(30),
    pais VARCHAR(30)
);

INSERT INTO caballeros VALUES
  (0,"Seiya","Pegaso","Bronce","Sagitario","Athena","Japón"),
  (0,"Shiryu","Dragón","Bronce","Libra","Athena","Japón"),
  (0,"Hyoga","Cisne","Bronce","Acuario","Athena","Rusia"),
  (0,"Shun","Andromeda","Bronce","Virgo","Athena","Japón"),
  (0,"Ikki","Fénix","Bronce","Leo","Athena","Japón"),
  (0,"Kanon","Géminis","Oro","Géminis","Athena","Grecia"),
  (0,"Saga","Géminis","Oro","Géminis","Athena","Grecia"),
  (0,"Camus","Acuario","Oro","Acuario","Athena","Francia"),
  (0,"Rhadamanthys","Wyvern","Espectro","Escorpión","Hades","Inglaterra"),
  (0,"Kanon","Dragón Marino","Marino","Géminis","Poseidón","Grecia"),
  (0,"Kagaho","Bennu","Espectro","Leo","Hades","Rusia");



