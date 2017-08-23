USE library;
SHOW TABLES;
INSERT book(id,NAME) VALUES(0,'徐巧红');
INSERT book(NAME) VALUES('字典');
SELECT * FROM book;
INSERT worker(NAME) VALUES('徐巧红');
INSERT worker(NAME) VALUES('徐巧红');

`worker`
CREATE TABLE borrow_return(id INT auto_increment primary key,book_id INT,reader_id INT);
INSERT worker(NAME,number) VALUE('张三','234156');
INSERT reader(NAME,PASSWORD,ID_card)VALUES('徐巧红','13579','32456788900876543');
CREATE TABLE good222(id INT AUTO_INCREMENT PRIMARY KEY,NAME VARCHAR(20),price INT);
INSERT users(NAME,PASSWORD,jifen)VALUE('徐巧红','123456','2341');
INSERT worker(NAME,PASSWORD,number)VALUE('徐巧红','qwe1234','32456');


DELETE 
UPDATE 


