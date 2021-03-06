CREATE TABLE catagory (
 catatory_id INT NOT NULL,
 catagory_name VARCHAR(10),
 catagory_person VARCHAR(10)
);

ALTER TABLE catagory ADD CONSTRAINT PK_catagory PRIMARY KEY (catatory_id);


CREATE TABLE goods (
 goods_id  INT NOT NULL,
 goods_name VARCHAR(10),
 amount INT,
 catatory_id INT
);

ALTER TABLE goods ADD CONSTRAINT PK_goods PRIMARY KEY (goods_id );


CREATE TABLE supplier (
 supplier_id INT NOT NULL,
 supplier_name VARCHAR(10)
);

ALTER TABLE supplier ADD CONSTRAINT PK_supplier PRIMARY KEY (supplier_id);


CREATE TABLE price (
 goods_id  INT NOT NULL,
 supplier_id INT NOT NULL,
 goods_price DECIMAL(10)
);

ALTER TABLE price ADD CONSTRAINT PK_price PRIMARY KEY (goods_id ,supplier_id);


ALTER TABLE goods ADD CONSTRAINT FK_goods_0 FOREIGN KEY (catatory_id) REFERENCES catagory (catatory_id);


ALTER TABLE price ADD CONSTRAINT FK_price_0 FOREIGN KEY (goods_id ) REFERENCES goods (goods_id );
ALTER TABLE price ADD CONSTRAINT FK_price_1 FOREIGN KEY (supplier_id) REFERENCES supplier (supplier_id);


