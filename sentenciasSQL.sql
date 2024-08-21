----- Creacion de la base de datos -----

CREATE DATABASE store;

----- Se indica que base de datos se utilizará -----

USE store;

----- Se crea la tabla "store", que contendrá los datos de las sucursales -----

CREATE TABLE store(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    adress VARCHAR(50) NULL
);

----- Muestra las propiedades de los campos en la tabla "store" -----

DESCRIBE store;

----- Se crea la tabla "product", que contendrá el listado de productos que hay en las sucursales -----

CREATE TABLE product(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DOUBLE NOT NULL,
    description VARCHAR (150) NULL,
    store_id INT NOT NULL
);

----- Comando para agregar propiedades a una tabla -----

ALTER TABLE product
ADD remove_property INT NOT NULL;

----- Comando para eliminar propiedades de una tabla -----

ALTER TABLE product
DROP COLUMN remove_property;

----- Comando para relacionar la tabla "product" con la tabla "store", especificando que una tienda puede tener muchos productos -----

ALTER TABLE product
ADD CONSTRAINT fk_store_product
FOREIGN KEY (store_id) REFERENCES store(id);

----- Creación de la tabla "customer" -----

CREATE TABLE customer(
	id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    address VARCHAR(50) NULL,
    phone VARCHAR(10) NULL
);

----- Creción de la tabla "payment_method" -----

CREATE TABLE payment_method(
	id INT NOT NULL PRIMARY KEY,
    type_payment VARCHAR(50) NOT NULL
);

----- Comando para agregar la propiedad "customer_id" a ala tabla "payment_method" -----

ALTER TABLE payment_method
ADD customer_id INT NOT NULL;

----- Comando para relacionar la tabla "payment_method" con la tabla "customer", especificando que un comprador debe tener un método de pago -----

ALTER TABLE payment_method
ADD CONSTRAINT fk_customer_payment_method
FOREIGN KEY(customer_id) REFERENCES customer(id);

----- Creación de la tabla "purchase_order" -----

CREATE TABLE purchase_order(
	id INT NOT NULL PRIMARY KEY,
    payment_method_id INT NOT NULL,
    customer_id INT NOT NULL
);

----- Creación de la tabla "purchase_order" -----

CREATE TABLE purchase_order_detail(
	id INT NOT NULL PRIMARY KEY,
    amount INT NOT NULL,
    price_per_unit DOUBLE NOT NULL,
    product_description VARCHAR(150) NULL,
    product_id INT NOT NULL,
    purchase_order_id INT NOT NULL
);

----- Comando para relacionar la tabla "purchase_order_detail" con la tabla "product", especificando que el detalle de una orden puede tener muchos productos -----

ALTER TABLE purchase_order_detail
ADD CONSTRAINT fk_product_purchase_order_detail
FOREIGN KEY(product_id) REFERENCES product(id);

----- Comando para relacionar la tabla "purchase_order_detail" con la tabla "purchase_order" -----

ALTER TABLE purchase_order_detail
ADD CONSTRAINT fk_purchase_order_purchase_order_detail
FOREIGN KEY(purchase_order_id) REFERENCES purchase_order(id);

----- Comando para relacionar la tabla "purchase_order" con la tabla "customer" -----

ALTER TABLE purchase_order
ADD CONSTRAINT fk_customer_purchase_order
FOREIGN KEY(customer_id) REFERENCES customer(id);

----- Comando para relacionar la tabla "purchase_order" con la tabla "payment_method -----

ALTER TABLE purchase_order
ADD CONSTRAINT fk_payment_method_purchase_order
FOREIGN KEY(payment_method_id) REFERENCES payment_method(id);

----- Comando para agregar los datos de tres sucursales a la tabla "store" -----

INSERT INTO store(id, name, adress) VALUES (459, "Electronic Technologies North", "Blvd López Mateos #459");
INSERT INTO store(id, name, adress) VALUES(346, "Electronic Technologies Central", "Av Insurgentes #346");
INSERT INTO store(id, name, adress) VALUES(549, "Electronic Technologies East", "Blvd Madero #549");

----- Comando para agregar los datos de tres productos a la tabla "product" -----

INSERT INTO product (id, name, price, description, store_id) VALUES(301, "Computadora de escritorio - Todo en uno", 15499.00, "Todo lo que necesitas para este regreso a clases", 549);
INSERT INTO product (id, name, price, description, store_id) VALUES(305, "Celular ET - 15a", 3590.00, "Ideal para el trabajo", 549);
INSERT INTO product (id, name, price, description, store_id) VALUES(310, "Laptop - Quinta generación", 9999.00, "Económica pero duradera, simplemente lo mejor del año", 549);

