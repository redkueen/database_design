CREATE TABLE 供应商 (
 供应商号 CHAR(10)  PRIMARY KEY NOT NULL,
 供应商名 CHAR(10)
);



CREATE TABLE 种类 (
 种类号 CHAR(10) PRIMARY KEY NOT NULL,
 种类名 CHAR(10),
 种类负责人 CHAR(10)
);



CREATE TABLE 商品 (
 商品号 CHAR(10) PRIMARY KEY  NOT NULL,
 商品名 CHAR(10),
 存量 CHAR(10),
 种类号 CHAR(10),
 FOREIGN KEY (种类号) references 种类 (种类号)
);



CREATE TABLE 供价 (
 供应商号 CHAR(10) NOT NULL,
 商品号 CHAR(10) NOT NULL,
 供价 CHAR(10),
 PRIMARY KEY (供应商号,商品号),
 FOREIGN KEY (供应商号) REFERENCES 供应商 (供应商号),
 FOREIGN KEY (商品号) REFERENCES 商品 (商品号)
);






