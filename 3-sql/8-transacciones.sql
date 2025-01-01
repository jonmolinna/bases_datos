USE curso_sql;
SELECT * FROM frameworks;

START TRANSACTION -- Inicio de la transaccion
    UPDATE frameworks SET framework = "Vue.js" WHERE id = 11;
    DELETE FROM frameworks;
    INSERT INTO frameworks VALUES (0, "Spring", 5, 2);
ROLLBACK; -- Si ocurre un error, regresa a los valores originales, pero se realizara en un try-catch pero esto se realiza en backend
COMMIT;  -- si sale bien es el Final de una transaccion

-- mysql no soporta el try-catch, pstsql, oracle, sql server si soportan


--------------------- LIMIT
SELECT * FROM frameworks LIMIT 2;
SELECT * FROM frameworks LIMIT 2,2;

-- 6-32-40