----- Comando para mostrar todos los datos de la tabla "product" -----

SELECT * FROM product;

----- Comando para aactualizar los datos de un producto de la tabla "product" a través del id -----

UPDATE product
SET name="Celular ET2019 - 19xs", description="Ideal para trabajo y escuela"
WHERE id = 305;

----- Comando para eliminar los datos de un producto de la tabla "product" a través del id -----

DELETE FROM product
WHERE id = 305;

----- Comando para mostar los datos de nombre, precio y descripción de los productos de la tabla "product" -----

SELECT name, price, description FROM product;

----- Comando para agregar los datos de varios productos a la tabla "product" -----

INSERT INTO product (id, name, price, description, store_id) VALUES(611, "Horno tostador", 1499.00, "Horno tostador de 4 rebanadas, acero inoxidable.", 346);
INSERT INTO product (id, name, price, description, store_id) VALUES(512, "Freidora con temporizador", 1590.00, "Puede cocinar cualquier alimento, desde papas fritas hasta verduras y mucho más.", 346);
INSERT INTO product (id, name, price, description, store_id) VALUES(815, "Batidora", 999.00, "5 velocidades, color rojo.", 346);
INSERT INTO product (id, name, price, description, store_id) VALUES(531, "Fuente de chocolate", 789.90, "Mejora la limpieza gracias a sus piezas desmontables.", 346);
INSERT INTO product (id, name, price, description, store_id) VALUES(912, "Máquina de palomitas de maíz", 830.00, "La máquina ocupa aceite caliente para la elaboración de las palomitas.", 346);
INSERT INTO product (id, name, price, description, store_id) VALUES(412, "Sandwichera", 459.00, "Sandwichera para desayuno, color gris.", 346);
INSERT INTO product (id, name, price, description, store_id) VALUES(317, "Pantalla smart TV 50''", 8890.00, "Tamaño de pantalla real 57.5'' x 33.3''.", 459);
INSERT INTO product (id, name, price, description, store_id) VALUES(679, "Cámara de seguridad", 1497.00, "Incluye soporte técnico 24/7.", 459);
INSERT INTO product (id, name, price, description, store_id) VALUES(923, "Soporte para TV", 297.00, "Adaptable a pantalla de 26'' - 65'', hasta 50 kg de carga.", 459);
INSERT INTO product (id, name, price, description, store_id) VALUES(873, "Laptop 1945", 15499.00, "Unidad de estado sólido de 256 GB y memoria RAM de 8 GB.", 459);
INSERT INTO product (id, name, price, description, store_id) VALUES(682, "Coche estéreo GPS - Navegación", 1299.00, "Pantalla táctil, conexión bluetooth, no incluye DVD.", 459);

----- Comando para mostrar los datos de la tabla "product" en orden descendente, si se coloca ASC se mostrarán en orden ascendente -----

SELECT * FROM product
ORDER BY price DESC;

----- Comando para mostrar los datos de la tabla "product" limitando a los 5 primeros registros -----

SELECT * FROM product
LIMIT 5;

----- Comando para mostrar los datos de la tabla "product" limitando del registro 3 al registro 5 -----

SELECT * FROM product
LIMIT 3,5;

----- Comando para mostrar los datos agrupados de la tabla "store_id" y contando cuantos productos hay registrados en cada sucursal -----

SELECT store_id, COUNT(*) FROM product
GROUP BY store_id;

----- Comando para agregar una sucursal a la tabla "store" -----

INSERT INTO store(id, name, adress) VALUES(111, "Sucursal", "Blvd Obregón #423");

----- Comandos para realizar consultas de conjunción -----

SELECT * FROM store
INNER JOIN product on store.id = product.store_id;

SELECT * FROM store
LEFT JOIN product ON store.id = product.store_id;

SELECT * FROM store
RIGHT JOIN product ON store.id = product.store_id;

----- Comando para realizar una consulta anidada -----

SELECT * FROM store
WHERE id = (
	SELECT store_id FROM product WHERE id = 310
);

----- Comando para crear una vista, se utiliza para llamar el nombre de la vista de manera directa -----

CREATE VIEW product_description AS
SELECT name, description, price FROM product;

----- ROLES -----

----- Sentencia para crear roles: -----

