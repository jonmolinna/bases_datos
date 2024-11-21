------------------------ Calculos Aritmeticos
SELECT 6 + 5 AS calculo;
SELECT 6 - 5 AS calculo;
SELECT 6 * 5 AS calculo;
SELECT 6 / 5 AS calculo;

------------------------ Funciones Matematicas
SELECT MOD(5, 2) AS calculo;
SELECT CEILING(7.1); -- 8
SELECT FLOOR(7.9); -- 7
SELECT ROUND(7.5); -- 8
SELECT POWER(2, 6); -- 64

------------------------ Columnas Calculadas
SELECT name, precio, cantidad, (precio * cantidad) as Ganancia from products;

------------------------ Funciones de agrupamiento
SELECT MAX(precio) AS precio_maximo from products;
SELECT MIN(precio) AS precio_minimo from products;
SELECT SUM(cantidad) as stock_total from products;
SELECT AVG(precio) as precio_promedio from products;

------------------------ GROUP BY
SELECT name, precio, MAX(precio) AS precio_maximo FROM products GROUP BY precio, name;

SELECT signo, COUNT(*) as total FROM caballeros GROUP BY signo;
SELECT rango, COUNT(*) AS total FROM caballeros GROUP BY rango;
SELECT ejercito, COUNT(*) AS total FROM caballeros GROUP BY ejercito;
SELECT rango, COUNT(*) AS total FROM caballeros WHERE ejercito = "Athena" GROUP BY rango;

------------------------ HAVING
-- WHERE condicion del campo que existe en la tabla
-- HAVING condicion del campo calculado o con un campo en la tabla
SELECT rango, COUNT(*) AS total FROM caballeros WHERE ejercito = "Athena" GROUP BY rango HAVING total >= 4;
SELECT name, precio, MAX(precio) AS precio_maximo FROM products GROUP BY name, precio HAVING precio >= 10000;

------------------------ DISTINCT
SELECT DISTINCT signo FROM caballeros;
SELECT DISTINCT pais FROM caballeros;

------------------------ ORDER BY
SELECT * FROM caballeros ORDER BY name ASC;
SELECT * FROM caballeros ORDER BY name, signo DESC;
SELECT * FROM caballeros WHERE ejercito = "Athena" ORDER BY name, armadura;
SELECT ejercito, COUNT(*) AS total FROM caballeros GROUP BY ejercito ORDER BY ejercito DESC;
SELECT name, precio, MAX(precio) AS precio_maximo FROM products GROUP BY precio, name HAVING precio_maximo >= 1000 ORDER BY name;

------------------------ BETWEEN
SELECT * FROM products WHERE precio BETWEEN 5000 AND 15000;

------------------------ REGEXP
SELECT * FROM products WHERE name REGEXP "[a-z]";
SELECT * FROM products WHERE description REGEXP '[0-9]';

------------------------ Funciones Cadenas
SELECT UPPER(name), LOWER(description), precio FROM products;

