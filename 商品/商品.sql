CREATE TABLE ��Ӧ�� (
 ��Ӧ�̺� CHAR(10)  PRIMARY KEY NOT NULL,
 ��Ӧ���� CHAR(10)
);



CREATE TABLE ���� (
 ����� CHAR(10) PRIMARY KEY NOT NULL,
 ������ CHAR(10),
 ���ฺ���� CHAR(10)
);



CREATE TABLE ��Ʒ (
 ��Ʒ�� CHAR(10) PRIMARY KEY  NOT NULL,
 ��Ʒ�� CHAR(10),
 ���� CHAR(10),
 ����� CHAR(10),
 FOREIGN KEY (�����) references ���� (�����)
);



CREATE TABLE ���� (
 ��Ӧ�̺� CHAR(10) NOT NULL,
 ��Ʒ�� CHAR(10) NOT NULL,
 ���� CHAR(10),
 PRIMARY KEY (��Ӧ�̺�,��Ʒ��),
 FOREIGN KEY (��Ӧ�̺�) REFERENCES ��Ӧ�� (��Ӧ�̺�),
 FOREIGN KEY (��Ʒ��) REFERENCES ��Ʒ (��Ʒ��)
);






