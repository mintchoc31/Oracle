/*
    ��¥: 2023/10/02
    �̸�: ������
    ����: 2�� �����ͺ��̽� �⺻
*/

//�ǽ�1-1
create table User1 (
    ID      VARCHAR2(20),
    NAME    VARCHAR2(20),
    HP      CHAR(13),
    AGE     NUMBER
);
drop table User1;

//�ǽ�1-2
insert into User1 values ('A101', '������', '010-1234-1111', 25);
insert into User1 values ('A102', '������', '010-1234-2222', 23);
insert into User1 values ('A103', '�庸��', '010-1234-3333', 32);
insert into User1 (id, name, age) values ('A104', '������', 45);
insert into User1 (id, name, hp) values ('A105', '�̼���', '010-1234-5555');

//�ǽ�1-3
select * from User1;
select * from User1 where id='A101';
select * from User1 where name='������';
select * from User1 where age > 30;
select id, name, age from User1;

//�ǽ�1-4
update User1 set hp='010-1234-4444' where id='A104';
update User1 set age=51 where id='A105';
update User1 set hp='010-1234-1001', age=27 where id='A101';

//�ǽ�1-5
delete from User1 where id='A101';
delete from User1 where id='A102' and age=25;
delete from User1 where age >= 30;

//�ǽ�2-1. �⺻Ű �ǽ�
create table USER2 (
    ID      VARCHAR2(20) PRIMARY KEY,
    NAME    VARCHAR2(20),
    HP      CHAR(13),
    AGE     NUMBER(2)
);

//�ǽ�2-2. 
create table USER3 (
    ID      VARCHAR(20) PRIMARY KEY,
    NAME    VARCHAR2(20),
    HP      CHAR(13) UNIQUE,
    AGE     NUMBER(3)
);

insert into USER3 values ('A101', '������', '010-1234-1001', 25);
insert into USER3 values ('A102','������', '010-1234-1002', 23);
insert into USER3 values ('A103', '�庸��', '010-1234-1003', 33);
insert into USER3 values ('A104', '������', '010-1234-1004', 43); 
insert into USER3 values ('A105', '�̼���', '010-1234-1005', 53);

// �ǽ� 2-3.
create table PARENT (
    PID     VARCHAR2(20) PRIMARY KEY,
    NAME    VARCHAR2(20),
    HP      CHAR(13) UNIQUE
);

create table CHILD (
    CID     VARCHAR2(20) PRIMARY KEY, 
    NAME    VARCHAR2(20),
    HP      CHAR(13) UNIQUE,
    PARENT  VARCHAR(20),
    FOREIGN KEY(PARENT) REFERENCES PARENT (PID)
);

insert into parent values ('P101','�輭��','010-1234-1001');
insert into parent values ('P102','�̼���','010-1234-1002');
insert into parent values ('P103','�Ż��Ӵ�','010-1234-1003');

insert into child values ('C101', '������', '010-1234-2001', 'P101');
insert into child values ('C102', '�̹��', '010-1234-2002', 'P102');
insert into child values ('C103', '�̹��', '010-1234-2003', 'P102');
insert into child values ('C104', '����', '010-1234-2004', 'P103');

//�ǽ� 2-4.
create table USER4 (
    NAME    VARCHAR2(20) NOT NULL,
    GENDER  CHAR(1) NOT NULL,
    AGE     INT DEFAULT 1,
    ADDR    VARCHAR2(255)
);
insert into USER4 values ('������', 'M', 23, '���ؽ�');
insert into USER4 values ('������', 'M', 21, '���ֽ�');
insert into USER4 (NAME, GENDER, ADDR) values ('�Ż��Ӵ�', 'F', '������');
insert into USER4 (NAME, GENDER) values ('�̼���', 'M');
insert into USER4 (NAME, GENDER, AGE) values ('�����', 'M' ,33);

//�ǽ� 2-5.
create table USER5 (
    NAME    VARCHAR2(20) NOT NULL,
    GENDER  CHAR(1) NOT NULL CHECK(GENDER IN('M','F')),
    AGE     INT DEFAULT 1 CHECK(AGE > 0 AND AGE < 100),
    ADDR    VARCHAR2(255)
);

insert into USER5 values ('������', 'M', 23, '���ؽ�');
insert into USER5 values ('������', 'M', 21, '���ֽ�');
insert into USER5 (NAME, GENDER, ADDR) values ('�Ż��Ӵ�', 'F', '������');
insert into USER5 (NAME, GENDER) values ('�̼���', 'M');
insert into USER5 (NAME, GENDER, AGE) values ('�����', 'M' ,33);

// �ǽ� 3-1. ������ ���� ��ȸ
select * from DICT;

SELECT TABLE_NAME FROM USER_TABLES;

SELECT OWNER, TABLE_NAME FROM ALL_TABLES;

SELECT * FROM DBA_TABLES;

SELECT * FROM DBA_USERS;

// �ǽ� 3-2. �ε��� ��ȸ/����/����
-- ���� ����� �ε��� ��ȸ
SELECT * FROM USER_INDEXES;

-- ���� ����� �ε��� ���� ��ȸ
SELECT * FROM USER_IND_COLUMNS;

-- �ε��� ����
CREATE INDEX IDX_USER1_ID ON USER1(ID);
SELECT * FROM USER_IND_COLUMNS;

-- �ε��� ����
DROP INDEX IDX_USER1_ID;
SELECT * FROM USER_IND_COLUMNS;

// �ǽ� 3-3. �� ���� ���� �Ҵ�
GRANT CREATE VIEW TO scott;

// �ǽ� 3-4. �� ����/��ȸ/����
// �� ����
CREATE VIEW VW_USER1 AS (SELECT NAME, HP, AGE FROM USER1);

CREATE VIEW VW_USER2_AGE_UNDER30 AS (
    SELECT * FROM USER2 WHERE AGE < 30
);

SELECT * FROM USER_VIEWS;

// �� ��ȸ
SELECT * FROM VW_USER1;
SELECT * FROM VW_USER2_AGE_UNDER30;

// �� ����
DROP VIEW VW_USER1;
DROP VIEW VW_USER2_AGE_UNDER30;

// �ǽ� 3-5. ������ �ǽ�
CREATE TABLE USER6 (
    SEQ     NUMBER PRIMARY KEY,
    NAME    VARCHAR2(20),
    GENDER  CHAR(1),
    AGE     NUMBER,
    ADDR    VARCHAR2(255)
);

// �ǽ� 3-6. ������ ����
CREATE SEQUENCE SEQ_USER6 INCREMENT BY 1 START WITH 1;

// �ǽ� 3-7. ������ �� �Է�
INSERT INTO USER6 VALUES (SEQ_USER6.NEXTVAL, '������','M', 25, '���ؽ�');
INSERT INTO USER6 VALUES (SEQ_USER6.NEXTVAL, '������','M', 23, '���ֽ�');
INSERT INTO USER6 VALUES (SEQ_USER6.NEXTVAL, '�Ż��Ӵ�','F', 27, '������');

// �ǽ� 4-1. ����� ����(system ����)
alter session set "_oracle_script"=true;
create user mintchoc31 identified by "1234";

// �ǽ� 4-2. ����� ��ȸ
select * from all_users;
select * from all_users where username='mintchoc31';


// �ǽ� 4-3. ����� ����
alert user mintchoc identified by '1q2w3e';
drop user mintchoc31;
drop user mintchoc31 cascade;

// �ǽ� 4-4. role �ο�
grant connect, resource to mintchoc31;
grant unlimited tablespace to mintchoc31;