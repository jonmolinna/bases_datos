-- Copias de las consultas que se realizan y se almacenan en una tabla views
-- Mayormente se usan para hacer reportes
USE curso_sql;

-- Primer Vista
CREATE VIEW vista_caballero AS
SELECT c.id, c.name as "caballero", a.name as "armadura",
s.name as "signo", r.name as "rango",
e.name as "ejercito", p.name as "pais" FROM caballeros c 
INNER JOIN armaduras a  ON c.armadura = a.id
INNER JOIN signos s ON c.signo = s.id
INNER JOIN rangos r ON c.rango = r.id
INNER JOIN ejercitos e ON c.ejercito = e.id
INNER JOIN paises p ON c.pais = p.id;

SELECT * FROM vista_caballero;

-- Segundo Vista
CREATE VIEW vista_signo AS
SELECT name as signo,
(SELECT COUNT(*) FROM caballeros c WHERE c.signo = s.id)
AS total_caballeros
FROM signos s;

SELECT * FROM vista_signo;


-- DELETE VISTA
DROP VIEW vista_caballero;

-- VERIFICAR VISTAS
SHOW FULL TABLES IN curso_sql WHERE TABLE_TYPE LIKE 'VIEW';