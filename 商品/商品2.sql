CREATE TABLE supplier (
 supplier_id INT NOT NULL,
 supplier_name CHAR(10)
);

ALTER TABLE supplier ADD CONSTRAINT PK_supplier PRIMARY KEY (supplier_id);


CREATE TABLE category (
 category_id INT NOT NULL,
 category_name CHAR(10),
 category_person CHAR(10)
);

ALTER TABLE category ADD CONSTRAINT PK_category PRIMARY KEY (category_id);


CREATE TABLE goods (
 goods_id INT NOT NULL,
 goods_name CHAR(10),
 amount INT,
 category_id INT
);

ALTER TABLE goods ADD CONSTRAINT PK_goods PRIMARY KEY (goods_id);


CREATE TABLE supply_price (
 supplier_id INT NOT NULL,
 goods_id INT NOT NULL,
 supply_price DECIMAL(10)
);

ALTER TABLE supply_price ADD CONSTRAINT PK_supply_price PRIMARY KEY (supplier_id,goods_id);


ALTER TABLE goods ADD CONSTRAINT FK_goods_0 FOREIGN KEY (category_id) REFERENCES category (category_id);


ALTER TABLE supply_price ADD CONSTRAINT FK_supply_price_0 FOREIGN KEY (supplier_id) REFERENCES supplier (supplier_id);
ALTER TABLE supply_price ADD CONSTRAINT FK_supply_price_1 FOREIGN KEY (goods_id) REFERENCES goods (goods_id);


