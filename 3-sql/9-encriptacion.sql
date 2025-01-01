USE curso_sql;

SELECT MD5('MY-PASSWORD');

-- Es mas seguro
SELECT SHA1('MY-PASSWORD');
SELECT SHA2('MY-PASSWORD', 256);

SELECT AES_ENCRYPT('MY-PASSWORD', 'KEY_SECRET');
SELECT AES_DECRYPT('name_campo', 'KEY_SECRET');

CREATE TABLE pagos_recurrentes (
    cuenta VARCHAR(8) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    tarjeta BLOB
);

INSERT INTO pagos_recurrentes VALUES
  ('12345678', 'Kendra', AES_ENCRYPT('1234567890123488', '12345678')),
  ('12345677', 'Malina', AES_ENCRYPT('1234567890123477', '12345677')),
  ('12345676', 'Noah', AES_ENCRYPT('1234567890123466', '12345676')),
  ('12345674', 'Emma', AES_ENCRYPT('1234567890123455', 'super_llave')),
  ('12345673', 'Mathias', AES_ENCRYPT('1234567890123444', 'super_llave'));

SELECT CAST(AES_DECRYPT(tarjeta, '12345678') AS CHAR) AS tarjeta_credito, nombre
FROM pagos_recurrentes;

SELECT CAST(AES_DECRYPT(tarjeta, 'super_llave') AS CHAR) AS tarjeta_credito, nombre
FROM pagos_recurrentes;