CREATE ROLE 'admin_store_role', 'read_store_role', 'write_store_role';


----- Sentencia para OTORGAR PERMISOS a los roles: -----

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP ON store.* TO 'admin_store_role';

GRANT SELECT ON store.* TO 'read_store_role';

GRANT SELECT ON store.* TO 'write_store_role';


----- La sentencia para crear cuentas de usuario: -----

CREATE USER 'admin’@’localhost' IDENTIFIED BY 'adm2020';
CREATE USER 'arturo_torres’@’localhost' IDENTIFIED BY 'arturoZXC123';
CREATE USER 'jose_ibarra’@’localhost' IDENTIFIED BY 'josestoredb';
CREATE USER 'andrea_rodriguez’@’localhost' IDENTIFIED BY 'adi1989';


----- La sentencia para crear ASIGNAR UN ROL a cada usuario: -----

GRANT 'admin_store_role' TO 'admin’@’localhost';
GRANT 'read_store_role' TO 'arturo_torres’@’localhost';
GRANT 'write_store_role' TO 'jose_ibarra’@’localhost';
GRANT 'write_store_role' TO 'andrea_rodriguez’@’localhost';

FLUSH PRIVILEGES;

SET DEFAULT ROLE ALL TO 'admin’@’localhost';
SET DEFAULT ROLE ALL TO 'arturo_torres’@’localhost';
SET DEFAULT ROLE ALL TO 'jose_ibarra’@’localhost';
SET DEFAULT ROLE ALL TO 'andrea_rodriguez’@’localhost';


----- La sentencia para crear ELIMINAR UN PERMISO A UN ROL: -----

REVOKE SELECT ON store.* FROM 'write_store_role';

----- Sentencia para evitar que se realice autocommit -----

SET autocommit = 0;

----- Sentencia para iniciar la transaccion -----

START TRANSACTION;

----- Obtener los datos del cliente con el id 548 -----

SELECT * FROM customer
WHERE id = 548;

SELECT * FROM customer;

----- Al no haber un cliente registrado se agregan los datos de uno -----

INSERT INTO customer (id, first_name, last_name, email, password, address, phone)
VALUES (548, 'Javier', 'Castillo', 'javcasti@gmail.com', 'javcaspass', 'Avenida Pino 35B', '5511241124');

----- Sentencia para obtener los metodos de pago de ese cliente con id 548 -----

SELECT * FROM payment_method 
WHERE customer_id = (
    SELECT id 
    FROM customer 
    WHERE id = 548
);

----- Al no haber datos registrados se generan los siguientes -----

INSERT INTO payment_method (id, type_payment, customer_id)
VALUES (185, 'Tarjeta de credito', 548);

----- Se genera el registro en la tabla purchase_order -----

INSERT INTO purchase_order (id, payment_method_id, customer_id) VALUES (266, 185, 548);

SELECT * FROM purchase_order
WHERE id = 266;

----- Se obtienen los datos del producto con id 317 -----

SELECT * FROM product
WHERE id = 317;

----- Se altera la tabla purchase_order_detail debido a que no cuenta con la columna product_name -----

DESCRIBE purchase_order_detail;

ALTER TABLE purchase_order_detail
ADD product_name VARCHAR(50) NULL;

----- Se agrega el registro con los siguientes datos -----

INSERT INTO purchase_order_detail (
    id, amount, price_per_unit, product_description, product_id, purchase_order_id, product_name
) VALUES (
    267, 5, 8890, 'Tamaño de pantalla real 57.5” x 33.3”', 555, 266666, 'Pantalla smart TV 50"'
);

----- Se ejecuta la sentencia ROLLBACK para deshacer los cambios -----

ROLLBACK;

----- Se verifica que se haya eliminado el registro con id 266 despues del ROLLBACK -----

SELECT * FROM purchase_order
WHERE id = 266;

----- Se corrige el id del producto que se ingreso anteriormente -----

INSERT INTO purchase_order_detail (
    id, amount, price_per_unit, product_description, product_id, purchase_order_id, product_name
) VALUES (
    267, 5, 8890, 'Tamaño de pantalla real 57.5” x 33.3”', 317, 266666, 'Pantalla smart TV 50"'
);

----- Se corrige el error arrojado sobre el id 2666666 -----

INSERT INTO purchase_order (id, payment_method_id, customer_id)
VALUES (266666, 185, 548);

----- Se realiza el COMMIT para hacer permanentes los cambios -----

COMMIT;
