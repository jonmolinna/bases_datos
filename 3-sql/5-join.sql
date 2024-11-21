CREATE TABLE armaduras (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);

CREATE TABLE signos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);

CREATE TABLE rangos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);

CREATE TABLE ejercitos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);

CREATE TABLE paises (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);

CREATE TABLE caballeros (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30),
    armadura INT UNSIGNED,
    rango INT UNSIGNED,
    signo INT UNSIGNED,
    ejercito INT UNSIGNED,
    pais INT UNSIGNED,
    FOREIGN KEY(armadura) REFERENCES armaduras(id),
    FOREIGN KEY(rango) REFERENCES rangos(id),
    FOREIGN KEY(signo) REFERENCES signos(id),
    FOREIGN KEY(ejercito) REFERENCES ejercitos(id),
    FOREIGN KEY(pais) REFERENCES paises(id)
);

INSERT INTO armaduras VALUES
  (1, "Pegaso"),
  (2, "Dragón"),
  (3, "Cisne"),
  (4, "Andrómeda"),
  (5, "Fénix"),
  (6, "Géminis"),
  (7, "Acuario"),
  (8, "Wyvern"),
  (9, "Dragón Marino"),
  (10, "Bennu");

INSERT INTO rangos VALUES
  (1, "Bronce"),
  (2, "Oro"),
  (3, "Espectro"),
  (4, "Marino");

INSERT INTO signos VALUES
  (1, "Aries"),
  (2, "Tauro"),
  (3, "Géminis"),
  (4, "Cancer"),
  (5, "Leo"),
  (6, "Virgo"),
  (7, "Libra"),
  (8, "Escorpión"),
  (9, "Sagitario"),
  (10, "Capricornio"),
  (11, "Acuario"),
  (12, "Piscis");

  INSERT INTO ejercitos VALUES
  (1, "Athena"),
  (2, "Hades"),
  (3, "Poseidón");

INSERT INTO paises VALUES
  (1, "Japón"),
  (2, "Rusia"),
  (3, "Grecia"),
  (4, "Francia"),
  (5, "Inglaterra");

  INSERT INTO caballeros VALUES
  (1,"Seiya", 1, 1, 9, 1, 1),
  (2,"Shiryu", 2, 1, 7, 1, 1),
  (3,"Hyoga", 3, 1, 11, 1, 2),
  (4,"Shun", 4, 1, 6, 1, 1),
  (5,"Ikki", 5, 1, 5, 1, 1),
  (6,"Kanon", 6, 2, 3, 1, 3),
  (7,"Saga", 6, 2, 3, 1, 3),
  (8,"Camus", 7, 2, 11, 1, 4),
  (9,"Rhadamanthys", 8, 3, 8, 2, 5),
  (10,"Kanon", 9, 4, 3, 3, 3),
  (11,"Kagaho", 10, 3, 5, 2, 2);

--   ------------------- JOIN
-- A. LEFT JOIN
SELECT * FROM caballeros c LEFT JOIN signos s
    ON c.signo = s.id;

-- B. RIGHT JOIN
SELECT * FROM caballeros c RIGHT JOIN signos s
    ON c.signo = s.id;

-- C. INNER JOIN
SELECT * FROM caballeros c INNER JOIN signos s
    ON c.signo = s.id;

-- D. FULL JOIN (mysql no soporta)
SELECT * FROM caballeros c LEFT JOIN signos s
    ON c.signo = s.id
UNION
SELECT * FROM caballeros c RIGHT JOIN signos s
    ON c.signo = s.id;




