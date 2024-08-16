# Ventas

## Listado de Entidades

### clientes **(ED)**

- cliente_id **(PK)**
- nombre
- apellidos
- telefono **(UQ)**
- email **(UQ)**
- direccion
- codigo_postal
- ciudad
- pais **(FK)**

### productos **(ED)**

- producto_id
- nombre
- descripcion
- foto
- precio
- cantidad

### ventas **(ED)**

- venta_id **(PK)**
- cliente_id **(FK)**
- fecha
- monto

### articulos_venta **(EP)**

- articulo_id **(PK)**
- venta_id **(FK)**
- producto_id **(FK)**
- cantidad

### paises **(EC)**

- pais_id **(PK)**
- nombre
- dominio **(UQ)**

## Relaciones

1. Un **cliente** tiene **pais** (_1 - 1_).
2. Un **cliente** genera **venta** (_1 - M_).
3. Una **venta** tiene **articulo** (_1 - M_).
4. Una **articulo** es un **producto** (_1 - 1_).

## Diagramas

### Modelo Relacional de la BD

![Modelo Relacional](./moldelo-relacional-db.png)

## Reglas de Negocio

### clientes

1. Crear un ciente.
2. Leer todos los clientes.
3. Leer un cliente en particular.
4. Actualizar un cliente.
5. Eliminar un cliente.

### productos

1. Crear un producto.
2. Leer todos los productos.
3. Leer un producto en particular.
4. Actualizar un producto.
5. Eliminar un producto.
6. Cada que haya una venta restar a la cantidad de productos disponibles, el numero de articulos que se vendieron.

### ventas

1. Crear una venta.
2. Leer todas las ventas.
3. Leer una venta en particular.
4. Leer todas las ventas de un cliente.
5. Leer todas las ventas de un producto.
6. Actualizar una venta.
7. Eliminar una venta.

### articulos_x_venta

1. Crear un articulo.
2. Leer todos los articulos.
3. Leer un articulo en particular.
4. Leer todos los articulos de una venta.
5. Leer todos los articulos de un producto.
6. Leer todos los articulos de un cliente.
7. Actualizar un articulo.
8. Eliminar un articulo.

### paises

1. Crear un pais.
2. Leer todos los paises.
3. Leer un pais en particular.
4. Actualizar un pais.
5. Eliminar un pais.
